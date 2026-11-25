module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk08 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk08_checked : ValidBoxTree coverageChunk08 ⟨70368744177664,87960930222080⟩ ⟨0,5212499568716⟩ := by
  decide +kernel

def coverageChunk09 : BoxSplit := (.second (.first (.second .leaf .leaf) .leaf) (.first (.second .leaf .leaf) .leaf))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk09_checked : ValidBoxTree coverageChunk09 ⟨87960930222080,105553116266496⟩ ⟨0,5212499568716⟩ := by
  decide +kernel

end LassalleRefinement
