import Conjectures.SwM9Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
private abbrev f := stepValue 9 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_8 : RowTrie := T 1360 [T 796 [T 228 [T 25 [T 1 [],T 1 []],T 29 [T 1 []]],T 294 [T 29 [T 1 []]]],T 1046 [T 299 [T 29 [T 1 []]]]]
theorem l5sub_8_cert : tabulate f 9 4 8 [8] = l5sub_8 := by rfl
end SaganWilsonPlacticMode.CertM9
