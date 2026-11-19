import Conjectures.LonelinessModularSupportLists
import Conjectures.LonelinessModularSupportMultiplicity
import Conjectures.LonelinessModularClosedFoldedSearch
import Conjectures.LonelinessModularDirections

/-! Compose support coverage, multiplicity coverage, and binary-tree soundness.

The binary roots may have repeated folded coordinates. Finite multiplicity
coverage supplies an actual coordinate permutation, after which the existing
closed-threshold checker applies to the original positive distinct tuple.
Every terminal and one-odd semantic premise remains explicit. In particular,
this module supplies no geometric bound, finite binary trace, or symmetry
that would justify dropping any Boolean branch from the existing checker. -/

namespace Loneliness.Modular.SupportFiniteSound

open FourSpeed FoldedSearch

/-- The actual integer tuple has positive distinct speeds. Folded roots do
not have to satisfy this predicate. -/
def Admissible {n : ℕ} (v : Fin n → ℕ) : Prop :=
  (∀ i, 0 < v i) ∧ (List.ofFn v).Nodup

/-- Every multiplicity class of every retained support appears as one of the
binary roots. Extra roots are harmless, but every root must have its own
checked tree in a classification theorem. -/
def RepresentativeCover {N R n : ℕ} (rows : Fin N → ℕ)
    (roots : Fin R → Fin n → ℕ) : Prop :=
  ∀ i, ∀ r ∈ SupportMultiplicity.representatives n (SupportSearch.Bits.decode (rows i)),
    ∃ j, List.ofFn (roots j) = r

instance {N R n : ℕ} (rows : Fin N → ℕ) (roots : Fin R → Fin n → ℕ) :
    Decidable (RepresentativeCover rows roots) :=
  inferInstanceAs (Decidable (∀ i,
    ∀ r ∈ SupportMultiplicity.representatives n (SupportSearch.Bits.decode (rows i)),
      ∃ j, List.ofFn (roots j) = r))

/-- A retained support and exhaustive multiplicity coverage produce a
represented binary root after reindexing the actual tuple. This step imposes
no injectivity condition on either the root or the folded coordinates. -/
theorem represented_root_of_retained {N R n m u inverse : ℕ} (hm : 0 < m)
    (rows : Fin N → ℕ) (roots : Fin R → Fin n → ℕ)
    (hcover : RepresentativeCover rows roots) (v : Fin n → ℕ)
    (hunit : (u * inverse) % m = 1 % m)
    (hretained : SupportLists.Retained rows
      (foldedSupport m u (residueSupport m (List.ofFn v)))) :
    ∃ j, ∃ σ : Equiv.Perm (Fin n), Represents m (roots j) (v ∘ σ) := by
  obtain ⟨i, hsupport⟩ := hretained
  have hset : (List.ofFn (fun j => folded m (u * v j))).toFinset =
      SupportSearch.Bits.decode (rows i) := by
    rw [transformed_support_eq m u hm (List.ofFn v)] at hsupport
    simpa only [List.map_ofFn, Function.comp_def] using hsupport
  obtain ⟨r, hr, hperm⟩ := SupportMultiplicity.exists_perm_representative (n := n)
    (List.ofFn (fun j => folded m (u * v j)))
    (SupportSearch.Bits.decode (rows i)) hset (by simp)
  obtain ⟨j, hroot⟩ := hcover i r hr
  have hrootperm : (List.ofFn (fun i => folded m (u * v i))).Perm
      (List.ofFn (roots j)) := by
    rw [hroot]
    exact hperm
  obtain ⟨σ, hσ⟩ := Multiplicity.folded_tuple_reindex m u v (roots j) hrootperm
  exact ⟨j, σ, u, inverse, hunit, hσ⟩

