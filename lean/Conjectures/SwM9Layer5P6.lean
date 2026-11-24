import Conjectures.SwM9Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
private abbrev f := stepValue 9 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_6 : RowTrie := T 1146 [T 447 [T 119 [T 17 [T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 163 [T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 213 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 269 [T 29 [T 1 []]]],T 571 [T 168 [T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 223 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 284 [T 29 [T 1 []]]],T 726 [T 228 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 294 [T 29 [T 1 []]]],T 916 [T 299 [T 29 [T 1 []]]]]
theorem l5sub_6_cert : tabulate f 9 4 6 [6] = l5sub_6 := by rfl
end SaganWilsonPlacticMode.CertM9
