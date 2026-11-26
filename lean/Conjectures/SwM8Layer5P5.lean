import Conjectures.SwM8Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM8
private abbrev T := RowTrie.node
private abbrev f := stepValue 8 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_5 : RowTrie := T 745 [T 289 [T 77 [T 13 [T 1 [],T 1 [],T 1 [],T 1 []],T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 110 [T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 149 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 194 [T 25 [T 1 []]]],T 366 [T 115 [T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 159 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 209 [T 25 [T 1 []]]],T 465 [T 164 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 219 [T 25 [T 1 []]]],T 590 [T 224 [T 25 [T 1 []]]]]
theorem l5sub_5_cert : tabulate f 8 4 5 [5] = l5sub_5 := by rfl
end SaganWilsonPlacticMode.CertM8
