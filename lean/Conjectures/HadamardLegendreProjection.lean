import Mathlib.Algebra.Group.Action.End
import Mathlib.Algebra.Group.Action.TypeTags
import Mathlib.Algebra.Group.Equiv.TypeTags
import Mathlib.Data.ZMod.Aut
import Mathlib.Data.Nat.Totient
import Mathlib.GroupTheory.Index
import Mathlib.Tactic.Abel
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.IntervalCases

/-!
# Actual factor projections on the length-1197 domain

The factors of R × ZMod 133, with R of order nine, are characterized by
nine-torsion and 133-torsion. Every automorphism therefore restricts to
both factors, and the cyclic-factor restriction is an actual unit
multiplier. An injective projection of an odd-order subgroup has order
dividing 27.
-/

noncomputable section

namespace HadamardLegendre

variable {R : Type*} [AddCommGroup R]

theorem nine_nsmul_eq_zero_iff_snd_eq_zero (hR : Nat.card R = 9)
    (x : R × ZMod 133) : (9 : ℕ) • x = 0 ↔ x.2 = 0 := by
  have hr : (9 : ℕ) • x.1 = 0 := by
    simpa only [hR] using card_nsmul_eq_zero' (x := x.1)
  constructor
  · intro h
    have hz := congrArg Prod.snd h
    change (9 : ℕ) • x.2 = 0 at hz
    have hscale := congrArg (fun z : ZMod 133 => (74 : ℕ) • z) hz
    have hinv : (74 : ZMod 133) * 9 = 1 := by decide
    simp only [nsmul_eq_mul, mul_zero] at hscale
    change (74 : ZMod 133) * ((9 : ZMod 133) * x.2) = 0 at hscale
    rw [← mul_assoc, hinv, one_mul] at hscale
    exact hscale
  · intro hz
    exact Prod.ext hr (by change (9 : ℕ) • x.2 = 0; rw [hz, nsmul_zero])

theorem automorphism_preserves_zero_fiber133 (hR : Nat.card R = 9)
    (e : AddAut (R × ZMod 133)) (x : R × ZMod 133) :
    (e x).2 = 0 ↔ x.2 = 0 := by
  rw [← nine_nsmul_eq_zero_iff_snd_eq_zero hR (e x),
    ← nine_nsmul_eq_zero_iff_snd_eq_zero hR x, ← map_nsmul]
  constructor
  · intro h
    exact e.injective (h.trans (map_zero e).symm)
  · intro h
    rw [h, map_zero]

theorem nsmul133_eq_zero_iff_fst_eq_zero (hR : Nat.card R = 9)
    (x : R × ZMod 133) : (133 : ℕ) • x = 0 ↔ x.1 = 0 := by
  have hr : (9 : ℕ) • x.1 = 0 := by
    simpa only [hR] using card_nsmul_eq_zero' (x := x.1)
  have hz : (133 : ℕ) • x.2 = 0 := by
    rw [nsmul_eq_mul, ZMod.natCast_self, zero_mul]
  constructor
  · intro h
    have hf := congrArg Prod.fst h
    change (133 : ℕ) • x.1 = 0 at hf
    calc
      x.1 = (4 : ℕ) • ((133 : ℕ) • x.1) := by
        calc
          x.1 = (59 : ℕ) • ((9 : ℕ) • x.1) + x.1 := by rw [hr, nsmul_zero, zero_add]
          _ = (4 : ℕ) • ((133 : ℕ) • x.1) := by abel
      _ = 0 := by rw [hf, nsmul_zero]
  · intro hf
    exact Prod.ext (by change (133 : ℕ) • x.1 = 0; rw [hf, nsmul_zero]) hz

/-- Every additive automorphism preserves the cyclic factor. -/
theorem automorphism_preserves_cyclic_factor133 (hR : Nat.card R = 9)
    (e : AddAut (R × ZMod 133)) (x : R × ZMod 133) :
    (e x).1 = 0 ↔ x.1 = 0 := by
  rw [← nsmul133_eq_zero_iff_fst_eq_zero hR (e x),
    ← nsmul133_eq_zero_iff_fst_eq_zero hR x, ← map_nsmul]
  constructor
  · intro h
    exact e.injective (h.trans (map_zero e).symm)
  · intro h
    rw [h, map_zero]

theorem automorphism_zero_fiber_pair133 (hR : Nat.card R = 9)
    (e : AddAut (R × ZMod 133)) (q : R) :
    e (q, 0) = ((e (q, 0)).1, 0) :=
  Prod.ext rfl ((automorphism_preserves_zero_fiber133 hR e (q, 0)).mpr rfl)

