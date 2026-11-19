import Conjectures.LiBasic

/-!
# A computable enumeration of the integer partitions of `31`

`partsAux n k` lists the partitions of `n` whose parts are at most `k`, in
decreasing order.  The recursion decides whether the part `k` is used:

* either all parts are at most `k - 1`, giving `partsAux n (k - 1)`;
* or the part `k` is used, and the rest is a partition of `n - k` with parts
  at most `k`, giving `(k :: ·)` applied to `partsAux (n - k) k`.

The definition is written with an explicit fuel argument, so it is structurally
recursive on the fuel and the kernel can reduce it.  (A direct well-founded
recursion is rejected by `decide`, which cannot reduce the well-founded
fixpoint.)  The wrapper `partsAux n k` uses fuel `n + k`.

`mem_partsAuxF` proves that every decreasing list of positive integers summing
to `n`, with every part at most `k`, occurs in `partsAuxF fuel n k` whenever
`n + k ≤ fuel`.  Specializing to `n = k = 31` gives the completeness of the
enumeration used by the edge-cut certificate.
-/

namespace LiFinal

/-- Fueled version of the partition enumeration. -/
@[reducible] def partsAuxF : Nat → Nat → Nat → List (List Nat)
  | 0, n, _ => if n = 0 then [[]] else []
  | _ + 1, 0, _ => [[]]
  | _ + 1, _ + 1, 0 => []
  | fuel + 1, n + 1, k + 1 =>
      partsAuxF fuel (n + 1) k ++
        (if k < n + 1 then (partsAuxF fuel (n - k) (k + 1)).map (fun l => (k + 1) :: l) else [])

/-- Partitions of `n` with all parts at most `k`, in decreasing order. -/
def partsAux (n k : Nat) : List (List Nat) :=
  partsAuxF (n + k) n k

/-- A decreasing list of positive integers summing to `n`. -/
def IsPartitionOf (n : Nat) (p : List Nat) : Prop :=
  p.sum = n ∧ (∀ x ∈ p, 0 < x) ∧ p.Pairwise (· ≥ ·)

/-- If the maximum allowed part `k` occurs in a decreasing bounded list, it is
the head of the list. -/
lemma exists_cons_of_mem_max {k : Nat} {p : List Nat}
    (hdec : p.Pairwise (· ≥ ·)) (hbound : ∀ x ∈ p, x ≤ k)
    (hmem : k ∈ p) : ∃ rest, p = k :: rest := by
  cases p with
  | nil => simp at hmem
  | cons a t =>
    have ha_eq : a = k := by
      have hle : a ≤ k := hbound a (by simp)
      by_contra hne
      have hmem_t : k ∈ t := by
        rcases List.mem_cons.mp hmem with h | h
        · exact absurd h.symm hne
        · exact h
      have hge : a ≥ k := (List.pairwise_cons.mp hdec).1 k hmem_t
      omega
    exact ⟨t, by simp [ha_eq]⟩

/-- Completeness of the fueled enumeration. -/
theorem mem_partsAuxF : ∀ (fuel n k : Nat) (p : List Nat),
    n + k ≤ fuel →
    p.sum = n → (∀ x ∈ p, 0 < x) → p.Pairwise (· ≥ ·) →
    (∀ x ∈ p, x ≤ k) → p ∈ partsAuxF fuel n k := by
  intro fuel
  induction fuel with
  | zero =>
    intro n k p hnk hsum hpos hdec hbound
    have hn : n = 0 := by omega
    have hk : k = 0 := by omega
    subst hn
    subst hk
    cases p with
    | nil => simp [partsAuxF]
    | cons a t =>
      simp only [List.sum_cons] at hsum
      have ha : 0 < a := hpos a (by simp)
      omega
  | succ fuel ih =>
    intro n k p hnk hsum hpos hdec hbound
    cases n with
    | zero =>
      cases p with
      | nil => simp [partsAuxF]
      | cons a t =>
        simp only [List.sum_cons] at hsum
        have ha : 0 < a := hpos a (by simp)
        omega
    | succ n' =>
      cases k with
      | zero =>
        cases p with
        | nil => simp only [List.sum_nil] at hsum; omega
        | cons a t =>
          have ha : 0 < a := hpos a (by simp)
          have hle : a ≤ 0 := hbound a (by simp)
          omega
      | succ k' =>
        by_cases hm : k' + 1 ∈ p
        · rcases exists_cons_of_mem_max hdec hbound hm with ⟨rest, rfl⟩
          simp only [List.sum_cons] at hsum
          have hrest_sum : rest.sum = n' - k' := by omega
          have hrest_pos : ∀ x ∈ rest, 0 < x := by
            intro x hx
            exact hpos x (by simp [hx])
          have hrest_dec : rest.Pairwise (· ≥ ·) := (List.pairwise_cons.mp hdec).2
          have hrest_bound : ∀ x ∈ rest, x ≤ k' + 1 := by
            intro x hx
            exact hbound x (by simp [hx])
          have hmem_rest : rest ∈ partsAuxF fuel (n' - k') (k' + 1) :=
            ih (n' - k') (k' + 1) rest (by omega)
              hrest_sum hrest_pos hrest_dec hrest_bound
          have hk : k' < n' + 1 := by
            have := List.le_sum_of_mem hm
            omega
          simp only [partsAuxF, hk, ↓reduceIte, List.mem_append, List.mem_map]
          exact Or.inr ⟨rest, hmem_rest, rfl⟩
        · have hbound' : ∀ x ∈ p, x ≤ k' := by
            intro x hx
            have hle : x ≤ k' + 1 := hbound x hx
            have hne : x ≠ k' + 1 := by
              intro hxeq
              exact hm (hxeq ▸ hx)
            omega
          have hmem' : p ∈ partsAuxF fuel (n' + 1) k' :=
            ih (n' + 1) k' p (by omega) hsum hpos hdec hbound'
          simp only [partsAuxF, List.mem_append]
          exact Or.inl hmem'

/-- Every integer partition of `31` occurs in `partsAux 31 31`. -/
theorem partsAux_complete_31 {p : List Nat} (hp : IsPartitionOf 31 p) :
    p ∈ partsAux 31 31 := by
  rcases hp with ⟨hsum, hpos, hdec⟩
  unfold partsAux
  exact mem_partsAuxF 62 31 31 p (by decide) hsum hpos hdec (by
    intro x hx
    have := List.le_sum_of_mem hx
    omega)

end LiFinal
