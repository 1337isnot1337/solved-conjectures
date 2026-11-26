import Conjectures.SwM8Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM8
private abbrev T := RowTrie.node
private abbrev f := stepValue 8 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_8 : RowTrie := T 980 [T 720 [T 224 [T 25 [T 1 []]]]]
theorem l5sub_8_cert : tabulate f 8 4 8 [8] = l5sub_8 := by rfl
end SaganWilsonPlacticMode.CertM8
