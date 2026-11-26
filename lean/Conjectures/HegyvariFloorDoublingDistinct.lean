import Conjectures.HegyvariFloorDoublingTransport

/-!
# Hegyvári's conjecture: distinct values and finite deletions

Section 4 of the existing proof, `results/hegyvari-floor-doubling/PROOF.md`.
This module is a candidate for the indexed-to-distinct-values bridge. The
tower-derived indexed completeness and eventual cross-ray separation must
still be established for the actual real floor-doubling rays.
-/
namespace HegyvariFloorDoubling

/-- The positive values of the union, with multiplicity discarded. -/
def PositiveRayUnion (f g : Nat → Nat) (x : Nat) : Prop :=
  0 < x ∧ ((∃ i, f i = x) ∨ ∃ j, g j = x)

/-- Cofiniteness of the indexed subset sums on every common tail. -/
def IndexedTailComplete (f g : Nat → Nat) : Prop :=
  ∀ N : Nat, ∃ M : Nat, ∀ m : Nat, M ≤ m →
    ∃ xs ys : List Nat,
      xs.Nodup ∧ ys.Nodup ∧
      (∀ i ∈ xs, N ≤ i) ∧ (∀ j ∈ ys, N ≤ j) ∧
      (xs.map f).sum + (ys.map g).sum = m

/-- Strong completeness of the actual positive numerical values.
A list represents an arbitrary finite forbidden set; the witnesses have
no repeated numerical value. -/
def DistinctStrongComplete (f g : Nat → Nat) : Prop :=
  ∀ forbidden : List Nat, ∃ M : Nat, ∀ m : Nat, M ≤ m →
    ∃ values : List Nat, values.Nodup ∧ values.sum = m ∧
      ∀ x ∈ values, PositiveRayUnion f g x ∧ x ∉ forbidden

def EventuallySeparated (f g : Nat → Nat) : Prop :=
  ∃ N : Nat,
    (∀ i j, N ≤ i → N ≤ j → f i = f j → i = j) ∧
    (∀ i j, N ≤ i → N ≤ j → g i = g j → i = j) ∧
    (∀ i j, N ≤ i → N ≤ j → f i ≠ g j)

def EventuallyAbove (f : Nat → Nat) : Prop :=
  ∀ B : Nat, ∃ N : Nat, ∀ i, N ≤ i → B ≤ f i

private theorem le_sum_of_mem {xs : List Nat} {x : Nat} (hx : x ∈ xs) :
    x ≤ xs.sum := by
  induction xs with
  | nil => simp at hx
  | cons a xs ih =>
    rw [List.mem_cons] at hx
    rw [List.sum_cons]
    rcases hx with h | h
    · omega
    · have hle := ih h
      omega

private theorem nodup_map_on_tail {f : Nat → Nat} {N : Nat}
    (hinj : ∀ i j, N ≤ i → N ≤ j → f i = f j → i = j)
    (xs : List Nat) (hxs : xs.Nodup) (htail : ∀ i ∈ xs, N ≤ i) :
    (xs.map f).Nodup := by
  induction xs with
  | nil => simp
  | cons a xs ih =>
    rw [List.map_cons, List.nodup_cons]
    rcases List.nodup_cons.mp hxs with ⟨ha, hnd⟩
    constructor
    · intro hmem
      rcases List.mem_map.mp hmem with ⟨i, hi, heq⟩
      have haN := htail a List.mem_cons_self
      have hiN := htail i (List.mem_cons_of_mem a hi)
      have hia := hinj i a hiN haN heq
      exact ha (hia ▸ hi)
    · exact ih hnd (fun i hi => htail i (List.mem_cons_of_mem a hi))

/-- Indexed witnesses become actual distinct numerical witnesses on a
separated tail. A single cutoff also avoids every element of any given
finite forbidden set. -/
theorem indexedTailComplete_to_distinctStrongComplete {f g : Nat → Nat}
    (hidx : IndexedTailComplete f g) (hsep : EventuallySeparated f g)
    (hf : EventuallyAbove f) (hg : EventuallyAbove g) :
    DistinctStrongComplete f g := by
  intro forbidden
  rcases hsep with ⟨S, hfinj, hginj, hcross⟩
  rcases hf (forbidden.sum + 1) with ⟨T, hfT⟩
  rcases hg (forbidden.sum + 1) with ⟨U, hgU⟩
  let N := max S (max T U)
  have hSN : S ≤ N := Nat.le_max_left S (max T U)
  have hTN : T ≤ N := Nat.le_trans (Nat.le_max_left T U) (Nat.le_max_right S (max T U))
  have hUN : U ≤ N := Nat.le_trans (Nat.le_max_right T U) (Nat.le_max_right S (max T U))
  rcases hidx N with ⟨M, hM⟩
  refine ⟨M, ?_⟩
  intro m hm
  rcases hM m hm with ⟨xs, ys, hxnd, hynd, hxt, hyt, hsum⟩
  have hxn : (xs.map f).Nodup :=
    nodup_map_on_tail (fun i j hi hj heq =>
      hfinj i j (Nat.le_trans hSN hi) (Nat.le_trans hSN hj) heq) xs hxnd hxt
  have hyn : (ys.map g).Nodup :=
    nodup_map_on_tail (fun i j hi hj heq =>
      hginj i j (Nat.le_trans hSN hi) (Nat.le_trans hSN hj) heq) ys hynd hyt
  refine ⟨xs.map f ++ ys.map g, ?_, ?_, ?_⟩
  · apply List.nodup_append.mpr
    refine ⟨hxn, hyn, ?_⟩
    intro x hx y hy hxy
    rcases List.mem_map.mp hx with ⟨i, hi, rfl⟩
    rcases List.mem_map.mp hy with ⟨j, hj, rfl⟩
    exact hcross i j (Nat.le_trans hSN (hxt i hi))
      (Nat.le_trans hSN (hyt j hj)) hxy
  · simpa only [List.sum_append] using hsum
  · intro x hx
    rcases List.mem_append.mp hx with hx | hx
    · rcases List.mem_map.mp hx with ⟨i, hi, rfl⟩
      have hbig := hfT i (Nat.le_trans hTN (hxt i hi))
      refine ⟨⟨by omega, Or.inl ⟨i, rfl⟩⟩, ?_⟩
      intro hbad
      have hle := le_sum_of_mem hbad
      omega
    · rcases List.mem_map.mp hx with ⟨j, hj, rfl⟩
      have hbig := hgU j (Nat.le_trans hUN (hyt j hj))
      refine ⟨⟨by omega, Or.inr ⟨j, rfl⟩⟩, ?_⟩
      intro hbad
      have hle := le_sum_of_mem hbad
      omega

