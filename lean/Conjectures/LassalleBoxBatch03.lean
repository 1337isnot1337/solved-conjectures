module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk06 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk06_checked : ValidBoxTree coverageChunk06 ⟨35184372088832,52776558133248⟩ ⟨5212499568716,10424999137432⟩ := by
  decide +kernel

def coverageChunk07 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk07_checked : ValidBoxTree coverageChunk07 ⟨52776558133248,70368744177664⟩ ⟨5212499568716,10424999137432⟩ := by
  decide +kernel

end LassalleRefinement
