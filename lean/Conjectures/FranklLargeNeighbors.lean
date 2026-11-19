module

public import Conjectures.FranklLargeSelection

/-! The local covering selections for one generator. -/

@[expose] public section

namespace Frankl.Large

open Finset

variable {α ι : Type*} [DecidableEq α] [Fintype ι] [DecidableEq ι]

def localSelection (G : ι → Finset α) (e : ι)
    (n : Finset (↑(neighbors G e))) : Finset ι :=
  n.map (Function.Embedding.subtype _)

def coveringNeighbors (G : ι → Finset α) (e : ι) :
    Finset (Finset (↑(neighbors G e))) :=
  univ.filter fun n => G e ⊆ generated G (localSelection G e n)

end Frankl.Large
