module
public import Conjectures.CyrusianKaplanHomogeneous
public import Conjectures.CyrusianKaplanExactCount

@[expose] public section
namespace CyrusianKaplan

open Finset

private theorem nat_cast_box_A_iff (g : ℕ) (A : Finset ℕ) :
    (∀ a∈A.map natRealEmbedding,(g:ℝ)<a ∧ a<2*(g:ℝ))↔
      A⊆Finset.Ioo g (2*g) := by
  constructor
  · intro h n hn
    have hmem : (n:ℝ)∈A.map natRealEmbedding := Finset.mem_map.mpr ⟨n,hn,rfl⟩
    have he := h (n:ℝ) hmem
    exact Finset.mem_Ioo.mpr ⟨by exact_mod_cast he.1,by exact_mod_cast he.2⟩
  · intro h x hx
    obtain ⟨n,hn,rfl⟩ := Finset.mem_map.mp hx
    have ha := Finset.mem_Ioo.mp (h hn)
    change (g:ℝ)<(n:ℝ) ∧ (n:ℝ)<2*(g:ℝ)
    exact ⟨by exact_mod_cast ha.1,by exact_mod_cast ha.2⟩

private theorem nat_cast_box_B_iff (g : ℕ) (B : Finset ℕ) :
    (∀ b∈B.map natRealEmbedding,0<b ∧ b≤(g:ℝ))↔
      B⊆Finset.Icc 1 g := by
  constructor
  · intro h n hn
    have hmem : (n:ℝ)∈B.map natRealEmbedding := Finset.mem_map.mpr ⟨n,hn,rfl⟩
    have he := h (n:ℝ) hmem
    exact Finset.mem_Icc.mpr ⟨by exact_mod_cast he.1,by exact_mod_cast he.2⟩
  · intro h x hx
    obtain ⟨n,hn,rfl⟩ := Finset.mem_map.mp hx
    have hb := Finset.mem_Icc.mp (h hn)
    change (0:ℝ)<(n:ℝ) ∧ (n:ℝ)≤(g:ℝ)
    have hp : 0<n := hb.1
    exact ⟨by exact_mod_cast hp,by exact_mod_cast hb.2⟩

theorem mem_admissibleEncodingPairs_real_iff (g r : ℕ) (A B : Finset ℕ) :
    (A,B)∈admissibleEncodingPairs g r ↔
      RealAdmissibleEncoding (g:ℝ) r (A.map natRealEmbedding) (B.map natRealEmbedding) := by
  rw [mem_admissibleEncodingPairs_iff]
  unfold RealAdmissibleEncoding
  rw [Finset.card_map,Finset.card_map,nat_cast_box_A_iff,nat_cast_box_B_iff]
  constructor
  · rintro ⟨⟨hA,hAC⟩,⟨hB,hBC⟩,hT⟩
    exact ⟨hAC,hBC,hA,hB,(realEncodingTests_nat_iff g A B hA hB).mpr hT⟩
  · rintro ⟨hAC,hBC,hA,hB,hT⟩
    exact ⟨⟨hA,hAC⟩,⟨hB,hBC⟩,(realEncodingTests_nat_iff g A B hA hB).mp hT⟩

/-- The actual integer encoding set at every positive genus is
obtained from the same genus-one real region by inverse scaling.
The strict boundary inequalities are preserved exactly. -/
theorem mem_admissibleEncodingPairs_normalized_iff (g r : ℕ) (hg : 0<g) (A B : Finset ℕ) :
    (A,B)∈admissibleEncodingPairs g r ↔
      RealAdmissibleEncoding 1 r
        ((A.map natRealEmbedding).map (positiveScaleEmbedding (g:ℝ)⁻¹
          (inv_pos.mpr (by exact_mod_cast hg))))
        ((B.map natRealEmbedding).map (positiveScaleEmbedding (g:ℝ)⁻¹
          (inv_pos.mpr (by exact_mod_cast hg)))) := by
  have hg' : (0:ℝ)<(g:ℝ) := by exact_mod_cast hg
  have h := realAdmissibleEncoding_scale_iff (c:=(g:ℝ)⁻¹) (g:=(g:ℝ))
    (inv_pos.mpr hg') r (A.map natRealEmbedding) (B.map natRealEmbedding)
  rw [inv_mul_cancel₀ hg'.ne'] at h
  exact (mem_admissibleEncodingPairs_real_iff g r A B).trans h.symm

end CyrusianKaplan
