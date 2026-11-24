import Conjectures.SaganWilsonPlacticModeDP

namespace SaganWilsonPlacticMode

def stepValue (m n : Nat) (prev : RowTrie) (r : List Nat) : Nat :=
  ((alphabet m).map fun x =>
    let rr := next x r
    if n < rr.length then 0 else lookup rr 2 prev).sum

theorem countTrie_succ_eq (m N n : Nat) :
    countTrie m N (n+1) =
      tabulate (stepValue m n (countTrie m N n)) m (cap N (n+1)) 2 [] := rfl

theorem tabulate_succ_eq (f : List Nat → Nat) (m d lo : Nat) (pre : List Nat) :
    tabulate f m (d+1) lo pre =
      RowTrie.node (f pre) ((List.range (m+1-lo)).map fun i =>
        tabulate f m d (lo+i) (pre ++ [lo+i])) := rfl

end SaganWilsonPlacticMode
