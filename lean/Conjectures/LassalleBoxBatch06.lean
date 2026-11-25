module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk12 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first .leaf .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk12_checked : ValidBoxTree coverageChunk12 ⟨105553116266496,140737488355328⟩ ⟨0,5212499568716⟩ := by
  decide +kernel

def coverageChunk13 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first (.second .leaf .leaf) .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk13_checked : ValidBoxTree coverageChunk13 ⟨105553116266496,140737488355328⟩ ⟨5212499568716,10424999137432⟩ := by
  decide +kernel

end LassalleRefinement
