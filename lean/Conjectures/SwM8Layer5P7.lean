import Conjectures.SwM8Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM8
private abbrev T := RowTrie.node
private abbrev f := stepValue 8 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_7 : RowTrie := T 915 [T 520 [T 164 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 219 [T 25 [T 1 []]]],T 695 [T 224 [T 25 [T 1 []]]]]
theorem l5sub_7_cert : tabulate f 8 4 7 [7] = l5sub_7 := by rfl
end SaganWilsonPlacticMode.CertM8
