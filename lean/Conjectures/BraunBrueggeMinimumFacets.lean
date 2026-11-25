import Conjectures.BraunBrueggeMinimumGeometry
import Conjectures.BraunBrueggeMinimumMatchingFaces
import Mathlib.Analysis.Convex.Combination

/-! Actual geometric facets of the symmetric edge polytope are in
bijection with the vertices of the normalized polar. A facet is a maximal
proper nonempty exposed face of the polytope. -/

open Finset Set

namespace BraunBruegge

variable {V : Type*} [Fintype V] [DecidableEq V]

def tightFace (G : SimpleGraph V) (f : V → ℝ) : Set (V → ℝ) :=
  {x ∈ symmetricEdgePolytope G | pairing f x = 1}

def IsFacet (G : SimpleGraph V) (F : Set (V → ℝ)) : Prop :=
  IsExposed ℝ (symmetricEdgePolytope G) F ∧ F.Nonempty ∧ F ≠ symmetricEdgePolytope G ∧
    ∀ S : Set (V → ℝ), IsExposed ℝ (symmetricEdgePolytope G) S →
      S ≠ symmetricEdgePolytope G → F ⊆ S → F = S

omit [Fintype V] in
private theorem zero_mem_polytope [Nontrivial V] {G : SimpleGraph V} (hG : G.Connected) (root : V) :
    (0 : V → ℝ) ∈ symmetricEdgePolytope G := by
  obtain ⟨v, hv⟩ := hG.preconnected.exists_adj_of_nontrivial root
  have h₁ : edgeVector root v ∈ symmetricEdgePolytope G := subset_convexHull ℝ _ ⟨root, v, hv, rfl⟩
  have h₂ : edgeVector v root ∈ symmetricEdgePolytope G := subset_convexHull ℝ _ ⟨v, root, hv.symm, rfl⟩
  have h := (convex_convexHull ℝ (edgeVectors G)) h₁ h₂ (a := (1 : ℝ) / 2) (b := 1 / 2)
    (by norm_num) (by norm_num) (by norm_num)
  have he : (1 / 2 : ℝ) • edgeVector root v + (1 / 2 : ℝ) • edgeVector v root = 0 := by
    rw [← smul_add]
    unfold edgeVector
    rw [sub_add_sub_cancel, sub_self, smul_zero]
  rwa [he] at h

private theorem zeroSum_of_mem_polytope {G : SimpleGraph V} {z : V → ℝ}
    (hz : z ∈ symmetricEdgePolytope G) : ∑ u, z u = 0 := by
  apply (mem_zeroSumSpace_iff _).mp
  apply convexHull_min _ (zeroSumSpace : Submodule ℝ (V → ℝ)).convex hz
  rintro _ ⟨u, v, _, rfl⟩
  change pairing (fun _ => 1) (edgeVector u v) = 0
  simp

theorem tightFace_exposed {G : SimpleGraph V} {root : V} {f : V → ℝ} (hf : f ∈ polar G root) :
    IsExposed ℝ (symmetricEdgePolytope G) (tightFace G f) := by
  rintro ⟨w, hw⟩
  let l : StrongDual ℝ (V → ℝ) := ⟨pairing f, (pairing f).continuous_of_finiteDimensional⟩
  have hle := ((polar_iff_polytope_pairing G root f).mp hf).2
  refine ⟨l, ?_⟩
  ext x
  constructor
  · rintro ⟨hx, he⟩
    exact ⟨hx, fun y hy => by change pairing f y ≤ pairing f x; rw [he]; exact hle y hy⟩
  · rintro ⟨hx, hopt⟩
    have hlo : pairing f w ≤ pairing f x := hopt w hw.1
    exact ⟨hx, (hle x hx).antisymm (hw.2 ▸ hlo)⟩

