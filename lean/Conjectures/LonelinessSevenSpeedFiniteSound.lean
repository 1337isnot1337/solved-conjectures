import Conjectures.LonelinessModularInitialSupport
import Conjectures.LonelinessModularClosedFoldedDirections
import Conjectures.LonelinessConsecutive
import Conjectures.LonelinessHigherExamplesSeven

/-! Interpret complete support certificates and binary lifting trees for the
three tight seven-speed directions. The six-speed runner bound supplies both
the ordinary plane gap and the one-odd pruning rule. Numerical coverage and
tree checks remain explicit inputs to these candidate theorems. -/

namespace Loneliness.Modular.SevenSpeed

open FourSpeed
open FoldedSearch

def shapes : List (List ℕ) :=
  [[1,2,3,4,5,6,7], [1,2,3,4,5,7,12], [1,4,5,6,7,11,13]]

theorem value_eq_of_mem_shapes (ds : List ℕ) (hds : ds ∈ shapes) :
    value ds = (1/8 : ℝ) := by
  simp only [shapes,List.mem_cons,List.mem_singleton] at hds
  rcases hds with rfl | rfl | rfl
  · have h := Loneliness.consecutive_value 7 (by decide)
    norm_num [List.range'] at h ⊢
    exact h
  · exact HigherExamples.seven_01_value
  · exact HigherExamples.seven_16_value

def Retained {N : ℕ} (roots : Fin N → Fin 7 → ℕ) (s : Finset ℕ) : Prop :=
  ∃ i, s = (List.ofFn (roots i)).toFinset

def terminal {N : ℕ} (roots : Fin N → Fin 7 → ℕ)
    (s : Finset ℕ) (index : ℕ) : Bool :=
  if h : index < N then decide (s = (List.ofFn (roots ⟨index,h⟩)).toFinset) else false

theorem terminal_sound {N : ℕ} (roots : Fin N → Fin 7 → ℕ) :
    ∀ s index, terminal roots s index = true → Retained roots s := by
  intro s index hcheck
  by_cases hi : index < N
  · rw [terminal,dite_eq_left hi] at hcheck
    exact ⟨⟨index,hi⟩,of_decide_eq_true hcheck⟩
  · rw [terminal,dite_eq_right hi] at hcheck
    cases hcheck

/-- A checked binary tree uses only the ordinary lower-dimensional runner
bound. In particular, no six-speed spectrum or critical-plane classification
is an input to this interpretation. -/
theorem checked_root
    (hLRC : CoordinateSubspace.LonelyRunnerBound 6)
    (leaves : ℕ → Closed.DirectionLeaf) (m : ℕ) (hm : 1 < m)
    (x : Fin 7 → ℕ) (tree : Closed.Tree 7)
    (hcheck : Closed.check 1 8 (Closed.directionTerminal 1 8 (1/7) shapes leaves)
      tree m x = true)
    (v : Fin 7 → ℕ) (hrep : Represents m x v) (hp : Search.Primitive v)
    (hpositive : ∀ i, 0 < v i) (hnodup : (List.ofFn v).Nodup)
    (hlow : value (List.ofFn v) ≤ (1/8 : ℝ)) :
    ∃ ds ∈ shapes, (List.ofFn v).Perm ds := by
  let admissible : (Fin 7 → ℕ) → Prop := fun w =>
    (∀ i, 0 < w i) ∧ (List.ofFn w).Nodup
  have hterminal := Closed.directionTerminal_sound (num := 1) (den := 8)
    (1/7) shapes leaves admissible (by
      intro w hw z hz
      have h := PlaneGeometry.plane_gap_of_runner_bound 5 hLRC w hw.1 z hz
      norm_num at h ⊢
      exact h)
  have honeOdd : Closed.OneOddSound 1 8 admissible := by
    intro w hw _hp hone
    have hpositive' : ∀ d ∈ List.ofFn w, 0 < d := by
      intro d hd
      obtain ⟨i,rfl⟩ := List.mem_ofFn.mp hd
      exact hw.1 i
    have h := Search.value_lower_of_one_odd_of_runner_bound
      (List.ofFn w) 6 hLRC hw.2 hpositive' hone
      (by simp) (by simp) (by norm_num)
    norm_num at h ⊢
    linarith
  exact Closed.check_sound (by decide : 0 < 8) (by decide : 2*1 < 8)
    _ admissible _ hterminal honeOdd tree m x hm hcheck v hrep hp
    ⟨hpositive,hnodup⟩ (by simpa using hlow)

/-- Full-size retained supports determine a coordinate permutation. The
finite initial search itself is responsible for excluding smaller supports. -/
theorem retained_classification {N m u inverse : ℕ} (hm : 1 < m)
    (hLRC : CoordinateSubspace.LonelyRunnerBound 6)
    (roots : Fin N → Fin 7 → ℕ) (hinjective : ∀ i, Function.Injective (roots i))
    (leaves : ℕ → Closed.DirectionLeaf) (trees : Fin N → Closed.Tree 7)
    (htrees : ∀ i, Closed.check 1 8 (Closed.directionTerminal 1 8 (1/7) shapes leaves)
      (trees i) m (roots i) = true)
    (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (hprimitive : Search.Primitive v)
    (hlow : value (List.ofFn v) ≤ (1/8 : ℝ)) (hunit : (u*inverse)%m = 1%m)
    (hretained : Retained roots (foldedSupport m u (residueSupport m (List.ofFn v)))) :
    ∃ ds ∈ shapes, (List.ofFn v).Perm ds := by
  obtain ⟨i,hsupport⟩ := hretained
  obtain ⟨σ,hσ⟩ := retained_support_reindex (by omega : 0 < m)
    v (roots i) (hinjective i) hsupport.symm
  have hperm : (List.ofFn (v ∘ σ)).Perm (List.ofFn v) := σ.ofFn_comp_perm v
  have hprimitive' : Search.Primitive (v ∘ σ) := by
    change Normalization.gcd (List.ofFn (v ∘ σ)) = 1
    rw [list_gcd_eq_of_perm hperm]
    exact hprimitive
  have hlow' : value (List.ofFn (v ∘ σ)) ≤ (1/8 : ℝ) := by
    rw [CriticalFamilies.value_perm hperm]
    exact hlow
  have hnodup' : (List.ofFn (v ∘ σ)).Nodup := hperm.nodup_iff.mpr hnodup
  obtain ⟨ds,hmem,hdirection⟩ := checked_root hLRC leaves m hm (roots i) (trees i)
    (htrees i) (v ∘ σ) ⟨u,inverse,hunit,hσ⟩ hprimitive'
    (fun j => hpositive (σ j)) hnodup' hlow'
  exact ⟨ds,hmem,hperm.symm.trans hdirection⟩

/-- One complete modular support certificate, together with a checked binary
tree at every retained root, classifies all positive distinct primitive
seven-speed tuples that avoid this modulus. -/
theorem checked_prime_classification {N : ℕ} (m : ℕ) (hm : 2 ≤ m)
    (hgrid : ¬ 8 ∣ m) (hLRC : CoordinateSubspace.LonelyRunnerBound 6)
    (inv : ℕ → ℕ) (hinv : ∀ a, 0 < a → 2*a ≤ m → (a*inv a)%m = 1%m)
    (roots : Fin N → Fin 7 → ℕ) (hinjective : ∀ i, Function.Injective (roots i))
    (leaves : ℕ → Closed.DirectionLeaf) (binaryTrees : Fin N → Closed.Tree 7)
    (hbinary : ∀ i, Closed.check 1 8 (Closed.directionTerminal 1 8 (1/7) shapes leaves)
      (binaryTrees i) m (roots i) = true)
    (supportTrees : ℕ → SupportSearch.Tree)
    (hsupport : ∀ b, 2 ≤ b → 2*b ≤ m →
      SupportSearch.check (InitialSupport.badTimes 8 m) (InitialSupport.pairCompatible m inv b)
        (terminal roots) (supportTrees b) (InitialSupport.selected b)
        (InitialSupport.available m inv b) (InitialSupport.uncovered 8 m b) 5 = true)
    (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (hprimitive : Search.Primitive v)
    (hmod : ∀ i, v i%m ≠ 0) (hlow : value (List.ofFn v) ≤ (1/8 : ℝ)) :
    ∃ ds ∈ shapes, (List.ofFn v).Perm ds := by
  have hmod' : ∀ a ∈ List.ofFn v, a%m ≠ 0 := by
    intro a ha
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp ha
    exact hmod i
  obtain ⟨u,inverse,hunit,hretained⟩ := InitialSupport.checked_initial_cover
    7 8 m (by decide) (by decide) hm hgrid inv hinv
    (terminal roots) (Retained roots) (terminal_sound roots) supportTrees hsupport
    (List.ofFn v) (by simp) hmod' (by simpa using hlow)
  exact retained_classification (by omega) hLRC roots hinjective leaves binaryTrees
    hbinary v hpositive hnodup hprimitive hlow hunit hretained

end Loneliness.Modular.SevenSpeed