/-- Checked trees classify every actual tuple represented by a retained
support, including every repeated-coordinate multiplicity class. -/
theorem retained_classification {N R n m u inverse : ℕ}
    (hm : 1 < m) (den : ℕ) (hden : 3 ≤ den)
    (rows : Fin N → ℕ) (roots : Fin R → Fin n → ℕ)
    (hcover : RepresentativeCover rows roots) (candidates : List (List ℕ))
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool)
    (hterminal : Closed.TerminalSound 1 den terminal Admissible
      (fun v => ∃ ds ∈ candidates, (List.ofFn v).Perm ds))
    (honeOdd : Closed.OneOddSound (n := n) 1 den Admissible)
    (trees : Fin R → Closed.Tree n)
    (htrees : ∀ j, Closed.check 1 den terminal (trees j) m (roots j) = true)
    (v : Fin n → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (hprimitive : Search.Primitive v)
    (hlow : value (List.ofFn v) ≤ (1 : ℝ) / den)
    (hunit : (u * inverse) % m = 1 % m)
    (hretained : SupportLists.Retained rows
      (foldedSupport m u (residueSupport m (List.ofFn v)))) :
    ∃ ds ∈ candidates, (List.ofFn v).Perm ds := by
  obtain ⟨j, σ, hrep⟩ := represented_root_of_retained (by omega : 0 < m)
    rows roots hcover v hunit hretained
  have hperm : (List.ofFn (v ∘ σ)).Perm (List.ofFn v) := σ.ofFn_comp_perm v
  have hprimitive' : Search.Primitive (v ∘ σ) := by
    change Normalization.gcd (List.ofFn (v ∘ σ)) = 1
    rw [list_gcd_eq_of_perm hperm]
    exact hprimitive
  have hlow' : value (List.ofFn (v ∘ σ)) ≤ (1 : ℝ) / den := by
    rw [CriticalFamilies.value_perm hperm]
    exact hlow
  have hadmissible : Admissible (v ∘ σ) :=
    ⟨fun i => hpositive (σ i), hperm.nodup_iff.mpr hnodup⟩
  obtain ⟨ds, hmem, hdirection⟩ := Closed.check_sound
    (by omega : 0 < den) (by omega : 2 * 1 < den)
    terminal Admissible (fun w => ∃ ds ∈ candidates, (List.ofFn w).Perm ds)
    hterminal honeOdd (trees j) m (roots j) hm (htrees j)
    (v ∘ σ) hrep hprimitive' hadmissible (by simpa using hlow')
  exact ⟨ds, hmem, hperm.symm.trans hdirection⟩

/-- Complete support search, complete multiplicity coverage, and checked
binary trees classify every positive distinct primitive tuple avoiding the
modulus at the closed threshold. Every finite and analytic premise is shown. -/
theorem checked_prime_classification {N R n : ℕ} (hn : 2 ≤ n)
    (den : ℕ) (hden : 3 ≤ den) (m : ℕ) (hm : 2 ≤ m) (hgrid : ¬ den ∣ m)
    (inv : ℕ → ℕ) (hinv : ∀ a, 0 < a → 2 * a ≤ m → (a * inv a) % m = 1 % m)
    (rows : Fin N → ℕ) (roots : Fin R → Fin n → ℕ)
    (hcover : RepresentativeCover rows roots) (candidates : List (List ℕ))
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool)
    (hterminal : Closed.TerminalSound 1 den terminal Admissible
      (fun v => ∃ ds ∈ candidates, (List.ofFn v).Perm ds))
    (honeOdd : Closed.OneOddSound (n := n) 1 den Admissible)
    (binaryTrees : Fin R → Closed.Tree n)
    (hbinary : ∀ j, Closed.check 1 den terminal (binaryTrees j) m (roots j) = true)
    (supportTrees : ℕ → SupportSearch.Tree)
    (hsupport : ∀ b, 2 ≤ b → 2 * b ≤ m →
      SupportSearch.check (InitialSupport.badTimes den m)
        (InitialSupport.pairCompatible m inv b) (SupportLists.terminal rows) (supportTrees b)
        (InitialSupport.selected b) (InitialSupport.available m inv b)
        (InitialSupport.uncovered den m b) (n - 2) = true)
    (v : Fin n → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (hprimitive : Search.Primitive v)
    (hmod : ∀ i, v i % m ≠ 0) (hlow : value (List.ofFn v) ≤ (1 : ℝ) / den) :
    ∃ ds ∈ candidates, (List.ofFn v).Perm ds := by
  have hne : List.ofFn v ≠ [] := by
    intro he
    have hlength := congrArg List.length he
    simp only [List.length_ofFn, List.length_nil] at hlength
    omega
  have hmod' : ∀ a ∈ List.ofFn v, a % m ≠ 0 := by
    intro a ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    exact hmod i
  obtain ⟨u, inverse, hunit, hretained⟩ := SupportLists.checked_list_cover
    n den m hn hden hm hgrid inv hinv rows supportTrees hsupport
    (List.ofFn v) hne (by simp) hmod' hlow
  exact retained_classification (by omega : 1 < m) den hden
    rows roots hcover candidates terminal hterminal honeOdd binaryTrees hbinary
    v hpositive hnodup hprimitive hlow hunit hretained

end Loneliness.Modular.SupportFiniteSound
