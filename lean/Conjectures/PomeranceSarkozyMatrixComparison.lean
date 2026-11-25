module
public import Conjectures.PomeranceSarkozyPoissonColumns
public import Conjectures.PomeranceSarkozyAtomicPush

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory
open scoped NNReal ENNReal BigOperators

variable {J K : Type*} [Fintype J] [Fintype K]

noncomputable def realMatrixMass (p : J→ℕ→ℝ) (x : K→J→ℕ) : ℝ :=
  ∏ k,∏ j,p j (x k j)

noncomputable def sumMatrix (x : K→J→ℕ) : K→ℕ :=
  fun k => ∑ j,x k j

theorem atomicMass_summable_of_ne_top {A : Type*} {p : A→ℝ}
    (hp : ∀ a,0≤p a) (hf : atomicMass p≠⊤) : Summable p := by
  lift p to A→ℝ≥0 using hp
  rw [NNReal.summable_coe]
  apply ENNReal.tsum_coe_ne_top_iff_summable.mp
  simpa [atomicMass] using hf

private def matrixEquiv {n : ℕ} (e : Fin n≃K×J) : (Fin n→ℕ) ≃ (K→J→ℕ) where
  toFun a k j := a (e.symm (k,j))
  invFun x i := x (e i).1 (e i).2
  left_inv a := by funext i; simp
  right_inv a := by funext k j; simp

private theorem realMatrixMass_equiv {n : ℕ} (e : Fin n≃K×J) (p : J→ℕ→ℝ) (x : Fin n→ℕ) :
    realMatrixMass p (matrixEquiv e x) =
      realTupleMass (fun i => p (e i).2) x := by
  unfold realMatrixMass realTupleMass
  rw [← Fintype.prod_prod_type (fun z : K×J => p z.2 ((matrixEquiv e) x z.1 z.2))]
  symm
  refine Fintype.prod_equiv e _ _ ?_
  intro i
  simp [matrixEquiv]

theorem realMatrixMass_atomicMass (p : J→ℕ→ℝ)
    (hp : ∀ j a,0≤p j a) (hp₁ : ∀ j,atomicMass (p j)=1) :
    atomicMass (realMatrixMass (K:=K) p)=1 := by
  classical
  let e := (Fintype.equivFin (K×J)).symm
  unfold atomicMass
  rw [← (matrixEquiv e).tsum_eq]
  simp_rw [realMatrixMass_equiv]
  exact realTupleMass_atomicMass _ (fun i => hp (e i).2) fun i => hp₁ (e i).2

theorem realMatrixMass_atomicL1_le (p q : J→ℕ→ℝ)
    (hp : ∀ j a,0≤p j a) (hq : ∀ j a,0≤q j a)
    (hp₁ : ∀ j,atomicMass (p j)=1) (hq₁ : ∀ j,atomicMass (q j)=1) :
    atomicL1 (realMatrixMass (K:=K) p) (realMatrixMass q) ≤
      ∑ _k : K,∑ j,atomicL1 (p j) (q j) := by
  classical
  let e := (Fintype.equivFin (K×J)).symm
  unfold atomicL1
  rw [← (matrixEquiv e).tsum_eq]
  simp_rw [realMatrixMass_equiv]
  change atomicL1 (realTupleMass (fun i => p (e i).2)) (realTupleMass (fun i => q (e i).2))≤
    ∑ _k : K,∑ j,atomicL1 (p j) (q j)
  rw [← Fintype.sum_prod_type (fun z : K×J => atomicL1 (p z.2) (q z.2))]
  have h := realTupleMass_atomicL1_le (fun i => p (e i).2) (fun i => q (e i).2)
    (fun i => hp (e i).2) (fun i => hq (e i).2) (fun i => hp₁ (e i).2) (fun i => hq₁ (e i).2)
  refine h.trans_eq ?_
  exact Fintype.sum_equiv e _ _ (fun _ => rfl)

theorem bernoulli_poisson_offset_sums_le (b : J→ℝ≥0) (hb : ∀ j,(b j:ℝ)≤1) :
    atomicL1 (atomicPush (sumMatrix (K:=K)) (realMatrixMass (fun j => bernoulliNatMass (b j:ℝ))))
      (atomicPush sumMatrix (realMatrixMass (fun j => poissonNatMass (b j)))) ≤
      ∑ _k : K,∑ j,ENNReal.ofReal (2*(b j:ℝ)^2) := by
  let p (j : J) := bernoulliNatMass (b j:ℝ)
  let q (j : J) := poissonNatMass (b j)
  have hp (j : J) : ∀ n,0≤p j n := bernoulliNatMass_nonneg (b j).coe_nonneg (hb j)
  have hq (j : J) : ∀ n,0≤q j n := poissonNatMass_nonneg (b j)
  have hp₁ (j : J) : atomicMass (p j)=1 := bernoulliNatMass_atomicMass (b j).coe_nonneg (hb j)
  have hq₁ (j : J) : atomicMass (q j)=1 := poissonNatMass_atomicMass (b j)
  have hpm (x : K→J→ℕ) : 0≤realMatrixMass p x :=
    Finset.prod_nonneg fun _ _ => Finset.prod_nonneg fun _ _ => hp _ _
  have hqm (x : K→J→ℕ) : 0≤realMatrixMass q x :=
    Finset.prod_nonneg fun _ _ => Finset.prod_nonneg fun _ _ => hq _ _
  have hps := atomicMass_summable_of_ne_top hpm (by rw [realMatrixMass_atomicMass p hp hp₁]; simp)
  have hqs := atomicMass_summable_of_ne_top hqm (by rw [realMatrixMass_atomicMass q hq hq₁]; simp)
  change atomicL1 (atomicPush sumMatrix (realMatrixMass p)) (atomicPush sumMatrix (realMatrixMass q))≤_
  refine ((atomicPush_l1_le _ _ _ hpm hqm hps hqs).trans
    (realMatrixMass_atomicL1_le p q hp hq hp₁ hq₁)).trans ?_
  exact Finset.sum_le_sum (fun _ _ => Finset.sum_le_sum fun j _ => bernoulli_poisson_atomicL1_le (b j))

end PomeranceSarkozy
