import Conjectures.SwM8Layer2
namespace SaganWilsonPlacticMode.CertM8
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table3 : RowTrie := T 36 [T 15 [T 1 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 3 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 5 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 7 [T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 []],T 13 [T 1 []]],T 15 [T 3 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 5 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 7 [T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 []],T 13 [T 1 []]],T 16 [T 5 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 7 [T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 []],T 13 [T 1 []]],T 18 [T 7 [T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 []],T 13 [T 1 []]],T 21 [T 9 [T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 []],T 13 [T 1 []]],T 25 [T 11 [T 1 [],T 1 []],T 13 [T 1 []]],T 30 [T 13 [T 1 []]]]
theorem cert3 : countTrie 8 10 3 = table3 := by
  rw [countTrie, cert2]
  all_goals rfl
end SaganWilsonPlacticMode.CertM8