private theorem exposed_eq_tightFace [Nontrivial V] {G : SimpleGraph V} (hG : G.Connected) (root : V)
    {F : Set (V → ℝ)} (he : IsExposed ℝ (symmetricEdgePolytope G) F) (hn : F.Nonempty)
    (hp : F ≠ symmetricEdgePolytope G) : ∃ f ∈ polar G root, F = tightFace G f := by
  obtain ⟨l, hF⟩ := he hn
  obtain ⟨w, hw⟩ := hn
  have hmax : ∀ z ∈ symmetricEdgePolytope G, l z ≤ l w := (hF ▸ hw).2
  have h0 : 0 ≤ l w := by simpa using hmax 0 (zero_mem_polytope hG root)
  have hp' : 0 < l w := by
    by_contra! h
    have hz : l w = 0 := le_antisymm h h0
    have he₀ : symmetricEdgePolytope G ⊆ LinearMap.ker l.toLinearMap := by
      apply convexHull_min _ (LinearMap.ker l.toLinearMap).convex
      rintro _ ⟨u, v, huv, rfl⟩
      have h₁ := hmax _ (subset_convexHull ℝ _ ⟨u, v, huv, rfl⟩)
      have h₂ := hmax _ (subset_convexHull ℝ _ ⟨v, u, huv.symm, rfl⟩)
      simp only [edgeVector, map_sub, hz] at h₁ h₂ ⊢
      change l (Pi.single u 1 - Pi.single v 1) = 0
      rw [map_sub]
      linarith
    apply hp
    ext z
    rw [hF]
    exact ⟨fun h => h.1, fun h => ⟨h, fun y hy => by
      have hy0 : l y = 0 := he₀ hy
      have hz0 : l z = 0 := he₀ h
      rw [hy0, hz0]⟩⟩
  let f (v : V) := l (edgeVector v root) / l w
  have hf (z : V → ℝ) (hz : z ∈ symmetricEdgePolytope G) : pairing f z = l z / l w := by
    have hsum := sum_smul_edgeVector_eq_of_zeroSum root (zeroSum_of_mem_polytope hz)
    calc
      pairing f z = (∑ v, z v * l (edgeVector v root)) / l w := by
        rw [pairing_apply, sum_div]
        apply sum_congr rfl
        intro v _
        unfold f
        ring
      _ = l z / l w := by
        have hlin := congrArg l hsum
        simp only [map_sum, map_smul, smul_eq_mul] at hlin
        rw [hlin]
  refine ⟨f, (polar_iff_polytope_pairing G root f).mpr ⟨by simp [f, edgeVector], ?_⟩, ?_⟩
  · intro z hz
    rw [hf z hz, div_le_one hp']
    exact hmax z hz
  · rw [hF]
    ext z
    constructor
    · rintro ⟨hz, hzmax⟩
      refine ⟨hz, ?_⟩
      rw [hf z hz, div_eq_one_iff_eq hp'.ne']
      exact (hmax z hz).antisymm (hzmax w (hF ▸ hw).1)
    · rintro ⟨hz, hh⟩
      have ee : l z = l w := by rwa [hf z hz, div_eq_one_iff_eq hp'.ne'] at hh
      exact ⟨hz, fun a ha => ee ▸ hmax a ha⟩

private theorem tightFace_mono {G : SimpleGraph V} {root : V} {f g : V → ℝ}
    (hf : f ∈ polar G root)
    (h : ∀ u v, G.Adj u v → f u - f v = 1 → g u - g v = 1) : tightFace G f ⊆ tightFace G g := by
  rintro x ⟨hx, he⟩
  obtain ⟨ι, hi, w, p, h0, h1, hp, hsum⟩ := mem_convexHull_iff_exists_fintype.mp hx
  have hf₀ i : pairing f (p i) ≤ 1 := ((polar_iff_polytope_pairing G root f).mp hf).2 _
    (subset_convexHull ℝ _ (hp i))
  have hd : (∑ i, w i * pairing f (p i)) = 1 := by
    have hh := congrArg (pairing f) hsum
    simp only [map_sum, map_smul, smul_eq_mul] at hh
    exact hh.trans he
  have hz : ∑ i, w i * (1 - pairing f (p i)) = 0 := by
    simp_rw [mul_sub, mul_one, sum_sub_distrib, h1, hd, sub_self]
  have hh (i : ι) : w i * pairing g (p i) = w i := by
    by_cases hn : w i = 0
    · simp [hn]
    · have hle : w i * (1 - pairing f (p i)) ≤ 0 := by
        rw [← hz]
        exact single_le_sum (f := fun j => w j * (1 - pairing f (p j)))
          (fun j _ => mul_nonneg (h0 j) (sub_nonneg.mpr (hf₀ j))) (Finset.mem_univ i)
      have he' : pairing f (p i) = 1 := by
        have hwi := lt_of_le_of_ne (h0 i) (Ne.symm hn)
        by_contra! nn
        have hlt := lt_of_le_of_ne (hf₀ i) nn
        have := mul_pos hwi (sub_pos.mpr hlt)
        linarith
      obtain ⟨u, v, huv, hu⟩ := hp i
      rw [hu, pairing_edgeVector] at he' ⊢
      rw [h u v huv he', mul_one]
  refine ⟨hx, ?_⟩
  rw [← hsum, map_sum]
  simp_rw [map_smul, smul_eq_mul, hh, h1]

private theorem tightGraph_le_of_face_le {G : SimpleGraph V} {f g : V → ℝ}
    (hfg : tightFace G f ⊆ tightFace G g) : tightGraph G f ≤ tightGraph G g := by
  intro u v he
  refine ⟨he.1, ?_⟩
  by_cases h : 0 ≤ f u - f v
  · have e : f u - f v = 1 := by simpa [abs_of_nonneg h] using he.2
    have hg := (hfg ⟨subset_convexHull ℝ _ ⟨u, v, he.1, rfl⟩, (pairing_edgeVector f u v).trans e⟩).2
    rw [pairing_edgeVector] at hg
    simp [hg]
  · have e : f v - f u = 1 := by
      have h' : |f u - f v| = 1 := he.2
      rw [abs_of_neg (lt_of_not_ge h)] at h'
      linarith
    have hg := (hfg ⟨subset_convexHull ℝ _ ⟨v, u, he.1.symm, rfl⟩, (pairing_edgeVector f v u).trans e⟩).2
    rw [pairing_edgeVector] at hg
    rw [abs_sub_comm, hg, abs_one]

private theorem normal_eq_of_face_le {G : SimpleGraph V} {root : V} {f g : V → ℝ}
    (hf : f ∈ polar G root) (hg : g ∈ polar G root) (hc : (tightGraph G f).Connected)
    (hle : tightFace G f ⊆ tightFace G g) : f = g := by
  have hsign (u v : V) (e : G.Adj u v) (h : f u - f v = 1) : g u - g v = 1 := by
    have ht : edgeVector u v ∈ tightFace G f :=
      ⟨subset_convexHull ℝ _ ⟨u, v, e, rfl⟩, (pairing_edgeVector f u v).trans h⟩
    have hh := (hle ht).2
    rwa [pairing_edgeVector] at hh
  have hstep {u v : V} (e : (tightGraph G f).Adj u v) : f u - g u = f v - g v := by
    have he : |f u - f v| = 1 := e.2
    by_cases hn : 0 ≤ f u - f v
    · rw [abs_of_nonneg hn] at he
      linarith [hsign u v e.1 he]
    · rw [abs_of_neg (lt_of_not_ge hn)] at he
      linarith [hsign v u e.1.symm (by linarith)]
  funext v
  have e := eq_of_reachable (G := tightGraph G f) (fun u => f u - g u)
    (fun _ _ e => hstep e) (hc root v)
  change f root - g root = f v - g v at e
  rw [hf.1, hg.1] at e
  linarith

private theorem tightFace_ne_polytope [Nontrivial V] {G : SimpleGraph V} (hG : G.Connected)
    (root : V) (f : V → ℝ) : tightFace G f ≠ symmetricEdgePolytope G := by
  intro e
  have h : (0 : V → ℝ) ∈ tightFace G f := e.symm ▸ zero_mem_polytope hG root
  have h' : pairing f 0 = 1 := h.2
  simp at h'

theorem facet_of_extreme_polar [Nontrivial V] {G : SimpleGraph V} (hG : G.Connected)
    (root : V) {f : V → ℝ} (hf : f ∈ (polar G root).extremePoints ℝ) : IsFacet G (tightFace G f) := by
  obtain ⟨hf0, hfc⟩ := mem_extreme_polar_iff.mp hf
  obtain ⟨v, e⟩ := hfc.preconnected.exists_adj_of_nontrivial root
  have hn : (tightFace G f).Nonempty := by
    have ee : |f root - f v| = 1 := e.2
    by_cases h : 0 ≤ f root - f v
    · rw [abs_of_nonneg h] at ee
      exact ⟨edgeVector root v, subset_convexHull ℝ _ ⟨root, v, e.1, rfl⟩,
        (pairing_edgeVector f root v).trans ee⟩
    · rw [abs_of_neg (lt_of_not_ge h)] at ee
      exact ⟨edgeVector v root, subset_convexHull ℝ _ ⟨v, root, e.1.symm, rfl⟩,
        (pairing_edgeVector f v root).trans (by linarith)⟩
  refine ⟨tightFace_exposed hf0, hn, tightFace_ne_polytope hG root f, ?_⟩
  intro S hS hp hle
  obtain ⟨g, hg, he⟩ := exposed_eq_tightFace hG root hS (hn.mono hle) hp
  rw [he] at hle ⊢
  rw [normal_eq_of_face_le hf0 hg hfc hle]

private theorem extreme_of_facet_normal [Nontrivial V] {G : SimpleGraph V} (hG : G.Connected)
    (root : V) {f : V → ℝ} (hf : f ∈ polar G root) (hfacet : IsFacet G (tightFace G f)) :
    f ∈ (polar G root).extremePoints ℝ := by
  let E : Set (V × V) := {uv | G.Adj uv.1 uv.2 ∧ f uv.2 - f uv.1 = 1}
  have hE (uv : V × V) (huv : uv ∈ E) : G.Adj uv.1 uv.2 := huv.1
  have hn : (orientedEdgeFace G root E).Nonempty := ⟨f, hf, fun _ huv => huv.2⟩
  obtain ⟨g, hg, hge⟩ := exists_polar_vertex_of_nonempty_orientedEdgeFace hG root E hE hn
  have hle : tightFace G f ⊆ tightFace G g := tightFace_mono hf fun u v e he =>
    hg.2 (v, u) ⟨e.symm, he⟩
  have he := hfacet.2.2.2 (tightFace G g) (tightFace_exposed hge.1) (tightFace_ne_polytope hG root g) hle
  have hc := (mem_extreme_polar_iff.mp hge).2.mono (tightGraph_le_of_face_le he.ge)
  exact mem_extreme_polar_iff.mpr ⟨hf, hc⟩

/-- Actual facets of the symmetric edge polytope correspond to extreme
points of the normalized polar, with the normal fixed by its root value. -/
noncomputable def polarVerticesEquivFacets [Nontrivial V] {G : SimpleGraph V}
    (hG : G.Connected) (root : V) : ((polar G root).extremePoints ℝ) ≃ {F // IsFacet G F} := by
  let f (p : ((polar G root).extremePoints ℝ)) : {F // IsFacet G F} :=
    ⟨tightFace G p.val, facet_of_extreme_polar hG root p.property⟩
  refine Equiv.ofBijective f ⟨?_, ?_⟩
  · intro p q he
    have hpq : tightFace G p.val = tightFace G q.val := congrArg Subtype.val he
    exact Subtype.ext (normal_eq_of_face_le p.property.1 q.property.1
      (mem_extreme_polar_iff.mp p.property).2 hpq.le)
  · intro F
    obtain ⟨g, hg, he⟩ := exposed_eq_tightFace hG root F.property.1 F.property.2.1 F.property.2.2.1
    have hfacet : IsFacet G (tightFace G g) := he ▸ F.property
    exact ⟨⟨g, extreme_of_facet_normal hG root hg hfacet⟩, Subtype.ext he.symm⟩

theorem finite_facets [Nontrivial V] {G : SimpleGraph V} (hG : G.Connected) (root : V) :
    Finite {F // IsFacet G F} := by
  have := finite_polar_vertices hG root
  exact Finite.of_equiv _ (polarVerticesEquivFacets hG root)

end BraunBruegge
