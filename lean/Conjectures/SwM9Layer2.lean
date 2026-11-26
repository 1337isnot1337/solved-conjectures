import Conjectures.SwM9Layer1
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table2 : RowTrie := T 9 [T 1 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 2 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 3 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 4 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 5 [T 1 [],T 1 [],T 1 [],T 1 []],T 6 [T 1 [],T 1 [],T 1 []],T 7 [T 1 [],T 1 []],T 8 [T 1 []]]
theorem cert2 : countTrie 9 10 2 = table2 := by
  rw [countTrie, cert1]
  all_goals rfl
end SaganWilsonPlacticMode.CertM9
