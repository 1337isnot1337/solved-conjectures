"""Untrusted finite-certificate producer for the Lean CUT proof.

Generated transitions and refinements are data, not axioms. Lean must check
all local certificates and prove the connection to arithmetic/game semantics.
Run this script from any directory using Python's standard library.
"""
from __future__ import annotations
import argparse
import hashlib
import importlib.util
import json
import re
from pathlib import Path
import sys

sys.dont_write_bytecode = True
HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
spec = importlib.util.spec_from_file_location("cut_period_source", HERE / "verify.py")
v = importlib.util.module_from_spec(spec)
spec.loader.exec_module(v)
records = []
raw_registry = {}
current = {}


def reachable(start, step, accepts):
    states = [start]
    indices = {start: 0}
    table = []
    final = set()
    for i, state in enumerate(states):
        if accepts(state):
            final.add(i)
        row = []
        for a in range(2):
            for b in range(2):
                target = step(state, a, b)
                if target not in indices:
                    indices[target] = len(states)
                    states.append(target)
                row.append(indices[target])
        table.append(row)
    raw_registry[id(table)] = states
    return table, final


def normalize(state):
    if isinstance(state, frozenset):
        return sorted(normalize(t) for t in state)
    if isinstance(state, tuple):
        return [normalize(t) for t in state]
    return state


def minimize(machine):
    table, final = machine
    labels = [int(i in final) for i in range(len(table))]
    while True:
        groups = {}
        new = []
        for i, row in enumerate(table):
            signature = labels[i], *(labels[j] for j in row)
            new.append(groups.setdefault(signature, len(groups)))
        if new == labels:
            break
        labels = new
    result = [None] * len(set(labels))
    for i, row in enumerate(table):
        result[labels[i]] = [labels[j] for j in row]
    mf = {labels[i] for i in final}
    assert labels[0] == 0
    states = raw_registry.pop(id(table))
    records.append(dict(current, raw_states=[normalize(s) for s in states],
                        raw_table=table, raw_final=sorted(final), labels=labels,
                        table=result, final=sorted(mf)))
    print(f"{current['name']}: {len(table)} represented states -> {len(result)} DFA states")
    return result, mf


def make(name, kind, inputs, fn):
    global current
    current = dict(name=name, kind=kind, inputs=inputs)
    return fn()


def lean_array(items):
    return "#[" + ",".join(items) + "]"


def graph_lean(record):
    raw_n = len(record['raw_states'])
    n = len(record['table'])
    states = ["none" if s is None else
              f"some (({s[0]} : ℤ),Fin.ofNat 12 {s[1]},Fin.ofNat 8 {s[2]})"
              for s in record['raw_states']]
    rows = lambda table: lean_array([lean_array(map(str, r)) for r in table])
    out = """-- Generated numerical data; every refinement claim is checked by Lean.
import Conjectures.CutPeriodGraph
namespace CutPeriod.GraphCertificate
open BinaryAutomata
set_option maxRecDepth 100000
"""
    out += f"def states : Array CutPeriod.State := {lean_array(states)}\n"
    out += f"def rawTable : Array (Array Nat) := {rows(record['raw_table'])}\n"
    out += f"def labels : Array Nat := {lean_array(map(str,record['labels']))}\n"
    out += f"def table : Array (Array Nat) := {rows(record['table'])}\n"
    out += f"def finals : Array Bool := {lean_array('true' if i in record['final'] else 'false' for i in range(n))}\n"
    out += f"""
def machine : DFA (Fin {n}) := {{
  step := fun q d => Fin.ofNat {n} (table[q.val]![d.val]!)
  start := 0
  final := fun q => finals[q.val]!
}}
def rep (q : Fin {raw_n}) : CutPeriod.State := states[q.val]!
def label (q : Fin {raw_n}) : Fin {n} := Fin.ofNat {n} labels[q.val]!
def next (q : Fin {raw_n}) (d : Digit) : Fin {raw_n} :=
  Fin.ofNat {raw_n} (rawTable[q.val]![d.val]!)

theorem checked_start : rep 0=CutPeriod.graph.start := by decide
theorem checked_label_start : label 0=machine.start := by decide
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem checked_step : ∀ q d, rep (next q d)=CutPeriod.graph.step (rep q) d := by decide
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem checked_label_step : ∀ q d, label (next q d)=machine.step (label q) d := by decide
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem checked_final : ∀ q, CutPeriod.graph.final (rep q)=machine.final (label q) := by decide

theorem language (w : List Digit) : CutPeriod.graph.accepts w=machine.accepts w :=
  certified_dfa_refinement CutPeriod.graph machine (0 : Fin {raw_n}) rep label next
    checked_start checked_label_start checked_step checked_label_step checked_final w

theorem correct (w : List Digit) : machine.accepts w=true ↔
    0<decodeHigh sizeBit w ∧ decodeHigh valueBit w=CutPeriod.value (decodeHigh sizeBit w) := by
  rw [←language]
  exact CutPeriod.graph_correct w
#print axioms correct
end CutPeriod.GraphCertificate
"""
    return out


