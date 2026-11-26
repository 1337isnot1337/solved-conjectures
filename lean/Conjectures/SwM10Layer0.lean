import Conjectures.SaganWilsonPlacticModeDP
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table0 : RowTrie := T 1 []
theorem cert0 : countTrie 10 10 0 = table0 := by
  rfl
end SaganWilsonPlacticMode.CertM10
