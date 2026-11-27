import Conjectures.AsgarliGhiocaYipExceptionalFibers
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.RingTheory.Polynomial.GaussLemma
import Mathlib.RingTheory.Polynomial.RationalRoot

/-! # Right translation on geometric components

A root of a monic irreducible factor determines divisibility over the generic
field. Clearing the interpolation denominator turns that divisibility into
an implication at every regular specialization. This gives the component
action without choosing any Galois extension that specializes at a fiber.
-/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial
open scoped Classical

universe u

variable {E : Type u} [Field E]

/-- A factorization into distinct monic irreducible factors. -/
structure GeometricFactors (P : PlanePolynomial E) where
  set : Finset (PlanePolynomial E)
  prod_eq : ∏ F ∈ set, F = P
  monic : ∀ F ∈ set, F.Monic
  irred : ∀ F ∈ set, Irreducible F

namespace GeometricFactors

variable {P : PlanePolynomial E}

abbrev Component (M : GeometricFactors P) := ↥M.set

theorem exists_of_separable_map (hP : P.Monic) {S : Type*} [Field S] (f : E[X] →+* S)
    (hs : (P.map f).Separable) : Nonempty (GeometricFactors P) := by
  classical
  obtain ⟨s, hprod, hfac⟩ := exists_monic_irred_factorization hP
  have hn : s.Nodup := by
    rw [Multiset.nodup_iff_count_le_one]
    intro F
    by_contra! hF
    have hmem : F ∈ s := Multiset.count_pos.mp (by omega)
    have hdvd : F * F ∣ P := by
      have hrep : Multiset.replicate 2 F ≤ s := Multiset.le_count_iff_replicate_le.mp (by omega)
      simpa only [Multiset.prod_replicate, pow_two, hprod] using Multiset.prod_dvd_prod_of_le hrep
    have hm := (hfac F hmem).1
    have hdeg := hm.natDegree_pos_of_not_isUnit (hfac F hmem).2.not_isUnit
    have hu : IsUnit (F.map f) := hs.squarefree (F.map f) (by
      simpa only [coe_mapRingHom, Polynomial.map_mul] using (map_dvd (mapRingHom f) hdvd))
    rw [← hm.natDegree_map f, (hm.map f).isUnit_iff.mp hu, natDegree_one] at hdeg
    exact (Nat.lt_irrefl 0) hdeg
  refine ⟨⟨s.toFinset, ?_, ?_, ?_⟩⟩
  · rw [prod_eq_multiset_prod, Multiset.toFinset_val, Multiset.dedup_eq_self.mpr hn]
    change (s.map id).prod = P
    rw [Multiset.map_id, hprod]
  · exact fun F hF ↦ (hfac F (Multiset.mem_toFinset.mp hF)).1
  · exact fun F hF ↦ (hfac F (Multiset.mem_toFinset.mp hF)).2

variable (M : GeometricFactors P)

theorem dvd (F : M.Component) : F.val ∣ P :=
  (Finset.dvd_prod_of_mem (fun a ↦ a) F.property).trans (dvd_of_eq M.prod_eq)

theorem mem_of_monic_irred_dvd {F : PlanePolynomial E} (hm : F.Monic)
    (hi : Irreducible F) (hd : F ∣ P) : F ∈ M.set := by
  have hd' : F ∣ ∏ G ∈ M.set, G := M.prod_eq.symm ▸ hd
  obtain ⟨G, hG, hg⟩ := (hi.prime.dvd_finsetProd_iff (fun a ↦ a)).mp hd'
  have he : F = G := eq_of_monic_of_associated hm (M.monic G hG)
    (associated_of_dvd_dvd hg (hi.dvd_symm (M.irred G hG) hg))
  exact he.symm ▸ hG

theorem existsUnique_root_component {S : Type*} [Field S] (f : E[X] →+* S)
    (hs : (P.map f).Separable) {x : S} (hx : (P.map f).eval x = 0) :
    ∃! F : M.Component, (F.val.map f).eval x = 0 := by
  classical
  rw [← M.prod_eq, Polynomial.map_prod, eval_prod, prod_eq_zero_iff] at hx
  obtain ⟨F, hF, hxF⟩ := hx
  refine ⟨⟨F, hF⟩, hxF, ?_⟩
  intro G hxG
  by_contra hGF
  have hne : F ≠ G.val := fun he ↦ hGF (Subtype.ext he.symm)
  have hdiv : F * G.val ∣ P := by
    calc
      _ = ∏ H ∈ ({F, G.val} : Finset _), H := (Finset.prod_pair hne).symm
      _ ∣ ∏ H ∈ M.set, H := Finset.prod_dvd_prod_of_subset _ _ _ (by
        intro H hH
        simp only [mem_insert, mem_singleton] at hH
        rcases hH with rfl | rfl
        · exact hF
        · exact G.property)
      _ = _ := M.prod_eq
  have hs' : ((F.map f) * (G.val.map f)).Separable := hs.of_dvd (by
    simpa only [coe_mapRingHom, Polynomial.map_mul] using map_dvd (mapRingHom f) hdiv)
  obtain ⟨a, b, hab⟩ := hs'.isCoprime
  have he := congrArg (evalRingHom x) hab
  simp only [map_add, map_mul, coe_evalRingHom, hxF, hxG, mul_zero, add_zero, eval_one] at he
  exact zero_ne_one he