def aggregate_rows(prefix, count):
    rows='['+','.join(f'⟨{i},{prefix}{i}⟩' for i in range(count))+']'
    return f'(checked_list_rows (n:={count}) {rows} (by decide))'


def balanced_lookup(name, lean_type, items):
    """Avoid repeatedly reducing large Array.push chains in the kernel."""
    def tree(lo, hi):
        if hi-lo == 1:
            return items[lo]
        mid = (lo+hi)//2
        left, right = tree(lo,mid), tree(mid,hi)
        if left == right:
            return left
        return f'(if idx<{mid} then {left} else {right})'
    body=tree(0,len(items))
    binder='idx' if 'idx' in body else '_idx'
    return f'def {name} ({binder} : Nat) : {lean_type} := {body}\n'


def chunked_lookup(name, lean_type, items):
    """Keep elaboration and code-generation caches local to small declarations."""
    if len(items)<=256:
        return balanced_lookup(name,lean_type,items)
    chunk_size=64
    out=[]
    calls=[]
    for lo in range(0,len(items),chunk_size):
        chunk_name=f'{name}_chunk_{lo//chunk_size}'
        out.append(balanced_lookup(chunk_name,lean_type,items[lo:lo+chunk_size]))
        calls.append(f'({chunk_name} (idx-{lo}))')
    def dispatch(lo,hi):
        if hi-lo==1:
            return calls[lo]
        mid=(lo+hi)//2
        return f'(if idx<{mid*chunk_size} then {dispatch(lo,mid)} else {dispatch(mid,hi)})'
    out.append(f'def {name} (idx : Nat) : {lean_type} := {dispatch(0,len(calls))}\n')
    return ''.join(out)


