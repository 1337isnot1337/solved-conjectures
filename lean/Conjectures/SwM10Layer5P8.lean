import Conjectures.SwM10Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
private abbrev f := stepValue 10 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_8 : RowTrie := T 1809 [T 878 [T 232 [T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 298 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 370 [T 33 [T 1 []]]],T 1133 [T 303 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 380 [T 33 [T 1 []]]],T 1437 [T 385 [T 33 [T 1 []]]]]
theorem l5sub_8_cert : tabulate f 10 4 8 [8] = l5sub_8 := by rfl
end SaganWilsonPlacticMode.CertM10
