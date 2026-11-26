import Conjectures.OrdinaryDarcaisWeightData

namespace OrdinaryDarcais

set_option Elab.async false
set_option maxRecDepth 10000

private theorem weight32 : weightAt 32 = divisorSum 32 := by decide +kernel
private theorem weight33 : weightAt 33 = divisorSum 33 := by decide +kernel
private theorem weight34 : weightAt 34 = divisorSum 34 := by decide +kernel
private theorem weight35 : weightAt 35 = divisorSum 35 := by decide +kernel
private theorem weight36 : weightAt 36 = divisorSum 36 := by decide +kernel
private theorem weight37 : weightAt 37 = divisorSum 37 := by decide +kernel
private theorem weight38 : weightAt 38 = divisorSum 38 := by decide +kernel
private theorem weight39 : weightAt 39 = divisorSum 39 := by decide +kernel
private theorem weight40 : weightAt 40 = divisorSum 40 := by decide +kernel
private theorem weight41 : weightAt 41 = divisorSum 41 := by decide +kernel
private theorem weight42 : weightAt 42 = divisorSum 42 := by decide +kernel
private theorem weight43 : weightAt 43 = divisorSum 43 := by decide +kernel
private theorem weight44 : weightAt 44 = divisorSum 44 := by decide +kernel
private theorem weight45 : weightAt 45 = divisorSum 45 := by decide +kernel
private theorem weight46 : weightAt 46 = divisorSum 46 := by decide +kernel
private theorem weight47 : weightAt 47 = divisorSum 47 := by decide +kernel
private theorem weight48 : weightAt 48 = divisorSum 48 := by decide +kernel
private theorem weight49 : weightAt 49 = divisorSum 49 := by decide +kernel
private theorem weight50 : weightAt 50 = divisorSum 50 := by decide +kernel
private theorem weight51 : weightAt 51 = divisorSum 51 := by decide +kernel
private theorem weight52 : weightAt 52 = divisorSum 52 := by decide +kernel
private theorem weight53 : weightAt 53 = divisorSum 53 := by decide +kernel
private theorem weight54 : weightAt 54 = divisorSum 54 := by decide +kernel
private theorem weight55 : weightAt 55 = divisorSum 55 := by decide +kernel
private theorem weight56 : weightAt 56 = divisorSum 56 := by decide +kernel
private theorem weight57 : weightAt 57 = divisorSum 57 := by decide +kernel
private theorem weight58 : weightAt 58 = divisorSum 58 := by decide +kernel
private theorem weight59 : weightAt 59 = divisorSum 59 := by decide +kernel
private theorem weight60 : weightAt 60 = divisorSum 60 := by decide +kernel
private theorem weight61 : weightAt 61 = divisorSum 61 := by decide +kernel
private theorem weight62 : weightAt 62 = divisorSum 62 := by decide +kernel
private theorem weight63 : weightAt 63 = divisorSum 63 := by decide +kernel

theorem weights032To063 (i : ℕ) (lo : 32 ≤ i) (hi : i ≤ 63) : weightAt i = divisorSum i := by
  interval_cases i
  · exact weight32
  · exact weight33
  · exact weight34
  · exact weight35
  · exact weight36
  · exact weight37
  · exact weight38
  · exact weight39
  · exact weight40
  · exact weight41
  · exact weight42
  · exact weight43
  · exact weight44
  · exact weight45
  · exact weight46
  · exact weight47
  · exact weight48
  · exact weight49
  · exact weight50
  · exact weight51
  · exact weight52
  · exact weight53
  · exact weight54
  · exact weight55
  · exact weight56
  · exact weight57
  · exact weight58
  · exact weight59
  · exact weight60
  · exact weight61
  · exact weight62
  · exact weight63

end OrdinaryDarcais
