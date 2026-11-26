module

public import Conjectures.ShumyatskySocleStructure
public import Conjectures.ShumyatskyFactorAction
public import Mathlib.GroupTheory.Subgroup.Simple

/-! The simple factors of a nonabelian minimal normal subgroup are
the ambient conjugates of a minimal normal subgroup of that subgroup. -/

@[expose] public section

namespace Shumyatsky

variable {G : Type*} [Group G]

private theorem minimalNormal_map (e : MulAut G) {P : Subgroup G}
    (hP : IsMinimalNormalSubgroup P) : IsMinimalNormalSubgroup (P.map e.toMonoidHom) := by
  have : P.Normal := hP.normal
  refine ⟨Subgroup.Normal.map hP.normal _ e.surjective, ?_, ?_⟩
  · intro h
    exact hP.neBot ((Subgroup.map_eq_bot_iff_of_injective P e.injective).mp h)
  · intro K hK hLe hNontriv
    have hEq : (K.comap e.toMonoidHom).map e.toMonoidHom = K :=
      Subgroup.map_comap_eq_self_of_surjective e.surjective K
    have hComapLe : K.comap e.toMonoidHom ≤ P := by
      rw [← Subgroup.comap_map_eq_self_of_injective (f := e.toMonoidHom) e.injective P]
      exact Subgroup.comap_mono hLe
    have hComapNe : K.comap e.toMonoidHom ≠ ⊥ := by
      intro h
      rw [h, Subgroup.map_bot] at hEq
      exact hNontriv hEq.symm
    rw [← hEq, hP.eq_of_le _ (hK.comap _) hComapLe hComapNe]

/-- The distinct internal subgroups obtained by ambient conjugation. -/
def ambientConjugates (N : Subgroup G) [N.Normal] (P : Subgroup N) : Set (Subgroup N) :=
  Set.range fun g : G => P.map (MulAut.conjNormal g).toMonoidHom

private theorem ambientConjugates_minimal (N : Subgroup G) [N.Normal] {P : Subgroup N}
    (hP : IsMinimalNormalSubgroup P) (K : ambientConjugates N P) :
    IsMinimalNormalSubgroup K.val := by
  obtain ⟨g, hg⟩ := K.property
  rw [← hg]
  exact minimalNormal_map (MulAut.conjNormal g) hP

private theorem mem_ambientConjugates_self (N : Subgroup G) [N.Normal] (P : Subgroup N) :
    P ∈ ambientConjugates N P := by
  refine ⟨1, ?_⟩
  change P.map (MulAut.conjNormal (H := N) 1).toMonoidHom = P
  rw [map_one]
  exact Subgroup.map_id P

private theorem map_ambientConjugates (N : Subgroup G) [N.Normal] {P K : Subgroup N}
    (hK : K ∈ ambientConjugates N P) (g : G) :
    K.map (MulAut.conjNormal g).toMonoidHom ∈ ambientConjugates N P := by
  obtain ⟨a, ha⟩ := hK
  refine ⟨g * a, ?_⟩
  change P.map (MulAut.conjNormal (H := N) (g * a)).toMonoidHom = _
  rw [← ha, Subgroup.map_map, map_mul]
  rfl

/-- Ambient conjugation acts transitively on the actual factor subgroups. -/
theorem ambientConjugates_transitive (N : Subgroup G) [N.Normal] (P : Subgroup N)
    (i j : ambientConjugates N P) :
    ∃ g : G, i.val.map (MulAut.conjNormal g).toMonoidHom = j.val := by
  obtain ⟨a, ha⟩ := i.property
  obtain ⟨b, hb⟩ := j.property
  refine ⟨b * a⁻¹, ?_⟩
  change P.map (MulAut.conjNormal (H := N) a).toMonoidHom = i.val at ha
  rw [← ha, Subgroup.map_map]
  change P.map (MulAut.conjNormal (H := N) (b * a⁻¹) * MulAut.conjNormal a).toMonoidHom = _
  rw [← map_mul, inv_mul_cancel_right]
  exact hb