theorem automorphism_cyclic_factor_pair133 (hR : Nat.card R = 9)
    (e : AddAut (R × ZMod 133)) (z : ZMod 133) :
    e (0, z) = (0, (e (0, z)).2) :=
  Prod.ext ((automorphism_preserves_cyclic_factor133 hR e (0, z)).mpr rfl) rfl

def nineRestrictionMap133 (e : AddAut (R × ZMod 133)) : R →+ R :=
  (AddMonoidHom.fst R (ZMod 133)).comp
    (e.toAddMonoidHom.comp (AddMonoidHom.inl R (ZMod 133)))

def cyclicRestrictionMap133 (e : AddAut (R × ZMod 133)) : ZMod 133 →+ ZMod 133 :=
  (AddMonoidHom.snd R (ZMod 133)).comp
    (e.toAddMonoidHom.comp (AddMonoidHom.inr R (ZMod 133)))

theorem nineRestrictionMap133_bijective (hR : Nat.card R = 9)
    (e : AddAut (R × ZMod 133)) : Function.Bijective (nineRestrictionMap133 e) := by
  constructor
  · intro q r h
    have heq : e (q, 0) = e (r, 0) := by
      rw [automorphism_zero_fiber_pair133 hR e q,
        automorphism_zero_fiber_pair133 hR e r]
      exact Prod.ext h rfl
    exact congrArg Prod.fst (e.injective heq)
  · intro q
    refine ⟨(e.symm (q, 0)).1, ?_⟩
    change (e ((e.symm (q, 0)).1, 0)).1 = q
    rw [← automorphism_zero_fiber_pair133 hR e.symm q]
    simp

theorem cyclicRestrictionMap133_bijective (hR : Nat.card R = 9)
    (e : AddAut (R × ZMod 133)) : Function.Bijective (cyclicRestrictionMap133 e) := by
  constructor
  · intro z w h
    have heq : e (0, z) = e (0, w) := by
      rw [automorphism_cyclic_factor_pair133 hR e z,
        automorphism_cyclic_factor_pair133 hR e w]
      exact Prod.ext rfl h
    exact congrArg Prod.snd (e.injective heq)
  · intro z
    refine ⟨(e.symm (0, z)).2, ?_⟩
    change (e (0, (e.symm (0, z)).2)).2 = z
    rw [← automorphism_cyclic_factor_pair133 hR e.symm z]
    simp

def nineFactorAut133 (hR : Nat.card R = 9)
    (e : AddAut (R × ZMod 133)) : AddAut R :=
  AddEquiv.ofBijective (nineRestrictionMap133 e)
    (nineRestrictionMap133_bijective hR e)

def cyclicFactorAut133 (hR : Nat.card R = 9)
    (e : AddAut (R × ZMod 133)) : AddAut (ZMod 133) :=
  AddEquiv.ofBijective (cyclicRestrictionMap133 e)
    (cyclicRestrictionMap133_bijective hR e)

@[simp] theorem nineFactorAut133_apply (hR : Nat.card R = 9)
    (e : AddAut (R × ZMod 133)) (q : R) :
    nineFactorAut133 hR e q = (e (q, 0)).1 := rfl

@[simp] theorem cyclicFactorAut133_apply (hR : Nat.card R = 9)
    (e : AddAut (R × ZMod 133)) (z : ZMod 133) :
    cyclicFactorAut133 hR e z = (e (0, z)).2 := rfl

/-- Restriction to the characteristic factor of order nine. -/
def nineProjection133 (hR : Nat.card R = 9) :
    Multiplicative (AddAut (R × ZMod 133)) →* Multiplicative (AddAut R) where
  toFun e := Multiplicative.ofAdd (nineFactorAut133 hR e.toAdd)
  map_one' := by
    change nineFactorAut133 hR (0 : AddAut (R × ZMod 133)) = 0
    ext q
    rfl
  map_mul' e f := by
    change nineFactorAut133 hR (e.toAdd + f.toAdd) =
      nineFactorAut133 hR e.toAdd + nineFactorAut133 hR f.toAdd
    ext q
    change (e.toAdd (f.toAdd (q, 0))).1 =
      (e.toAdd ((f.toAdd (q, 0)).1, 0)).1
    rw [automorphism_zero_fiber_pair133 hR f.toAdd q]

/-- Restriction to the characteristic cyclic factor of order 133. -/
def cyclicProjection133 (hR : Nat.card R = 9) :
    Multiplicative (AddAut (R × ZMod 133)) →*
      Multiplicative (AddAut (ZMod 133)) where
  toFun e := Multiplicative.ofAdd (cyclicFactorAut133 hR e.toAdd)
  map_one' := by
    change cyclicFactorAut133 hR (0 : AddAut (R × ZMod 133)) = 0
    ext z
    rfl
  map_mul' e f := by
    change cyclicFactorAut133 hR (e.toAdd + f.toAdd) =
      cyclicFactorAut133 hR e.toAdd + cyclicFactorAut133 hR f.toAdd
    ext z
    change (e.toAdd (f.toAdd (0, z))).2 =
      (e.toAdd (0, (f.toAdd (0, z)).2)).2
    rw [automorphism_cyclic_factor_pair133 hR f.toAdd z]

