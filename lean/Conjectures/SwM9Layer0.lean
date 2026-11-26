import Conjectures.SaganWilsonPlacticModeDP
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table0 : RowTrie := T 1 []
theorem cert0 : countTrie 9 10 0 = table0 := by
  rfl
end SaganWilsonPlacticMode.CertM9
