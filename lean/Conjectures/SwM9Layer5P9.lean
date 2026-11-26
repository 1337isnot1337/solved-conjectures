import Conjectures.SwM9Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
private abbrev f := stepValue 9 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_9 : RowTrie := T 1445 [T 1076 [T 299 [T 29 [T 1 []]]]]
theorem l5sub_9_cert : tabulate f 9 4 9 [9] = l5sub_9 := by rfl
end SaganWilsonPlacticMode.CertM9
