import Conjectures.SwM8Layer0
namespace SaganWilsonPlacticMode.CertM8
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table1 : RowTrie := T 1 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []]
theorem cert1 : countTrie 8 10 1 = table1 := by
  rw [countTrie, cert0]
  all_goals rfl
end SaganWilsonPlacticMode.CertM8
