import Conjectures.PackingConstructions
import Mathlib.Algebra.BigOperators.Fin

/-! From finite residue packings to periodic integer center indicators. -/
namespace PackingFourPoint

open scoped BigOperators

noncomputable def fiberCount {ι G : Type*} [Fintype ι] (f : ι → G) (z : G) : ℤ := by
  classical
  exact ∑ i, if f i = z then 1 else 0

theorem fiberCount_nonneg {ι G : Type*} [Fintype ι] (f : ι → G) (z : G) :
    0 ≤ fiberCount f z := by
  classical
  apply Finset.sum_nonneg
  intro i _
  split_ifs <;> omega

theorem fiberCount_le_one {ι G : Type*} [Fintype ι] (f : ι → G)
    (hf : Function.Injective f) (z : G) : fiberCount f z ≤ 1 := by
  classical
  by_cases h : ∃ i, f i = z
  · obtain ⟨i, rfl⟩ := h
    simp [fiberCount, hf.eq_iff]
  · have hn : ∀ i, f i ≠ z := by simpa only [not_exists] using h
    simp [fiberCount, hn]

theorem fiberCount_ge_one {ι G : Type*} [Fintype ι] (f : ι → G)
    (hf : Function.Surjective f) (z : G) : 1 ≤ fiberCount f z := by
  classical
  obtain ⟨i, hi⟩ := hf z
  have hs := Finset.single_le_sum (f := fun i => if f i = z then (1 : ℤ) else 0)
    (s := Finset.univ) (a := i) (by intro j _; split_ifs <;> omega) (Finset.mem_univ i)
  simpa only [hi, ite_true, fiberCount] using hs

noncomputable def periodicCenters {ι : Type*} [Fintype ι] {P : ℕ}
    (centers : ι → ZMod P) (t : ℤ) : ℤ := fiberCount centers (t : ZMod P)

def fourOffsets {P : ℕ} (a b : ZMod P) (d : Fin 2 × Fin 2) : ZMod P :=
  d.1.val*a+d.2.val*b

theorem periodicCenters_periodic {ι : Type*} [Fintype ι] {P : ℕ}
    (centers : ι → ZMod P) (t : ℤ) :
    periodicCenters centers (t+P) = periodicCenters centers t := by
  simp [periodicCenters]

theorem multiplicity_eq_fiberCount {ι : Type*} [Fintype ι] {P : ℕ}
    (centers : ι → ZMod P) (a b t : ℤ) :
    multiplicity (periodicCenters centers) a b t =
      fiberCount (fun e : ι × (Fin 2 × Fin 2) =>
        centers e.1 + fourOffsets (a : ZMod P) (b : ZMod P) e.2) (t : ZMod P) := by
  classical
  simp only [multiplicity, periodicCenters, fiberCount, Fintype.sum_prod_type,
    Fin.sum_univ_two, fourOffsets, Fin.val_zero, Fin.val_one,
    Nat.cast_zero, Nat.cast_one, zero_mul, one_mul, zero_add, add_zero,
    Int.cast_sub, Finset.sum_add_distrib]
  simp only [← eq_sub_iff_add_eq, sub_add_eq_sub_sub]
  ring

theorem periodic_packing {ι : Type*} [Fintype ι] {P : ℕ}
    (centers : ι → ZMod P) (a b : ℤ)
    (hpack : Function.Injective (fun e : ι × (Fin 2 × Fin 2) =>
      centers e.1 + fourOffsets (a : ZMod P) (b : ZMod P) e.2)) :
    ∀ t, multiplicity (periodicCenters centers) a b t ≤ 1 := by
  intro t
  rw [multiplicity_eq_fiberCount]
  exact fiberCount_le_one _ hpack _

theorem periodic_covering {ι : Type*} [Fintype ι] {P : ℕ}
    (centers : ι → ZMod P) (a b : ℤ)
    (hcover : Function.Surjective (fun e : ι × (Fin 2 × Fin 2) =>
      centers e.1 + fourOffsets (a : ZMod P) (b : ZMod P) e.2)) :
    ∀ t, 1 ≤ multiplicity (periodicCenters centers) a b t := by
  intro t
  rw [multiplicity_eq_fiberCount]
  exact fiberCount_ge_one _ hcover _

def residueEquiv (P : ℕ) [NeZero P] : Fin P ≃ ZMod P where
  toFun i := (i.val : ZMod P)
  invFun z := ⟨z.val, ZMod.val_lt z⟩
  left_inv i := by
    apply Fin.ext
    simp [Nat.mod_eq_of_lt i.isLt]
  right_inv z := ZMod.natCast_zmod_val z

