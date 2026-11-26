import Conjectures.AsgarliGhiocaYipTwistComponents
import Conjectures.AsgarliGhiocaYipTwistCount

/-! # Lower bound from the mass of twisted points on the cover -/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial
open scoped Classical

variable {K E G : Type*} [Field K] [Fintype K] [Field E] [Algebra K E]
  [Algebra.IsAlgebraic K E] [Group G] [Fintype G]

/-- Nonzero parameters at which the resolvent is separable. -/
noncomputable def regularParameters (P : PlanePolynomial K) : Finset K :=
  (univ.erase 0).filter fun t ↦ (exceptionalPolynomial P).eval t ≠ 0

theorem mem_regularParameters {P : PlanePolynomial K} {t : K} :
    t ∈ regularParameters P ↔ t ≠ 0 ∧ (exceptionalPolynomial P).eval t ≠ 0 := by
  simp [regularParameters]

set_option maxHeartbeats 800000 in
/-- Each good root contributes to exactly one twist. The total mass and the
upper bound on each stable pair imply that the seed twist has enough points. -/
theorem half_le_twist_fibers {P : PlanePolynomial K} (hP : P.Monic) (R : G → PlanePolynomial E)
    (M : GeometricFactors (planeMap (algebraMap K E) P))
    (act : ComponentTranslations M G R (planeMap (algebraMap K E) P).derivative)
    (x : K → G → E) {τ : G}
    (hs : ∀ t, specialize (algebraMap K E t) (planeMap (algebraMap K E) P) =
      ∏ g : G, (X - C (x t g)))
    (hinterp : ∀ t g h, planeEval (algebraMap K E t) (x t g) (R h) =
      planeEval (algebraMap K E t) (x t g) (planeMap (algebraMap K E) P).derivative * x t (g * h))
    (h0 : (exceptionalPolynomial P).eval 0 ≠ 0)
    (hseed : ∃ g, x 0 (g * τ) = (x 0 g)^Fintype.card K)
    {N D : ℕ} (hN : 0 < N) (hn : Fintype.card G = N) (hdeg : P.natDegree = N)
    (hc : ∀ j, (P.coeff j).natDegree ≤ N - j)
    (estimate : ∀ (p : M.Component × G) (S : Finset (E × E)),
      (∀ z ∈ S, planeEval z.1 z.2 p.1.val = 0 ∧ planeEval z.1 z.2 p.1.val.derivative ≠ 0 ∧
        z.1^Fintype.card K = z.1 ∧
        planeEval z.1 z.2 (planeMap (algebraMap K E) P).derivative ≠ 0 ∧
        planeEval z.1 z.2 (planeMap (algebraMap K E) P).derivative * z.2^Fintype.card K =
          planeEval z.1 z.2 (R p.2)) →
      (S.card : ℝ) ≤ Fintype.card K + 8 * (N : ℝ)^2 * Real.sqrt (Fintype.card K))
    (hND : 2 * N ≤ D) (hD : 4 ≤ D) (hq : D^8 ≤ Fintype.card K) :
    Fintype.card K ≤ 2 * ∑ t ∈ regularParameters P,
      ((univ : Finset G).filter fun g ↦ x t (g * τ) = (x t g)^Fintype.card K).card := by
  classical
  let base := algebraMap K E
  let P' := planeMap base P
  let B := P'.derivative
  let q := Fintype.card K
  let evalT (t : K) := evalRingHom (base t)
  let reg (t : K) : Prop := (exceptionalPolynomial P).eval t ≠ 0
  have hsep (t : K) (ht : reg t) : (P'.map (evalT t)).Separable := by
    change (specialize (base t) (planeMap base P)).Separable
    rw [specialize_planeMap]
    exact ((separable_specialize_iff hP t).mpr ht).map
  have hroot (t : K) (g : G) : (P'.map (evalT t)).eval (x t g) = 0 := by
    change (specialize (base t) P').eval _ = _
    rw [hs, eval_prod]
    exact prod_eq_zero (mem_univ g) (by simp)
  have hinj (t : K) (ht : reg t) : Function.Injective (x t) := by
    have h := hsep t ht
    change (specialize (base t) P').Separable at h
    rw [hs] at h
    exact separable_prod_X_sub_C_iff.mp h
  choose owner howner hunique using fun (t : K) (ht : reg t) (g : G) ↦
    M.existsUnique_root_component (evalT t) (hsep t ht) (hroot t g)
  let Φ : PlanePolynomial E ≃ₐ[K] PlanePolynomial E := planeFrobenius
  have hΦ : Φ P' = P' := planeFrobenius_lift P
  let φ := FiniteField.frobeniusAlgEquivOfAlgebraic K E
  have hφ (z : E) : φ z = z^q := rfl
  have hpFrob (t : K) (z : E) (F : PlanePolynomial E) :
      planeEval (base t) (z^q) (Φ F) = φ (planeEval (base t) z F) := by
    rw [← hφ]
    change planeEval (base t) (φ z) (planeFrobenius (K := K) F) = _
    rw [planeFrobenius_apply]
    have h := planeEval_map φ.toAlgHom.toRingHom (base t) z F
    have ht : φ.toAlgHom.toRingHom (base t) = base t := φ.commutes t
    rw [ht] at h
    exact h
  let fr (F : M.Component) : M.Component := ⟨Φ F.val, M.mem_of_monic_irred_dvd
    ((M.monic F.val F.property).map _)
    ((MulEquiv.irreducible_iff Φ.toRingEquiv.toMulEquiv).mpr (M.irred F.val F.property))
    (by
      obtain ⟨H, hH⟩ := M.dvd F
      exact ⟨Φ H, hΦ.symm.trans ((congrArg Φ hH).trans (map_mul Φ F.val H))⟩)⟩
  have hnext (t : K) (g : G) : ∃ h, x t h = (x t g)^q := by
    have h := hpFrob t (x t g) P'
    have hr : planeEval (base t) (x t g) P' = 0 := hroot t g
    rw [hΦ, hr, map_zero] at h
    change (specialize (base t) P').eval ((x t g)^q) = 0 at h
    rw [hs, eval_prod, prod_eq_zero_iff] at h
    obtain ⟨l, _, hl⟩ := h
    exact ⟨l, (sub_eq_zero.mp (by simpa using hl)).symm⟩
  choose next hmove using hnext
  let twist (t : K) (g : G) := g⁻¹ * next t g
  have htwist (t : K) (g : G) : x t (g * twist t g) = (x t g)^q := by
    change x t (g * (g⁻¹ * next t g)) = _
    rw [← mul_assoc, mul_inv_cancel, one_mul, hmove]
  have hsimple (t : K) (ht : reg t) (g : G) : (B.map (evalT t)).eval (x t g) ≠ 0 := by
    change (P'.derivative.map (evalT t)).eval _ ≠ 0
    rw [← derivative_map]
    exact (hsep t ht).eval₂_derivative_ne_zero (RingHom.id E) (hroot t g)
  have hstable (t : K) (ht : reg t) (g h : G) (hh : x t (g * h) = (x t g)^q) :
      act.act (owner t ht g) h = fr (owner t ht g) := by
    have ha := act.transport (evalT t) _ h _ _ (howner t ht g) (hsimple t ht g) (hinterp t g h)
    have hb : ((fr (owner t ht g)).val.map (evalT t)).eval (x t (g * h)) = 0 := by
      change planeEval (base t) (x t (g * h)) (Φ (owner t ht g).val) = 0
      rw [hh, hpFrob]
      exact (congrArg φ (howner t ht g)).trans (map_zero φ)
    exact (hunique t ht (g * h) _ ha).trans (hunique t ht (g * h) _ hb).symm
  obtain ⟨g₀, hg₀⟩ := hseed
  let c₀ := owner 0 h0 g₀
  let : Nonempty M.Component := ⟨c₀⟩
  let stable := (univ : Finset (M.Component × G)).filter fun p ↦ act.act p.1 p.2 = fr p.1
  let target : M.Component × G := (c₀, τ)
  have htarget : target ∈ stable := mem_filter.mpr ⟨mem_univ _, hstable 0 h0 g₀ τ hg₀⟩
  have hcard : stable.card = N := (card_stable_pairs act.act act.one act.mul act.transitive fr).trans hn
  let T := regularParameters P
  have hT (t : ↥T) : reg t.val := (mem_regularParameters.mp t.property).2
  let assign (y : ↥T × G) : M.Component × G := (owner y.1.val (hT y.1) y.2, twist y.1.val y.2)
  have hass (y : ↥T × G) : assign y ∈ stable :=
    mem_filter.mpr ⟨mem_univ _, hstable _ (hT y.1) _ _ (htwist y.1.val y.2)⟩
  let block (p : M.Component × G) := (univ : Finset (↥T × G)).filter fun y ↦ assign y = p
  let points (p : M.Component × G) := (block p).card
  have hmass : ∑ p ∈ stable, points p = T.card * N := by
    have hh := card_eq_sum_card_fiberwise (s := (univ : Finset (↥T × G))) (t := stable)
      (f := assign) (fun y _ ↦ hass y)
    simpa [points, block, Fintype.card_prod, hn] using hh.symm
  have hX : (exceptionalPolynomial P).natDegree ≤ 2 * N^2 := by
    apply (natDegree_exceptionalPolynomial_le P (b := N) (fun j ↦ (hc j).trans (Nat.sub_le ..))).trans
    rw [hdeg]
    simpa [pow_two, mul_assoc] using Nat.mul_le_mul_right N (show N + (N - 1) ≤ 2 * N by omega)
  have hEx : exceptionalPolynomial P ≠ 0 := fun h ↦ h0 (by rw [h, eval_zero])
  have hloss : q ≤ T.card + (2 * N^2 + 1) := by
    let bad := insert 0 (exceptionalPolynomial P).roots.toFinset
    have ht : T = badᶜ := by
      ext t
      simp [T, bad, mem_regularParameters, Multiset.mem_toFinset, mem_roots hEx, IsRoot.def]
    have hbad : bad.card ≤ 2 * N^2 + 1 :=
      (card_insert_le _ _).trans (Nat.add_le_add_right
        ((Multiset.toFinset_card_le _).trans ((card_roots' _).trans hX)) 1)
    have he := card_compl_add_card bad
    rw [← ht] at he
    omega
  have hupper (p : M.Component × G) : (points p : ℝ) ≤ q + 8 * (N : ℝ)^2 * Real.sqrt q := by
    let embed (y : ↥T × G) : E × E := (base y.1.val, x y.1.val y.2)
    have hemb : Function.Injective embed := by
      intro y z h
      have h1 : y.1 = z.1 := Subtype.ext (base.injective (congrArg Prod.fst h))
      have h2 := congrArg Prod.snd h
      change x y.1.val y.2 = x z.1.val z.2 at h2
      rw [h1] at h2
      exact Prod.ext h1 (hinj _ (hT z.1) h2)
    let S := (block p).image embed
    have hSn : S.card = points p := card_image_of_injective _ hemb
    have hdvd := M.dvd p.1
    have hp (z : E × E) (hz : z ∈ S) :
        planeEval z.1 z.2 p.1.val = 0 ∧ planeEval z.1 z.2 p.1.val.derivative ≠ 0 ∧
        z.1^q = z.1 ∧ planeEval z.1 z.2 B ≠ 0 ∧
        planeEval z.1 z.2 B * z.2^q = planeEval z.1 z.2 (R p.2) := by
      obtain ⟨y, hy, rfl⟩ := mem_image.mp hz
      have he := (mem_filter.mp hy).2
      have he1 : owner y.1.val (hT y.1) y.2 = p.1 := congrArg Prod.fst he
      have he2 : twist y.1.val y.2 = p.2 := congrArg Prod.snd he
      have hz0 := howner y.1.val (hT y.1) y.2
      rw [he1] at hz0
      have hsepF : (p.1.val.map (evalT y.1.val)).Separable :=
        (hsep _ (hT y.1)).of_dvd (map_dvd (mapRingHom _) hdvd)
      have hF0 : planeEval (embed y).1 (embed y).2 p.1.val = 0 := hz0
      refine ⟨hF0, ?_, ?_, hsimple _ (hT y.1) y.2, ?_⟩
      · change (p.1.val.derivative.map (evalT y.1.val)).eval _ ≠ 0
        rw [← derivative_map]
        exact hsepF.eval₂_derivative_ne_zero (RingHom.id E) hz0
      · change (base y.1.val)^q = _
        rw [← map_pow, FiniteField.pow_card]
      · have hh := hinterp y.1.val y.2 p.2
        have h2 : x y.1.val (y.2 * p.2) = (x y.1.val y.2)^q := by
          simpa only [he2] using htwist y.1.val y.2
        rw [h2] at hh
        exact hh.symm
    rw [← hSn]
    exact estimate p S hp
  have hmain := half_of_twisted_mass stable htarget points hN hcard hND hD hq hloss hmass
    (fun p _ ↦ hupper p)
  have hcardFiber (t : K) : ((block target).filter fun y ↦ y.1.val = t).card ≤
      ((univ : Finset G).filter fun g ↦ x t (g * τ) = (x t g)^q).card := by
    apply card_le_card_of_injOn Prod.snd
    · intro y hy
      obtain ⟨hy, ht⟩ := mem_filter.mp hy
      have hh : twist y.1.val y.2 = τ := congrArg Prod.snd (mem_filter.mp hy).2
      exact mem_filter.mpr ⟨mem_univ _, ht ▸ (hh ▸ htwist y.1.val y.2)⟩
    · intro y hy z hz h
      exact Prod.ext (Subtype.ext ((mem_filter.mp hy).2.trans (mem_filter.mp hz).2.symm)) h
  have hpoint : points target ≤ ∑ t ∈ T, ((univ : Finset G).filter fun g ↦
      x t (g * τ) = (x t g)^q).card := by
    have he := card_eq_sum_card_fiberwise (s := block target) (t := T)
      (f := fun y : ↥T × G ↦ y.1.val) (fun y _ ↦ y.1.property)
    exact he.trans_le (sum_le_sum (fun t _ ↦ hcardFiber t))
  exact hmain.trans (Nat.mul_le_mul_left 2 hpoint)

end Conjectures.AsgarliGhiocaYip
