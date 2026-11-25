module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk14 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first .leaf .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk14_checked : ValidBoxTree coverageChunk14 ⟨140737488355328,175921860444160⟩ ⟨0,5212499568716⟩ := by
  decide +kernel

def coverageChunk15 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first .leaf .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk15_checked : ValidBoxTree coverageChunk15 ⟨140737488355328,175921860444160⟩ ⟨5212499568716,10424999137432⟩ := by
  decide +kernel

end LassalleRefinement
