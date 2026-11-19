#!/usr/bin/env python3
"""Untrusted producer for the finite CUT quotient/residue certificates.

Lean checks every transition used by the collision screen and every explicit
lower-option witness. No assertion in this program is a proof assumption.
The original automata generator and completed certificate files are untouched.
"""
from pathlib import Path
import argparse
import itertools
import json


ROOT = Path(__file__).resolve().parents[2]
# Indices 0..10 allow every q>=0; 11 and12 require q=0; 13 requires q>=1.
SHAPES = [(1, 0), (2, 1), (4, 3), (5, 1), (7, 3), (8, 2),
          (9, 4), (10, 5), (11, 6), (12, 7), (15, 7),
          (3, 2), (6, 4), (6, 0)]
ARITIES = (2, 3, 9)
COLLISION_ARITIES = (2, 3, 8, 9)


def xor(values):
    result = 0
    for value in values:
        result ^= value
    return result


def collision_masks():
    table = [[0] * 16 for _ in range(10)]
    table[0][0] = 1
    for p in range(9):
        for w in range(16):
            for code in range(16):
                if not (table[p][w] >> code) & 1:
                    continue
                for s, (v, r) in enumerate(SHAPES):
                    if w + v <= 15:
                        target = (code % 8) ^ r
                        target += 8 * (code >= 8 or s not in (11, 12))
                        table[p + 1][w + v] |= 1 << target
    exceptions = []
    for s, (w, r) in enumerate(SHAPES):
        for p in COLLISION_ARITIES:
            for total in range(w + 1):
                if (w - total) % 12:
                    continue
                for flexible in (False, True):
                    if (table[p][total] >> (r + 8 * flexible)) & 1:
                        exceptions.append((s, p, total, flexible))
    assert exceptions == [(13, 2, 6, False)]
    return table, exceptions


def cover_templates():
    # This finite DP has no positive-quotient shape. Fixed atoms remain fixed.
    levels = {0: {(0, 0, 0): []}}
    for p in range(1, 10):
        levels[p] = {}
        for (w, r, free), word in levels[p - 1].items():
            for s, (v, low) in enumerate(SHAPES[:13]):
                if w + v <= 51:
                    key = w + v, r ^ low, free + (s < 11)
                    levels[p].setdefault(key, word + [s])
    witnesses = {}
    for offset in range(4):
        required_free = 1 if offset < 2 else 3
        for target, (w, r) in enumerate(SHAPES):
            if target in (11, 12):
                continue
            for low in range(r if offset == 0 else 8):
                found = next((word for p in ARITIES
                              for (total, value, free), word in levels[p].items()
                              if total == w + 12 * offset and value == low
                              and free >= required_free), None)
                if found is None:
                    raise RuntimeError(f"No witness for {(offset, target, low)}")
                # The first one/three positions receive arbitrary high quotients.
                found = [s for s in found if s < 11] + [s for s in found if s >= 11]
                assert all(s < 11 for s in found[:required_free])
                assert sum(SHAPES[s][0] for s in found) == w + 12 * offset
                assert xor(SHAPES[s][1] for s in found) == low
                witnesses[offset, target, low] = found
    assert len(witnesses) == 327
    return witnesses


def small_templates():
    prefix = [0, 0, 1, 2, 3, 1, 4]
    result = {}
    for n in range(1, 7):
        for g in range(prefix[n]):
            found = next((list(word) for p in (2, 3)
                          for word in itertools.product(range(1, n + 1), repeat=p)
                          if sum(word) == n and xor(prefix[a] for a in word) == g), None)
            assert found is not None
            result[n, g] = found
    return result


def nat_list(values):
    return "[" + ",".join(map(str, values)) + "]"