def lower_lean(record):
    raw_n = len(record['raw_states'])
    n = len(record['table'])
    active = ['['+','.join(str(i*3+sign+1) for i,sign in states)+']'
              for states in record['raw_states']]
    rows = lambda table: lean_array(lean_array(map(str,r)) for r in table)
    out = '''-- Generated data; Lean checks all finite representation claims.
import Conjectures.CutPeriodLower
namespace CutPeriod.LowerCertificate
open BinaryAutomata
set_option maxRecDepth 100000
set_option maxHeartbeats 0
'''
    out += f'def representatives : Array (List Nat) := {lean_array(active)}\n'
    out += f'def rawTable : Array (Array Nat) := {rows(record["raw_table"])}\n'
    out += f'def labels : Array Nat := {lean_array(map(str,record["labels"]))}\n'
    out += f'def table : Array (Array Nat) := {rows(record["table"])}\n'
    out += f'def finals : Array Bool := {lean_array("true" if i in record["final"] else "false" for i in range(n))}\n'
    out += f'''
def machine : DFA (Fin {n}) := {{
  step := fun q d => Fin.ofNat {n} (table[q.val]![d.val]!)
  start := 0
  final := fun q => finals[q.val]!
}}
def active (q : Fin {raw_n}) : List (Fin 81) :=
  representatives[q.val]!.map (Fin.ofNat 81)
def label (q : Fin {raw_n}) : Fin {n} := Fin.ofNat {n} labels[q.val]!
def next (q : Fin {raw_n}) (d : Digit) : Fin {raw_n} :=
  Fin.ofNat {raw_n} (rawTable[q.val]![d.val]!)

theorem checked_start : maskOfList ((active 0).map Fin.val)=Lower.semantic.startMask := by decide
theorem checked_label_start : label 0=machine.start := by decide
'''
    for i in range(raw_n):
        out += f'''theorem refinement_row_{i} : ∀ d,
    maskOfList ((active (next ({i} : Fin {raw_n}) d)).map Fin.val)=
      maskOfList (((active ({i} : Fin {raw_n})).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) := by decide
'''
    out += f'''theorem checked_step : ∀ q d,
    maskOfList ((active (next q d)).map Fin.val)=
      maskOfList (((active q).flatMap (fun s => Lower.semantic.successors s d)).map Fin.val) :=
  {aggregate_rows('refinement_row_',raw_n)}

theorem checked_label_step : ∀ q d, label (next q d)=machine.step (label q) d := by decide
'''
    for i in range(raw_n):
        out += f'theorem final_row_{i} : (active ({i} : Fin {raw_n})).any Lower.semantic.final=machine.final (label ({i} : Fin {raw_n})) := by decide\n'
    out += f'''theorem checked_final : ∀ q, (active q).any Lower.semantic.final=machine.final (label q) :=
  {aggregate_rows('final_row_',raw_n)}

theorem language (w : List Digit) : Lower.semantic.accepts w=machine.accepts w :=
  certified_list_refinement Lower.semantic machine (0 : Fin {raw_n}) active label next
    checked_start checked_label_start checked_step checked_label_step checked_final w

theorem correct (w : List Digit) : machine.accepts w=true ↔
    0<decodeHigh sizeBit w ∧ decodeHigh valueBit w<CutPeriod.value (decodeHigh sizeBit w) := by
  rw [←language]
  exact Lower.correct w
#print axioms correct
end CutPeriod.LowerCertificate
'''
    return out


def namespace(name):
    if name == 'graph':
        return 'GraphCertificate'
    if name == 'lower':
        return 'LowerCertificate'
    return name[0].upper()+name[1:]+'Certificate'


def option_data_lean(by_name):
    out='''-- Numerical DFA definitions; actual-option semantics is checked separately.
import Conjectures.BinaryAutomata
namespace CutPeriod.OptionData
open BinaryAutomata
'''
    for tag in ('A','B'):
        record=by_name['options'+tag]; n=len(record['table'])
        out+=balanced_lookup('row'+tag,'Array Nat',[lean_array(map(str,r)) for r in record['table']])
        out+=balanced_lookup('final'+tag,'Bool',['true' if i in record['final'] else 'false' for i in range(n)])
        out+=f'''def machine{tag} : DFA (Fin {n}) := {{
  step := fun q d => Fin.ofNat {n} ((row{tag} q.val)[d.val]!)
  start := 0
  final := fun q => final{tag} q.val
}}
'''
    return out+'end CutPeriod.OptionData\n'


