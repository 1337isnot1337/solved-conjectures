import Conjectures.SwM9Layer9
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table10 : RowTrie := T 22677445 []
theorem cert10 : countTrie 9 10 10 = table10 := by
  rw [countTrie, cert9]
  all_goals rfl
theorem value : countFast 9 10 = 22677445 := by
  unfold countFast
  rw [cert10]
  all_goals rfl
#print axioms value
end SaganWilsonPlacticMode.CertM9
