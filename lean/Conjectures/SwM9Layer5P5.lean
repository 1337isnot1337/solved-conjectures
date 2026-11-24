import Conjectures.SwM9Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
private abbrev f := stepValue 9 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_5 : RowTrie := T 1020 [T 350 [T 81 [T 13 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 114 [T 17 [T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 153 [T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 198 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 249 [T 29 [T 1 []]]],T 432 [T 119 [T 17 [T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 163 [T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 213 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 269 [T 29 [T 1 []]]],T 536 [T 168 [T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 223 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 284 [T 29 [T 1 []]]],T 666 [T 228 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 294 [T 29 [T 1 []]]],T 826 [T 299 [T 29 [T 1 []]]]]
theorem l5sub_5_cert : tabulate f 9 4 5 [5] = l5sub_5 := by rfl
end SaganWilsonPlacticMode.CertM9