end GeometricFactors

/-- Clear the denominator of a polynomial after substituting `Z = R/B`. -/
private noncomputable def clearedSubst (F R B : PlanePolynomial E) : PlanePolynomial E :=
  ∑ j ∈ range (F.natDegree + 1), C (F.coeff j) * R^j * B^(F.natDegree - j)

private theorem eval_clearedSubst {S : Type*} [Field S] (f : E[X] →+* S)
    (F R B : PlanePolynomial E) (x y : S) (h : (R.map f).eval x = (B.map f).eval x * y) :
    ((clearedSubst F R B).map f).eval x = (B.map f).eval x ^ F.natDegree * (F.map f).eval y := by
  rw [clearedSubst, Polynomial.map_sum, eval_finsetSum,
    eval_eq_sum_range' (Nat.lt_succ_of_le (natDegree_map_le (p := F))), mul_sum]
  apply sum_congr rfl
  intro j hj
  simp only [Polynomial.map_mul, Polynomial.map_C, Polynomial.map_pow, eval_mul, eval_C,
    eval_pow, coeff_map, h]
  have hj' : j + (F.natDegree - j) = F.natDegree := Nat.add_sub_of_le (Nat.le_of_lt_succ (mem_range.mp hj))
  rw [mul_pow]
  calc
    _ = (F.coeff j |> f) * y^j * ((B.map f).eval x ^ j * (B.map f).eval x ^ (F.natDegree - j)) := by ring
    _ = _ := by rw [← pow_add, hj']; ring

private theorem dvd_of_generic_root {L : Type*} [Field L] [Algebra (FractionRing E[X]) L]
    {F Q : PlanePolynomial E} (hF : F.Monic) (hi : Irreducible F) {x : L}
    (hF0 : (F.map ((algebraMap (FractionRing E[X]) L).comp (algebraMap E[X] (FractionRing E[X])))).eval x = 0)
    (hQ0 : (Q.map ((algebraMap (FractionRing E[X]) L).comp (algebraMap E[X] (FractionRing E[X])))).eval x = 0) :
    F ∣ Q := by
  let η := algebraMap E[X] (FractionRing E[X])
  have hi' : Irreducible (F.map η) := (hF.irreducible_iff_irreducible_map_fraction_map).mp hi
  have hmin : F.map η = minpoly (FractionRing E[X]) x := minpoly.eq_of_irreducible_of_monic hi'
    (by simpa only [← Polynomial.map_map, eval_map_algebraMap] using hF0) (hF.map η)
  apply (hF.isPrimitive.dvd_iff_fraction_map_dvd_fraction_map (FractionRing E[X])).mpr
  change F.map η ∣ Q.map η
  rw [hmin]
  apply minpoly.dvd
  simpa only [← Polynomial.map_map, eval_map_algebraMap] using hQ0

/-- The permutation action on the components, together with the identity
that transports any specialized root along the interpolated twist. -/
structure ComponentTranslations {P : PlanePolynomial E} (M : GeometricFactors P)
    (G : Type*) [Group G] (R : G → PlanePolynomial E) (B : PlanePolynomial E) where
  act : M.Component → G → M.Component
  one : ∀ F, act F 1 = F
  mul : ∀ F g h, act F (g * h) = act (act F g) h
  transitive : ∀ F H, ∃ g, act F g = H
  transport : ∀ {S : Type u} [Field S] (f : E[X] →+* S) (F : M.Component) (g : G) (x y : S),
    (F.val.map f).eval x = 0 → (B.map f).eval x ≠ 0 →
    ((R g).map f).eval x = (B.map f).eval x * y → ((act F g).val.map f).eval y = 0

theorem componentTranslations_of_generic {P : PlanePolynomial E} (M : GeometricFactors P)
    {G : Type*} [Group G] [Fintype G] (R : G → PlanePolynomial E) (B : PlanePolynomial E)
    {L : Type u} [Field L] [IsAlgClosed L] [Algebra (FractionRing E[X]) L]
    (x : G → L)
    (hsplit : P.map ((algebraMap (FractionRing E[X]) L).comp (algebraMap E[X] (FractionRing E[X]))) =
      ∏ g : G, (X - C (x g)))
    (hsep : (P.map ((algebraMap (FractionRing E[X]) L).comp (algebraMap E[X] (FractionRing E[X])))).Separable)
    (hB : ∀ g, (B.map ((algebraMap (FractionRing E[X]) L).comp
      (algebraMap E[X] (FractionRing E[X])))).eval (x g) ≠ 0)
    (hR : ∀ g h, ((R h).map ((algebraMap (FractionRing E[X]) L).comp
      (algebraMap E[X] (FractionRing E[X])))).eval (x g) =
      (B.map ((algebraMap (FractionRing E[X]) L).comp
        (algebraMap E[X] (FractionRing E[X])))).eval (x g) * x (g * h)) :
    Nonempty (ComponentTranslations M G R B) := by
  classical
  let f := (algebraMap (FractionRing E[X]) L).comp (algebraMap E[X] (FractionRing E[X]))
  have hx (g : G) : (P.map f).eval (x g) = 0 := by
    rw [hsplit, eval_prod]
    exact prod_eq_zero (mem_univ g) (by simp)
  choose own hown huniq using fun g ↦ M.existsUnique_root_component f hsep (hx g)
  have hsurj : Function.Surjective own := by
    intro F
    have hm := M.monic F.val F.property
    have hp : 0 < (F.val.map f).natDegree := by
      rw [hm.natDegree_map]
      exact hm.natDegree_pos_of_not_isUnit (M.irred F.val F.property).not_isUnit
    obtain ⟨y, hy⟩ := IsAlgClosed.exists_root (F.val.map f) (by
      rw [degree_eq_natDegree (hm.map f).ne_zero]; exact_mod_cast hp.ne')
    have hyP : (P.map f).eval y = 0 := by
      obtain ⟨Q, hQ⟩ := M.dvd F
      rw [hQ, Polynomial.map_mul, eval_mul, hy.eq_zero, zero_mul]
    rw [hsplit, eval_prod, prod_eq_zero_iff] at hyP
    obtain ⟨g, _, hg⟩ := hyP
    have hyx : y = x g := sub_eq_zero.mp (by simpa using hg)
    exact ⟨g, (huniq g F (by simpa only [← hyx] using hy.eq_zero)).symm⟩
  choose repr hrepr using hsurj
  let act (F : M.Component) (g : G) := own (repr F * g)
  have hdiv (F : M.Component) (g : G) : F.val ∣ clearedSubst (act F g).val (R g) B := by
    have hroot : (F.val.map f).eval (x (repr F)) = 0 := by
      have h := hown (repr F)
      change ((own (repr F)).val.map f).eval (x (repr F)) = 0 at h
      rwa [hrepr F] at h
    have hzero : ((clearedSubst (act F g).val (R g) B).map f).eval (x (repr F)) = 0 := by
      rw [eval_clearedSubst f (act F g).val (R g) B (x (repr F)) _ (hR (repr F) g),
        hown (repr F * g), mul_zero]
    exact dvd_of_generic_root (M.monic F.val F.property) (M.irred F.val F.property) hroot hzero
  have htransport {S : Type u} [Field S] (ψ : E[X] →+* S) (F : M.Component) (g : G) (u v : S)
      (hu : (F.val.map ψ).eval u = 0) (hb : (B.map ψ).eval u ≠ 0)
      (hr : ((R g).map ψ).eval u = (B.map ψ).eval u * v) : ((act F g).val.map ψ).eval v = 0 := by
    obtain ⟨Q, hQ⟩ := hdiv F g
    have hz : ((clearedSubst (act F g).val (R g) B).map ψ).eval u = 0 := by
      rw [hQ, Polynomial.map_mul, eval_mul, hu, zero_mul]
    rw [eval_clearedSubst ψ (act F g).val (R g) B u v hr] at hz
    exact (mul_eq_zero.mp hz).resolve_left (pow_ne_zero _ hb)
  have hact (g h : G) : act (own g) h = own (g * h) :=
    huniq (g * h) _ (htransport f (own g) h (x g) (x (g * h)) (hown g) (hB g) (hR g h))
  refine ⟨⟨act, ?_, ?_, ?_, ?_⟩⟩
  · intro F
    change own (repr F * 1) = F
    rw [mul_one, hrepr]
  · intro F g h
    calc
      act F (g * h) = own (repr F * (g * h)) := rfl
      _ = own ((repr F * g) * h) := congrArg own (mul_assoc ..).symm
      _ = act (own (repr F * g)) h := (hact _ _).symm
      _ = _ := rfl
  · intro F H
    refine ⟨(repr F)⁻¹ * repr H, ?_⟩
    change own (repr F * ((repr F)⁻¹ * repr H)) = H
    rw [← mul_assoc, mul_inv_cancel, one_mul, hrepr]
  · intro S inst ψ F g x y hx hb hr
    exact htransport ψ F g x y hx hb hr

end Conjectures.AsgarliGhiocaYip
