module
public import Conjectures.PomeranceSarkozyAtomicPush

@[expose] public section
namespace PomeranceSarkozy

open scoped ENNReal

variable {A : Type*}

theorem atomicL1_triangle (p q r : A→ℝ) :
    atomicL1 p r≤atomicL1 p q+atomicL1 q r := by
  unfold atomicL1
  rw [← ENNReal.tsum_add]
  apply ENNReal.tsum_le_tsum
  intro a
  rw [← ENNReal.ofReal_add (abs_nonneg _) (abs_nonneg _)]
  exact ENNReal.ofReal_le_ofReal (abs_sub_le _ _ _)

/-- Event probability discrepancy is bounded by the atom L1 distance
on the full support. -/
theorem atomicEvent_difference_le (p q : A→ℝ) (hps : Summable p) (hqs : Summable q)
    (hp : ∀ a,0≤p a) (hq : ∀ a,0≤q a) (S : Set A) :
    ENNReal.ofReal |(∑' a : ↥S,p a.val)-(∑' a : ↥S,q a.val)|≤atomicL1 p q := by
  have hd : Summable (fun a : ↥S => |p a.val-q a.val|) := by
    apply Summable.of_nonneg_of_le (fun _ => abs_nonneg _) _ ((hps.add hqs).subtype S)
    intro a
    change |p a.val-q a.val|≤p a.val+q a.val
    exact (abs_sub _ _).trans_eq (by rw [abs_of_nonneg (hp _),abs_of_nonneg (hq _)])
  have hp' : Summable (fun a : ↥S => p a.val) := hps.subtype S
  have hq' : Summable (fun a : ↥S => q a.val) := hqs.subtype S
  have hn : Summable (fun a : ↥S => ‖p a.val-q a.val‖) := by
    simpa only [Real.norm_eq_abs] using hd
  rw [← hp'.tsum_sub hq']
  calc
    _ ≤ ∑' a : ↥S, ENNReal.ofReal |p a.val-q a.val| := by
      rw [← ENNReal.ofReal_tsum_of_nonneg (fun _ => abs_nonneg _) hd]
      apply ENNReal.ofReal_le_ofReal
      simpa only [Real.norm_eq_abs] using norm_tsum_le_tsum_norm hn
    _ ≤ _ := ENNReal.tsum_comp_le_tsum_of_injective (f:=(Subtype.val : ↥S→A))
      Subtype.val_injective (fun a => ENNReal.ofReal |p a-q a|)

end PomeranceSarkozy
