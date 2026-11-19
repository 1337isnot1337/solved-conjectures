import Conjectures.LiPartitionsFinalEnum

/-!
# Exact count and duplicate-freeness of the integer partitions of `31`

`Conjectures/LiPartitionsFinalEnum.lean` defines the computable enumeration
`LiFinal.partsAux 31 31` and proves that it is complete: every decreasing,
positive list summing to `31` occurs in it.  `Conjectures/LiPartitionsFinal.lean`
derives `(partsAux 31 31).length = 6842` from the edge-cut certificate.

This module closes the two statements that the certificate comparison alone
does not provide at the level of the enumeration:

* `partsAuxF_nodup`: a structural proof, for every `fuel`, `n` and `k`, that
  `partsAuxF fuel n k` contains no repeated list (no `decide`, no native code);
* `partsAux_31_nodup`, `partsAux_31_length_exact`: the enumeration of the
  partitions of `31` is duplicate-free and has exactly 6,842 rows;
* `mem_partsAux_31_iff`: the enumeration is also sound, so its rows are
  exactly the integer partitions of `31` (exhaustive and precise);
* `card_partitions_31`: the type of integer partitions of `31` has cardinality
  6,842, with the finset `(partsAux 31 31).toFinset` as its `Fintype` data.

The only concrete computation is the kernel-checked evaluation of the length
of the closed list `partsAux 31 31`; duplicate-freeness is proved structurally
for all parameters.
-/

namespace LiFinal

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-! ## Invariants of the fueled enumeration -/

/-- Every element of `partsAuxF fuel n k` sums to `n`. -/
theorem partsAuxF_sum : ∀ (fuel n k : Nat) (p : List Nat),
    p ∈ partsAuxF fuel n k → p.sum = n := by
  intro fuel
  induction fuel with
  | zero =>
    intro n k p hp
    by_cases hn : n = 0
    · subst hn
      simp [partsAuxF] at hp
      subst hp
      rfl
    · simp [partsAuxF, hn] at hp
  | succ fuel ih =>
    intro n k p hp
    cases n with
    | zero =>
      simp [partsAuxF] at hp
      subst hp
      rfl
    | succ n =>
      cases k with
      | zero =>
        simp [partsAuxF] at hp
      | succ k =>
        simp only [partsAuxF, List.mem_append] at hp
        rcases hp with hp | hp
        · have h := ih (n + 1) k p hp
          omega
        · by_cases hk : k < n + 1
          · rw [ite_eq_left hk] at hp
            rcases List.mem_map.mp hp with ⟨l, hl, rfl⟩
            have h := ih (n - k) (k + 1) l hl
            simp only [List.sum_cons]
            omega
          · rw [ite_eq_right hk] at hp
            simp at hp

/-- Every entry of every element of `partsAuxF fuel n k` is positive. -/
theorem partsAuxF_pos : ∀ (fuel n k : Nat) (p : List Nat),
    p ∈ partsAuxF fuel n k → ∀ x ∈ p, 0 < x := by
  intro fuel
  induction fuel with
  | zero =>
    intro n k p hp x hx
    by_cases hn : n = 0
    · subst hn
      simp [partsAuxF] at hp
      subst hp
      simp at hx
    · simp [partsAuxF, hn] at hp
  | succ fuel ih =>
    intro n k p hp x hx
    cases n with
    | zero =>
      simp [partsAuxF] at hp
      subst hp
      simp at hx
    | succ n =>
      cases k with
      | zero =>
        simp [partsAuxF] at hp
      | succ k =>
        simp only [partsAuxF, List.mem_append] at hp
        rcases hp with hp | hp
        · exact ih (n + 1) k p hp x hx
        · by_cases hk : k < n + 1
          · rw [ite_eq_left hk] at hp
            rcases List.mem_map.mp hp with ⟨l, hl, rfl⟩
            rcases List.mem_cons.mp hx with rfl | hx
            · omega
            · exact ih (n - k) (k + 1) l hl x hx
          · rw [ite_eq_right hk] at hp
            simp at hp

/-- Every entry of every element of `partsAuxF fuel n k` is at most `k`. -/
theorem partsAuxF_bound : ∀ (fuel n k : Nat) (p : List Nat),
    p ∈ partsAuxF fuel n k → ∀ x ∈ p, x ≤ k := by
  intro fuel
  induction fuel with
  | zero =>
    intro n k p hp x hx
    by_cases hn : n = 0
    · subst hn
      simp [partsAuxF] at hp
      subst hp
      simp at hx
    · simp [partsAuxF, hn] at hp
  | succ fuel ih =>
    intro n k p hp x hx
    cases n with
    | zero =>
      simp [partsAuxF] at hp
      subst hp
      simp at hx
    | succ n =>
      cases k with
      | zero =>
        simp [partsAuxF] at hp
      | succ k =>
        simp only [partsAuxF, List.mem_append] at hp
        rcases hp with hp | hp
        · have h := ih (n + 1) k p hp x hx
          omega
        · by_cases hk : k < n + 1
          · rw [ite_eq_left hk] at hp
            rcases List.mem_map.mp hp with ⟨l, hl, rfl⟩
            rcases List.mem_cons.mp hx with rfl | hx
            · omega
            · have h := ih (n - k) (k + 1) l hl x hx
              omega
          · rw [ite_eq_right hk] at hp
            simp at hp