def collision_source(table):
    rows = ",\n  ".join("#" + nat_list(row) for row in table)
    return f'''import Conjectures.CutPeriodWeightPiles

/-! Generated finite collision screen. Every successor and every excluded
target profile below is checked by kernel reduction. -/
namespace CutPeriod.Weight
set_option Elab.async false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

def profileRows : Array (Array Nat) := #[
  {rows}]

def profileMask (p w : Nat) : Nat := (profileRows[p]!)[w]!
def profileCode (r : Nat) (b : Bool) : Nat := r+(if b then 8 else 0)
def profileHas (p w r : Nat) (b : Bool) : Bool :=
  (profileMask p w).testBit (profileCode r b)

theorem profile_start : profileHas 0 0 0 false=true := by decide +kernel

theorem profile_step_finite : ∀ p : Fin 9, ∀ w : Fin 16, ∀ r : Fin 8,
    ∀ b : Bool, ∀ s : Shape,
    w.val+weight s≤15 → profileHas p.val w.val r.val b=true →
    profileHas (p.val+1) (w.val+weight s) (r.val ^^^ low s)
      (b || flexible s)=true := by decide +kernel

theorem profile_step (p w r : Nat) (b : Bool) (s : Shape)
    (hp : p<9) (hw : w+weight s≤15) (hr : r<8)
    (h : profileHas p w r b=true) :
    profileHas (p+1) (w+weight s) (r ^^^ low s) (b || flexible s)=true := by
  exact profile_step_finite ⟨p,hp⟩ ⟨w,by omega⟩ ⟨r,hr⟩ b s hw h

theorem profile_exclusion_finite : ∀ s : Shape, ∀ p : Fin 10,
    ∀ w : Fin 16, ∀ b : Bool,
    (p.val=2 ∨ p.val=3 ∨ p.val=8 ∨ p.val=9) →
    w.val≤weight s → w.val%12=weight s%12 →
    profileHas p.val w.val (low s) b=true → s.val=13 ∧ b=false := by
  decide +kernel

theorem profile_exclusion (s : Shape) (p w : Nat) (b : Bool)
    (hp : p=2 ∨ p=3 ∨ p=8 ∨ p=9)
    (hw : w≤weight s) (hmod : w%12=weight s%12)
    (h : profileHas p w (low s) b=true) : s.val=13 ∧ b=false := by
  have hbound := (weight_bounds s).2
  exact profile_exclusion_finite s ⟨p,by omega⟩ ⟨w,by omega⟩ b hp hw hmod h

end CutPeriod.Weight
'''


