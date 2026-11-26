import Conjectures.SwM10Layer2
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table3 : RowTrie := T 55 [T 19 [T 1 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 3 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 5 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 7 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 [],T 1 []],T 15 [T 1 [],T 1 []],T 17 [T 1 []]],T 19 [T 3 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 5 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 7 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 [],T 1 []],T 15 [T 1 [],T 1 []],T 17 [T 1 []]],T 20 [T 5 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 7 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 [],T 1 []],T 15 [T 1 [],T 1 []],T 17 [T 1 []]],T 22 [T 7 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 [],T 1 []],T 15 [T 1 [],T 1 []],T 17 [T 1 []]],T 25 [T 9 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 11 [T 1 [],T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 [],T 1 []],T 15 [T 1 [],T 1 []],T 17 [T 1 []]],T 29 [T 11 [T 1 [],T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 [],T 1 []],T 15 [T 1 [],T 1 []],T 17 [T 1 []]],T 34 [T 13 [T 1 [],T 1 [],T 1 []],T 15 [T 1 [],T 1 []],T 17 [T 1 []]],T 40 [T 15 [T 1 [],T 1 []],T 17 [T 1 []]],T 47 [T 17 [T 1 []]]]
theorem cert3 : countTrie 10 10 3 = table3 := by
  rw [countTrie, cert2]
  all_goals rfl
end SaganWilsonPlacticMode.CertM10
