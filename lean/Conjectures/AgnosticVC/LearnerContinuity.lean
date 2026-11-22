module

public import Conjectures.AgnosticVC.OptimizerInterior
public import Mathlib.Topology.Maps.Proper.Basic

/-! Measurability of the optimizer for a full vector of random loss weights. -/

@[expose] public section

namespace AgnosticVC

variable {α κ : Type*} [Fintype α] [Nonempty α] [Fintype κ]
variable {γ : κ → Type*} [∀ j, Fintype (γ j)]

/-- At fixed positive full temperature and nonnegative restriction coefficients, the
entire optimizing probability vector is continuous in all losses simultaneously. -/
theorem continuous_optimizer {τ : ℝ} {coeff : κ → ℝ} (hτ : 0 < τ) (hc : ∀ j, 0 ≤ coeff j)
    (restriction : ∀ j, α → γ j) :
    Continuous (fun loss : α → ℝ => optimizer loss τ coeff restriction) := by
  let P := {p : α → ℝ // IsLaw p}
  let : CompactSpace P := isCompact_iff_compactSpace.mp isCompact_laws
  let f : (α → ℝ) → P := fun L => ⟨optimizer L τ coeff restriction, optimizer_isLaw ..⟩
  have joint : Continuous fun z : (α → ℝ) × P =>
      objective z.1 τ coeff restriction z.2.val := by
    have hp : Continuous (fun z : (α → ℝ) × P => (z.2.val : α → ℝ)) :=
      continuous_subtype_val.comp continuous_snd
    have l (i : α) : Continuous fun z : (α → ℝ) × P => z.1 i :=
      (continuous_apply i).comp continuous_fst
    have w (i : α) : Continuous fun z : (α → ℝ) × P => z.2.val i :=
      (continuous_apply i).comp hp
    unfold objective expected
    exact ((continuous_finsetSum _ fun i _ => (w i).mul (l i)).add
      (continuous_const.mul (continuous_negEntropy.comp hp))).add
      (continuous_finsetSum _ fun j _ => continuous_const.mul (continuous_negEntropy.comp
        (continuous_pi fun b => (continuous_marginal_apply (restriction j) b).comp hp)))
  have right (r : P) : Continuous fun z : (α → ℝ) × P =>
      objective z.1 τ coeff restriction r.val := by
    unfold objective expected
    fun_prop
  have graph : f.graph = ⋂ r : P, {z | objective z.1 τ coeff restriction z.2.val ≤
                                         objective z.1 τ coeff restriction r.val} := by
    ext z
    simp only [Set.mem_iInter, Set.mem_ofPred_eq]
    change (f z.1 = z.2) ↔ _
    constructor
    · intro h r
      rw [← h]
      exact optimizer_min _ _ _ _ _ r.property
    · intro h
      apply Subtype.ext
      exact minimizer_unique hτ hc (optimizer_isLaw ..) z.2.property
        (optimizer_min z.1 τ coeff restriction) (fun r hr => h ⟨r,hr⟩)
  have cf : Continuous f := continuous_of_isClosed_graph (graph ▸
    isClosed_iInter (fun r => isClosed_le joint (right r)))
  exact continuous_subtype_val.comp cf

end AgnosticVC
