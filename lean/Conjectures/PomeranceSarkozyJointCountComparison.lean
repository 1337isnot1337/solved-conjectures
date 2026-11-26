module
public import Conjectures.PomeranceSarkozyModelCountMass
public import Conjectures.PomeranceSarkozyBernoulliCountEncoding
public import Conjectures.PomeranceSarkozyPoissonCountLaw
public import Conjectures.PomeranceSarkozyFiniteAtomic
public import Conjectures.PomeranceSarkozyAtomicEvent

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory
open Finset
open scoped ENNReal NNReal BigOperators

noncomputable def arithOffsetMass (I P : Finset ℕ) (L N : ℕ) : (↥I→ℕ)→ℝ :=
  atomicPush (fun S : ↥(I×ˢP).powerset => fun h : ↥I => (offsetCounts I P S.val h).val)
    (fun S : ↥(I×ˢP).powerset => (observationLaw (arithmeticObservation (I×ˢP) L (N:=N)) S.val:ℝ))

noncomputable def modelOffsetMass (I P : Finset ℕ) : (↥I→ℕ)→ℝ :=
  atomicPush (fun S : ↥(I×ˢP).powerset => fun h : ↥I => (offsetCounts I P S.val h).val)
    (fun S : ↥(I×ˢP).powerset => (observationLaw (modelObservation (I×ˢP) (P:=P)) S.val:ℝ))

noncomputable def bernOffsetMass {n : ℕ} (I : Finset ℕ) (p : Fin n→ℕ) : (↥I→ℕ)→ℝ :=
  atomicPush (sumMatrix ∘ setTupleMatrix I) (fun s => (bernoulliTupleMass I p s:ℝ))

theorem arith_model_offset_atomic_le (I P : Finset ℕ) (L N R : ℕ) (hN : 0<N)
    (hP : ∀ p∈P,p.Prime) (hI : ∀ h∈I,∀ p∈P,h<p) (hL : ∀ h∈I,h≤L) :
    atomicL1 (arithOffsetMass I P L N) (modelOffsetMass I P)≤
      ENNReal.ofReal (crtWindowL1Bound (I×ˢP) N R:ℝ) := by
  classical
  unfold arithOffsetMass modelOffsetMass
  refine (atomicPush_l1_le _ _ _
    (fun _ => by exact_mod_cast observationLaw_nonneg _ _)
    (fun _ => by exact_mod_cast observationLaw_nonneg _ _)
    ((hasSum_fintype _).summable) ((hasSum_fintype _).summable)).trans ?_
  rw [atomicL1_ratCast_eq]
  apply ENNReal.ofReal_le_ofReal
  have h := arithmetic_model_window_l1 (I×ˢP) P L N R hN hP
    (fun _ he => (Finset.mem_product.mp he).2)
    (fun _ he => hI _ (Finset.mem_product.mp he).1 _ (Finset.mem_product.mp he).2)
    (fun _ he => hL _ (Finset.mem_product.mp he).1)
  have he : finiteLawL1
      (fun S : ↥(I×ˢP).powerset => observationLaw (arithmeticObservation (I×ˢP) L (N:=N)) S.val)
      (fun S : ↥(I×ˢP).powerset => observationLaw (modelObservation (I×ˢP) (P:=P)) S.val)
      ≤ crtWindowL1Bound (I×ˢP) N R := by
    unfold finiteLawL1
    rw [Finset.sum_coe_sort (I×ˢP).powerset (fun S =>
      |observationLaw (arithmeticObservation (I×ˢP) L (N:=N)) S -
        observationLaw (modelObservation (I×ˢP) (P:=P)) S|)]
    exact h
  exact_mod_cast he

theorem model_bern_offset_atomic_le {n : ℕ} (I P : Finset ℕ) (e : Fin n≃↥P)
    (hP : ∀ p∈P,0<p) (hI : ∀ h∈I,∀ p∈P,h<p) :
    let p (i : Fin n) := (e i).val
    atomicL1 (modelOffsetMass I P) (bernOffsetMass I p) ≤
      ENNReal.ofReal ((∑ i,2*(I.card:ℚ)*((I.card-1:ℕ):ℚ)*(1/(p i:ℚ))^2 : ℚ):ℝ) := by
  classical
  let p (i : Fin n) := (e i).val
  let a := residueTupleMass I p (fun i => shiftResidue (p i) (hP _ (e i).property))
  let b := bernoulliTupleMass I p
  have hq : modelOffsetMass I P = atomicPush (sumMatrix ∘ setTupleMatrix I) (fun s => (a s:ℝ)) := by
    unfold modelOffsetMass
    rw [atomicPush_cast_pushFiniteLaw,atomicPush_cast_pushFiniteLaw]
    funext s
    exact congrArg (fun x : ℚ => (x:ℝ)) (congrFun (model_count_mass_eq_residue_tuple_push I P e hP hI) s)
  change atomicL1 (modelOffsetMass I P) (bernOffsetMass I p)≤_
  rw [hq]
  unfold bernOffsetMass
  have ha (s : Fin n→↥I.powerset) : 0≤(a s:ℝ) := by
    unfold a residueTupleMass
    positivity
  have hb (s : Fin n→↥I.powerset) : 0≤(b s:ℝ) := by
    unfold b bernoulliTupleMass tupleWeight bernoulliAtoms
    push_cast
    apply Finset.prod_nonneg
    intro i _
    have hpi : (1:ℝ)≤(p i:ℝ) := by exact_mod_cast hP _ (e i).property
    have hle : (1:ℝ)/(p i:ℝ)≤1 := div_le_one_of_le₀ hpi (by positivity)
    exact mul_nonneg (by positivity) (pow_nonneg (sub_nonneg.mpr hle) _)
  refine (atomicPush_l1_le _ _ _ ha hb ((hasSum_fintype _).summable) ((hasSum_fintype _).summable)).trans ?_
  rw [atomicL1_ratCast_eq]
  apply ENNReal.ofReal_le_ofReal
  exact_mod_cast shift_residue_tuple_bernoulli_l1 I p
    (fun i => hP _ (e i).property) (fun h hh i => hI h hh _ (e i).property)

end PomeranceSarkozy
