import Conjectures.SwM9Layer7
namespace SaganWilsonPlacticMode.CertM9
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table8 : RowTrie := T 448071 [T 221011 [T 73899 [],T 90139 [],T 108339 [],T 128499 [],T 150129 [],T 172185 [],T 193012 [],T 210294 []],T 259091 [T 93779 [],T 116683 [],T 142289 [],T 169729 [],T 197545 [],T 223652 [],T 245308 []],T 295491 [T 121387 [],T 152439 [],T 185717 [],T 219405 [],T 251072 [],T 277662 []],T 329931 [T 157899 [],T 197085 [],T 236841 [],T 274488 [],T 306782 []],T 362061 [T 203063 [],T 249111 [],T 293228 [],T 332122 []],T 391293 [T 255571 [],T 306620 [],T 353024 []],T 416613 [T 313860 [],T 368558 []],T 436374 [T 377342 []]]
theorem cert8 : countTrie 9 10 8 = table8 := by
  rw [countTrie, cert7]
  all_goals rfl
end SaganWilsonPlacticMode.CertM9
