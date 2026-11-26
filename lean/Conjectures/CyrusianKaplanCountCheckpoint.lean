module
public import Conjectures.CyrusianKaplanDilation
public import Conjectures.CyrusianKaplanBaselineCount

@[expose] public section
namespace CyrusianKaplan

open Finset

noncomputable def normalizedEncodingPairs (g r : ℕ) (hg : 0<g) :
    Finset (Finset ℕ × Finset ℕ) := by
  classical
  let s := positiveScaleEmbedding (g:ℝ)⁻¹ (inv_pos.mpr (by exact_mod_cast hg))
  exact (((Finset.Ioo g (2*g)).powersetCard r) ×ˢ ((Finset.Icc 1 g).powersetCard r)).filter
    (fun z=>RealAdmissibleEncoding 1 r ((z.1.map natRealEmbedding).map s)
      ((z.2.map natRealEmbedding).map s))

theorem normalizedEncodingPairs_eq (g r : ℕ) (hg : 0<g) :
    normalizedEncodingPairs g r hg=admissibleEncodingPairs g r := by
  classical
  ext ⟨A,B⟩
  have h := mem_admissibleEncodingPairs_normalized_iff g r hg A B
  unfold normalizedEncodingPairs
  rw [Finset.mem_filter,← h]
  constructor
  · exact fun hh=>hh.2
  · intro hAB
    refine ⟨?_,hAB⟩
    obtain ⟨hA,hB,_⟩ := (mem_admissibleEncodingPairs_iff g r A B).mp hAB
    exact Finset.mem_product.mpr ⟨Finset.mem_powersetCard.mpr hA,Finset.mem_powersetCard.mpr hB⟩

/-- The literal ordinal count equals the number of integer pairs
selected by the same normalized real region at every positive g.
This is the geometric input, not yet Ehrhart counting. -/
theorem exact_ordinarization_count_normalized (g r : ℕ) (hg : 0<g) :
    Nat.card (ExactOrdinarizationClass g r)=(normalizedEncodingPairs g r hg).card := by
  rw [normalizedEncodingPairs_eq,exact_ordinarization_count]

end CyrusianKaplan
