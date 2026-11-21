import Conjectures.BernardiMoralesRows
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fin.Tuple.Basic

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open Finset Matrix

variable {R : Type*} [CommRing R]

/-- Finite tensor averaging: a one-coordinate replacement rule can be
applied successively to all colors, with no independence assumptions on the
function being averaged. Independence is encoded by the product weights. -/
theorem sum_product_replace {β Z : Type*} [Fintype β] (n : ℕ)
    (w : Fin n → β → R) (v : Fin n → β → Z) (t : Fin n → Z)
    (a : Fin n → R) (F : (Fin n → Z) → R)
    (h : ∀ i x, (∑ b : β, w i b * F (Function.update x i (v i b))) =
      a i * F (Function.update x i (t i))) :
    (∑ s : Fin n → β, (∏ i, w i (s i)) * F (fun i => v i (s i))) =
      (∏ i, a i) * F t := by
  classical
  induction n with
  | zero =>
    simp only [Fintype.prod_empty, Fintype.sum_unique, one_mul]
    exact congrArg F (Subsingleton.elim _ _)
  | succ n ih =>
    let G : (Fin n → Z) → R := fun x => F (Fin.cons (α := fun _ : Fin (n+1) => Z) (t 0) x)
    have hg : ∀ i x, (∑ b : β, w i.succ b *
        G (Function.update x i (v i.succ b))) =
        a i.succ * G (Function.update x i (t i.succ)) := by
      intro i x
      have he (z : Z) :
          Function.update (Fin.cons (α := fun _ : Fin (n+1) => Z) (t 0) x) i.succ z =
            Fin.cons (α := fun _ : Fin (n+1) => Z) (t 0) (Function.update x i z) := by
        exact (Fin.cons_update (α := fun _ : Fin (n+1) => Z) (t 0) x i z).symm
      simpa only [he, G] using h i.succ (Fin.cons (α := fun _ : Fin (n+1) => Z) (t 0) x)
    have hzero (s : Fin n → β) :
        (∑ b : β, w 0 b * F (Fin.cons (v 0 b) (fun i => v i.succ (s i)))) =
          a 0 * G (fun i => v i.succ (s i)) := by
      have he (z : Z) :
          Function.update (Fin.cons (α := fun _ : Fin (n+1) => Z) (t 0) (fun i => v i.succ (s i))) 0 z =
            Fin.cons (α := fun _ : Fin (n+1) => Z) z (fun i => v i.succ (s i)) := by
        funext j
        refine Fin.cases ?_ (fun j => ?_) j <;> simp
      simpa only [he, G] using h 0 (Fin.cons (α := fun _ : Fin (n+1) => Z) (t 0) (fun i => v i.succ (s i)))
    calc
      (∑ s : Fin (n+1) → β, (∏ i, w i (s i)) * F (fun i => v i (s i))) =
          ∑ s : Fin n → β, (∏ i, w i.succ (s i)) *
            ∑ b : β, w 0 b * F (Fin.cons (v 0 b) (fun i => v i.succ (s i))) := by
        rw [← Equiv.sum_comp (Fin.consEquiv (fun _ : Fin (n+1) => β))]
        simp only [Fintype.sum_prod_type, Fin.consEquiv_apply, Fin.prod_univ_succ,
          Fin.cons_zero, Fin.cons_succ]
        rw [Finset.sum_comm]
        apply Finset.sum_congr rfl
        intro s _
        rw [Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro b _
        have he : (fun i : Fin (n+1) => v i (Fin.cons (α := fun _ : Fin (n+1) => β) b s i)) =
            Fin.cons (v 0 b) (fun i => v i.succ (s i)) := by
          funext i
          refine Fin.cases ?_ (fun j => ?_) i <;> simp
        rw [he]
        ring
      _ = a 0 * ((∏ i : Fin n, a i.succ) * G (fun i => t i.succ)) := by
        simp_rw [hzero]
        have he : (∑ s : Fin n → β, (∏ i, w i.succ (s i)) *
            (a 0 * G (fun i => v i.succ (s i)))) =
            a 0 * ∑ s : Fin n → β, (∏ i, w i.succ (s i)) *
              G (fun i => v i.succ (s i)) := by
          rw [Finset.mul_sum]
          apply Finset.sum_congr rfl
          intro s _
          ring
        rw [he, ih (fun i => w i.succ) (fun i => v i.succ) (fun i => t i.succ)
          (fun i => a i.succ) G hg]
      _ = (∏ i, a i) * F t := by
        rw [Fin.prod_univ_succ, mul_assoc]
        congr 2
        apply congrArg F
        funext i
        refine Fin.cases ?_ (fun j => ?_) i <;> rfl

variable {V : Type*} [Fintype V] [DecidableEq V]

def colorMatrix (root : V) {r : ℕ} (f : {i : V // i ≠ root} → Fin r)
    (H : Fin r → Matrix V V R) : Matrix V V R :=
  fun i j => if h : i = root then 1 else H (f ⟨i, h⟩) i j

def colorFiber (root : V) {r : ℕ} (f : {i : V // i ≠ root} → Fin r)
    (c : Fin r) : Finset V :=
  Finset.univ.filter (fun i => ∃ h : i ≠ root, f ⟨i, h⟩ = c)

theorem root_not_colorFiber (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (c : Fin r) :
    root ∉ colorFiber root f c := by simp [colorFiber]

theorem colorFiber_nonempty (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (hf : Function.Surjective f) (c : Fin r) :
    (colorFiber root f c).Nonempty := by
  obtain ⟨i, hi⟩ := hf c
  exact ⟨i, by simp [colorFiber, i.property, hi]⟩

theorem colorMatrix_update (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (H : Fin r → Matrix V V R)
    (c : Fin r) (d : V → R) (M : Matrix V V R) :
    colorMatrix root f (Function.update H c (Matrix.of fun i j => d i * M i j)) =
      replaceRows (colorFiber root f c) d M (colorMatrix root f H) := by
  ext i j
  by_cases hir : i = root
  · subst i
    simp [colorMatrix, replaceRows, root_not_colorFiber]
  · by_cases hc : f ⟨i, hir⟩ = c
    · simp [colorMatrix, replaceRows, colorFiber, hir, hc]
    · simp [colorMatrix, replaceRows, colorFiber, hir, hc]

/-- The numerical matrix of the source event determinant, expressed using
literal cyclic interval indicators and the marked vertex indicator. -/
def eventMatrix (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (D : Finset V)
    (S : Fin r → V → Bool) : Matrix V V R :=
  colorMatrix root f (fun c => Matrix.of fun i j =>
    markFactor D (fun v => bitValue (S c v)) i *
      intervalKernel C.pred (fun v => bitValue (S c v)) i j)

variable {K : Type*} [Field K]

noncomputable def meanEventMatrix (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (D : Finset V) (q : V → K) : Matrix V V K :=
  colorMatrix root f (fun _ => Matrix.of fun i j => markFactor D q i * meanKernel C q i j)

/-- Every nonempty color fiber contributes exactly one cyclic determinant. -/
theorem average_eventMatrix (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (hf : Function.Surjective f)
    (D : Finset V) (q : V → K) (hq : 1 - ∏ i, q i ≠ 0) :
    (∑ S : Fin r → V → Bool, (∏ c, weight q (S c)) * (eventMatrix C root f D S).det) =
      (1 - ∏ i, q i) ^ r * (meanEventMatrix C root f D q).det := by
  apply (sum_product_replace r (fun _ => weight q)
    (fun _ s => Matrix.of fun i j => markFactor D (fun v => bitValue (s v)) i *
      intervalKernel C.pred (fun v => bitValue (s v)) i j)
    (fun _ => Matrix.of fun i j => markFactor D q i * meanKernel C q i j)
    (fun _ => 1 - ∏ i, q i) (fun H => (colorMatrix root f H).det) ?_).trans
  · simp [meanEventMatrix]
  · intro c H
    simp_rw [colorMatrix_update]
    exact average_replaceRows C root (colorFiber root f c) D
      (colorFiber_nonempty root f hf c) (root_not_colorFiber root f c)
      (colorMatrix root f H) (by intro j; simp [colorMatrix]) q hq

/-- A matrix diagonal off one row has no contributing nonidentity permutation. -/
theorem det_diagonal_except_root (root : V) (d : V → K) (B : Matrix V V K) :
    (diagonalRows (Finset.univ.erase root) d B).det =
      B root root * ∏ i ∈ Finset.univ.erase root, d i := by
  rw [← det_diagonalRowsCleared]
  have he : diagonalRowsCleared (Finset.univ.erase root) d B =
      Matrix.diagonal (fun i => if i = root then B root root else d i) := by
    ext i j
    by_cases hir : i = root <;> by_cases hjr : j = root
    · subst i; subst j; simp [diagonalRowsCleared]
    · subst i; simp [diagonalRowsCleared, hjr, Ne.symm hjr, Matrix.diagonal_apply]
    · subst j; simp [diagonalRowsCleared, hir, Matrix.diagonal_apply]
    · by_cases hij : i = j <;> simp [diagonalRowsCleared, hir, hjr, hij, Matrix.diagonal_apply]
  rw [he, Matrix.det_diagonal,
    ← Finset.mul_prod_erase Finset.univ _ (Finset.mem_univ root)]
  simp only [ite_true]
  congr 1
  apply Finset.prod_congr rfl
  intro i hi
  simp [Finset.ne_of_mem_erase hi]

theorem meanEventMatrix_det (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (D : Finset V) (hD : root ∉ D)
    (q : V → K) (hq : 1 - ∏ i, q i ≠ 0) :
    (1 - ∏ i, q i) * (meanEventMatrix C root f D q).det =
      (1 - q root) * ∏ i ∈ D, q i := by
  have he : meanEventMatrix C root f D q =
      replaceRows (Finset.univ.erase root) (markFactor D q) (meanKernel C q)
        (Matrix.of fun _ _ => 1) := by
    ext i j
    by_cases hi : i = root <;> simp [meanEventMatrix, colorMatrix, replaceRows, hi]
  rw [he, mul_comm, ← cycleMatrix_det C q, ← Matrix.det_mul,
    replaceRows_mul _ _ _ _ _ (meanKernel_mul C q hq), det_diagonal_except_root,
    mul_cycleMatrix]
  simp only [Matrix.of_apply, mul_one]
  congr 1
  calc
    (∏ i ∈ Finset.univ.erase root, markFactor D q i) = ∏ i, markFactor D q i := by
      simp [markFactor, hD]
    _ = ∏ i ∈ D, q i := by simp [markFactor]

/-- The full Bernoulli-weighted event determinant identity, for every fixed
surjection and every finite cyclic vertex set. -/
theorem weighted_event_identity (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin (r+1)) (hf : Function.Surjective f)
    (D : Finset V) (hD : root ∉ D) (q : V → K) (hq : 1 - ∏ i, q i ≠ 0) :
    (∑ S : Fin (r+1) → V → Bool, (∏ c, weight q (S c)) *
      (eventMatrix C root f D S).det) =
      (1 - ∏ i, q i) ^ r * (1 - q root) * ∏ i ∈ D, q i := by
  rw [average_eventMatrix C root f hf D q hq, pow_succ, mul_assoc,
    meanEventMatrix_det C root f D hD q hq]
  ring

end BernardiMorales