def boolean_lean(record, by_name):
    inputs=record['inputs']
    counts=[len(by_name[name]['table']) for name in inputs]
    ns=[namespace(name) for name in inputs]
    sources=['OptionData.machine'+name[-1] if name.startswith('options') else namespace(name)+'.machine'
             for name in inputs]
    raw_n=len(record['raw_states']); n=len(record['table'])
    union=record['kind']=='union'
    op='(fun a b => a || b)' if union else ('(fun a b => a && b)' if record['kind']=='intersection' else '(fun a b => a && !b)')
    qtype=f'Fin {counts[0]}'
    semantic=sources[0]
    for c,src in zip(counts[1:],sources[1:]):
        qtype=f'({qtype} × Fin {c})'
        semantic=f'({semantic}).product {src} {op}'
    reps=[]
    for state in record['raw_states']:
        rep=f'({state[0]} : Fin {counts[0]})'
        for i,c in zip(state[1:],counts[1:]):
            rep=f'({rep},({i} : Fin {c}))'
        reps.append(rep)
    out='-- Generated data; all Boolean-language refinements are checked by Lean.\n'
    out+='import Conjectures.BinaryBoolean\n'
    out+='import Conjectures.CutPeriodOptionData\n'
    out+=''.join('import Conjectures.CutPeriod'+namespace(src)+'\n' for src in inputs if not src.startswith('options'))
    out+=f'''namespace CutPeriod.{namespace(record['name'])}
open BinaryAutomata
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def semantic : DFA {qtype} := {semantic}
'''
    out+=balanced_lookup('representativeData',qtype,reps)
    out+=balanced_lookup('rawRow','Array Nat',[lean_array(map(str,r)) for r in record['raw_table']])
    out+=balanced_lookup('labelData','Nat',list(map(str,record['labels'])))
    out+=balanced_lookup('machineRow','Array Nat',[lean_array(map(str,r)) for r in record['table']])
    out+=balanced_lookup('finalData','Bool',['true' if i in record['final'] else 'false' for i in range(n)])
    if union:
        out+=f'def machine : DFA (Fin {n}) := OptionData.machine{record["name"][-1]}\n'
    else:
        out+=f'''
def machine : DFA (Fin {n}) := {{
  step := fun q d => Fin.ofNat {n} ((machineRow q.val)[d.val]!)
  start := 0
  final := fun q => finalData q.val
}}
'''
    out+=f'''
def rep (q : Fin {raw_n}) : {qtype} := representativeData q.val
def label (q : Fin {raw_n}) : Fin {n} := Fin.ofNat {n} (labelData q.val)
def next (q : Fin {raw_n}) (d : Digit) : Fin {raw_n} :=
  Fin.ofNat {raw_n} ((rawRow q.val)[d.val]!)
theorem checked_start : rep 0=semantic.start := by decide
theorem checked_label_start : label 0=machine.start := by decide
'''
    for i in range(raw_n):
        out+=f'theorem transition_row_{i} : ∀ d, rep (next ({i} : Fin {raw_n}) d)=semantic.step (rep ({i} : Fin {raw_n})) d := by decide\n'
    out+=f'''theorem checked_step : ∀ q d, rep (next q d)=semantic.step (rep q) d :=
  {aggregate_rows('transition_row_',raw_n)}
theorem checked_label_step : ∀ q d, label (next q d)=machine.step (label q) d := by decide
'''
    for i in range(raw_n):
        out+=f'theorem final_row_{i} : semantic.final (rep ({i} : Fin {raw_n}))=machine.final (label ({i} : Fin {raw_n})) := by decide\n'
    out+=f'''theorem checked_final : ∀ q, semantic.final (rep q)=machine.final (label q) :=
  {aggregate_rows('final_row_',raw_n)}

theorem language (w : List Digit) : semantic.accepts w=machine.accepts w :=
  certified_dfa_refinement semantic machine (0 : Fin {raw_n}) rep label next
    checked_start checked_label_start checked_step checked_label_step checked_final w
'''
    if union:
        arities=[int(src[5:]) for src in inputs]
        props=' ∨\n      '.join(f'Piles {k} (decodeHigh sizeBit w) (decodeHigh valueBit w)' for k in arities)
        rewrites=','.join(src+'.recognizes_piles w' for src in ns)
        out+=f'''
theorem correct (w : List Digit) : machine.accepts w=true ↔
      {props} := by
  rw [←language]
  simp only [semantic,DFA.product_accepts,Bool.or_eq_true,{rewrites},or_assoc]
#print axioms correct
'''
    else:
        out+='''
theorem checked_nonacceptance : ∀ q, machine.final q=false := by decide
theorem rejects (w : List Digit) : semantic.accepts w=false := by
  rw [language]
  exact DFA.rejects_of_final_false machine checked_nonacceptance w
#print axioms rejects
'''
    out+=f"end CutPeriod.{namespace(record['name'])}\n"
    return out


