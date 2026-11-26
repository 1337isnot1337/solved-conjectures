import Conjectures.SwM9Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
private abbrev f := stepValue 9 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_7 : RowTrie := T 1260 [T 591 [T 168 [T 21 [T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 223 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 284 [T 29 [T 1 []]]],T 771 [T 228 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 294 [T 29 [T 1 []]]],T 991 [T 299 [T 29 [T 1 []]]]]
theorem l5sub_7_cert : tabulate f 9 4 7 [7] = l5sub_7 := by rfl
end SaganWilsonPlacticMode.CertM9
