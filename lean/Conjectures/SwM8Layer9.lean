import Conjectures.SwM8Layer8
namespace SaganWilsonPlacticMode.CertM8
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table9 : RowTrie := T 1450053 [T 767013 [],T 908154 [],T 1044927 [],T 1169982 [],T 1277145 [],T 1361628 [],T 1420023 []]
theorem cert9 : countTrie 8 10 9 = table9 := by
  rw [countTrie, cert8]
  all_goals rfl
end SaganWilsonPlacticMode.CertM8
