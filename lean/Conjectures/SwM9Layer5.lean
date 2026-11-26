import Conjectures.SwM9Layer5P2
import Conjectures.SwM9Layer5P3
import Conjectures.SwM9Layer5P4
import Conjectures.SwM9Layer5P5
import Conjectures.SwM9Layer5P6
import Conjectures.SwM9Layer5P7
import Conjectures.SwM9Layer5P8
import Conjectures.SwM9Layer5P9
import Conjectures.SaganWilsonPlacticModeCertSupport
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
private abbrev f := stepValue 9 4 table4
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def l5subroot : RowTrie := T 1515 [l5sub_2,l5sub_3,l5sub_4,l5sub_5,l5sub_6,l5sub_7,l5sub_8,l5sub_9]
theorem l5subroot_cert : tabulate f 9 5 2 [] = l5subroot := by
  change RowTrie.node (f []) [tabulate f 9 4 2 [2], tabulate f 9 4 3 [3], tabulate f 9 4 4 [4], tabulate f 9 4 5 [5], tabulate f 9 4 6 [6], tabulate f 9 4 7 [7], tabulate f 9 4 8 [8], tabulate f 9 4 9 [9]] = l5subroot
  rw [l5sub_2_cert, l5sub_3_cert, l5sub_4_cert, l5sub_5_cert, l5sub_6_cert, l5sub_7_cert, l5sub_8_cert, l5sub_9_cert]
  all_goals rfl
def table5 : RowTrie := l5subroot
theorem cert5 : countTrie 9 10 5 = table5 := by
  rw [countTrie_succ_eq, cert4]
  exact l5subroot_cert
end SaganWilsonPlacticMode.CertM9
