import Conjectures.SwM8Layer7
namespace SaganWilsonPlacticMode.CertM8
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table8 : RowTrie := T 226928 [T 118483 [T 43338 [],T 53418 [],T 64478 [],T 76518 [],T 89118 [],T 101374 [],T 111841 []],T 140071 [T 55770 [],T 69966 [],T 85646 [],T 102054 [],T 117914 [],T 131393 []],T 160287 [T 73102 [],T 92422 [],T 112666 [],T 132242 [],T 149013 []],T 178837 [T 96076 [],T 120226 [],T 143714 [],T 164197 []],T 195413 [T 124202 [],T 151826 [],T 176511 []],T 209553 [T 156130 [],T 185479 []],T 220481 [T 190451 []]]
theorem cert8 : countTrie 8 10 8 = table8 := by
  rw [countTrie, cert7]
  all_goals rfl
end SaganWilsonPlacticMode.CertM8
