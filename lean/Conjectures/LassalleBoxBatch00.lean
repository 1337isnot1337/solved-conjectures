module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk00 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk00_checked : ValidBoxTree coverageChunk00 ⟨0,17592186044416⟩ ⟨0,5212499568716⟩ := by
  decide +kernel

def coverageChunk01 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk01_checked : ValidBoxTree coverageChunk01 ⟨17592186044416,35184372088832⟩ ⟨0,5212499568716⟩ := by
  decide +kernel

end LassalleRefinement
