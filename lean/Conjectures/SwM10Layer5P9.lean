import Conjectures.SwM10Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
private abbrev f := stepValue 10 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_9 : RowTrie := T 1934 [T 1163 [T 303 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 380 [T 33 [T 1 []]]],T 1502 [T 385 [T 33 [T 1 []]]]]
theorem l5sub_9_cert : tabulate f 10 4 9 [9] = l5sub_9 := by rfl
end SaganWilsonPlacticMode.CertM10
