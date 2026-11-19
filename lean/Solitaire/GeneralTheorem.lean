import Solitaire.StableClassification

/-! The corrected limit-shape theorem for actual arbitrary-layer solitaire
dynamics. Every finite estimate used in the analytic transfer is discharged. -/
namespace SolitaireGeneral

open Filter
open scoped Topology

noncomputable def configurationProfile (a : ℝ) (s : Multiset ℕ) (x : ℝ) : ℝ :=
  profile a s.sum (columns s) x

namespace LayerRule

def referenceState (L : LayerRule) (n : ℕ) : Multiset ℕ :=
  L.stableState (L.referenceIndex n)

theorem referenceState_mass (L : LayerRule) (n : ℕ) :
    (L.referenceState n).sum=L.stableMass (L.referenceIndex n) :=
  L.stableState_mass _

theorem referenceState_columns (L : LayerRule) (n : ℕ) :
    columns (L.referenceState n)=L.stablePile (L.referenceIndex n) :=
  L.stableState_columns _

theorem recurrent_comparison (L : LayerRule) (s : Multiset ℕ)
    (hpos : ∀ j ∈ s, 0 < j) (hn : 0 < s.sum) (hrec : L.Recurrent s) :
    ProfileComparison s.sum (L.stableMass (L.referenceIndex s.sum)) (columns s)
      (L.stablePile (L.referenceIndex s.sum)) := by
  obtain ⟨p,hp,hcycle⟩ := hrec
  let : NeZero p := ⟨by omega⟩
  let C := L.orbitCycle s hpos p hcycle
  have hspec := L.reference_spec s.sum
  have h := C.maximal_stable_interlacing hn (L.referenceIndex s.sum) hspec.1 hspec.2 0
  have hzero : C.piles 0=s := L.orbitCycle_zero s hpos p hcycle
  rw [← C.columns_eq_age hn 0,hzero] at h
  apply L.reference_comparison s.sum hn (columns s)
  intro k
  exact ⟨h.2 k,h.1 k⟩

/-- The explicit estimate for any actual recurrent configuration and its
largest-mass actual stable reference. -/
theorem recurrent_profile_bound (L : LayerRule) (s : Multiset ℕ)
    (hpos : ∀ j ∈ s, 0 < j) (hn : 0 < s.sum) (hrec : L.Recurrent s)
    (a ε x : ℝ) (ha : 0 < a) (hε : 0 < ε) (hx : ε ≤ x) (hscale : 2 ≤ a*ε) :
    |configurationProfile a s x-configurationProfile a (L.referenceState s.sum) x| ≤
      4/(a*ε^2)+Real.sqrt 2/(ε*Real.sqrt (s.sum : ℝ)) := by
  have h := (L.recurrent_comparison s hpos hn hrec).bound a ε x ha hε hx hscale
  simpa only [configurationProfile,referenceState_mass,referenceState_columns] using h

end LayerRule

/-- Uniform convergence for arbitrary rule sequences and every choice of an
actual recurrent state of each positive deck size. -/
theorem corrected_solitaire_uniform (L : ℕ → LayerRule) (states : ℕ → Multiset ℕ)
    (hpos : ∀ n, 0 < n → ∀ j ∈ states n, 0 < j)
    (hmass : ∀ n, 0 < n → (states n).sum=n)
    (hrec : ∀ n, 0 < n → (L n).Recurrent (states n))
    (a : ℕ → ℝ) (hapos : ∀ n, 0 < n → 0 < a n) (ha : Tendsto a atTop atTop)
    (ε : ℝ) (hε : 0 < ε) :
    TendstoUniformlyOn
      (fun n x => configurationProfile (a n) (states n) x-
        configurationProfile (a n) ((L n).referenceState n) x)
      (fun _ => 0) atTop (Set.Ici ε) := by
  apply Metric.tendstoUniformlyOn_iff.mpr
  intro δ hδ
  have herr := (profile_error_tendsto a ha ε hε).eventually (gt_mem_nhds hδ)
  have hscale := (ha.atTop_mul_const hε).eventually_ge_atTop 2
  filter_upwards [herr,hscale,eventually_ge_atTop 1] with n hn hsc hnp
  intro x hx
  have hnpos : 0 < n := by omega
  have hstate : 0 < (states n).sum := by rw [hmass n hnpos]; exact hnpos
  have hb := (L n).recurrent_profile_bound (states n) (hpos n hnpos) hstate
    (hrec n hnpos) (a n) ε x (hapos n hnpos) hε hx hsc
  rw [hmass n hnpos] at hb
  simpa only [Real.dist_eq,zero_sub,abs_neg] using hb.trans_lt hn

/-- Pointwise stable limits transfer to every actual recurrent state sequence. -/
theorem corrected_solitaire_pointwise (L : ℕ → LayerRule) (states : ℕ → Multiset ℕ)
    (hpos : ∀ n, 0 < n → ∀ j ∈ states n, 0 < j)
    (hmass : ∀ n, 0 < n → (states n).sum=n)
    (hrec : ∀ n, 0 < n → (L n).Recurrent (states n))
    (a : ℕ → ℝ) (hapos : ∀ n, 0 < n → 0 < a n) (ha : Tendsto a atTop atTop)
    (x v : ℝ) (hx : 0 < x)
    (hlimit : Tendsto (fun n => configurationProfile (a n) ((L n).referenceState n) x)
      atTop (𝓝 v)) :
    Tendsto (fun n => configurationProfile (a n) (states n) x) atTop (𝓝 v) := by
  have hd := (corrected_solitaire_uniform L states hpos hmass hrec a hapos ha x hx).tendsto_at
    (show x ∈ Set.Ici x by simp)
  simpa using hd.add hlimit

/-- The same theorem with arbitrary layer sets as the input, including infinite
sets. The only required layer is the bottom layer. -/
theorem arbitrary_layers_uniform (layers : ℕ → Set ℕ) (hone : ∀ n, 1 ∈ layers n)
    (states : ℕ → Multiset ℕ)
    (hpos : ∀ n, 0 < n → ∀ j ∈ states n, 0 < j)
    (hmass : ∀ n, 0 < n → (states n).sum=n)
    (hrec : ∀ n, 0 < n → (LayerRule.ofLayers (layers n) (hone n)).Recurrent (states n))
    (a : ℕ → ℝ) (hapos : ∀ n, 0 < n → 0 < a n) (ha : Tendsto a atTop atTop)
    (ε : ℝ) (hε : 0 < ε) :
    TendstoUniformlyOn
      (fun n x => configurationProfile (a n) (states n) x-
        configurationProfile (a n)
          ((LayerRule.ofLayers (layers n) (hone n)).referenceState n) x)
      (fun _ => 0) atTop (Set.Ici ε) :=
  corrected_solitaire_uniform (fun n => LayerRule.ofLayers (layers n) (hone n))
    states hpos hmass hrec a hapos ha ε hε

end SolitaireGeneral
