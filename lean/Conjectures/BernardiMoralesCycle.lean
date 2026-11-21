import Conjectures.BernardiMoralesAveraging
import Mathlib.GroupTheory.Perm.Cycle.Basic
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.Algebra.BigOperators.Fin

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open Finset Matrix Equiv

variable {V R : Type*} [Fintype V] [DecidableEq V] [CommRing R]

/-- A single cyclic order with at least two vertices, represented by its
predecessor permutation. -/
structure CyclicOrder (V : Type*) [Fintype V] [DecidableEq V] where
  pred : Equiv.Perm V
  isCycle : pred.IsCycle
  noFixed : ∀ i, pred i ≠ i

theorem CyclicOrder.on_univ (C : CyclicOrder V) :
    C.pred.IsCycleOn (↑(Finset.univ : Finset V) : Set V) := by
  simpa [C.noFixed] using C.isCycle.isCycleOn

noncomputable def CyclicOrder.orbitEquiv (C : CyclicOrder V) (j : V) :
    Fin (Fintype.card V) ≃ V :=
  Equiv.ofBijective (fun t => (C.pred ^ t.val) j) (by
    constructor
    · intro a b hab
      apply Fin.ext
      exact C.on_univ.injOn_pow_apply (Finset.mem_univ j) a.isLt b.isLt hab
    · intro i
      obtain ⟨t, ht, he⟩ := C.on_univ.exists_pow_eq (Finset.mem_univ j) (Finset.mem_univ i)
      exact ⟨⟨t, ht⟩, he⟩)

theorem CyclicOrder.pow_card_apply (C : CyclicOrder V) (j : V) :
    (C.pred ^ Fintype.card V) j = j :=
  C.on_univ.pow_card_apply (Finset.mem_univ j)

noncomputable def CyclicOrder.distance (C : CyclicOrder V) (i j : V) :
    Fin (Fintype.card V) := (C.orbitEquiv j).symm i

theorem CyclicOrder.distance_spec (C : CyclicOrder V) (i j : V) :
    (C.pred ^ (C.distance i j).val) j = i :=
  (C.orbitEquiv j).apply_symm_apply i

def weightedShift (ρ : Equiv.Perm V) (q : V → R) : Matrix V V R :=
  fun i j => if i = ρ j then q j else 0

def cycleMatrix (ρ : Equiv.Perm V) (q : V → R) : Matrix V V R :=
  1 - weightedShift ρ q

theorem mul_cycleMatrix (B : Matrix V V R) (ρ : Equiv.Perm V) (q : V → R) :
    B * cycleMatrix ρ q = fun i j => B i j - q j * B i (ρ j) := by
  rw [cycleMatrix, Matrix.mul_sub, Matrix.mul_one]
  ext i j
  simp [weightedShift, Matrix.mul_apply, mul_comm]

