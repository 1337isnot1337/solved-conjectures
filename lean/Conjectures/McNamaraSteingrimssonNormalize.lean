module

public import Conjectures.McNamaraSteingrimssonLayerEmbedding
public import Conjectures.McNamaraSteingrimssonPolynomial
public import Mathlib.Data.Finset.Sort

@[expose] public section
namespace McNamaraSteingrimsson

/-- Classical pattern containment: there is an increasing injection of
positions preserving the relative order of every pair of selected values. -/
def ClassicalPattern {m n : ℕ} (a : Equiv.Perm (Fin m)) (b : Equiv.Perm (Fin n)) : Prop :=
  ∃ f : Fin m → Fin n, StrictMono f ∧ ∀ i j, a i<a j ↔ b (f i)<b (f j)

/-- Normalize an injective numerical ordering of a finite carrier. -/
noncomputable def codeRank {α : Type*} [Fintype α] (code : α→ℕ)
    (hc : Function.Injective code) : α ≃ Fin (Fintype.card α) := by
  let _ : LinearOrder α := LinearOrder.lift' code hc
  exact (Fintype.orderIsoFinOfCardEq α rfl).symm.toEquiv

theorem codeRank_lt_iff {α : Type*} [Fintype α] (code : α→ℕ)
    (hc : Function.Injective code) (p q : α) :
    codeRank code hc p < codeRank code hc q ↔ code p < code q := by
  let _ : LinearOrder α := LinearOrder.lift' code hc
  change (Fintype.orderIsoFinOfCardEq α rfl).symm p <
      (Fintype.orderIsoFinOfCardEq α rfl).symm q ↔ p<q
  exact OrderIso.lt_iff_lt _

theorem sizedAt_le_two (v : List Bool) (i : Fin v.length) : sizedAt v i≤2 := by
  simp [sizedAt,layerSize]
  split <;> decide

def posCode {v : List Bool} (p : LayerPosition v) : ℕ :=
  2*p.1.val+p.2.val

def valCode {v : List Bool} (p : LayerPosition v) : ℕ :=
  2*p.1.val+(sizedAt v p.1-1-p.2.val)

theorem posCode_lt_iff {v : List Bool} (p q : LayerPosition v) :
    posCode p < posCode q ↔ positionLT p q := by
  have hP := p.2.isLt
  have hQ := q.2.isLt
  have hsP := sizedAt_le_two v p.1
  have hsQ := sizedAt_le_two v q.1
  simp only [posCode,positionLT,Fin.lt_def,Fin.ext_iff]
  omega

theorem valCode_lt_iff {v : List Bool} (p q : LayerPosition v) :
    valCode p < valCode q ↔ valueLT p q := by
  have hP := p.2.isLt
  have hQ := q.2.isLt
  have hsP := sizedAt_le_two v p.1
  have hsQ := sizedAt_le_two v q.1
  by_cases h : p.1=q.1
  · have hs : sizedAt v p.1=sizedAt v q.1 := congrArg (sizedAt v) h
    have he := congrArg Fin.val h
    simp only [valCode,valueLT,h,true_and,Fin.lt_def]
    omega
  · have he : p.1.val ≠ q.1.val := fun h' => h (Fin.ext h')
    simp only [valCode,valueLT,h,false_and,or_false,Fin.lt_def]
    omega

theorem posCode_inj (v : List Bool) : Function.Injective (@posCode v) := by
  rintro ⟨i,a⟩ ⟨j,b⟩ h
  have ha:=a.isLt; have hb:=b.isLt
  have h₁ := sizedAt_le_two v i
  have h₂ := sizedAt_le_two v j
  change 2*i.val+a.val=2*j.val+b.val at h
  have hij : i=j := Fin.ext (by omega)
  subst j
  exact Sigma.ext rfl (heq_of_eq (Fin.ext (by change a.val=b.val; omega)))

