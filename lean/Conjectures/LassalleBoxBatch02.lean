module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk04 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk04_checked : ValidBoxTree coverageChunk04 ⟨35184372088832,52776558133248⟩ ⟨0,5212499568716⟩ := by
  decide +kernel

def coverageChunk05 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk05_checked : ValidBoxTree coverageChunk05 ⟨52776558133248,70368744177664⟩ ⟨0,5212499568716⟩ := by
  decide +kernel

end LassalleRefinement
