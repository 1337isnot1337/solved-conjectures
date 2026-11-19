module

public import Conjectures.ExtensionDependency

@[expose] public section

namespace ExtensionGood

private theorem hiddenProof : 2 + 2 = 4 := rfl

def value : Nat := 4

theorem result : 2 + 2 = 4 := hiddenProof

end ExtensionGood