theorem valCode_inj (v : List Bool) : Function.Injective (@valCode v) := by
  rintro ⟨i,a⟩ ⟨j,b⟩ h
  have ha:=a.isLt; have hb:=b.isLt
  have h₁ := sizedAt_le_two v i
  have h₂ := sizedAt_le_two v j
  change 2*i.val+(sizedAt v i-1-a.val)=2*j.val+(sizedAt v j-1-b.val) at h
  have hij : i=j := Fin.ext (by omega)
  subst j
  exact Sigma.ext rfl (heq_of_eq (Fin.ext (by change a.val=b.val; omega)))

theorem card_layerPosition (v : List Bool) : Fintype.card (LayerPosition v)=layerWeight v := by
  rw [Fintype.card_sigma]
  simp only [Fintype.card_fin]
  rw [← List.sum_ofFn]
  unfold sizedAt layerWeight
  exact congrArg List.sum (List.ofFn_getElem_eq_map v layerSize)

noncomputable def layerPermutation (v : List Bool) :
    Equiv.Perm (Fin (Fintype.card (LayerPosition v))) :=
  (codeRank (@posCode v) (posCode_inj v)).symm.trans (codeRank (@valCode v) (valCode_inj v))

theorem layerPattern_iff_classicalPattern {u v : List Bool} :
    LayerPattern u v ↔ ClassicalPattern (layerPermutation u) (layerPermutation v) := by
  let pu := codeRank (@posCode u) (posCode_inj u)
  let pv := codeRank (@posCode v) (posCode_inj v)
  let vu := codeRank (@valCode u) (valCode_inj u)
  let vv := codeRank (@valCode v) (valCode_inj v)
  have pU (i j : LayerPosition u) : pu i<pu j ↔ positionLT i j :=
    (codeRank_lt_iff _ _ _ _).trans (posCode_lt_iff _ _)
  have pV (i j : LayerPosition v) : pv i<pv j ↔ positionLT i j :=
    (codeRank_lt_iff _ _ _ _).trans (posCode_lt_iff _ _)
  have vU (i j : LayerPosition u) : vu i<vu j ↔ valueLT i j :=
    (codeRank_lt_iff _ _ _ _).trans (valCode_lt_iff _ _)
  have vV (i j : LayerPosition v) : vv i<vv j ↔ valueLT i j :=
    (codeRank_lt_iff _ _ _ _).trans (valCode_lt_iff _ _)
  constructor
  · rintro ⟨f,_,hp,hv⟩
    let g := fun i => pv (f (pu.symm i))
    refine ⟨g,?_,?_⟩
    · intro i j hi
      have hx : pu (pu.symm i)<pu (pu.symm j) := by simpa using hi
      exact (pV _ _).mpr ((hp _ _).mp ((pU _ _).mp hx))
    · intro i j
      change vu (pu.symm i)<vu (pu.symm j) ↔ vv (pv.symm (g i))<vv (pv.symm (g j))
      simp only [g,Equiv.symm_apply_apply]
      exact (vU _ _).trans ((hv _ _).trans (vV _ _).symm)
  · rintro ⟨g,hg,hv⟩
    let f := fun i => pv.symm (g (pu i))
    refine ⟨f,pv.symm.injective.comp (hg.injective.comp pu.injective),?_,?_⟩
    · intro i j
      rw [← pU,← pV]
      simpa [f] using (hg.lt_iff_lt (a := pu i) (b := pu j)).symm
    · intro i j
      have h := hv (pu i) (pu j)
      change vu (pu.symm (pu i))<vu (pu.symm (pu j)) ↔
        vv (pv.symm (g (pu i)))<vv (pv.symm (g (pu j))) at h
      simp only [Equiv.symm_apply_apply] at h
      exact (vU _ _).symm.trans (h.trans (vV (f i) (f j)))

theorem layerPermutation_pattern_iff_subword {u v : List Bool} :
    ClassicalPattern (layerPermutation u) (layerPermutation v) ↔ LayerSubword u v :=
  layerPattern_iff_classicalPattern.symm.trans layerPattern_iff_subword

end McNamaraSteingrimsson
