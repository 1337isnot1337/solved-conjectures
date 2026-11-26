module
public import Conjectures.PomeranceSarkozyCountableVariation

@[expose] public section
namespace PomeranceSarkozy

open scoped ENNReal

variable {A B : Type*}

noncomputable def atomicPush (f : A→B) (p : A→ℝ) (b : B) : ℝ :=
  ∑' a : ↥(f ⁻¹' {b}),p a.val

/-- Summing over the fibers of a statistic cannot increase the L1
distance, including when the individual supports are countably infinite. -/
theorem atomicPush_l1_le (f : A→B) (p q : A→ℝ) (hp : ∀ a,0≤p a) (hq : ∀ a,0≤q a)
    (hps : Summable p) (hqs : Summable q) :
    atomicL1 (atomicPush f p) (atomicPush f q)≤atomicL1 p q := by
  have habs : Summable (fun a => |p a-q a|) := by
    refine Summable.of_nonneg_of_le (fun _ => abs_nonneg _) (fun a => ?_) (hps.add hqs)
    exact (abs_sub _ _).trans_eq (by rw [abs_of_nonneg (hp a),abs_of_nonneg (hq a)])
  have he (b : B) :
      ENNReal.ofReal |atomicPush f p b-atomicPush f q b| ≤
        ∑' a : ↥(f ⁻¹' {b}),ENNReal.ofReal |p a.val-q a.val| := by
    unfold atomicPush
    let S : Set A := f ⁻¹' {b}
    have hp' : Summable (fun a : ↥S => p a.val) := hps.subtype S
    have hq' : Summable (fun a : ↥S => q a.val) := hqs.subtype S
    have ha' : Summable (fun a : ↥S => |p a.val-q a.val|) := habs.subtype S
    have hn : Summable (fun a : ↥S => ‖p a.val-q a.val‖) := by
      simpa only [Real.norm_eq_abs] using ha'
    change ENNReal.ofReal |(∑' a : ↥S,p a.val)-(∑' a : ↥S,q a.val)| ≤ _
    rw [← hp'.tsum_sub hq',← ENNReal.ofReal_tsum_of_nonneg (fun _ => abs_nonneg _) ha']
    apply ENNReal.ofReal_le_ofReal
    simpa only [Real.norm_eq_abs] using norm_tsum_le_tsum_norm hn
  unfold atomicL1
  exact (ENNReal.tsum_le_tsum he).trans_eq (ENNReal.tsum_fiberwise (fun a => ENNReal.ofReal |p a-q a|) f)

end PomeranceSarkozy
