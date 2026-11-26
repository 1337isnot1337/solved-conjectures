import Conjectures.SwM8Layer4
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM8
private abbrev T := RowTrie.node
private abbrev f := stepValue 8 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5sub_6 : RowTrie := T 836 [T 381 [T 115 [T 17 [T 1 [],T 1 [],T 1 []],T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 159 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 209 [T 25 [T 1 []]]],T 500 [T 164 [T 21 [T 1 [],T 1 []],T 25 [T 1 []]],T 219 [T 25 [T 1 []]]],T 650 [T 224 [T 25 [T 1 []]]]]
theorem l5sub_6_cert : tabulate f 8 4 6 [6] = l5sub_6 := by rfl
end SaganWilsonPlacticMode.CertM8
