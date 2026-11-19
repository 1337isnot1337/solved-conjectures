import Conjectures.LonelinessModularInitialSupport
import Conjectures.LonelinessModularClosedFoldedDirections

/-! Complete finite support certificates for the five-runner lower bound.

Every support of size at most five is covered by the initial search. A retained
row supplies an actual short-vector certificate; the four-runner bound then
recovers one of the two primitive integer directions. The numerical prime
certificates and the prime-avoidance argument are separate obligations.
-/

namespace Loneliness.Modular.FiveRunner

open FourSpeed

def consecutive : List ℕ := [1, 2, 3, 4, 5]

def exceptional : List ℕ := [1, 3, 4, 5, 9]

def directions : List (List ℕ) := [consecutive, exceptional]

structure Row where
  root : Fin 5 → ℕ
  time : ℕ
  direction : List ℕ

def Row.leaf (row : Row) : FoldedSearch.Closed.DirectionLeaf :=
  ⟨row.time, 9, row.direction⟩

def Row.Valid (m : ℕ) (row : Row) : Prop :=
  Function.Injective row.root ∧
    row.leaf.Valid 1 6 m (1 / 5) directions row.root

instance (m : ℕ) (row : Row) : Decidable (row.Valid m) :=
  inferInstanceAs (Decidable (_ ∧ _))

def Retained {N : ℕ} (rows : Fin N → Row) (s : Finset ℕ) : Prop :=
  ∃ i, s = (List.ofFn (rows i).root).toFinset

def terminal {N : ℕ} (rows : Fin N → Row) (s : Finset ℕ) (index : ℕ) : Bool :=
  if h : index < N then decide (s = (List.ofFn (rows ⟨index, h⟩).root).toFinset)
  else false

theorem terminal_sound {N : ℕ} (rows : Fin N → Row) :
    ∀ s index, terminal rows s index = true → Retained rows s := by
  intro s index hcheck
  by_cases hi : index < N
  · rw [terminal, dite_eq_left hi] at hcheck
    exact ⟨⟨index, hi⟩, of_decide_eq_true hcheck⟩
  · rw [terminal, dite_eq_right hi] at hcheck
    cases hcheck

/-- Distinctness of the retained row recovers a coordinate permutation even
when distinctness of the original folded residues was not assumed. -/
theorem retained_direction {N m u inverse : ℕ} (hm : 0 < m)
    (hLRC : CoordinateSubspace.LonelyRunnerBound 4)
    (rows : Fin N → Row) (hrows : ∀ i, (rows i).Valid m)
    (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i) (hprimitive : Search.Primitive v)
    (hlow : value (List.ofFn v) ≤ (1 / 6 : ℝ)) (hunit : (u * inverse) % m = 1 % m)
    (hretained : Retained rows (foldedSupport m u (residueSupport m (List.ofFn v)))) :
    ∃ ds ∈ directions, (List.ofFn v).Perm ds := by
  obtain ⟨i, hsupport⟩ := hretained
  obtain ⟨σ, hσ⟩ := retained_support_reindex hm v (rows i).root
    (hrows i).1 hsupport.symm
  have hperm : (List.ofFn (v ∘ σ)).Perm (List.ofFn v) := σ.ofFn_comp_perm v
  have hprimitive' : Search.Primitive (v ∘ σ) := by
    change Normalization.gcd (List.ofFn (v ∘ σ)) = 1
    rw [list_gcd_eq_of_perm hperm]
    exact hprimitive
  have hlow' : value (List.ofFn (v ∘ σ)) ≤ (1 / 6 : ℝ) := by
    rw [CriticalFamilies.value_perm hperm]
    exact hlow
  have hrep : FoldedSearch.Represents m (rows i).root (v ∘ σ) :=
    ⟨u, inverse, hunit, hσ⟩
  have hgap : Search.PlaneGap ((1 / 5 : ℚ) : ℝ) (v ∘ σ) := by
    intro z hz
    have h := PlaneGeometry.plane_gap_of_runner_bound 3 hLRC (v ∘ σ)
      (fun j => hpositive (σ j)) z hz
    norm_num at h ⊢
    exact h
  obtain ⟨ds, hmem, hdirection⟩ := FoldedSearch.Closed.direction_leaf_sound
    (num := 1) (den := 6) hm (1 / 5) directions (rows i).leaf
    (rows i).root (v ∘ σ) (hrows i).2 hrep hprimitive' (by simpa using hlow') hgap
  exact ⟨ds, hmem, hperm.symm.trans hdirection⟩

/-- The support search includes all supports of size at most five. Its
concrete certificate checks remain explicit here and are discharged by each
prime module. No distinctness premise on the actual tuple is required. -/
theorem checked_prime_classification {N : ℕ} (m : ℕ) (hm : 2 ≤ m) (hgrid : ¬6 ∣ m)
    (hLRC : CoordinateSubspace.LonelyRunnerBound 4)
    (inv : ℕ → ℕ) (hinv : ∀ a, 0 < a → 2 * a ≤ m → (a * inv a) % m = 1 % m)
    (rows : Fin N → Row) (hrows : ∀ i, (rows i).Valid m)
    (trees : ℕ → SupportSearch.Tree)
    (hcheck : ∀ b, 2 ≤ b → 2 * b ≤ m →
      SupportSearch.check (InitialSupport.badTimes 6 m) (InitialSupport.pairCompatible m inv b)
        (terminal rows) (trees b) (InitialSupport.selected b) (InitialSupport.available m inv b)
        (InitialSupport.uncovered 6 m b) 3 = true)
    (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i) (hprimitive : Search.Primitive v)
    (hmod : ∀ i, v i % m ≠ 0) (hlow : value (List.ofFn v) ≤ (1 / 6 : ℝ)) :
    ∃ ds ∈ directions, (List.ofFn v).Perm ds := by
  have hmod' : ∀ a ∈ List.ofFn v, a % m ≠ 0 := by
    intro a ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    exact hmod i
  obtain ⟨u, inverse, hunit, hretained⟩ := InitialSupport.checked_initial_cover
    5 6 m (by decide) (by decide) hm hgrid inv hinv
    (terminal rows) (Retained rows) (terminal_sound rows) trees hcheck
    (List.ofFn v) (by simp) hmod' (by simpa using hlow)
  exact retained_direction (by omega : 0 < m) hLRC rows hrows v hpositive hprimitive
    hlow hunit hretained

theorem classified_iff (ds : List ℕ) :
    (∃ target ∈ directions, ds.Perm target) ↔
      ds.Perm consecutive ∨ ds.Perm exceptional := by
  simp [directions]

end Loneliness.Modular.FiveRunner
