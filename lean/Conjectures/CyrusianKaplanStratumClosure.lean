module
public import Mathlib.Analysis.Normed.Module.Basic
public import Mathlib.Analysis.SpecificLimits.Basic
public import Mathlib.Topology.Order.Basic
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan

open Filter Set
open scoped Topology

/-- Equality indices and oriented negative indices of a sign
stratum. A positive sign is represented by negating its form. -/
def strictAffineStratum {E ι : Type*} (f : ι→E→ℝ) (I₀ Iminus : Set ι) : Set E :=
  {x | (∀ i∈I₀,f i x=0) ∧ (∀ i∈Iminus,f i x<0)}

def weakAffineStratum {E ι : Type*} (f : ι→E→ℝ) (I₀ Iminus : Set ι) : Set E :=
  {x | (∀ i∈I₀,f i x=0) ∧ (∀ i∈Iminus,f i x≤0)}

private theorem isClosed_weakAffineStratum {E ι : Type*} [TopologicalSpace E]
    (f : ι→E→ℝ) (I₀ Iminus : Set ι) (hf : ∀ i,Continuous (f i)) :
    IsClosed (weakAffineStratum f I₀ Iminus) := by
  have h :
      (⋂ i : I₀,{x : E | f i.val x=0}) ∩ (⋂ i : Iminus,{x : E | f i.val x≤0}) =
        weakAffineStratum f I₀ Iminus := by
    ext x
    change (_ ∧ _) ↔ (_ ∧ _)
    simp only [Set.mem_iInter,Set.mem_ofPred_eq]
    exact ⟨fun ⟨a,b⟩=>⟨fun i hi=>a ⟨i,hi⟩,fun i hi=>b ⟨i,hi⟩⟩,
      fun ⟨a,b⟩=>⟨fun i=>a i.val i.property,fun i=>b i.val i.property⟩⟩
  rw [← h]
  exact (isClosed_iInter (fun i : I₀ => isClosed_eq (hf i.val) continuous_const)).inter
    (isClosed_iInter (fun i : Iminus => isClosed_le (hf i.val) continuous_const))

/-- For a nonempty strict sign stratum, replacing strict constraints
by weak constraints gives exactly its closure. The same interior
witness approximates a weak point by convex combinations, uniformly
over all the prescribed signs. -/
theorem closure_strictAffineStratum_eq {E ι : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (f : ι→E→ℝ) (I₀ Iminus : Set ι) (hf : ∀ i,Continuous (f i))
    (hAff : ∀ (i : ι) (x y : E) (t : ℝ),
      f i ((1-t)•x+t•y)=(1-t)*f i x+t*f i y)
    (hN : (strictAffineStratum f I₀ Iminus).Nonempty) :
    closure (strictAffineStratum f I₀ Iminus)=weakAffineStratum f I₀ Iminus := by
  apply le_antisymm
  · apply closure_minimal _ (isClosed_weakAffineStratum f I₀ Iminus hf)
    intro x hx
    exact ⟨hx.1,fun i hi=>(hx.2 i hi).le⟩
  · intro x (hx : x∈weakAffineStratum f I₀ Iminus)
    obtain ⟨y,hy⟩ := hN
    let u (n : ℕ) : ℝ := 1/((n:ℝ)+1)
    let z (n : ℕ) : E := (1-u n)•x+u n•y
    have hU : Tendsto u atTop (𝓝 0) := tendsto_one_div_add_atTop_nhds_zero_nat
    have hOne : Tendsto (fun _ : ℕ=>(1:ℝ)) atTop (𝓝 1) := tendsto_const_nhds
    have hX : Tendsto (fun _ : ℕ=>x) atTop (𝓝 x) := tendsto_const_nhds
    have hY : Tendsto (fun _ : ℕ=>y) atTop (𝓝 y) := tendsto_const_nhds
    have hL : Tendsto z atTop (𝓝 x) := by
      simpa only [z,sub_zero,one_smul,zero_smul,add_zero] using
        (((hOne.sub hU).smul hX).add (hU.smul hY))
    apply mem_closure_of_tendsto hL
    apply Filter.Eventually.of_forall
    intro n
    have hP : 0<u n := by unfold u; positivity
    have hQ : 0≤1-u n := by
      apply sub_nonneg.mpr
      unfold u
      apply (div_le_one₀ (show (0 : ℝ) < (n : ℝ) + 1 by positivity)).mpr
      exact le_add_of_nonneg_left (Nat.cast_nonneg _)
    change (∀ i∈I₀,f i (z n)=0) ∧ (∀ i∈Iminus,f i (z n)<0)
    refine ⟨?_,?_⟩
    · intro i hi
      change f i ((1-u n)•x+u n•y)=0
      rw [hAff,hx.1 i hi,hy.1 i hi,mul_zero,mul_zero,add_zero]
    · intro i hi
      change f i ((1-u n)•x+u n•y)<0
      rw [hAff]
      exact add_neg_of_nonpos_of_neg (mul_nonpos_of_nonneg_of_nonpos hQ (hx.2 i hi))
        (mul_neg_of_pos_of_neg hP (hy.2 i hi))

end CyrusianKaplan
