import Conjectures.HadamardBorderSymmetryOrbits
import Mathlib.Algebra.Group.Equiv.TypeTags
import Mathlib.Data.Nat.Totient
import Mathlib.Data.ZMod.Aut
import Mathlib.RingTheory.IntegralDomain

/-!
# The two factors of the actual border-domain automorphism group

Four-torsion and 149-torsion characterize the two factors of `Q × ZMod 149`
when `Q` has order four. Restriction therefore gives genuine homomorphisms
on automorphism groups. The cyclic-factor restriction is identified with a
unit multiplier through `ZMod.AddAutEquivUnits`.
-/

noncomputable section

namespace HadamardBorderSymmetry

variable {Q : Type*} [AddGroup Q]

local instance symmetryProjection149Prime : Fact (Nat.Prime 149) := ⟨by norm_num⟩

/-- The other direct factor is the characteristic 149-torsion subgroup. -/
theorem nsmul149_eq_zero_iff_fst_eq_zero (hQ : Nat.card Q = 4)
    (x : Q × ZMod 149) : (149 : ℕ) • x = 0 ↔ x.1 = 0 := by
  have hfour : (4 : ℕ) • x.1 = 0 := by
    simpa only [hQ] using (card_nsmul_eq_zero' (x := x.1))
  have hfirst : (149 : ℕ) • x.1 = x.1 := by
    calc
      (149 : ℕ) • x.1 = (4 * 37 + 1 : ℕ) • x.1 := rfl
      _ = (37 : ℕ) • ((4 : ℕ) • x.1) + x.1 := by
        rw [add_nsmul, mul_nsmul, one_nsmul]
      _ = x.1 := by rw [hfour, nsmul_zero, zero_add]
  have hsecond : (149 : ℕ) • x.2 = 0 := by
    rw [nsmul_eq_mul, ZMod.natCast_self, zero_mul]
  constructor
  · intro h
    have hf := congrArg Prod.fst h
    change (149 : ℕ) • x.1 = 0 at hf
    rwa [hfirst] at hf
  · intro h
    exact Prod.ext (hfirst.trans h) hsecond

/-- Every additive automorphism preserves the cyclic factor. -/
theorem automorphism_preserves_cyclic_factor149 (hQ : Nat.card Q = 4)
    (e : AddAut (Q × ZMod 149)) (x : Q × ZMod 149) :
    (e x).1 = 0 ↔ x.1 = 0 := by
  rw [← nsmul149_eq_zero_iff_fst_eq_zero hQ (e x),
    ← nsmul149_eq_zero_iff_fst_eq_zero hQ x, ← map_nsmul]
  constructor
  · intro h
    exact e.injective (h.trans (map_zero e).symm)
  · intro h
    rw [h, map_zero]

theorem automorphism_zero_fiber_pair149 (hQ : Nat.card Q = 4)
    (e : AddAut (Q × ZMod 149)) (q : Q) :
    e (q, 0) = ((e (q, 0)).1, 0) :=
  Prod.ext rfl ((automorphism_preserves_zero_fiber hQ e (q, 0)).mpr rfl)

theorem automorphism_cyclic_factor_pair149 (hQ : Nat.card Q = 4)
    (e : AddAut (Q × ZMod 149)) (z : ZMod 149) :
    e (0, z) = (0, (e (0, z)).2) :=
  Prod.ext ((automorphism_preserves_cyclic_factor149 hQ e (0, z)).mpr rfl) rfl

def quotientRestrictionMap149 (e : AddAut (Q × ZMod 149)) : Q →+ Q :=
  (AddMonoidHom.fst Q (ZMod 149)).comp
    (e.toAddMonoidHom.comp (AddMonoidHom.inl Q (ZMod 149)))

def cyclicRestrictionMap149 (e : AddAut (Q × ZMod 149)) : ZMod 149 →+ ZMod 149 :=
  (AddMonoidHom.snd Q (ZMod 149)).comp
    (e.toAddMonoidHom.comp (AddMonoidHom.inr Q (ZMod 149)))

theorem quotientRestrictionMap149_bijective (hQ : Nat.card Q = 4)
    (e : AddAut (Q × ZMod 149)) : Function.Bijective (quotientRestrictionMap149 e) := by
  constructor
  · intro q r h
    have heq : e (q, 0) = e (r, 0) := by
      rw [automorphism_zero_fiber_pair149 hQ e q,
        automorphism_zero_fiber_pair149 hQ e r]
      exact Prod.ext h rfl
    exact congrArg Prod.fst (e.injective heq)
  · intro q
    refine ⟨(e.symm (q, 0)).1, ?_⟩
    change (e ((e.symm (q, 0)).1, 0)).1 = q
    rw [← automorphism_zero_fiber_pair149 hQ e.symm q]
    simp

theorem cyclicRestrictionMap149_bijective (hQ : Nat.card Q = 4)
    (e : AddAut (Q × ZMod 149)) : Function.Bijective (cyclicRestrictionMap149 e) := by
  constructor
  · intro z w h
    have heq : e (0, z) = e (0, w) := by
      rw [automorphism_cyclic_factor_pair149 hQ e z,
        automorphism_cyclic_factor_pair149 hQ e w]
      exact Prod.ext rfl h
    exact congrArg Prod.snd (e.injective heq)
  · intro z
    refine ⟨(e.symm (0, z)).2, ?_⟩
    change (e (0, (e.symm (0, z)).2)).2 = z
    rw [← automorphism_cyclic_factor_pair149 hQ e.symm z]
    simp

def quotientFactorAut149 (hQ : Nat.card Q = 4)
    (e : AddAut (Q × ZMod 149)) : AddAut Q :=
  AddEquiv.ofBijective (quotientRestrictionMap149 e)
    (quotientRestrictionMap149_bijective hQ e)

def cyclicFactorAut149 (hQ : Nat.card Q = 4)
    (e : AddAut (Q × ZMod 149)) : AddAut (ZMod 149) :=
  AddEquiv.ofBijective (cyclicRestrictionMap149 e)
    (cyclicRestrictionMap149_bijective hQ e)

@[simp] theorem quotientFactorAut149_apply (hQ : Nat.card Q = 4)
    (e : AddAut (Q × ZMod 149)) (q : Q) :
    quotientFactorAut149 hQ e q = (e (q, 0)).1 := rfl

@[simp] theorem cyclicFactorAut149_apply (hQ : Nat.card Q = 4)
    (e : AddAut (Q × ZMod 149)) (z : ZMod 149) :
    cyclicFactorAut149 hQ e z = (e (0, z)).2 := rfl

/-- Restriction to the characteristic factor of order four. -/
def quotientProjection149 (hQ : Nat.card Q = 4) :
    Multiplicative (AddAut (Q × ZMod 149)) →* Multiplicative (AddAut Q) where
  toFun e := Multiplicative.ofAdd (quotientFactorAut149 hQ e.toAdd)
  map_one' := by
    change quotientFactorAut149 hQ (0 : AddAut (Q × ZMod 149)) = 0
    ext q
    rfl
  map_mul' e f := by
    change quotientFactorAut149 hQ (e.toAdd + f.toAdd) =
      quotientFactorAut149 hQ e.toAdd + quotientFactorAut149 hQ f.toAdd
    ext q
    change (e.toAdd (f.toAdd (q, 0))).1 =
      (e.toAdd ((f.toAdd (q, 0)).1, 0)).1
    rw [automorphism_zero_fiber_pair149 hQ f.toAdd q]

/-- Restriction to the characteristic cyclic factor of order 149. -/
def cyclicProjection149 (hQ : Nat.card Q = 4) :
    Multiplicative (AddAut (Q × ZMod 149)) →*
      Multiplicative (AddAut (ZMod 149)) where
  toFun e := Multiplicative.ofAdd (cyclicFactorAut149 hQ e.toAdd)
  map_one' := by
    change cyclicFactorAut149 hQ (0 : AddAut (Q × ZMod 149)) = 0
    ext z
    rfl
  map_mul' e f := by
    change cyclicFactorAut149 hQ (e.toAdd + f.toAdd) =
      cyclicFactorAut149 hQ e.toAdd + cyclicFactorAut149 hQ f.toAdd
    ext z
    change (e.toAdd (f.toAdd (0, z))).2 =
      (e.toAdd (0, (f.toAdd (0, z)).2)).2
    rw [automorphism_cyclic_factor_pair149 hQ f.toAdd z]

/-- The actual multiplier induced by an additive automorphism. -/
def multiplierProjection149 (hQ : Nat.card Q = 4) :
    Multiplicative (AddAut (Q × ZMod 149)) →* (ZMod 149)ˣ :=
  (AddEquiv.toMultiplicativeLeft (ZMod.AddAutEquivUnits 149)).toMonoidHom.comp
    (cyclicProjection149 hQ)

@[simp] theorem multiplierProjection149_val (hQ : Nat.card Q = 4)
    (e : Multiplicative (AddAut (Q × ZMod 149))) :
    (multiplierProjection149 hQ e : ZMod 149) = (e.toAdd (0, 1)).2 := rfl

theorem multiplierProjection149_apply (hQ : Nat.card Q = 4)
    (e : Multiplicative (AddAut (Q × ZMod 149))) (z : ZMod 149) :
    (e.toAdd (0, z)).2 = (multiplierProjection149 hQ e : ZMod 149) * z := by
  have h := (ZMod.AddAutEquivUnits 149).symm_apply_apply (cyclicFactorAut149 hQ e.toAdd)
  have hz := congrArg (fun f : AddAut (ZMod 149) => f z) h
  change (multiplierProjection149 hQ e : ZMod 149) * z = (e.toAdd (0, z)).2 at hz
  exact hz.symm

/-- Product decomposition of actual evaluation, derived from the torsion subgroups. -/
theorem automorphism_product_apply149 (hQ : Nat.card Q = 4)
    (e : Multiplicative (AddAut (Q × ZMod 149))) (q : Q) (z : ZMod 149) :
    e.toAdd (q, z) = ((quotientProjection149 hQ e).toAdd q,
      (multiplierProjection149 hQ e : ZMod 149) * z) := by
  have hsplit : (q, z) = (q, (0 : ZMod 149)) + (0, z) := by simp
  rw [hsplit, map_add, automorphism_zero_fiber_pair149 hQ e.toAdd q,
    automorphism_cyclic_factor_pair149 hQ e.toAdd z]
  change ((e.toAdd (q, 0)).1 + 0, 0 + (e.toAdd (0, z)).2) = _
  exact Prod.ext (add_zero _) ((zero_add _).trans (multiplierProjection149_apply hQ e z))

/-- The two genuine factor projections together determine an automorphism. -/
theorem projections149_jointly_injective (hQ : Nat.card Q = 4)
    (e f : Multiplicative (AddAut (Q × ZMod 149)))
    (hq : quotientProjection149 hQ e = quotientProjection149 hQ f)
    (hz : multiplierProjection149 hQ e = multiplierProjection149 hQ f) : e = f := by
  change e.toAdd = f.toAdd
  apply DFunLike.ext
  rintro ⟨q, z⟩
  rw [automorphism_product_apply149 hQ e q z,
    automorphism_product_apply149 hQ f q z, hq, hz]

/-- A prime-order 37 automorphism acts trivially on the quotient factor. -/
theorem order37_quotientProjection149_eq_one [Finite Q] (hQ : Nat.card Q = 4)
    (e : Multiplicative (AddAut (Q × ZMod 149))) (he : orderOf e = 37) :
    quotientProjection149 hQ e = 1 := by
  classical
  let : Fintype Q := Fintype.ofFinite Q
  let π : Multiplicative (AddAut Q) →* Equiv.Perm Q :=
    AddMonoidHom.toMultiplicativeLeft (AddAut.toPerm Q)
  have hepow : e ^ 37 = 1 := by simpa only [he] using pow_orderOf_eq_one e
  have hpow : (π (quotientProjection149 hQ e)) ^ 37 = 1 := by
    rw [← map_pow, ← map_pow, hepow, map_one, map_one]
  have hcard : Fintype.card Q < 37 := by
    simpa only [← Nat.card_eq_fintype_card, hQ] using (by decide : 4 < 37)
  have hπ := permutation_eq_one_of_prime_pow_eq_one_of_card_lt
    (π (quotientProjection149 hQ e)) (by norm_num : Nat.Prime 37) hpow hcard
  change (quotientProjection149 hQ e).toAdd = 0
  apply DFunLike.ext
  intro q
  exact congrArg (fun σ : Equiv.Perm Q => σ q) hπ

/-- The induced multiplier retains the full order 37. -/
theorem order37_multiplierProjection149 [Finite Q] (hQ : Nat.card Q = 4)
    (e : Multiplicative (AddAut (Q × ZMod 149))) (he : orderOf e = 37) :
    orderOf (multiplierProjection149 hQ e) = 37 := by
  have hepow : e ^ 37 = 1 := by simpa only [he] using pow_orderOf_eq_one e
  have hpow : (multiplierProjection149 hQ e) ^ 37 = 1 := by
    rw [← map_pow, hepow, map_one]
  have hdvd := orderOf_dvd_of_pow_eq_one hpow
  refine ((show Nat.Prime 37 by norm_num).eq_one_or_self_of_dvd _ hdvd).resolve_left ?_
  intro h
  have hmult := orderOf_eq_one_iff.mp h
  have hquot := order37_quotientProjection149_eq_one hQ e he
  have heone : e = 1 := projections149_jointly_injective hQ e 1
    (by simpa using hquot) (by simpa using hmult)
  rw [heone, orderOf_one] at he
  norm_num at he

theorem order37_automorphism_apply149 [Finite Q] (hQ : Nat.card Q = 4)
    (e : Multiplicative (AddAut (Q × ZMod 149))) (he : orderOf e = 37)
    (q : Q) (z : ZMod 149) :
    e.toAdd (q, z) = (q, (multiplierProjection149 hQ e : ZMod 149) * z) := by
  simpa only [order37_quotientProjection149_eq_one hQ e he,
    toAdd_one, AddAut.zero_apply] using
    automorphism_product_apply149 hQ e q z

theorem units149_card : Nat.card (ZMod 149)ˣ = 148 := by
  rw [Nat.card_eq_fintype_card, ZMod.card_units_eq_totient,
    Nat.totient_prime (by norm_num : Nat.Prime 149)]

theorem units149_isCyclic : IsCyclic (ZMod 149)ˣ := inferInstance

end HadamardBorderSymmetry