private theorem succ_le_two_pow (n : Nat) : n + 1 ≤ 2 ^ n := by
  induction n with
  | zero => decide
  | succ n ih =>
    rw [Nat.pow_succ]
    omega

/-- A positive binary-step ray eventually exceeds every numerical bound. -/
theorem binaryStep_eventuallyAbove {f : Nat → Nat} {d : Nat → Bool}
    (h : BinaryStep f d) (i0 : Nat) (hpos : 0 < f i0) :
    EventuallyAbove f := by
  intro B
  refine ⟨i0 + B, ?_⟩
  intro i hi
  have hlow := binaryStep_lower h i0 (i - i0)
  have heq : i0 + (i - i0) = i := by omega
  rw [heq] at hlow
  have hm : 2 ^ (i - i0) ≤ 2 ^ (i - i0) * f i0 := by
    simpa using Nat.mul_le_mul_left (2 ^ (i - i0)) (show 1 ≤ f i0 by omega)
  have hp := succ_le_two_pow (i - i0)
  omega

/-- Once positive, a binary-step ray is strictly increasing. -/
theorem binaryStep_strictOnTail {f : Nat → Nat} {d : Nat → Bool}
    (h : BinaryStep f d) (i0 : Nat) (hpos : 0 < f i0) :
    ∀ i j, i0 ≤ i → i < j → f i < f j := by
  intro i j hi hij
  have hbase := binaryStep_lower h i0 (i - i0)
  have heq : i0 + (i - i0) = i := by omega
  rw [heq] at hbase
  have hpowpos : 1 ≤ 2 ^ (i - i0) := by
    have hp := succ_le_two_pow (i - i0)
    omega
  have hm : f i0 ≤ 2 ^ (i - i0) * f i0 := by
    simpa using Nat.mul_le_mul_right (f i0) hpowpos
  have hfi : 0 < f i := by omega
  have hj := binaryStep_lower h i (j - i)
  have heq' : i + (j - i) = j := by omega
  rw [heq'] at hj
  have hpow2 : 2 ≤ 2 ^ (j - i) := by
    have hp := succ_le_two_pow (j - i)
    omega
  have hmul := Nat.mul_le_mul_right (f i) hpow2
  omega

theorem binaryStep_injectiveOnTail {f : Nat → Nat} {d : Nat → Bool}
    (h : BinaryStep f d) (i0 : Nat) (hpos : 0 < f i0) :
    ∀ i j, i0 ≤ i → i0 ≤ j → f i = f j → i = j := by
  intro i j hi hj heq
  by_cases hlt : i < j
  · have hstrict := binaryStep_strictOnTail h i0 hpos i j hi hlt
    omega
  · by_cases hgt : j < i
    · have hstrict := binaryStep_strictOnTail h i0 hpos j i hj hgt
      omega
    · omega

/-- The Section 4 bridge for positive binary-step rays. Only the
cross-ray noncoincidence and the indexed completeness are left as hypotheses.
They must be derived for the real floor rays before the conjecture is proved. -/
theorem distinctStrongComplete_of_binarySteps
    {f g : Nat → Nat} {u v : Nat → Bool} (hf : BinaryStep f u)
    (hg : BinaryStep g v) (i0 j0 : Nat) (hfpos : 0 < f i0) (hgpos : 0 < g j0)
    (hcross : ∃ K : Nat, ∀ i j, K ≤ i → K ≤ j → f i ≠ g j)
    (hidx : IndexedTailComplete f g) : DistinctStrongComplete f g := by
  rcases hcross with ⟨K, hK⟩
  let N := max K (max i0 j0)
  have hKN : K ≤ N := Nat.le_max_left K (max i0 j0)
  have hiN : i0 ≤ N := Nat.le_trans (Nat.le_max_left i0 j0)
    (Nat.le_max_right K (max i0 j0))
  have hjN : j0 ≤ N := Nat.le_trans (Nat.le_max_right i0 j0)
    (Nat.le_max_right K (max i0 j0))
  apply indexedTailComplete_to_distinctStrongComplete hidx
  · refine ⟨N, ?_, ?_, ?_⟩
    · intro i j hi hj heq
      exact binaryStep_injectiveOnTail hf i0 hfpos i j
        (Nat.le_trans hiN hi) (Nat.le_trans hiN hj) heq
    · intro i j hi hj heq
      exact binaryStep_injectiveOnTail hg j0 hgpos i j
        (Nat.le_trans hjN hi) (Nat.le_trans hjN hj) heq
    · intro i j hi hj
      exact hK i j (Nat.le_trans hKN hi) (Nat.le_trans hKN hj)
  · exact binaryStep_eventuallyAbove hf i0 hfpos
  · exact binaryStep_eventuallyAbove hg j0 hgpos

end HegyvariFloorDoubling
