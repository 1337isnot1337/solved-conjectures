import Conjectures.SwM10Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
private abbrev f := stepValue 10 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_5 : RowTrie := T 1349 [T 417 [T 85 [T 13 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 118 [T 17 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 157 [T 21 [T 1 [],T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 202 [T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 253 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 310 [T 33 [T 1 []]]],T 504 [T 123 [T 17 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 167 [T 21 [T 1 [],T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 217 [T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 273 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 335 [T 33 [T 1 []]]],T 613 [T 172 [T 21 [T 1 [],T 1 [],T 1 [],T 1 []],T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 227 [T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 288 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 355 [T 33 [T 1 []]]],T 748 [T 232 [T 25 [T 1 [],T 1 [],T 1 []],T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 298 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 370 [T 33 [T 1 []]]],T 913 [T 303 [T 29 [T 1 [],T 1 []],T 33 [T 1 []]],T 380 [T 33 [T 1 []]]],T 1112 [T 385 [T 33 [T 1 []]]]]
theorem l5sub_5_cert : tabulate f 10 4 5 [5] = l5sub_5 := by rfl
end SaganWilsonPlacticMode.CertM10
