import Conjectures.SwM8Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM8
private abbrev T := RowTrie.node
private abbrev f := stepValue 8 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_3 : RowTrie := T 540 [T 190 [T 34 [T 5 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 9 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 45 [T 9 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 62 [T 13 [T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 85 [T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 114 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 149 [T 25 [T 1 []]]],T 225 [T 50 [T 9 [T 1 [],T 1 [],T 1 [],T 1 [],T 1 []],T 13 [T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 72 [T 13 [T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 100 [T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 134 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 174 [T 25 [T 1 []]]],T 264 [T 77 [T 13 [T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 110 [T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 149 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 194 [T 25 [T 1 []]]],T 311 [T 115 [T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 159 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 209 [T 25 [T 1 []]]],T 370 [T 164 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 219 [T 25 [T 1 []]]],T 445 [T 224 [T 25 [T 1 []]]]]
theorem l5sub_3_cert : tabulate f 8 4 3 [3] = l5sub_3 := by rfl
end SaganWilsonPlacticMode.CertM8
