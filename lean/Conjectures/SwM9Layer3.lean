import Conjectures.SwM9Layer2
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table3 : RowTrie := T 45 [T 17 [T 1 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 3 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 5 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 7 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 []],T 15 [T 1 []]],T 17 [T 3 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 5 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 7 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 []],T 15 [T 1 []]],T 18 [T 5 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 7 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 []],T 15 [T 1 []]],T 20 [T 7 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 []],T 15 [T 1 []]],T 23 [T 9 [T 1 [],T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 []],T 15 [T 1 []]],T 27 [T 11 [T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 []],T 15 [T 1 []]],T 32 [T 13 [T 1 [],T 1 []],T 15 [T 1 []]],T 38 [T 15 [T 1 []]]]
theorem cert3 : countTrie 9 10 3 = table3 := by
  rw [countTrie, cert2]
  all_goals rfl
end SaganWilsonPlacticMode.CertM9
