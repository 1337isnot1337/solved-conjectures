import Conjectures.LonelinessModularInitialSupport
import Conjectures.LonelinessModularClosedFoldedDirections
import Conjectures.LonelinessConsecutive

/-! A complete checked initial support search for one modulus identifies a
primitive tight six-speed tuple. The retained rows carry short-vector
certificates, so a modular match is converted to an integer direction using
the five-speed runner bound. A prime-avoiding argument is a separate step. -/

namespace Loneliness.Modular.SixSpeed

open FourSpeed

def consecutive : List ℕ := [1,2,3,4,5,6]

structure Row where
  root : Fin 6 → ℕ
  time : ℕ

def Row.leaf (row : Row) : FoldedSearch.Closed.DirectionLeaf :=
  ⟨row.time,6,consecutive⟩

def Row.Valid (m : ℕ) (row : Row) : Prop :=
  Function.Injective row.root ∧
    row.leaf.Valid 1 7 m (1/6) [consecutive] row.root

instance (m : ℕ) (row : Row) : Decidable (row.Valid m) :=
  inferInstanceAs (Decidable (_ ∧ _))

def Retained {N : ℕ} (rows : Fin N → Row) (s : Finset ℕ) : Prop :=
  ∃ i, s=(List.ofFn (rows i).root).toFinset

def terminal {N : ℕ} (rows : Fin N → Row) (s : Finset ℕ) (index : ℕ) : Bool :=
  if h : index<N then decide (s=(List.ofFn (rows ⟨index,h⟩).root).toFinset) else false

theorem terminal_sound {N : ℕ} (rows : Fin N → Row) :
    ∀ s index, terminal rows s index=true → Retained rows s := by
  intro s index hcheck
  by_cases hi : index<N
  · rw [terminal,dite_eq_left hi] at hcheck
    exact ⟨⟨index,hi⟩,of_decide_eq_true hcheck⟩
  · simp only [terminal,hi,dite_eq_right,Bool.false_eq_true] at hcheck

/-- The support itself determines a coordinate permutation because each
retained row has six distinct entries. No distinctness of the original
folded residues is assumed before applying the finite support certificate. -/
theorem retained_direction {N m u inverse : ℕ} (hm : 0<m)
    (hLRC : CoordinateSubspace.LonelyRunnerBound 5)
    (rows : Fin N → Row) (hrows : ∀ i, (rows i).Valid m)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0<v i) (hprimitive : Search.Primitive v)
    (hlow : value (List.ofFn v)≤(1/7:ℝ)) (hunit : (u*inverse)%m=1%m)
    (hretained : Retained rows (foldedSupport m u (residueSupport m (List.ofFn v)))) :
    (List.ofFn v).Perm consecutive := by
  obtain ⟨i,hsupport⟩ := hretained
  obtain ⟨σ,hσ⟩ := retained_support_reindex hm v (rows i).root (hrows i).1 hsupport.symm
  have hperm : (List.ofFn (v ∘ σ)).Perm (List.ofFn v) := σ.ofFn_comp_perm v
  have hprimitive' : Search.Primitive (v ∘ σ) := by
    change Normalization.gcd (List.ofFn (v ∘ σ))=1
    rw [list_gcd_eq_of_perm hperm]
    exact hprimitive
  have hlow' : value (List.ofFn (v ∘ σ))≤(1/7:ℝ) := by
    rw [CriticalFamilies.value_perm hperm]
    exact hlow
  have hrep : FoldedSearch.Represents m (rows i).root (v ∘ σ) :=
    ⟨u,inverse,hunit,hσ⟩
  have hgap : Search.PlaneGap ((1/6:ℚ):ℝ) (v ∘ σ) := by
    intro z hz
    have h := PlaneGeometry.plane_gap_of_runner_bound 4 hLRC (v ∘ σ)
      (fun j => hpositive (σ j)) z hz
    norm_num at h ⊢
    exact h
  obtain ⟨ds,hmem,hdirection⟩ := FoldedSearch.Closed.direction_leaf_sound
    (num:=1) (den:=7) hm (1/6) [consecutive] (rows i).leaf
    (rows i).root (v ∘ σ) (hrows i).2 hrep hprimitive' (by simpa using hlow') hgap
  have hds : ds=consecutive := List.mem_singleton.mp hmem
  rw [hds] at hdirection
  exact hperm.symm.trans hdirection

/-- Every tuple reducing to this modulus is covered by the supplied finite
initial search. This theorem retains the numerical search checks explicitly;
concrete prime modules discharge them with kernel reduction. -/
theorem checked_prime_classification {N : ℕ} (m : ℕ) (hm : 2≤m) (hgrid : ¬7∣m)
    (hLRC : CoordinateSubspace.LonelyRunnerBound 5)
    (inv : ℕ → ℕ) (hinv : ∀ a, 0<a → 2*a≤m → (a*inv a)%m=1%m)
    (rows : Fin N → Row) (hrows : ∀ i, (rows i).Valid m)
    (trees : ℕ → SupportSearch.Tree)
    (hcheck : ∀ b, 2≤b → 2*b≤m →
      SupportSearch.check (InitialSupport.badTimes 7 m) (InitialSupport.pairCompatible m inv b)
        (terminal rows) (trees b) (InitialSupport.selected b) (InitialSupport.available m inv b)
        (InitialSupport.uncovered 7 m b) 4=true)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0<v i) (hprimitive : Search.Primitive v)
    (hmod : ∀ i, v i%m≠0) (hlow : value (List.ofFn v)≤(1/7:ℝ)) :
    (List.ofFn v).Perm consecutive := by
  have hmod' : ∀ a∈List.ofFn v, a%m≠0 := by
    intro a ha
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp ha
    exact hmod i
  obtain ⟨u,inverse,hunit,hretained⟩ := InitialSupport.checked_initial_cover
    6 7 m (by decide) (by decide) hm hgrid inv hinv
    (terminal rows) (Retained rows) (terminal_sound rows) trees hcheck
    (List.ofFn v) (by simp) hmod' (by simpa using hlow)
  exact retained_direction (by omega : 0<m) hLRC rows hrows v hpositive hprimitive
    hlow hunit hretained

theorem consecutive_value : value consecutive=(1/7:ℝ) := by
  have h := Loneliness.consecutive_value 6 (by decide)
  norm_num [consecutive,List.range'] at h ⊢
  exact h

end Loneliness.Modular.SixSpeed