private theorem iSup_ambientConjugates_eq_top {N : Subgroup G} (hN : IsMinimalNormalSubgroup N)
    [N.Normal] {P : Subgroup N} (hP : IsMinimalNormalSubgroup P) :
    (⨆ K : ambientConjugates N P, K.val) = ⊤ := by
  let J : Subgroup N := ⨆ K : ambientConjugates N P, K.val
  let M := J.map N.subtype
  have hStable (g : G) : J.map (MulAut.conjNormal g).toMonoidHom ≤ J := by
    change (⨆ K : ambientConjugates N P, K.val).map _ ≤ J
    rw [Subgroup.map_iSup]
    exact iSup_le fun K => le_iSup (fun K : ambientConjugates N P => K.val)
      ⟨_, map_ambientConjugates N K.property g⟩
  have hNormal : M.Normal := by
    constructor
    intro x hx g
    obtain ⟨a, ha, rfl⟩ := Subgroup.mem_map.mp hx
    exact ⟨MulAut.conjNormal g a, hStable g (Subgroup.mem_map_of_mem _ ha), rfl⟩
  have hLe : M ≤ N := fun x hx => by
    obtain ⟨a, _, rfl⟩ := Subgroup.mem_map.mp hx
    exact a.property
  have hPLe : P ≤ J := le_iSup (fun K : ambientConjugates N P => K.val)
    ⟨P, mem_ambientConjugates_self N P⟩
  have hMNe : M ≠ ⊥ := by
    intro h
    have hJ : J = ⊥ := (Subgroup.map_eq_bot_iff_of_injective J N.subtype_injective).mp h
    rw [hJ] at hPLe
    exact hP.neBot (le_antisymm hPLe bot_le)
  have hMN := hN.eq_of_le M hNormal hLe hMNe
  apply Subgroup.map_injective N.subtype_injective
  rw [Subgroup.map_top, N.range_subtype]
  exact hMN

private theorem simple_of_minimal_normal_factor {I : Type*} (P : I → Subgroup G)
    (hMin : ∀ i, IsMinimalNormalSubgroup (P i)) (hJoin : (⨆ i, P i) = ⊤)
    (i : I) : IsSimpleGroup (P i) := by
  classical
  refine Subgroup.isSimpleGroup_iff.mpr ⟨(hMin i).neBot, ?_⟩
  intro H hLe hNormal
  by_cases hBot : H = ⊥
  · exact Or.inl hBot
  have hNormalInG : H.Normal := by
    apply Subgroup.normalizer_eq_top_iff.mp
    rw [eq_top_iff, ← hJoin]
    apply iSup_le
    intro j
    by_cases he : P j = P i
    · rw [he]
      exact (Subgroup.normal_subgroupOf_iff_le_normalizer hLe).mp hNormal
    · apply Subgroup.le_normalizer_iff.mpr
      intro x hx y hy
      have hComm := commute_of_distinct_minimal_normal (hMin j) (hMin i) he ⟨x, hx⟩ ⟨y, hLe hy⟩
      rw [hComm.eq, mul_assoc, mul_inv_cancel, mul_one]
      exact hy
  exact Or.inr ((hMin i).eq_of_le H hNormalInG hLe hBot)

