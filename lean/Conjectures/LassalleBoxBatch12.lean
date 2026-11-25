module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk24 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first .leaf .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk24_checked : ValidBoxTree coverageChunk24 ⟨422212465065984,492581209243648⟩ ⟨0,10424999137432⟩ := by
  decide +kernel

def coverageChunk25 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first .leaf .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk25_checked : ValidBoxTree coverageChunk25 ⟨492581209243648,562949953421312⟩ ⟨0,10424999137432⟩ := by
  decide +kernel

end LassalleRefinement
