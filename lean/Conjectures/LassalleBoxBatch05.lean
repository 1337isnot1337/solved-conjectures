module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk10 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk10_checked : ValidBoxTree coverageChunk10 ⟨70368744177664,87960930222080⟩ ⟨5212499568716,10424999137432⟩ := by
  decide +kernel

def coverageChunk11 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk11_checked : ValidBoxTree coverageChunk11 ⟨87960930222080,105553116266496⟩ ⟨5212499568716,10424999137432⟩ := by
  decide +kernel

end LassalleRefinement