/-- Only the identity and the full cycle can choose, at every vertex, either
the diagonal position or the predecessor position. -/
theorem CyclicOrder.perm_choice (C : CyclicOrder V) (σ : Equiv.Perm V)
    (h : ∀ i, σ i = i ∨ σ i = C.pred i) : σ = 1 ∨ σ = C.pred := by
  by_cases hσ : σ = 1
  · exact Or.inl hσ
  right
  obtain ⟨a, ha⟩ : ∃ a, σ a ≠ a := by
    by_contra hn
    push Not at hn
    exact hσ (Equiv.ext hn)
  have step (i : V) (hi : σ i ≠ i) : σ (C.pred i) ≠ C.pred i := by
    have he := (h i).resolve_left hi
    intro hj
    have heq : i = C.pred i := σ.injective (he.trans hj.symm)
    exact C.noFixed i heq.symm
  have moved (n : ℕ) : σ ((C.pred ^ n) a) ≠ (C.pred ^ n) a := by
    induction n with
    | zero => simpa using ha
    | succ n ih =>
      simpa [pow_succ', Equiv.Perm.mul_apply] using step ((C.pred ^ n) a) ih
  apply Equiv.ext
  intro j
  obtain ⟨n, hn⟩ := C.isCycle.exists_pow_eq (C.noFixed a) (C.noFixed j)
  rw [← hn]
  exact (h _).resolve_left (moved n)

theorem cycleMatrix_det (C : CyclicOrder V) (q : V → R) :
    (cycleMatrix C.pred q).det = 1 - ∏ i, q i := by
  let term (σ : Equiv.Perm V) : R :=
    ((Equiv.Perm.sign σ : ℤ) : R) * ∏ i, cycleMatrix C.pred q (σ i) i
  have hsum : (∑ σ : Equiv.Perm V, term σ) = term 1 + term C.pred := by
    calc
      (∑ σ : Equiv.Perm V, term σ) = ∑ σ ∈ ({1, C.pred} : Finset (Equiv.Perm V)), term σ := by
        symm
        apply Finset.sum_subset (Finset.subset_univ _)
        intro σ _ hσ
        have hne : σ ≠ 1 ∧ σ ≠ C.pred := by simpa using hσ
        have hb : ∃ i, σ i ≠ i ∧ σ i ≠ C.pred i := by
          by_contra hn
          push Not at hn
          have hh : ∀ i, σ i = i ∨ σ i = C.pred i := by
            intro i
            by_cases hi : σ i = i
            · exact Or.inl hi
            · exact Or.inr (hn i hi)
          rcases C.perm_choice σ hh with he | he
          · exact hne.1 he
          · exact hne.2 he
        obtain ⟨i, hi, hp⟩ := hb
        have hz : (∏ j, cycleMatrix C.pred q (σ j) j) = 0 := by
          apply Finset.prod_eq_zero (Finset.mem_univ i)
          simp [cycleMatrix, weightedShift, Matrix.one_apply, hi, hp]
        simp [term, hz]
      _ = _ := by simp [C.isCycle.ne_one, Ne.symm C.isCycle.ne_one]
  have ht1 : term 1 = 1 := by
    simp [term, cycleMatrix, weightedShift, Matrix.one_apply, C.noFixed,
      fun i => Ne.symm (C.noFixed i)]
  have hsupp : C.pred.support = Finset.univ := by
    ext i
    simp [C.noFixed]
  have hsign : ((Equiv.Perm.sign C.pred : ℤ) : R) =
      -(-1 : R) ^ Fintype.card V := by
    rw [C.isCycle.sign, hsupp]
    simp
  have htp : term C.pred = -(∏ i, q i) := by
    simp only [term, cycleMatrix, Matrix.sub_apply, weightedShift, ite_eq_left rfl]
    have hdiag : ∀ i, (1 : Matrix V V R) (C.pred i) i = 0 := by
      intro i
      simp [Matrix.one_apply, C.noFixed]
    simp_rw [hdiag, zero_sub]
    rw [Finset.prod_neg, hsign, Finset.card_univ]
    have hsq : (-1 : R) ^ Fintype.card V * (-1 : R) ^ Fintype.card V = 1 := by
      rw [← mul_pow]
      simp
    calc
      -(-1 : R) ^ Fintype.card V *
          ((-1 : R) ^ Fintype.card V * ∏ i, q i) =
        -((-1 : R) ^ Fintype.card V * (-1 : R) ^ Fintype.card V) * ∏ i, q i := by ring
      _ = _ := by rw [hsq]; ring
  rw [Matrix.det_apply']
  change (∑ σ, term σ) = _
  rw [hsum, ht1, htp]
  ring

def pathWeight (ρ : Equiv.Perm V) (q : V → R) (j : V) (n : ℕ) : R :=
  ∏ t ∈ Finset.range n, q ((ρ ^ t) j)

omit [Fintype V] [DecidableEq V] in
theorem pathWeight_succ (ρ : Equiv.Perm V) (q : V → R) (j : V) (n : ℕ) :
    pathWeight ρ q j (n+1) = pathWeight ρ q j n * q ((ρ ^ n) j) := by
  exact Finset.prod_range_succ _ _

theorem weightedShift_pow (ρ : Equiv.Perm V) (q : V → R) (n : ℕ) (i j : V) :
    (weightedShift ρ q ^ n) i j =
      if i = (ρ ^ n) j then pathWeight ρ q j n else 0 := by
  induction n generalizing i j with
  | zero => simp [pathWeight, Matrix.one_apply]
  | succ n ih =>
    rw [pow_succ', Matrix.mul_apply]
    simp_rw [ih]
    rw [Finset.sum_eq_single ((ρ ^ n) j)]
    · simp [weightedShift, pathWeight_succ, pow_succ', Equiv.Perm.mul_apply, mul_comm]
    · intro b _ hb
      simp [hb]
    · simp

theorem pathWeight_card (C : CyclicOrder V) (q : V → R) (j : V) :
    pathWeight C.pred q j (Fintype.card V) = ∏ i, q i := by
  unfold pathWeight
  rw [← Fin.prod_univ_eq_prod_range]
  exact Equiv.prod_comp (C.orbitEquiv j) q

theorem weightedShift_pow_card (C : CyclicOrder V) (q : V → R) :
    weightedShift C.pred q ^ Fintype.card V = (∏ i, q i) • (1 : Matrix V V R) := by
  ext i j
  rw [weightedShift_pow, C.pow_card_apply, pathWeight_card]
  by_cases h : i = j <;> simp [h, Matrix.one_apply]

def intervalKernel (ρ : Equiv.Perm V) (q : V → R) : Matrix V V R :=
  ∑ a ∈ Finset.range (Fintype.card V), weightedShift ρ q ^ a

theorem intervalKernel_mul_cycleMatrix (C : CyclicOrder V) (q : V → R) :
    intervalKernel C.pred q * cycleMatrix C.pred q =
      (1 - ∏ i, q i) • (1 : Matrix V V R) := by
  unfold intervalKernel cycleMatrix
  rw [geom_sum_mul_neg, weightedShift_pow_card]
  ext i j
  by_cases h : i = j <;> simp [h, Matrix.one_apply]

theorem intervalKernel_entry (C : CyclicOrder V) (q : V → R) (i j : V) :
    intervalKernel C.pred q i j = pathWeight C.pred q j (C.distance i j).val := by
  unfold intervalKernel
  simp only [Matrix.sum_apply]
  simp_rw [weightedShift_pow]
  rw [Finset.sum_eq_single (C.distance i j).val]
  · simp [C.distance_spec]
  · intro b hb hbd
    have hne : i ≠ (C.pred ^ b) j := by
      intro he
      have hval : (C.distance i j).val = b :=
        C.on_univ.injOn_pow_apply (Finset.mem_univ j)
          (C.distance i j).isLt (Finset.mem_range.mp hb)
          ((C.distance_spec i j).trans he)
      exact hbd hval.symm
    simp [hne]
  · intro hn
    exact False.elim (hn (Finset.mem_range.mpr (C.distance i j).isLt))

theorem intervalKernel_full (C : CyclicOrder V) :
    intervalKernel C.pred (fun _ => (1 : R)) = fun _ _ => 1 := by
  ext i j
  rw [intervalKernel_entry]
  simp [pathWeight]

/-- The path product is the literal event that every vertex strictly after
`i` through `j` in the cyclic order belongs to the selected subset. -/
theorem intervalKernel_binary (C : CyclicOrder V) (s : V → Bool) (i j : V) :
    intervalKernel C.pred (fun v => (bitValue (s v) : R)) i j =
      if ∀ t < (C.distance i j).val, s ((C.pred ^ t) j) = true then 1 else 0 := by
  rw [intervalKernel_entry]
  by_cases h : ∀ t < (C.distance i j).val, s ((C.pred ^ t) j) = true
  · rw [ite_eq_left h]
    apply Finset.prod_eq_one
    intro t ht
    simp [bitValue, h t (Finset.mem_range.mp ht)]
  · rw [ite_eq_right h]
    push Not at h
    obtain ⟨t, ht, hs⟩ := h
    apply Finset.prod_eq_zero (Finset.mem_range.mpr ht)
    simp [bitValue, hs]

end BernardiMorales
