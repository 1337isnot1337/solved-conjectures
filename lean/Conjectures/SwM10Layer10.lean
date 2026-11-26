import Conjectures.SwM10Layer9
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table10 : RowTrie := T 49807595 []
theorem cert10 : countTrie 10 10 10 = table10 := by
  rw [countTrie, cert9]
  all_goals rfl
theorem value : countFast 10 10 = 49807595 := by
  unfold countFast
  rw [cert10]
  all_goals rfl
#print axioms value
end SaganWilsonPlacticMode.CertM10