def sum_lean(record, by_name):
    k=int(record['name'][5:])
    left=by_name[record['inputs'][0]]; right=by_name['graph']
    L,R=len(left['table']),len(right['table']); N=L*R*2
    raw_n=len(record['raw_states']); n=len(record['table'])
    left_ns='GraphCertificate' if k==2 else f'Parts{k-1}Certificate'
    import_left='' if k==2 else f'import Conjectures.CutPeriodParts{k-1}Certificate\n'
    use_fast=k>=3
    lookup=chunked_lookup if use_fast else balanced_lookup
    import_fast='import Conjectures.BinaryFastComposition\n' if use_fast else ''
    execution_options='set_option Elab.async false\nset_option linter.all false\n' if use_fast else ''
    out=f'''-- Generated data. Every transition-cache row and refinement row is checked.
import Conjectures.BinaryComposition
import Conjectures.CutPeriodGraphCertificate
import Conjectures.CutPeriodPiles
{import_left}{import_fast}namespace CutPeriod.Parts{k}Certificate
open BinaryAutomata
{execution_options}set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option exponentiation.threshold {N}

def left (s : Fin {N}) : Fin {L} := Fin.ofNat {L} (s.val/({R}*2))
def right (s : Fin {N}) : Fin {R} := Fin.ofNat {R} ((s.val/2)%{R})
def carry (s : Fin {N}) : Fin 2 := Fin.ofNat 2 (s.val%2)
def pack (a : Fin {L}) (b : Fin {R}) (c : Fin 2) : Fin {N} :=
  Fin.ofNat {N} ((a.val*{R}+b.val)*2+c.val)

def encoding : ProductEncoding {L} {R} {N} := {{
  left := left, right := right, carry := carry, pack := pack
  left_pack := by
    intro a b c
    apply Fin.ext
    have ha := a.isLt
    have hb := b.isLt
    have hc := c.isLt
    simp only [left,pack,Fin.val_ofNat]
    omega
  right_pack := by
    intro a b c
    apply Fin.ext
    have ha := a.isLt
    have hb := b.isLt
    have hc := c.isLt
    simp only [right,pack,Fin.val_ofNat,Nat.mod_mod]
    omega
  carry_pack := by
    intro a b c
    apply Fin.ext
    have ha := a.isLt
    have hb := b.isLt
    have hc := c.isLt
    simp only [carry,pack,Fin.val_ofNat,Nat.mod_mod]
    omega
  pack_parts := by
    intro q
    apply Fin.ext
    have hq := q.isLt
    simp only [left,right,carry,pack,Fin.val_ofNat,Nat.mod_mod]
    omega
}}

def semantic : NFA {N} := sumMachine encoding {left_ns}.machine GraphCertificate.machine
  {left_ns}.machine.rejectingSink GraphCertificate.machine.rejectingSink
'''
    LD={i for i,row in enumerate(left['table']) if i not in left['final'] and all(t==i for t in row)}
    RD={i for i,row in enumerate(right['table']) if i not in right['final'] and all(t==i for t in row)}
    successor_table=[]
    for s in range(N):
        i=s//(R*2); j=(s//2)%R; carry=s%2
        row=[]
        for d in range(4):
            targets=[]
            for dl in range(4):
                for dr in range(4):
                    for mid in range(2):
                        a=left['table'][i][dl]; b=right['table'][j][dr]
                        if dl//2+dr//2+mid==d//2+2*carry and (dl%2)^(dr%2)==d%2 and a not in LD and b not in RD:
                            targets.append((a*R+b)*2+mid)
            row.append(targets)
        successor_table.append(row)
    successor_rows=[lean_array('['+','.join(map(str,ts))+']' for ts in row) for row in successor_table]
    out+=lookup('successorData','Array (List Nat)',successor_rows)
    out+=f'''def cachedSuccessors (s : Fin {N}) (d : Digit) : List (Fin {N}) :=
  (successorData s.val)[d.val]!.map (Fin.ofNat {N})

def composed : NFA {N} := {{semantic with successors := cachedSuccessors}}
'''
    if use_fast:
        out+=f'''def fast : Fin {N} → Digit → List (Fin {N}) :=
  fastSuccessors encoding {left_ns}.machine GraphCertificate.machine
    {left_ns}.machine.rejectingSink GraphCertificate.machine.rejectingSink
theorem fast_eq (s : Fin {N}) (d : Digit) : fast s d=semantic.successors s d :=
  fastSuccessors_eq encoding _ _ _ _ s d
'''
    target='fast' if use_fast else 'semantic.successors'
    for i in range(N):
        out+=f'theorem transition_row_{i} : ∀ d, cachedSuccessors ({i} : Fin {N}) d={target} ({i} : Fin {N}) d := by decide\n'
    if use_fast:
        out+=f'''theorem checked_fast : ∀ s d, cachedSuccessors s d=fast s d :=
  {aggregate_rows('transition_row_',N)}
theorem checked_successors : ∀ s d, cachedSuccessors s d=semantic.successors s d :=
  fun s d => (checked_fast s d).trans (fast_eq s d)
'''
    else:
        out+=f'''theorem checked_successors : ∀ s d, cachedSuccessors s d=semantic.successors s d :=
  {aggregate_rows('transition_row_',N)}
'''
    out+='''
theorem composed_eq : composed=semantic := by
  have h : cachedSuccessors=semantic.successors := funext (fun s => funext (checked_successors s))
  unfold composed
  rw [h]
'''
    active=[]
    for S in record['raw_states']:
        active.append('['+','.join(str((i*R+j)*2+c) for i,j,c in S)+']')
    rows=lambda table:lean_array([lean_array(map(str,r)) for r in table])
    out+=lookup('representativeData','List Nat',active)
    out+=lookup('rawRow','Array Nat',[lean_array(map(str,r)) for r in record['raw_table']])
    out+=lookup('labelData','Nat',list(map(str,record['labels'])))
    out+=lookup('machineRow','Array Nat',[lean_array(map(str,r)) for r in record['table']])
    out+=lookup('finalData','Bool',['true' if i in record['final'] else 'false' for i in range(n)])
    out+=f'''
def machine : DFA (Fin {n}) := {{
  step := fun q d => Fin.ofNat {n} ((machineRow q.val)[d.val]!)
  start := 0
  final := fun q => finalData q.val
}}
def active (q : Fin {raw_n}) : List (Fin {N}) :=
  (representativeData q.val).map (Fin.ofNat {N})
def label (q : Fin {raw_n}) : Fin {n} := Fin.ofNat {n} (labelData q.val)
def next (q : Fin {raw_n}) (d : Digit) : Fin {raw_n} :=
  Fin.ofNat {raw_n} ((rawRow q.val)[d.val]!)

theorem checked_start : maskOfList ((active 0).map Fin.val)=composed.startMask := by decide
theorem checked_label_start : label 0=machine.start := by decide
'''
    for i in range(raw_n):
        out+=f'''theorem refinement_row_{i} : ∀ d,
    maskOfList ((active (next ({i} : Fin {raw_n}) d)).map Fin.val)=
      maskOfList (((active ({i} : Fin {raw_n})).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide
'''
    out+=f'''theorem checked_step : ∀ q d,
    maskOfList ((active (next q d)).map Fin.val)=
      maskOfList (((active q).flatMap (fun s => composed.successors s d)).map Fin.val) :=
  {aggregate_rows('refinement_row_',raw_n)}

theorem checked_label_step : ∀ q d, label (next q d)=machine.step (label q) d := by decide
'''
    for i in range(raw_n):
        out+=f'theorem final_row_{i} : (active ({i} : Fin {raw_n})).any composed.final=machine.final (label ({i} : Fin {raw_n})) := by decide\n'
    out+=f'''theorem checked_final : ∀ q, (active q).any composed.final=machine.final (label q) :=
  {aggregate_rows('final_row_',raw_n)}

theorem language (w : List Digit) : composed.accepts w=machine.accepts w :=
  certified_list_refinement composed machine (0 : Fin {raw_n}) active label next
    checked_start checked_label_start checked_step checked_label_step checked_final w

theorem correct (w : List Digit) : machine.accepts w=true ↔
    ∃ cols : List Column, cols.map Column.out=w ∧
      {left_ns}.machine.accepts (cols.map Column.left)=true ∧
      GraphCertificate.machine.accepts (cols.map Column.right)=true ∧
      leftSize cols+rightSize cols=outSize cols ∧ leftValue cols ^^^ rightValue cols=outValue cols := by
  rw [←language,composed_eq]
  exact sum_accepts_iff encoding _ _ _ _
    {left_ns}.machine.rejectingSink_sound GraphCertificate.machine.rejectingSink_sound w

theorem recognizes_piles : CutPeriod.RecognizesPiles machine {k} := by
  intro w
  rw [←language,composed_eq]
  exact CutPeriod.sum_recognizes_successor encoding {left_ns}.machine {k-1}
    {"CutPeriod.graph_recognizes_one" if k==2 else left_ns+".recognizes_piles"} w

#print axioms correct
#print axioms recognizes_piles
end CutPeriod.Parts{k}Certificate
'''
    return out