/-- Every element of `partsAuxF fuel n k` is a decreasing list. -/
theorem partsAuxF_pairwise : ∀ (fuel n k : Nat) (p : List Nat),
    p ∈ partsAuxF fuel n k → p.Pairwise (· ≥ ·) := by
  intro fuel
  induction fuel with
  | zero =>
    intro n k p hp
    by_cases hn : n = 0
    · subst hn
      simp [partsAuxF] at hp
      subst hp
      simp
    · simp [partsAuxF, hn] at hp
  | succ fuel ih =>
    intro n k p hp
    cases n with
    | zero =>
      simp [partsAuxF] at hp
      subst hp
      simp
    | succ n =>
      cases k with
      | zero =>
        simp [partsAuxF] at hp
      | succ k =>
        simp only [partsAuxF, List.mem_append] at hp
        rcases hp with hp | hp
        · exact ih (n + 1) k p hp
        · by_cases hk : k < n + 1
          · rw [ite_eq_left hk] at hp
            rcases List.mem_map.mp hp with ⟨l, hl, rfl⟩
            rw [List.pairwise_cons]
            refine ⟨?_, ih (n - k) (k + 1) l hl⟩
            intro y hy
            have h := partsAuxF_bound fuel (n - k) (k + 1) l hl y hy
            omega
          · rw [ite_eq_right hk] at hp
            simp at hp

/-- Soundness of the enumeration: every element of `partsAuxF fuel n k` is an
integer partition of `n`. -/
theorem partsAuxF_isPartitionOf {fuel n k : Nat} {p : List Nat}
    (hp : p ∈ partsAuxF fuel n k) : IsPartitionOf n p :=
  ⟨partsAuxF_sum fuel n k p hp, partsAuxF_pos fuel n k p hp,
    partsAuxF_pairwise fuel n k p hp⟩

/-! ## Duplicate-freeness -/

/-- Every fueled enumeration is duplicate-free, structurally in `fuel`.

The recursion splits the partitions according to whether the part `k + 1` is
used.  The two branches are internally duplicate-free by induction, and they
are disjoint because lists in the first branch have all entries at most `k`,
whereas lists in the second branch start with `k + 1`. -/
theorem partsAuxF_nodup : ∀ (fuel n k : Nat), (partsAuxF fuel n k).Nodup := by
  intro fuel
  induction fuel with
  | zero =>
    intro n k
    by_cases hn : n = 0
    · subst hn
      simp [partsAuxF]
    · simp [partsAuxF, hn]
  | succ fuel ih =>
    intro n k
    cases n with
    | zero => simp [partsAuxF]
    | succ n =>
      cases k with
      | zero => simp [partsAuxF]
      | succ k =>
        simp only [partsAuxF]
        by_cases hk : k < n + 1
        · rw [ite_eq_left hk]
          refine List.Nodup.append (ih (n + 1) k) ?_ ?_
          · exact List.Nodup.map (fun a b hab => (List.cons.inj hab).2)
              (ih (n - k) (k + 1))
          · intro a ha hb
            rcases List.mem_map.mp hb with ⟨l, _hl, rfl⟩
            have hmem : k + 1 ∈ ((k + 1) :: l) := by simp
            have hle : k + 1 ≤ k :=
              partsAuxF_bound fuel (n + 1) k ((k + 1) :: l) ha (k + 1) hmem
            omega
        · rw [ite_eq_right hk, List.append_nil]
          exact ih (n + 1) k

/-! ## The partition count for `31` -/

/-- The computable enumeration of the integer partitions of `31` is
duplicate-free. -/
theorem partsAux_31_nodup : (partsAux 31 31).Nodup :=
  partsAuxF_nodup 62 31 31

/-- The computable enumeration of the integer partitions of `31` has exactly
6,842 rows.  (Kernel evaluation of the closed list; no native code.) -/
theorem partsAux_31_length_exact : (partsAux 31 31).length = 6842 := by
  decide

/-- Every row of the enumeration is an integer partition of `31`. -/
theorem partsAux_sound_31 {p : List Nat} (hp : p ∈ partsAux 31 31) :
    IsPartitionOf 31 p :=
  partsAuxF_isPartitionOf hp

/-- The rows of `partsAux 31 31` are exactly the integer partitions of `31`:
the enumeration is both sound and complete. -/
theorem mem_partsAux_31_iff {p : List Nat} :
    p ∈ partsAux 31 31 ↔ IsPartitionOf 31 p :=
  ⟨partsAux_sound_31, partsAux_complete_31⟩

/-- The duplicate-free finset of enumerated rows has cardinality 6,842. -/
theorem partsAux_31_toFinset_card : (partsAux 31 31).toFinset.card = 6842 := by
  rw [List.toFinset_card_of_nodup partsAux_31_nodup, partsAux_31_length_exact]

/-- The type of integer partitions of `31` is finite, with underlying finset
the duplicate-free enumeration `partsAux 31 31`. -/
instance partitionsFintype : Fintype {p : List Nat // IsPartitionOf 31 p} :=
  Fintype.subtype (partsAux 31 31).toFinset (fun p => by
    rw [List.mem_toFinset]
    exact mem_partsAux_31_iff)

/-- There are exactly `p(31) = 6842` integer partitions of `31`. -/
theorem card_partitions_31 :
    Fintype.card {p : List Nat // IsPartitionOf 31 p} = 6842 := by
  rw [Fintype.card_of_subtype (partsAux 31 31).toFinset (fun p => by
        rw [List.mem_toFinset]
        exact mem_partsAux_31_iff),
    List.toFinset_card_of_nodup partsAux_31_nodup, partsAux_31_length_exact]

/-- Exactness package: the enumeration of the integer partitions of `31` is
duplicate-free, has 6,842 rows, and contains exactly the integer partitions. -/
theorem partsAux_31_exact :
    (partsAux 31 31).Nodup ∧ (partsAux 31 31).length = 6842 ∧
      ∀ p : List Nat, p ∈ partsAux 31 31 ↔ IsPartitionOf 31 p :=
  ⟨partsAux_31_nodup, partsAux_31_length_exact, fun _ => mem_partsAux_31_iff⟩

end LiFinal
