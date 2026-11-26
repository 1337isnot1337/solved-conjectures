import Conjectures.SwM9Layer8
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table9 : RowTrie := T 3159936 [T 1574567 [],T 1858067 [],T 2135855 [],T 2396759 [],T 2631119 [],T 2830871 [],T 2989367 [],T 3100904 []]
theorem cert9 : countTrie 9 10 9 = table9 := by
  rw [countTrie, cert8]
  all_goals rfl
end SaganWilsonPlacticMode.CertM9