private theorem nonabelian_internal_factor [Finite G] {N : Subgroup G} (hN : IsMinimalNormalSubgroup N)
    [N.Normal] (hNonabel : ¬IsMulCommutative N) {P : Subgroup N}
    (hP : IsMinimalNormalSubgroup P) : ¬IsMulCommutative P := by
  classical
  intro hAbel
  have : Finite (Subgroup N) :=
    Finite.of_injective (fun H : Subgroup N => (H : Set N)) SetLike.coe_injective
  let _ := Fintype.ofFinite (ambientConjugates N P)
  let H (i : ambientConjugates N P) := i.val
  let : ∀ i, IsMulCommutative (H i) := fun i => by
    obtain ⟨g, hg⟩ := i.property
    change IsMulCommutative i.val
    rw [← hg]
    exact Subgroup.map_isMulCommutative _ _
  have hPair : Pairwise fun i j => ∀ x y : N, x ∈ H i → y ∈ H j → Commute x y :=
    fun i j hij x y hx hy => commute_of_distinct_minimal_normal
      (ambientConjugates_minimal N hP i) (ambientConjugates_minimal N hP j)
      (fun he => hij (Subtype.ext he)) ⟨x, hx⟩ ⟨y, hy⟩
  let f := Subgroup.noncommPiCoprod hPair
  have hRange : f.range = ⊤ := Subgroup.noncommPiCoprod_range.trans
    (iSup_ambientConjugates_eq_top hN hP)
  have hSurj : Function.Surjective f := MonoidHom.range_eq_top.mp hRange
  apply hNonabel
  apply IsMulCommutative.of_comm
  intro x y
  obtain ⟨a, rfl⟩ := hSurj x
  obtain ⟨b, rfl⟩ := hSurj y
  rw [← map_mul, ← map_mul, mul_comm' a b]

private theorem directProductEquivJoin_mulSingle {I : Type*} [Finite I] [DecidableEq I]
    (H : I → Subgroup G)
    (hComm : ∀ i j, i ≠ j → ∀ a : H i, ∀ b : H j, Commute (a : G) (b : G))
    (hCenter : ∀ i, Subgroup.center (H i) = ⊥) (i : I) (a : H i) :
    (directProductEquivJoin H hComm hCenter (Pi.mulSingle i a) : G) = a := by
  let _ := Fintype.ofFinite I
  apply Subgroup.noncommPiCoprod_mulSingle
  exact fun i j hij x y hx hy => hComm i j hij ⟨x, hx⟩ ⟨y, hy⟩

/-- Every ambient conjugate of an internal minimal normal subgroup
    is a simple factor, and the factors form one conjugacy orbit. -/
theorem exists_nonabelian_simple_power_of_minimal_normal
    [Finite G] {N : Subgroup G} (hN : IsMinimalNormalSubgroup N)
    (hNonabel : ¬IsMulCommutative N) :
    letI : N.Normal := hN.normal
    ∃ P : Subgroup N, IsSimpleGroup P ∧ ¬IsMulCommutative P ∧
      letI := Classical.decEq (ambientConjugates N P)
      ∃ e : (ambientConjugates N P → P) ≃* N,
        ∀ i : ambientConjugates N P, (coordinateFactor i).map e.toMonoidHom = i.val := by
  classical
  let : N.Normal := hN.normal
  have : Nontrivial N := N.nontrivial_iff_ne_bot.mpr hN.neBot
  have hTop : (⊤ : Subgroup N) ≠ ⊥ := top_ne_bot
  obtain ⟨P, _, hP⟩ := exists_minimal_normal_below (⊤ : Subgroup N) hTop
  have : Finite (Subgroup N) :=
    Finite.of_injective (fun H : Subgroup N => (H : Set N)) SetLike.coe_injective
  let I := ambientConjugates N P
  let : DecidableEq I := Classical.decEq I
  let H (i : I) := i.val
  have hMin : ∀ i, IsMinimalNormalSubgroup (H i) := ambientConjugates_minimal N hP
  have hJoin : (⨆ i, H i) = ⊤ := iSup_ambientConjugates_eq_top hN hP
  have hPNonabel := nonabelian_internal_factor hN hNonabel hP
  let i₀ : I := ⟨P, mem_ambientConjugates_self N P⟩
  have hPSimple : IsSimpleGroup P := simple_of_minimal_normal_factor H hMin hJoin i₀
  have hCommute (i j : I) (hij : i ≠ j) (x : H i) (y : H j) : Commute (x : N) (y : N) :=
    commute_of_distinct_minimal_normal (hMin i) (hMin j)
      (fun he => hij (Subtype.ext he)) x y
  let transport (i : I) : P ≃* H i := by
    let g := Classical.choose i.property
    have hg : P.map (MulAut.conjNormal g).toMonoidHom = H i := Classical.choose_spec i.property
    exact ((MulAut.conjNormal g).subgroupMap P).trans (MulEquiv.subgroupCongr hg)
  have hCenter (i : I) : Subgroup.center (H i) = ⊥ := by
    apply center_eq_bot_of_nonabelian_minimal_normal (hMin i)
    intro hAbel
    apply hPNonabel
    apply IsMulCommutative.of_comm
    intro a b
    apply (transport i).injective
    simp only [map_mul, mul_comm' (transport i a) (transport i b)]
  let productToN := (directProductEquivJoin H hCommute hCenter).trans
    ((MulEquiv.subgroupCongr hJoin).trans Subgroup.topEquiv)
  let e := (MulEquiv.piCongrRight transport).trans productToN
  refine ⟨P, hPSimple, hPNonabel, e, ?_⟩
  intro i
  have hSingle (a : P) :
      (MulEquiv.piCongrRight transport) (Pi.mulSingle i a) = Pi.mulSingle i (transport i a) := by
    funext j
    rw [MulEquiv.piCongrRight_apply]
    by_cases h : j = i
    · subst j
      simp
    · rw [Pi.mulSingle_eq_of_ne h, Pi.mulSingle_eq_of_ne h, map_one]
  have hApply (a : P) : e (Pi.mulSingle i a) = (transport i a : N) := by
    change productToN ((MulEquiv.piCongrRight transport) (Pi.mulSingle i a)) = _
    rw [hSingle]
    exact directProductEquivJoin_mulSingle H hCommute hCenter i (transport i a)
  ext x
  constructor
  · intro hx
    obtain ⟨z, hz, rfl⟩ := Subgroup.mem_map.mp hx
    obtain ⟨a, rfl⟩ := MonoidHom.mem_range.mp hz
    change e (Pi.mulSingle i a) ∈ i.val
    rw [hApply]
    exact (transport i a).property
  · intro hx
    obtain ⟨a, ha⟩ := (transport i).surjective ⟨x, hx⟩
    exact Subgroup.mem_map.mpr
      ⟨Pi.mulSingle i a, ⟨a, rfl⟩, (hApply a).trans (congrArg Subtype.val ha)⟩

end Shumyatsky
