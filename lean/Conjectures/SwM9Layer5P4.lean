import Conjectures.SwM9Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
private abbrev f := stepValue 9 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_4 : RowTrie := T 885 [T 286 [T 54 [T 9 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 76 [T 13 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 104 [T 17 [T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 138 [T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 178 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 224 [T 29 [T 1 []]]],T 340 [T 81 [T 13 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 114 [T 17 [T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 153 [T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 198 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 249 [T 29 [T 1 []]]],T 407 [T 119 [T 17 [T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 163 [T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 213 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 269 [T 29 [T 1 []]]],T 491 [T 168 [T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 223 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 284 [T 29 [T 1 []]]],T 596 [T 228 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 294 [T 29 [T 1 []]]],T 726 [T 299 [T 29 [T 1 []]]]]
theorem l5sub_4_cert : tabulate f 9 4 4 [4] = l5sub_4 := by rfl
end SaganWilsonPlacticMode.CertM9
