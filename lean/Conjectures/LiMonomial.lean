import Conjectures.LiDualFull
import Conjectures.LiWeighted
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Tactic

open MvPolynomial
open scoped BigOperators

namespace LiMonomial

def eps : Dual := Dual.mk 0 1

lemma eps_sq : eps * eps = 0 := by
  ext <;> simp [eps]

lemma pow_succ_custom (x : Dual) (n : ℕ) : x ^ (n + 1) = x * x ^ n := rfl

lemma eps_pow_add_two (c : ℕ) : eps ^ (c + 2) = 0 := by
  induction c with
  | zero =>
      rw [show 0 + 2 = 1 + 1 by omega, pow_succ_custom]
      simp [eps_sq]
  | succ c ih =>
      rw [show c + 1 + 2 = (c + 2) + 1 by omega, pow_succ_custom, ih, mul_zero]

lemma eps_pow (c : ℕ) : eps ^ c = if c = 0 then 1 else if c = 1 then eps else 0 := by
  match c with
  | 0 => simp
  | 1 => simp
  | c + 2 => rw [eps_pow_add_two c]; simp

lemma v1_pow (b : ℕ) :
    (Dual.mk (-1) 0 : Dual) ^ b = Dual.mk ((-1 : ℚ) ^ b) 0 := by
  induction b with
  | zero => rfl
  | succ b ih =>
      rw [pow_succ_custom, ih]
      ext <;> simp [pow_succ]

def v : Fin 3 → Dual := fun i => if i = 0 then 0 else if i = 1 then Dual.mk (-1) 0 else eps

lemma snd_eps_pow (c : ℕ) : (eps ^ c).c1 = if c = 1 then 1 else 0 := by
  rw [eps_pow]
  by_cases h0 : c = 0 <;> by_cases h1 : c = 1 <;> simp [h0, h1, eps]

lemma c0_v1_pow (b : ℕ) : ((Dual.mk (-1) 0 : Dual) ^ b).c0 = (-1 : ℚ) ^ b := by
  rw [v1_pow]

lemma c1_v1_pow (b : ℕ) : ((Dual.mk (-1) 0 : Dual) ^ b).c1 = 0 := by
  rw [v1_pow]

lemma c0_v0_pow (a : ℕ) : ((0 : Dual) ^ a).c0 = if a = 0 then 1 else 0 := by
  match a with
  | 0 => simp
  | a + 1 => rw [pow_succ_custom]; simp

lemma c1_v0_pow (a : ℕ) : ((0 : Dual) ^ a).c1 = 0 := by
  match a with
  | 0 => simp
  | a + 1 => rw [pow_succ_custom]; simp

theorem snd_prod_v (d : Fin 3 →₀ ℕ) (h : Finsupp.weight LiWeighted.wt d = 31) :
    (∏ i : Fin 3, v i ^ d i).c1 =
      if d = (Finsupp.single 1 14 + Finsupp.single 2 1) then 1 else 0 := by
  have hw : d 0 + 2 * d 1 + 3 * d 2 = 31 := by
    simpa [Finsupp.weight_eq_sum, LiWeighted.wt, Fin.sum_univ_three, mul_comm, mul_left_comm,
      mul_assoc] using h
  rw [Fin.prod_univ_three]
  have hv0 : v 0 = 0 := by decide
  have hv1 : v 1 = Dual.mk (-1) 0 := by decide
  have hv2 : v 2 = eps := by decide
  rw [hv0, hv1, hv2]
  rw [Dual.snd_mul, Dual.snd_mul, c0_v0_pow, c1_v0_pow, c0_v1_pow, c1_v1_pow,
    snd_eps_pow]
  by_cases hd : d = (Finsupp.single 1 14 + Finsupp.single 2 1)
  · rw [hd, if_pos rfl]
    simp [Finsupp.add_apply, Finsupp.single_apply]
    rw [c0_v1_pow]
    norm_num
  · rw [if_neg hd]
    by_cases h0 : d 0 = 0
    · by_cases h2 : d 2 = 1
      · have h1 : d 1 = 14 := by omega
        exact absurd (by
          ext i
          fin_cases i <;> simp [h0, h1, h2, Finsupp.single_eq_same]) hd
      · simp [h0, h2]
    · simp [h0]

/-- The `.c1` projection as an additive homomorphism. -/
def sndHom : Dual →+ ℚ where
  toFun := Dual.c1
  map_zero' := rfl
  map_add' := Dual.snd_add

theorem snd_aeval_of_weighted (p : MvPolynomial (Fin 3) ℚ)
    (hp : IsWeightedHomogeneous LiWeighted.wt p 31) :
    (MvPolynomial.aeval v p).c1 =
      p.coeff (Finsupp.single 1 14 + Finsupp.single 2 1) := by
  have hsum : (MvPolynomial.aeval v p).c1 = sndHom (∑ d ∈ p.support,
      MvPolynomial.aeval v (MvPolynomial.monomial d (p.coeff d))) := by
    conv_lhs => rw [MvPolynomial.as_sum p]
    rw [map_sum]
    rfl
  rw [hsum, map_sum]
  have hterm : ∀ d ∈ p.support,
      sndHom (MvPolynomial.aeval v (MvPolynomial.monomial d (p.coeff d)))
        = if d = (Finsupp.single 1 14 + Finsupp.single 2 1) then p.coeff d else 0 := by
    intro d hd
    rw [MvPolynomial.aeval_monomial]
    have hd31 : Finsupp.weight LiWeighted.wt d = 31 := hp (Finsupp.mem_support_iff.mp hd)
    have hprod : (d.prod fun i k => v i ^ k) = ∏ i : Fin 3, v i ^ d i := by
      rw [Finsupp.prod_of_support_subset d (Finset.subset_univ _)
        (fun i k => v i ^ k) (by intro i _; simp)]
    rw [hprod, Dual.algebraMap_eq_mk]
    change (Dual.mk (p.coeff d) 0 * (∏ i : Fin 3, v i ^ d i)).c1 =
      if d = (Finsupp.single 1 14 + Finsupp.single 2 1) then p.coeff d else 0
    rw [Dual.snd_mul]
    simp only [Dual.snd_zero, zero_mul, add_zero]
    rw [snd_prod_v d hd31]
    by_cases hd' : d = (Finsupp.single 1 14 + Finsupp.single 2 1)
    · rw [if_pos hd', if_pos hd']; ring
    · rw [if_neg hd', if_neg hd']; ring
  rw [Finset.sum_congr rfl hterm]
  by_cases h : (Finsupp.single 1 14 + Finsupp.single 2 1) ∈ p.support
  · rw [Finset.sum_eq_single (Finsupp.single 1 14 + Finsupp.single 2 1)]
    · rw [if_pos rfl]
    · intro d _ hde
      rw [if_neg hde]
    · intro hnot
      exact absurd h hnot
  · rw [Finset.sum_eq_zero]
    · rw [Finsupp.notMem_support_iff.mp h]
    · intro d hd
      rw [if_neg]
      rintro rfl
      exact h hd

end LiMonomial
