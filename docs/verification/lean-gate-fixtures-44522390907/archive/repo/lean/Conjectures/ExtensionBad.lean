module

public import Conjectures.ExtensionGood

@[expose] public section

namespace ExtensionBad

private noncomputable def hiddenOwnedChoice : Nat :=
  Classical.choice (show Nonempty Nat from ⟨9⟩)

theorem result : 2 + 2 = 4 := ExtensionGood.result

end ExtensionBad
