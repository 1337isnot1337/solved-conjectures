import Conjectures.LonelinessDistanceColoring
import Conjectures.LonelinessFiveSpeedClassificationCore

/-! The five-distance graph consequence, with the finite five-speed
exhaustion proof as an explicit assembly input. -/

namespace Loneliness.FiveSpeedCertificate

theorem triangle_free_five_distance_colorable_of_exhaustion
    (hexhaustion : SporadicExhaustion) (ds : List ℕ)
    (hlen : ds.length = 5) (hdistinct : ds.Nodup) (hpositive : ∀ a ∈ ds, 0 < a)
    (hfree : (DistanceColoring.graph ds).CliqueFree 3) :
    (DistanceColoring.graph ds).Colorable 5 := by
  apply DistanceColoring.colorable_of_value ds 5 (by decide)
  exact five_speed_value_ge_fifth_of_no_additive hexhaustion ds hlen hdistinct hpositive
    (DistanceColoring.triangleFree_no_additive ds hpositive hfree)

end Loneliness.FiveSpeedCertificate
