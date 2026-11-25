module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk16 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first .leaf .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk16_checked : ValidBoxTree coverageChunk16 ⟨175921860444160,211106232532992⟩ ⟨0,5212499568716⟩ := by
  decide +kernel

def coverageChunk17 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first .leaf .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk17_checked : ValidBoxTree coverageChunk17 ⟨175921860444160,211106232532992⟩ ⟨5212499568716,10424999137432⟩ := by
  decide +kernel

end LassalleRefinement