def modular_sum_sources(source, record, by_name):
    """Release per-command proof state between bounded certificate blocks."""
    k=int(record['name'][5:]); raw_n=len(record['raw_states'])
    N=len(by_name[record['inputs'][0]]['table'])*len(by_name['graph']['table'])*2
    ns=f'CutPeriod.Parts{k}Certificate'
    base=f'Conjectures.CutPeriodParts{k}'
    block_size=256
    options='''open BinaryAutomata
set_option Elab.async false
set_option linter.all false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
'''+f'set_option exponentiation.threshold {N}\n'
    def frame(imports):
        return ''.join('import '+name+'\n' for name in imports)+f'namespace {ns}\n'+options
    def finish(s):
        return s+f'\nend {ns}\n'
    def row_block(name,total,lo,hi,body,row_prefix):
        pairs='['+','.join(f'⟨{i},{row_prefix}{i}⟩' for i in range(lo,hi))+']'
        return f'''theorem {name} : ∀ q : Fin {total}, {lo}≤q.val → q.val<{lo+block_size} →
    {body} := by
  have h : ∀ q : Fin {total}, {lo}≤q.val → q.val<{hi} → {body} :=
    FiniteCertificate.checked_interval_rows (n:={total}) (lo:={lo}) (len:={hi-lo})
      (P:=fun q => {body}) {pairs} (by decide +kernel)
  intro q hlo hhi
  exact h q hlo (by have hq := q.isLt; omega)
'''
    def aggregate(name,total,body,block_prefix):
        count=(total+block_size-1)//block_size
        pairs='['+','.join(f'⟨{i},{block_prefix}{i}⟩' for i in range(count))+']'
        return f'''theorem {name} : ∀ q : Fin {total}, {body} := by
  let Block : Fin {count} → Prop := fun i => ∀ q : Fin {total},
    i.val*{block_size}≤q.val → q.val<(i.val+1)*{block_size} → {body}
  have hb : ∀ i, Block i :=
    FiniteCertificate.checked_list_rows (P:=Block) {pairs} (by decide +kernel)
  intro q
  let i : Fin {count} := ⟨q.val/{block_size},by have hq := q.isLt; omega⟩
  apply hb i q
  all_goals dsimp only [i]; have hq := q.isLt; omega
'''
    sources={}
    manifest=[]
    def add(suffix,body):
        name=base+suffix
        sources[name.replace('.','/')+'.lean']=body
        manifest.append(name)
    split_at=source.index('theorem transition_row_0')
    add('Data',finish(source[:split_at]))
    transition_rows=re.findall(r'theorem transition_row_\d+ :[^\n]*\n',source)
    assert len(transition_rows)==N
    transition_blocks=[]
    trans_body='∀ d, cachedSuccessors q d=fast q d'
    for lo in range(0,N,block_size):
        hi=min(N,lo+block_size); b=lo//block_size
        suffix=f'TransitionRows{b}'
        block=frame([base+'Data','Conjectures.FiniteIntervalCertificate'])
        block+=''.join(transition_rows[lo:hi]).replace('by decide\n','by decide +kernel\n')
        block+=row_block(f'transition_block_{b}',N,lo,hi,trans_body,'transition_row_')
        add(suffix,finish(block)); transition_blocks.append(base+suffix)
    rep_at=source.index('def representativeData_chunk_0')
    transitions=frame(transition_blocks)
    transitions+=aggregate('checked_fast',N,trans_body,'transition_block_')
    transitions+=source[source.index('theorem checked_successors'):rep_at]
    add('Transitions',finish(transitions))
    start_at=source.index('theorem checked_start')
    state_data=frame([base+'Transitions'])+source[rep_at:start_at]
    add('StateData',finish(state_data))
    refinement_rows=re.findall(r'theorem refinement_row_\d+ :.*? := by decide\n',source,re.S)
    final_rows=re.findall(r'theorem final_row_\d+ :[^\n]*\n',source)
    assert len(refinement_rows)==raw_n and len(final_rows)==raw_n
    step_body='''∀ d, maskOfList ((active (next q d)).map Fin.val)=
      maskOfList (((active q).flatMap (fun s => composed.successors s d)).map Fin.val)'''
    final_body='(active q).any composed.final=machine.final (label q)'
    refinement_blocks=[]
    for lo in range(0,raw_n,block_size):
        hi=min(raw_n,lo+block_size); b=lo//block_size
        suffix=f'RefinementRows{b}'
        block=frame([base+'StateData','Conjectures.FiniteIntervalCertificate'])
        block+=''.join(refinement_rows[lo:hi]).replace('by decide\n','by decide +kernel\n')
        block+=''.join(final_rows[lo:hi]).replace('by decide\n','by decide +kernel\n')
        block+=row_block(f'refinement_block_{b}',raw_n,lo,hi,step_body,'refinement_row_')
        block+=row_block(f'final_block_{b}',raw_n,lo,hi,final_body,'final_row_')
        add(suffix,finish(block)); refinement_blocks.append(base+suffix)
    main=frame(refinement_blocks)
    main+=source[start_at:source.index('theorem refinement_row_0')]
    main+=aggregate('checked_step',raw_n,step_body,'refinement_block_')
    main+=source[source.index('theorem checked_label_step'):source.index('theorem final_row_0')]
    main+=aggregate('checked_final',raw_n,final_body,'final_block_')
    main+=source[source.index('theorem language'):]
    add('Certificate',main)
    sources[f'Conjectures/CutPeriodParts{k}.modules']=''.join(name+'\n' for name in manifest)
    return sources


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parts-until",type=int,default=1,choices=range(1,10))
    parser.add_argument("--lower",action="store_true",help="emit the lower-value certificate")
    parser.add_argument("--boolean",action="store_true",help="emit union and error-language certificates")
    parser.add_argument("--error-languages",action="store_true",help="emit the four error checks for numerical option DFAs")
    args=parser.parse_args()
    v.reachable_machine = reachable
    v.minimize = minimize
    single = make('graph', 'counter', [], v.candidate_graph)
    parts = {1: single}
    for k in range(2, 10):
        parts[k] = make(f'parts{k}', 'sum', ['graph' if k == 2 else f'parts{k-1}', 'graph'],
                        lambda k=k: v.pile_sum(parts[k-1], single))
    lower = make('lower', 'lower', ['graph'], lambda: v.lower_values(single))
    for tag, arities in [('A',(2,3,9)),('B',(2,3,8,9))]:
        options = make('options'+tag, 'union', [f'parts{k}' for k in arities],
                       lambda: v.combine([parts[k] for k in arities], any))
        collision = make('collision'+tag, 'intersection', ['graph','options'+tag],
                         lambda: v.combine([single,options], all))
        missing = make('missing'+tag, 'difference', ['lower','options'+tag],
                       lambda: v.combine([lower,options], lambda p:p[0] and not p[1]))
        assert not collision[1] and not missing[1]
    data = dict(source_sha256=hashlib.sha256((HERE/'verify.py').read_bytes()).hexdigest(),
                digit_order='most-significant-first', stages=records)
    path=HERE/'lean-certificate-data.json'
    path.write_text(json.dumps(data,separators=(',',':'))+'\n')
    target=ROOT/'lean/Conjectures/CutPeriodGraphCertificate.lean'
    target.write_text(graph_lean(records[0]))
    by_name={r["name"]:r for r in records}
    if args.lower:
        target.with_name("CutPeriodLowerCertificate.lean").write_text(lower_lean(by_name['lower']))
    if args.boolean or args.error_languages:
        target.with_name('CutPeriodOptionData.lean').write_text(option_data_lean(by_name))
        for record in records:
            if record['kind'] in (('union','intersection','difference') if args.boolean else ('intersection','difference')):
                target.with_name('CutPeriod'+namespace(record['name'])+'.lean').write_text(boolean_lean(record,by_name))
    for k in range(2,args.parts_until+1):
        part_path=target.with_name(f"CutPeriodParts{k}Certificate.lean")
        record=by_name[f"parts{k}"]
        source=sum_lean(record,by_name)
        if k>=3:
            for relative,body in modular_sum_sources(source,record,by_name).items():
                (target.parent.parent/relative).write_text(body)
        else:
            part_path.write_text(source)
    print(f"Wrote {path.stat().st_size} bytes of certificate data and the graph Lean certificate")


if __name__ == '__main__':
    main()
