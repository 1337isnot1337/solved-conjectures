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
from pathlib import Path
import sys

sys.dont_write_bytecode = True
HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
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


def boolean_lean(record, by_name):
    inputs=record['inputs']
    counts=[len(by_name[name]['table']) for name in inputs]
    ns=[namespace(name) for name in inputs]
    raw_n=len(record['raw_states']); n=len(record['table'])
    union=record['kind']=='union'
    op='(fun a b => a || b)' if union else ('(fun a b => a && b)' if record['kind']=='intersection' else '(fun a b => a && !b)')
    qtype=f'Fin {counts[0]}'
    semantic=ns[0]+'.machine'
    for c,src in zip(counts[1:],ns[1:]):
        qtype=f'({qtype} × Fin {c})'
        semantic=f'({semantic}).product {src}.machine {op}'
    reps=[]
    for state in record['raw_states']:
        rep=f'({state[0]} : Fin {counts[0]})'
        for i,c in zip(state[1:],counts[1:]):
            rep=f'({rep},({i} : Fin {c}))'
        reps.append(rep)
    out='-- Generated data; all Boolean-language refinements are checked by Lean.\n'
    out+='import Conjectures.BinaryBoolean\n'
    out+=''.join('import Conjectures.CutPeriod'+src+'\n' for src in ns)
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
    out+=f'''
def machine : DFA (Fin {n}) := {{
  step := fun q d => Fin.ofNat {n} ((machineRow q.val)[d.val]!)
  start := 0
  final := fun q => finalData q.val
}}
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
    out=f'''-- Generated data. Every transition-cache row and refinement row is checked.
import Conjectures.BinaryComposition
import Conjectures.CutPeriodGraphCertificate
import Conjectures.CutPeriodPiles
{import_left}namespace CutPeriod.Parts{k}Certificate
open BinaryAutomata
set_option maxRecDepth 100000
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
    out+=balanced_lookup('successorData','Array (List Nat)',successor_rows)
    out+=f'''def cachedSuccessors (s : Fin {N}) (d : Digit) : List (Fin {N}) :=
  (successorData s.val)[d.val]!.map (Fin.ofNat {N})

def composed : NFA {N} := {{semantic with successors := cachedSuccessors}}
'''
    for i in range(N):
        out+=f'theorem transition_row_{i} : ∀ d, cachedSuccessors ({i} : Fin {N}) d=semantic.successors ({i} : Fin {N}) d := by decide\n'
    out+=f'''theorem checked_successors : ∀ s d, cachedSuccessors s d=semantic.successors s d :=
  {aggregate_rows('transition_row_',N)}

theorem composed_eq : composed=semantic := by
  have h : cachedSuccessors=semantic.successors := funext (fun s => funext (checked_successors s))
  unfold composed
  rw [h]
'''
    active=[]
    for S in record['raw_states']:
        active.append('['+','.join(str((i*R+j)*2+c) for i,j,c in S)+']')
    rows=lambda table:lean_array([lean_array(map(str,r)) for r in table])
    out+=balanced_lookup('representativeData','List Nat',active)
    out+=balanced_lookup('rawRow','Array Nat',[lean_array(map(str,r)) for r in record['raw_table']])
    out+=balanced_lookup('labelData','Nat',list(map(str,record['labels'])))
    out+=balanced_lookup('machineRow','Array Nat',[lean_array(map(str,r)) for r in record['table']])
    out+=balanced_lookup('finalData','Bool',['true' if i in record['final'] else 'false' for i in range(n)])
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


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parts-until",type=int,default=1,choices=range(1,10))
    parser.add_argument("--lower",action="store_true",help="emit the lower-value certificate")
    parser.add_argument("--boolean",action="store_true",help="emit union and error-language certificates")
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
    target=ROOT/'l-solitaire-limit-shapes/lean/Conjectures/CutPeriodGraphCertificate.lean'
    target.write_text(graph_lean(records[0]))
    by_name={r["name"]:r for r in records}
    if args.lower:
        target.with_name("CutPeriodLowerCertificate.lean").write_text(lower_lean(by_name['lower']))
    if args.boolean:
        for record in records:
            if record['kind'] in ('union','intersection','difference'):
                target.with_name('CutPeriod'+namespace(record['name'])+'.lean').write_text(boolean_lean(record,by_name))
    for k in range(2,args.parts_until+1):
        part_path=target.with_name(f"CutPeriodParts{k}Certificate.lean")
        part_path.write_text(sum_lean(by_name[f"parts{k}"],by_name))
    print(f"Wrote {path.stat().st_size} bytes of certificate data and the graph Lean certificate")


if __name__ == '__main__':
    main()
