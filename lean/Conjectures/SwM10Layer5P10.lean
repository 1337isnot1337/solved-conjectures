import Conjectures.SwM10Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
private abbrev f := stepValue 10 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_10 : RowTrie := T 2044 [T 1537 [T 385 [T 33 [T 1 []]]]]
theorem l5sub_10_cert : tabulate f 10 4 10 [10] = l5sub_10 := by rfl
end SaganWilsonPlacticMode.CertM10
