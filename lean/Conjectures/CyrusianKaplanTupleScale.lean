module
public import Conjectures.CyrusianKaplanLatticeFibres

@[expose] public section
namespace CyrusianKaplan
open Set

private theorem indexedFinset_positive_scale {r : ℕ} (a : Fin r→ℝ) {c : ℝ} (hc : 0<c) :
    indexedFinset (fun j => c*a j) =
      (indexedFinset a).map (positiveScaleEmbedding c hc) := by
  ext z
  rw [mem_indexedFinset_iff]
  constructor
  · rintro ⟨i,rfl⟩
    exact Finset.mem_map.mpr ⟨a i,(mem_indexedFinset_iff _ _).mpr ⟨i,rfl⟩,rfl⟩
  · rintro hz
    obtain ⟨x,hx,he⟩ := Finset.mem_map.mp hz
    obtain ⟨i,rfl⟩ := (mem_indexedFinset_iff _ _).mp hx
    exact ⟨i,he⟩

theorem admissibleTupleRegion_scale_iff {r : ℕ} {c : ℝ} (hc : 0<c)
    (g : ℝ) (z : TupleSpace r) :
    c • z∈admissibleTupleRegion r (c*g) ↔ z∈admissibleTupleRegion r g := by
  let a := z.1
  let b := z.2
  have hMono (u : Fin r→ℝ) : StrictMono (fun i => c*u i) ↔ StrictMono u := by
    constructor
    · intro h i j hij
      exact lt_of_mul_lt_mul_left (h hij) hc.le
    · intro h i j hij
      exact mul_lt_mul_of_pos_left (h hij) hc
  change (StrictMono (fun i => c*a i) ∧ StrictMono (fun i => c*b i) ∧
      RealAdmissibleEncoding (c*g) r (indexedFinset (fun i => c*a i))
        (indexedFinset (fun i => c*b i))) ↔
    (StrictMono a ∧ StrictMono b ∧
      RealAdmissibleEncoding g r (indexedFinset a) (indexedFinset b))
  rw [hMono,hMono,indexedFinset_positive_scale a hc,indexedFinset_positive_scale b hc,
    realAdmissibleEncoding_scale_iff hc]

end CyrusianKaplan
