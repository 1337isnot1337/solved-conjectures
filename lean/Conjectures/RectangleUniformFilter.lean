import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic.Linarith

/-! The joint filter for h tending to infinity uniformly over all w >= h. -/
namespace RectangleUniform

open Filter
open scoped Topology

def regime : Filter (ℕ × ℕ) :=
  (Filter.comap Prod.fst atTop) ⊓ Filter.principal {p | p.1 ≤ p.2}

theorem eventually_regime_iff (P : ℕ × ℕ → Prop) :
    (∀ᶠ p in regime, P p) ↔ ∀ᶠ h : ℕ in atTop, ∀ w : ℕ, h ≤ w → P (h,w) := by
  rw [regime, eventually_inf_principal, eventually_comap]
  simp only [Set.mem_ofPred_eq]
  constructor
  · intro hp
    filter_upwards [hp] with h hh
    intro w hw
    exact hh (h,w) rfl hw
  · intro hp
    filter_upwards [hp] with h hh
    rintro ⟨a,b⟩ hab hw
    dsimp only at hab hw ⊢
    subst a
    exact hh b hw

instance : NeBot regime := by
  refine ⟨fun hb => ?_⟩
  have hf : ∀ᶠ p in regime, False := by rw [hb]; simp
  have hh := (eventually_regime_iff (fun _ => False)).1 hf
  obtain ⟨h, hh⟩ := hh.exists
  exact hh h le_rfl

theorem fst_tendsto : Tendsto (fun p : ℕ × ℕ => p.1) regime atTop :=
  Filter.tendsto_comap.mono_left inf_le_left

theorem ordered_eventually : ∀ᶠ p in regime, p.1 ≤ p.2 := by
  rw [eventually_regime_iff]
  exact Eventually.of_forall (fun h w hw => hw)

theorem snd_tendsto : Tendsto (fun p : ℕ × ℕ => p.2) regime atTop :=
  tendsto_atTop_mono' _ ordered_eventually fst_tendsto

theorem area_tendsto : Tendsto (fun p : ℕ × ℕ => ((p.1*p.2 : ℕ) : ℝ)) regime atTop := by
  have hn : Tendsto (fun p : ℕ × ℕ => p.1*p.2) regime atTop := by
    apply tendsto_atTop_mono' _ ?_ fst_tendsto
    filter_upwards [fst_tendsto.eventually (eventually_gt_atTop 0), ordered_eventually] with p hp ho
    nlinarith
  exact tendsto_natCast_atTop_atTop.comp hn

/-- Two uniform multiplicative estimates determine the normalized limit. -/
theorem ratio_tendsto {ι : Type*} {l : Filter ι} (X S : ι → ℝ) (C : ℝ)
    (hS : ∀ᶠ x in l, 0 < S x)
    (hlo : ∀ ε : ℝ, 0 < ε → ∀ᶠ x in l, (C-ε)*S x ≤ X x)
    (hhi : ∀ ε : ℝ, 0 < ε → ∀ᶠ x in l, X x ≤ (C+ε)*S x) :
    Tendsto (fun x => X x/S x) l (𝓝 C) := by
  apply tendsto_order.2
  constructor
  · intro a ha
    have he : 0 < (C-a)/2 := by linarith
    filter_upwards [hS,hlo ((C-a)/2) he] with x hs hx
    have hr := (le_div_iff₀ hs).2 hx
    linarith
  · intro b hb
    have he : 0 < (b-C)/2 := by linarith
    filter_upwards [hS,hhi ((b-C)/2) he] with x hs hx
    have hr := (div_le_iff₀ hs).2 hx
    linarith

end RectangleUniform
