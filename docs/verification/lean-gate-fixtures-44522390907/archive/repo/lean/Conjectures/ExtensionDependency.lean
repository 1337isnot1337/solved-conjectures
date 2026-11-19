module

public import Mathlib.Data.Nat.Basic

@[expose] public section

namespace ExtensionDependency

private noncomputable def hiddenUnownedChoice : Nat :=
  Classical.choice (show Nonempty Nat from ⟨7⟩)

def unrelated : Nat := 3

end ExtensionDependency
