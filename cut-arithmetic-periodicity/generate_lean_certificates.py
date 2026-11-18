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


def sum_lean(record, by_name):
    k=int(record['name'][5:])
    left_name=record['inputs'][0]
    left=by_name[left_name]
    right=by_name['graph']
    L,R=len(left['table']),len(right['table'])
    N=L*R*2
    raw_n=len(record['raw_states']); n=len(record['table'])
    left_ns='GraphCertificate' if k==2 else f'Parts{k-1}Certificate'
    import_left='' if k==2 else f'import Conjectures.CutPeriodParts{k-1}Certificate\n'
    out=f'''-- Generated data. All encoding and refinement claims are kernel checked.
import Conjectures.BinaryComposition
import Conjectures.CutPeriodGraphCertificate
{import_left}namespace CutPeriod.Parts{k}Certificate
open BinaryAutomata
set_option maxRecDepth 100000
set_option maxHeartbeats 0

def left (s : Fin {N}) : Fin {L} := Fin.ofNat {L} (s.val/({R}*2))
def right (s : Fin {N}) : Fin {R} := Fin.ofNat {R} ((s.val/2)%{R})
def carry (s : Fin {N}) : Fin 2 := Fin.ofNat 2 (s.val%2)
def pack (a : Fin {L}) (b : Fin {R}) (c : Fin 2) : Fin {N} :=
  Fin.ofNat {N} ((a.val*{R}+b.val)*2+c.val)

def encoding : ProductEncoding {L} {R} {N} := {{
  left := left, right := right, carry := carry, pack := pack
  left_pack := by decide
  right_pack := by decide
  carry_pack := by decide
  pack_parts := by decide
}}

def composed : NFA {N} := sumMachine encoding {left_ns}.machine GraphCertificate.machine
  {left_ns}.machine.rejectingSink GraphCertificate.machine.rejectingSink
'''
    active=[]
    for S in record['raw_states']:
        ids=sorted((i*R+j)*2+c for i,j,c in S)
        active.append('['+','.join(map(str,ids))+']')
    rows=lambda table:lean_array([lean_array(map(str,r)) for r in table])
    out+=f"def representatives : Array (List Nat) := {lean_array(active)}\n"
    out+=f"def rawTable : Array (Array Nat) := {rows(record['raw_table'])}\n"
    out+=f"def labels : Array Nat := {lean_array(map(str,record['labels']))}\n"
    out+=f"def table : Array (Array Nat) := {rows(record['table'])}\n"
    out+=f"def finals : Array Bool := {lean_array('true' if i in record['final'] else 'false' for i in range(n))}\n"
    out+=f'''
def machine : DFA (Fin {n}) := {{
  step := fun q d => Fin.ofNat {n} (table[q.val]![d.val]!)
  start := 0
  final := fun q => finals[q.val]!
}}
def active (q : Fin {raw_n}) : List (Fin {N}) :=
  representatives[q.val]!.map (Fin.ofNat {N})
def label (q : Fin {raw_n}) : Fin {n} := Fin.ofNat {n} labels[q.val]!
def next (q : Fin {raw_n}) (d : Digit) : Fin {raw_n} :=
  Fin.ofNat {raw_n} (rawTable[q.val]![d.val]!)

theorem checked_start : maskOfList ((active 0).map Fin.val)=composed.startMask := by decide
theorem checked_label_start : label 0=machine.start := by decide

theorem checked_step : ∀ q d,
    maskOfList ((active (next q d)).map Fin.val)=
      maskOfList (((active q).flatMap (fun s => composed.successors s d)).map Fin.val) := by decide

theorem checked_label_step : ∀ q d, label (next q d)=machine.step (label q) d := by decide

theorem checked_final : ∀ q, (active q).any composed.final=machine.final (label q) := by decide

theorem language (w : List Digit) : composed.accepts w=machine.accepts w :=
  certified_list_refinement composed machine (0 : Fin {raw_n}) active label next
    checked_start checked_label_start checked_step checked_label_step checked_final w

theorem correct (w : List Digit) : machine.accepts w=true ↔
    ∃ cols : List Column, cols.map Column.out=w ∧
      {left_ns}.machine.accepts (cols.map Column.left)=true ∧
      GraphCertificate.machine.accepts (cols.map Column.right)=true ∧
      leftSize cols+rightSize cols=outSize cols ∧ leftValue cols ^^^ rightValue cols=outValue cols := by
  rw [←language]
  exact sum_accepts_iff encoding _ _ _ _
    {left_ns}.machine.rejectingSink_sound GraphCertificate.machine.rejectingSink_sound w

#print axioms correct
end CutPeriod.Parts{k}Certificate
'''
    return out


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parts-until",type=int,default=1,choices=range(1,10))
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
    for k in range(2,args.parts_until+1):
        part_path=target.with_name(f"CutPeriodParts{k}Certificate.lean")
        part_path.write_text(sum_lean(by_name[f"parts{k}"],by_name))
    print(f"Wrote {path.stat().st_size} bytes of certificate data and the graph Lean certificate")


if __name__ == '__main__':
    main()