/-- The actual multiplier induced by an additive automorphism. -/
def multiplierProjection133 (hR : Nat.card R = 9) :
    Multiplicative (AddAut (R × ZMod 133)) →* (ZMod 133)ˣ :=
  (AddEquiv.toMultiplicativeLeft (ZMod.AddAutEquivUnits 133)).toMonoidHom.comp
    (cyclicProjection133 hR)

@[simp] theorem multiplierProjection133_val (hR : Nat.card R = 9)
    (e : Multiplicative (AddAut (R × ZMod 133))) :
    (multiplierProjection133 hR e : ZMod 133) = (e.toAdd (0, 1)).2 := rfl

theorem multiplierProjection133_apply (hR : Nat.card R = 9)
    (e : Multiplicative (AddAut (R × ZMod 133))) (z : ZMod 133) :
    (e.toAdd (0, z)).2 = (multiplierProjection133 hR e : ZMod 133) * z := by
  have h := (ZMod.AddAutEquivUnits 133).symm_apply_apply (cyclicFactorAut133 hR e.toAdd)
  have hz := congrArg (fun f : AddAut (ZMod 133) => f z) h
  change (multiplierProjection133 hR e : ZMod 133) * z = (e.toAdd (0, z)).2 at hz
  exact hz.symm

/-- Product decomposition of actual evaluation, derived from the torsion subgroups. -/
theorem automorphism_product_apply133 (hR : Nat.card R = 9)
    (e : Multiplicative (AddAut (R × ZMod 133))) (q : R) (z : ZMod 133) :
    e.toAdd (q, z) = ((nineProjection133 hR e).toAdd q,
      (multiplierProjection133 hR e : ZMod 133) * z) := by
  have hsplit : (q, z) = (q, (0 : ZMod 133)) + (0, z) := by simp
  rw [hsplit, map_add, automorphism_zero_fiber_pair133 hR e.toAdd q,
    automorphism_cyclic_factor_pair133 hR e.toAdd z]
  change ((e.toAdd (q, 0)).1 + 0, 0 + (e.toAdd (0, z)).2) = _
  exact Prod.ext (add_zero _) ((zero_add _).trans (multiplierProjection133_apply hR e z))

/-- The two genuine factor projections together determine an automorphism. -/
theorem projections133_jointly_injective (hR : Nat.card R = 9)
    (e f : Multiplicative (AddAut (R × ZMod 133)))
    (hq : nineProjection133 hR e = nineProjection133 hR f)
    (hz : multiplierProjection133 hR e = multiplierProjection133 hR f) : e = f := by
  change e.toAdd = f.toAdd
  apply DFunLike.ext
  rintro ⟨q, z⟩
  rw [automorphism_product_apply133 hR e q z,
    automorphism_product_apply133 hR f q z, hq, hz]

theorem units133_card : Nat.card (ZMod 133)ˣ = 108 := by
  rw [Nat.card_eq_fintype_card, ZMod.card_units_eq_totient]
  decide

theorem card_dvd_twenty_seven_of_injective_projection {U : Type*} [Group U]
    (φ : U →* (ZMod 133)ˣ) (hφ : Function.Injective φ)
    (hodd : Odd (Nat.card U)) : Nat.card U ∣ 27 := by
  let : Finite U := Finite.of_injective φ hφ
  have hdiv : Nat.card U ∣ 108 := by
    simpa only [units133_card] using Subgroup.card_dvd_of_injective φ hφ
  have hnot : ¬2 ∣ Nat.card U := by
    rintro ⟨m, hm⟩
    obtain ⟨k, hk⟩ := hodd
    omega
  have hcop : Nat.Coprime (Nat.card U) 4 :=
    ((Nat.prime_two.coprime_iff_not_dvd.mpr hnot).symm).pow_right 2
  exact hcop.dvd_mul_right.mp (show Nat.card U ∣ 27 * 4 from hdiv)

theorem divisor_twenty_seven_le_nine_or_eq (n : ℕ) (h : n ∣ 27) :
    n ≤ 9 ∨ n = 27 := by
  have hn : n ∈ Nat.divisors 27 := Nat.mem_divisors.mpr ⟨h, by decide⟩
  have hdivs : Nat.divisors 27 = ({1, 3, 9, 27} : Finset ℕ) := by decide
  rw [hdivs] at hn
  simp only [Finset.mem_insert, Finset.mem_singleton] at hn
  rcases hn with rfl | rfl | rfl | rfl <;> norm_num

end HadamardLegendre
