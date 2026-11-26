import Conjectures.SwM8Layer9
namespace SaganWilsonPlacticMode.CertM8
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table10 : RowTrie := T 9398925 []
theorem cert10 : countTrie 8 10 10 = table10 := by
  rw [countTrie, cert9]
  all_goals rfl
theorem value : countFast 8 10 = 9398925 := by
  unfold countFast
  rw [cert10]
  all_goals rfl
#print axioms value
end SaganWilsonPlacticMode.CertM8
