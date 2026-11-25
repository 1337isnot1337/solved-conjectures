module
public import Mathlib.Algebra.DualNumber
public import Mathlib.Algebra.Group.TypeTags.Basic
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
public import Mathlib.Algebra.BigOperators.Ring.Finset

@[expose] public section
namespace NovelliThibon

variable {R : Type*} [CommRing R]

def unitJet (a : R) : (DualNumber R)ˣ where
  val := ⟨1,a⟩
  inv := ⟨1,-a⟩
  val_inv := by
    apply TrivSqZeroExt.ext
    · change (1:R)*1=1
      simp
    · change (1:R)*(-a)+a*1=0
      simp
  inv_val := by
    apply TrivSqZeroExt.ext
    · change (1:R)*1=1
      simp
    · change (1:R)*a+(-a)*1=0
      simp

def jetHom : Multiplicative R →* (DualNumber R)ˣ where
  toFun a := unitJet a.toAdd
  map_one' := by
    apply Units.ext
    rfl
  map_mul' a b := by
    apply Units.ext
    apply TrivSqZeroExt.ext
    · change 1=(1:R)*1
      simp
    · change a.toAdd+b.toAdd=(1:R)*b.toAdd+a.toAdd*1
      simp [add_comm]

theorem unitJet_zpow (a : R) (z : ℤ) :
    unitJet a ^ z = unitJet (z • a) := by
  change jetHom (Multiplicative.ofAdd a) ^ z = jetHom (Multiplicative.ofAdd (z • a))
  rw [ofAdd_zsmul,map_zpow]

theorem unitJet_prod {ι : Type*} (s : Finset ι) (a : ι → R) :
    (∏ i ∈ s, unitJet (a i)) = unitJet (∑ i ∈ s, a i) := by
  classical
  induction s using Finset.induction_on with
  | empty => exact jetHom.map_one.symm
  | insert i s hi ih =>
    rw [Finset.prod_insert hi,Finset.sum_insert hi,ih]
    exact (jetHom.map_mul (Multiplicative.ofAdd (a i))
      (Multiplicative.ofAdd (∑ j ∈ s,a j))).symm

/-- Evaluate an integral Laurent monomial expansion in dual numbers.
Each parameter has base value one and an arbitrary first-order direction. -/
def laurentDirections {ι W : Type*} [Fintype W] (s : Finset ι)
    (weight : W → R) (exponent : ι → W → ℤ) (direction : ι → R) : DualNumber R :=
  ∑ w : W, (TrivSqZeroExt.inl (weight w) : DualNumber R) *
      ((∏ i ∈ s,unitJet (direction i) ^ exponent i w).val)

theorem laurentDirections_fst {ι W : Type*} [Fintype W] (s : Finset ι)
    (weight : W → R) (exponent : ι → W → ℤ) (direction : ι → R) :
    (laurentDirections s weight exponent direction).fst = ∑ w : W,weight w := by
  unfold laurentDirections
  simp_rw [unitJet_zpow,unitJet_prod]
  rw [TrivSqZeroExt.fst_sum]
  apply Finset.sum_congr rfl
  intro w _
  change weight w * (1:R) = weight w
  exact mul_one _

/-- No truncation or positivity assumption on the exponents: the
linear coefficient is exactly the signed first exponent moment. -/
theorem laurentDirections_snd {ι W : Type*} [Fintype W] (s : Finset ι)
    (weight : W → R) (exponent : ι → W → ℤ) (direction : ι → R) :
    (laurentDirections s weight exponent direction).snd =
      ∑ i ∈ s,direction i*(∑ w : W,weight w*(exponent i w:R)) := by
  unfold laurentDirections
  simp_rw [unitJet_zpow,unitJet_prod]
  rw [TrivSqZeroExt.snd_sum]
  have term (w : W) :
      ((TrivSqZeroExt.inl (weight w) : DualNumber R) *
        (unitJet (∑ i ∈ s, exponent i w • direction i)).val).snd =
        weight w * ∑ i ∈ s,(exponent i w:R)*direction i := by
    change weight w * (∑ i ∈ s, exponent i w • direction i) +
      (0:R) * 1 = _
    simp only [zero_mul,add_zero,zsmul_eq_mul]
  simp_rw [term]
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro w _
  ac_rfl

end NovelliThibon
