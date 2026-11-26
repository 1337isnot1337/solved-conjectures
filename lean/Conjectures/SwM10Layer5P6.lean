import Conjectures.SwM10Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
private abbrev f := stepValue 10 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_6 : RowTrie := T 1515 [T 519 [T 123 [T 17 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 167 [T 21 [T 1 [],T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 217 [T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 273 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 335 [T 33 [T 1 []]]],T 648 [T 172 [T 21 [T 1 [],T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 227 [T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 288 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 355 [T 33 [T 1 []]]],T 808 [T 232 [T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 298 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 370 [T 33 [T 1 []]]],T 1003 [T 303 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 380 [T 33 [T 1 []]]],T 1237 [T 385 [T 33 [T 1 []]]]]
theorem l5sub_6_cert : tabulate f 10 4 6 [6] = l5sub_6 := by rfl
end SaganWilsonPlacticMode.CertM10
