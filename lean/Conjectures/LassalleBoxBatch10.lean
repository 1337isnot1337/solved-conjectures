module
public import Conjectures.LassalleBoxSoundness

@[expose] public section
namespace LassalleRefinement

def coverageChunk20 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk20_checked : ValidBoxTree coverageChunk20 ⟨246290604621824,281474976710656⟩ ⟨0,10424999137432⟩ := by
  decide +kernel

def coverageChunk21 : BoxSplit := (.second (.first (.second .leaf .leaf) (.second .leaf .leaf)) (.first (.second .leaf .leaf) (.second .leaf .leaf)))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 0 in
theorem coverageChunk21_checked : ValidBoxTree coverageChunk21 ⟨281474976710656,316659348799488⟩ ⟨0,10424999137432⟩ := by
  decide +kernel

end LassalleRefinement
