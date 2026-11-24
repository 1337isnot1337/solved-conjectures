import Conjectures.SwM10Layer7
namespace SaganWilsonPlacticMode.CertM10
private abbrev T := RowTrie.node
set_option maxRecDepth 100000
set_option maxHeartbeats 0
def table8 : RowTrie := T 823810 [T 385336 [T 118636 [],T 143500 [],T 171724 [],T 203308 [],T 237692 [],T 273692 [],T 309443 [],T 342349 [],T 369040 []],T 448126 [T 148834 [],T 183778 [],T 223104 [],T 265832 [],T 310322 [],T 354237 [],T 394513 [],T 427336 []],T 509110 [T 190498 [],T 237566 [],T 288666 [],T 341758 [],T 394117 [],T 442323 [],T 482258 []],T 568078 [T 245322 [],T 304864 [],T 366754 [],T 427977 [],T 484883 [],T 533204 []],T 624680 [T 313376 [],T 384288 [],T 454865 [],T 521367 [],T 579544 []],T 678230 [T 393478 [],T 473871 [],T 550879 [],T 620452 []],T 727490 [T 483995 [],T 572293 [],T 654718 []],T 770435 [T 584073 [],T 680540 []],T 804000 [T 695296 []]]
theorem cert8 : countTrie 10 10 8 = table8 := by
  rw [countTrie, cert7]
  all_goals rfl
end SaganWilsonPlacticMode.CertM10
