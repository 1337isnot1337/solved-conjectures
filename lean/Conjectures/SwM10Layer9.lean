import Conjectures.SwM10Layer8
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table9 : RowTrie := T 6339295 [T 2993194 [],T 3517102 [],T 4034458 [],T 4529386 [],T 4987900 [],T 5397820 [],T 5748376 [],T 6029473 [],T 6230591 []]
theorem cert9 : countTrie 10 10 9 = table9 := by
  rw [countTrie, cert8]
  all_goals rfl
end SaganWilsonPlacticMode.CertM10