def cover_source(witnesses, small):
    one = []
    three = []
    for mode in range(2):
        for target in range(14):
            for low in range(8):
                word = witnesses.get((mode, target, low), [0])
                one.append("⟨" + str(word[0]) + "," + nat_list(word[1:]) + "⟩")
                word = witnesses.get((mode + 2, target, low), [0, 0, 0])
                three.append("⟨" + ",".join(map(str, word[:3])) + "," + nat_list(word[3:]) + "⟩")
    one_data = ",\n  ".join(one)
    three_data = ",\n  ".join(three)
    small_data = ",".join(nat_list(small.get((n, g), [])) for n in range(7) for g in range(5))
    return f'''import Conjectures.CutPeriodWeightPiles

/-! Generated explicit lower-option witnesses. There are 327 used rows.
Each arbitrary quotient is assigned only to a proved unrestricted ray. -/
namespace CutPeriod.Weight
set_option Elab.async false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

def AllowedArity (p : Nat) : Prop := p=2 ∨ p=3 ∨ p=9
instance (p : Nat) : Decidable (AllowedArity p) :=
  inferInstanceAs (Decidable (p=2 ∨ p=3 ∨ p=9))

structure OneTemplate where
  head : Shape
  tail : List Shape
  deriving Inhabited

def OneTemplate.word (t : OneTemplate) : List Shape := t.head::t.tail
def OneTemplate.Valid (t : OneTemplate) (w r : Nat) : Prop :=
  t.head.val<11 ∧ t.tail.all (fun s => decide (s.val<13))=true ∧
    AllowedArity t.word.length ∧ templateWeight t.word=w ∧ templateLow t.word=r
instance (t : OneTemplate) (w r : Nat) : Decidable (t.Valid w r) := by
  unfold OneTemplate.Valid
  infer_instance

def oneTemplates : Array OneTemplate := #[
  {one_data}]
def oneTemplate (mode : Fin 2) (s : Shape) (r : Fin 8) : OneTemplate :=
  oneTemplates[mode.val*112+s.val*8+r.val]!

theorem one_zero_valid : ∀ s : Shape, ∀ r : Fin 8,
    s.val≠11 → s.val≠12 → r.val<low s →
    (oneTemplate 0 s r).Valid (weight s) r.val := by decide +kernel

theorem one_one_valid : ∀ s : Shape, ∀ r : Fin 8,
    s.val≠11 → s.val≠12 →
    (oneTemplate 1 s r).Valid (weight s+12) r.val := by decide +kernel

structure ThreeTemplate where
  first : Shape
  second : Shape
  third : Shape
  tail : List Shape
  deriving Inhabited

def ThreeTemplate.word (t : ThreeTemplate) : List Shape :=
  t.first::t.second::t.third::t.tail
def ThreeTemplate.Valid (t : ThreeTemplate) (w r : Nat) : Prop :=
  t.first.val<11 ∧ t.second.val<11 ∧ t.third.val<11 ∧
    t.tail.all (fun s => decide (s.val<13))=true ∧
    AllowedArity t.word.length ∧ templateWeight t.word=w ∧ templateLow t.word=r
instance (t : ThreeTemplate) (w r : Nat) : Decidable (t.Valid w r) := by
  unfold ThreeTemplate.Valid
  infer_instance

def threeTemplates : Array ThreeTemplate := #[
  {three_data}]
def threeTemplate (parity : Fin 2) (s : Shape) (r : Fin 8) : ThreeTemplate :=
  threeTemplates[parity.val*112+s.val*8+r.val]!

theorem three_valid : ∀ parity : Fin 2, ∀ s : Shape, ∀ r : Fin 8,
    s.val≠11 → s.val≠12 →
    (threeTemplate parity s r).Valid (weight s+12*(2+parity.val)) r.val := by
  decide +kernel

def smallTemplates : Array (List Nat) := #[{small_data}]
def smallTemplate (n g : Nat) : List Nat := smallTemplates[n*5+g]!
def SmallValid (l : List Nat) (n g : Nat) : Prop :=
  l.all (fun a => decide (0<a))=true ∧ AllowedArity l.length ∧
    l.sum=n ∧ CutFamily.xorList (l.map value)=g
instance (l : List Nat) (n g : Nat) : Decidable (SmallValid l n g) := by
  unfold SmallValid
  infer_instance

theorem small_value_bound : ∀ n : Fin 7, value n.val≤4 := by decide +kernel

theorem small_valid : ∀ n : Fin 7, ∀ g : Fin 5, 0<n.val → g.val<value n.val →
    SmallValid (smallTemplate n.val g.val) n.val g.val := by decide +kernel

end CutPeriod.Weight
'''


def write(path, text):
    if not path.exists() or path.read_text() != text:
        path.write_text(text)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, default=ROOT / "lean/Conjectures")
    parser.add_argument("--json", type=Path)
    args = parser.parse_args()
    table, exceptions = collision_masks()
    witnesses = cover_templates()
    small = small_templates()
    args.output_dir.mkdir(parents=True, exist_ok=True)
    write(args.output_dir / "CutPeriodWeightTables.lean", collision_source(table))
    write(args.output_dir / "CutPeriodWeightCoverTables.lean", cover_source(witnesses, small))
    if args.json:
        data = {"shapes": SHAPES, "collision_masks": table, "collision_exceptions": exceptions,
                "cover_witnesses": [{"offset": o, "target": s, "low": r, "shapes": word}
                                    for (o, s, r), word in sorted(witnesses.items())],
                "small_witnesses": [{"n": n, "g": g, "piles": word}
                                    for (n, g), word in sorted(small.items())]}
        args.json.write_text(json.dumps(data, indent=2) + "\n")
    print(f"Generated 160 collision masks, {len(witnesses)} lower-option rows, "
          f"and {len(small)} small-pile rows; no Lean check has been performed.")


if __name__ == "__main__":
    main()