theorem fiberCount_total {ι G : Type*} [Fintype ι] [Fintype G] (f : ι → G) :
    ∑ z, fiberCount f z = (Fintype.card ι : ℤ) := by
  classical
  simp only [fiberCount]
  rw [Finset.sum_comm]
  simp

theorem periodicCenters_block_count {ι : Type*} [Fintype ι] {P : ℕ} [NeZero P]
    (centers : ι → ZMod P) (start : ℤ) :
    intervalSum (periodicCenters centers) start P = (Fintype.card ι : ℤ) := by
  classical
  unfold intervalSum
  rw [← Fin.sum_univ_eq_sum_range]
  calc
    ∑ j : Fin P, periodicCenters centers (start+(j.val : ℤ))
      = ∑ z : ZMod P, fiberCount centers z := by
        apply Fintype.sum_equiv
          ((residueEquiv P).trans (Equiv.addLeft (start : ZMod P)))
        intro j
        simp [periodicCenters, residueEquiv]
    _ = (Fintype.card ι : ℤ) := fiberCount_total centers

theorem periodicCenters_full_blocks {ι : Type*} [Fintype ι] {P : ℕ} [NeZero P]
    (centers : ι → ZMod P) (start : ℤ) (k : ℕ) :
    intervalSum (periodicCenters centers) start (k*P) =
      (k : ℤ)*(Fintype.card ι : ℤ) := by
  apply le_antisymm
  · exact block_sum_upper _ _ _ (fun s => le_of_eq (periodicCenters_block_count centers s)) _ _
  · exact block_sum_lower _ _ _ (fun s => le_of_eq (periodicCenters_block_count centers s).symm) _ _

/-- A finite set of distinct residue centers has the expected asymptotic
count, with a uniform quadratic boundary bound. -/
theorem periodicCenters_count_bounds {ι : Type*} [Fintype ι] {P : ℕ} [NeZero P]
    (centers : ι → ZMod P) (hc : Function.Injective centers) (start : ℤ) (n : ℕ) :
    (Fintype.card ι : ℤ)*n-(P : ℤ)^2 ≤
      (P : ℤ)*intervalSum (periodicCenters centers) start n ∧
    (P : ℤ)*intervalSum (periodicCenters centers) start n ≤
      (Fintype.card ι : ℤ)*n+(P : ℤ)^2 := by
  have hn : n/P*P+n%P = n := by
    simpa only [Nat.mul_comm, Nat.add_comm] using Nat.mod_add_div n P
  have hs := intervalSum_add (periodicCenters centers) start (n/P*P) (n%P)
  rw [hn, periodicCenters_full_blocks] at hs
  have hl := intervalSum_nonneg (periodicCenters centers)
    (fun t => fiberCount_nonneg centers _) (start+↑(n/P*P)) (n%P)
  have hu := intervalSum_le_length (periodicCenters centers)
    (fun t => fiberCount_le_one centers hc _) (start+↑(n/P*P)) (n%P)
  have hcard : Fintype.card ι ≤ P := by
    simpa only [ZMod.card] using Fintype.card_le_of_injective centers hc
  have hcard' : (Fintype.card ι : ℤ) ≤ P := by exact_mod_cast hcard
  have hcast : (n/P : ℕ)*(P : ℤ)+(n%P : ℕ) = n := by exact_mod_cast hn
  have hrem : ((n%P : ℕ) : ℤ) ≤ P := by
    exact_mod_cast (Nat.mod_lt n (Nat.pos_of_ne_zero (NeZero.ne P))).le
  have hP0 : (0 : ℤ) ≤ P := by omega
  have hlow : (n/P : ℕ)*(Fintype.card ι : ℤ) ≤
      intervalSum (periodicCenters centers) start n := by omega
  have hupp : intervalSum (periodicCenters centers) start n ≤
      (n/P : ℕ)*(Fintype.card ι : ℤ)+(n%P : ℕ) := by omega
  have hl' := mul_le_mul_of_nonneg_left hlow hP0
  have hu' := mul_le_mul_of_nonneg_left hupp hP0
  have herr1 : (n%P : ℕ)*(Fintype.card ι : ℤ) ≤ (P : ℤ)^2 := by
    nlinarith [mul_le_mul hrem hcard' (by omega : (0 : ℤ) ≤ Fintype.card ι) hP0]
  have herr2 : (P : ℤ)*(n%P : ℕ) ≤ (P : ℤ)^2 := by nlinarith
  constructor <;> nlinarith

end PackingFourPoint
