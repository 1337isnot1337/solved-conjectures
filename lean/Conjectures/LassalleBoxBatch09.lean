module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk18 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first .leaf .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk18_checked : ValidBoxTree coverageChunk18 ⟨211106232532992,246290604621824⟩ ⟨0,5212499568716⟩ := by
  decide +kernel

def coverageChunk19 : BoxSplit := (.first (.second (.first .leaf .leaf) (.first .leaf .leaf)) (.second (.first .leaf .leaf) (.first .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk19_checked : ValidBoxTree coverageChunk19 ⟨211106232532992,246290604621824⟩ ⟨5212499568716,10424999137432⟩ := by
  decide +kernel

end LassalleRefinement
