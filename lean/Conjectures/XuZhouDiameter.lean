module

public import Conjectures.XuZhouCliqueChain
public import Conjectures.XuZhouZeroExtension

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators InnerProductSpace

variable {V : Type*} [Fintype V] [DecidableEq V]

omit [Fintype V] [DecidableEq V] in
theorem induce_layerCliqueGraph {d : ℕ} (layer : V→Fin d) (s : Finset V) :
    inducedGraph (layerCliqueGraph layer) s =
      layerCliqueGraph (fun u : ↥s => layer u.val) := by
  ext u v
  change (u.val≠v.val ∧ (layer u.val).val ≤ (layer v.val).val+1 ∧
      (layer v.val).val ≤ (layer u.val).val+1) ↔ _
  change _ ↔ (u≠v ∧ (layer u.val).val ≤ (layer v.val).val+1 ∧
      (layer v.val).val ≤ (layer u.val).val+1)
  constructor
  · rintro ⟨hn,h1,h2⟩
    exact ⟨fun h => hn (congrArg Subtype.val h),h1,h2⟩
  · rintro ⟨hn,h1,h2⟩
    exact ⟨fun h => hn (Subtype.ext h),h1,h2⟩

theorem lapMatrix_congr {A B : SimpleGraph V} [dA : DecidableRel A.Adj]
    [dB : DecidableRel B.Adj] (h : A=B) : A.lapMatrix ℝ=B.lapMatrix ℝ := by
  subst B
  have hdec : dB=dA := Subsingleton.elim _ _
  cases hdec
  rfl

noncomputable def laplacianCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (lo hi : ℝ) : ℕ :=
  Fintype.card {i : V // lo ≤ (G.isHermitian_lapMatrix ℝ).eigenvalues i ∧
    (G.isHermitian_lapMatrix ℝ).eigenvalues i ≤ hi}

/-- Xu–Zhou's Conjecture 1.1 (preprint Conjecture 5.1), with multiplicity and
the original closed interval. -/
theorem diameter_laplacian_conjecture (G : SimpleGraph V) [DecidableRel G.Adj]
    (connected : G.Connected) (c : ℕ)
    (hd : 2 ≤ G.diam) (hc : c ≤ G.diam-2)
    (hsize : G.diam ≤ Fintype.card V-2-c) :
    laplacianCount G ((Fintype.card V-G.diam+2-c:ℕ):ℝ) (Fintype.card V:ℝ) ≤
      Fintype.card V-G.diam+c := by
  classical
  let d := G.diam
  let n := Fintype.card V
  have hd' : 2 ≤ d := hd
  have hc' : c ≤ d-2 := hc
  have hn : d+1+(c+1) ≤ n := by
    have hh : d ≤ n-2-c := hsize
    omega
  obtain ⟨layer,hsurj,hG⟩ := exists_diameter_layering G connected
  obtain ⟨s,hs,hsurj'⟩ := exists_retained_layers layer hsurj hn
  let K := layerCliqueGraph layer
  let J := layerCliqueGraph (fun u : ↥s => layer u.val)
  let hJ := J.isHermitian_lapMatrix ℝ
  let hM := G.isHermitian_lapMatrix ℝ
  let W := strictlyLowSpace hJ 4
  let L : W →ₗ[ℝ] EuclideanSpace ℝ V := (zeroExtend s).comp W.subtype
  let Z := L.range
  have hf : Function.Injective L := (zeroExtend_injective s).comp Subtype.val_injective
  have hs' : s.card=d+1+(c+1) := hs
  have hnum : Fintype.card (↥s)=d+1+(c+1) := Fintype.card_coe s |>.trans hs'
  have hsurplus : (∑ i,(layerSize (fun u : ↥s => layer u.val) i-1))=c+1 := by
    have hh := card_eq_layer_count_add_surplus (fun u : ↥s => layer u.val) hsurj'
    change Fintype.card (↥s)=d+1+_ at hh
    rw [hnum] at hh
    omega
  have hhigh : Fintype.card {i : ↥s // (4:ℝ) ≤ hJ.eigenvalues i} ≤ 2*(c+1) := by
    have H := cliqueChain_card_eigenvalues_ge_four (fun u : ↥s => layer u.val) hsurj'
    rw [hsurplus] at H
    exact H
  have hcompl : Fintype.card {i : ↥s // (4:ℝ) ≤ hJ.eigenvalues i} =
      s.card-Fintype.card {i : ↥s // hJ.eigenvalues i < (4:ℝ)} := by
    simpa only [not_lt,Fintype.card_coe] using
      Fintype.card_subtype_compl (fun i : ↥s => hJ.eigenvalues i<(4:ℝ))
  have hdim : Module.finrank ℝ Z=Fintype.card {i : ↥s // hJ.eigenvalues i<(4:ℝ)} := by
    change Module.finrank ℝ L.range=_
    rw [LinearMap.finrank_range_of_inj hf]
    exact strictlyLowSpace_finrank hJ 4
  have hlow : d-c ≤ Module.finrank ℝ Z := by
    rw [hcompl] at hhigh
    omega
  let cutoff : ℝ := (4:ℝ)+((n-s.card:ℕ):ℝ)
  have hJliteral : inducedGraph K s=J := induce_layerCliqueGraph layer s
  have hZ (x : Z) (hx : x≠0) : quadraticEnergy (G.lapMatrix ℝ) x.val < cutoff*‖x.val‖^2 := by
    obtain ⟨y,hy⟩ := x.property
    have hnz : y≠0 := fun he => hx (Subtype.ext (by
      rw [← hy,he,map_zero]; rfl))
    have hlowE := strictlyLowSpace_energy hJ 4 y hnz
    rw [← hy]
    change quadraticEnergy (G.lapMatrix ℝ) (zeroExtend s y.val) <
      cutoff*‖zeroExtend s y.val‖^2
    have hmono := quadraticEnergy_lapMatrix_mono G K hG (zeroExtend s y.val)
    have hzero := zeroExtend_energy_le K s y.val
    rw [lapMatrix_congr hJliteral] at hzero
    rw [zeroExtend_norm_square]
    unfold cutoff n
    linarith
  have H := card_ge_le_sub_finrank hM cutoff Z hZ
  have hcutN : 4+(n-s.card)=n-d+2-c := by omega
  have hcut : cutoff=((n-d+2-c:ℕ):ℝ) := by
    unfold cutoff
    exact_mod_cast hcutN
  rw [hcut] at H
  calc
    _ ≤ Fintype.card {i : V // ((n-d+2-c:ℕ):ℝ) ≤ hM.eigenvalues i} := by
      unfold laplacianCount
      apply Fintype.card_le_of_injective
        (fun i => ⟨i.val,i.property.1⟩)
      intro u v huv
      apply Subtype.ext
      exact congrArg (fun x : { i : V // ((n-d+2-c:ℕ):ℝ) ≤ hM.eigenvalues i } => x.val) huv
    _ ≤ n-d+c := by
      exact H.trans (by omega)

end XuZhou
