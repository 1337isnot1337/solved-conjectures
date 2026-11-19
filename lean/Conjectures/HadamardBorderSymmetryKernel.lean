import Conjectures.HadamardBorderSymmetryCore
import Conjectures.HadamardBorderSymmetryPairs
import Conjectures.HadamardBorderSymmetryWeighted
import Mathlib.Tactic.Ring

/-!
# Trivial kernel of the common multiplier projection

A nonidentity automorphism of the four-point quotient forces two equal
fibers. The raw correlation at the complementary shift bounds the sum
of the other two fibers. Their compressed correlation then contradicts
the energy bound. Every sum below is taken from the actual sign rows.
-/

namespace HadamardBorderSymmetry

open scoped BigOperators

theorem sum_four_points {α : Type*} [Fintype α] [DecidableEq α]
    (z h a b : α) (hcover : ∀ q, q = z ∨ q = h ∨ q = a ∨ q = b)
    (hpair : List.Pairwise (· ≠ ·) [z, h, a, b]) (f : α → ℤ) :
    (∑ q, f q) = f z + f h + f a + f b := by
  have hn : [z, h, a, b].Nodup := hpair
  have huniv : [z, h, a, b].toFinset = Finset.univ := by
    ext q
    simp only [List.mem_toFinset, List.mem_cons, List.mem_nil_iff, or_false,
      Finset.mem_univ, iff_true]
    exact hcover q
  rw [← huniv, List.sum_toFinset f hn]
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero,
    add_assoc]

theorem abs_add_eq_mul_add_one_of_signs (u v : ℤ)
    (hu : u = 1 ∨ u = -1) (hv : v = 1 ∨ v = -1) :
    |u + v| = u * v + 1 := by
  rcases hu with hu | hu <;> rcases hv with hv | hv <;> rw [hu, hv] <;> norm_num

theorem paired_fiber_abs_bound149 (f g : ZMod 149 → ℤ)
    (hf : ∀ x, f x = 1 ∨ f x = -1) (hg : ∀ x, g x = 1 ∨ g x = -1) :
    |(∑ x, f x) + (∑ x, g x)| ≤ (∑ x, f x * g x) + 149 := by
  calc
    |(∑ x, f x) + (∑ x, g x)| = |(∑ x, f x + g x)| := by
      rw [Finset.sum_add_distrib]
    _ ≤ ∑ x, |f x + g x| := Finset.abs_sum_le_sum_abs _ _
    _ = ∑ x, (f x * g x + 1) := by
      apply Finset.sum_congr rfl
      intro x hx
      exact abs_add_eq_mul_add_one_of_signs (f x) (g x) (hf x) (hg x)
    _ = (∑ x, f x * g x) + 149 := by
      rw [Finset.sum_add_distrib]
      norm_num

variable {Q : Type*} [AddCommGroup Q] [Fintype Q] [DecidableEq Q]

/-- A common symmetry of all actual fibers cannot act nontrivially on
the four-point quotient while fixing the cyclic coordinate. -/
theorem quotient_automorphism_symmetry_impossible (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F)
    (e : AddAut Q) (he : e ≠ 0)
    (hinv : ∀ i q x, F i (e q) x = F i q x) : False := by
  classical
  obtain ⟨a, h, hh0, hh2, ha0, _hah, hea, hcover, hpair, ha2⟩ :=
    nontrivial_order_four_automorphism_pairs
      (by simpa only [Nat.card_eq_fintype_card] using hQ) e he
  have hh : h + h = 0 := by simpa only [two_nsmul] using hh2
  have haa : a + a = 0 ∨ a + a = h := by simpa only [two_nsmul] using ha2
  have hsame (i : Fin 4) (x : ZMod 149) : F i (a + h) x = F i a x := by
    rw [← hea]
    exact hinv i a x
  have hC (i : Fin 4) : fiberSum149 F i (a + h) = fiberSum149 F i a := by
    apply Finset.sum_congr rfl
    intro x hx
    exact hsame i x
  have hstep (i : Fin 4) (x : ZMod 149) :
      (∑ q, F i (q + h) x * F i q x) = 2 + 2 * (F i 0 x * F i h x) := by
    rw [sum_four_points 0 h a (a + h) hcover hpair]
    simp only [zero_add, hh, add_assoc, add_zero, hsame]
    have hsquare : F i a x * F i a x = 1 := by
      rcases hF.sign i a x with hs | hs <;> rw [hs] <;> norm_num
    nlinarith [hsquare]
  have hrows (i : Fin 4) :
      (∑ q, ∑ x, F i (q + h) x * F i q x) =
        298 + 2 * (∑ x, F i 0 x * F i h x) := by
    rw [Finset.sum_comm]
    simp_rw [hstep i]
    rw [Finset.sum_add_distrib, ← Finset.mul_sum]
    norm_num
  have hraw : combinedCorrelation149 F h 0 =
      1192 + 2 * (∑ i, ∑ x, F i 0 x * F i h x) := by
    unfold combinedCorrelation149
    simp only [add_zero]
    simp_rw [hrows]
    rw [Finset.sum_add_distrib, ← Finset.mul_sum]
    norm_num
  have hcorr : combinedCorrelation149 F h 0 = 4 := by
    have hpair0 : (h, (0 : ZMod 149)) ≠ (0, 0) := by
      intro hp
      exact hh0 (congrArg Prod.fst hp)
    simpa only [ite_eq_right hh0] using hF.correlation h 0 hpair0
  have hprod : (∑ i, ∑ x, F i 0 x * F i h x) = -594 := by
    linarith [hraw, hcorr]
  have habs : (∑ i, |fiberSum149 F i 0 + fiberSum149 F i h|) ≤ 2 := by
    calc
      (∑ i, |fiberSum149 F i 0 + fiberSum149 F i h|) ≤
          ∑ i, ((∑ x, F i 0 x * F i h x) + 149) := by
        apply Finset.sum_le_sum
        intro i hi
        exact paired_fiber_abs_bound149 (F i 0) (F i h) (hF.sign i 0) (hF.sign i h)
      _ = 2 := by
        rw [Finset.sum_add_distrib, hprod]
        norm_num
  have hha : h + a = a + h := add_comm h a
  have haha : (a + h) + a = (a + a) + h := by abel
  have hcompstep (i : Fin 4) :
      (∑ q, fiberSum149 F i (q + a) * fiberSum149 F i q) =
        2 * (fiberSum149 F i a * (fiberSum149 F i 0 + fiberSum149 F i h)) := by
    rw [sum_four_points 0 h a (a + h) hcover hpair]
    simp only [zero_add, hha, haha, hC]
    rcases haa with ha_zero | ha_h
    · rw [ha_zero, zero_add]
      ring
    · rw [ha_h, hh]
      ring
  have hc := compressed_correlation_nonzero149 F hF a ha0
  simp_rw [hcompstep] at hc
  rw [← Finset.mul_sum] at hc
  have hcomp :
      (∑ i, fiberSum149 F i a * (fiberSum149 F i 0 + fiberSum149 F i h)) = 298 := by
    linarith
  have hbound (i : Fin 4) : |fiberSum149 F i a| < 25 :=
    energy608_abs_lt25 (fun p : Fin 4 × Q => fiberSum149 F p.1 p.2)
      (compressed_energy149 F hQ hF) (i, a)
  exact small_pair_sum_correlation_impossible
    (fun i => fiberSum149 F i a)
    (fun i => fiberSum149 F i 0 + fiberSum149 F i h) hbound habs hcomp

end HadamardBorderSymmetry
