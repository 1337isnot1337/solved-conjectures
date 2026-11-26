import Conjectures.SwM10Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
private abbrev f := stepValue 10 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_7 : RowTrie := T 1669 [T 668 [T 172 [T 21 [T 1 [],T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 227 [T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 288 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 355 [T 33 [T 1 []]]],T 853 [T 232 [T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 298 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 370 [T 33 [T 1 []]]],T 1078 [T 303 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 380 [T 33 [T 1 []]]],T 1347 [T 385 [T 33 [T 1 []]]]]
theorem l5sub_7_cert : tabulate f 10 4 7 [7] = l5sub_7 := by rfl
end SaganWilsonPlacticMode.CertM10
