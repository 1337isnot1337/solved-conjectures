module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk22 : BoxSplit := (.second (.first (.second .leaf .leaf) .leaf) (.first (.second .leaf .leaf) .leaf))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk22_checked : ValidBoxTree coverageChunk22 ⟨316659348799488,351843720888320⟩ ⟨0,10424999137432⟩ := by
  decide +kernel

def coverageChunk23 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first .leaf .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk23_checked : ValidBoxTree coverageChunk23 ⟨351843720888320,422212465065984⟩ ⟨0,10424999137432⟩ := by
  decide +kernel

end LassalleRefinement
