module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk02 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk02_checked : ValidBoxTree coverageChunk02 ⟨0,17592186044416⟩ ⟨5212499568716,10424999137432⟩ := by
  decide +kernel

def coverageChunk03 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk03_checked : ValidBoxTree coverageChunk03 ⟨17592186044416,35184372088832⟩ ⟨5212499568716,10424999137432⟩ := by
  decide +kernel

end LassalleRefinement
