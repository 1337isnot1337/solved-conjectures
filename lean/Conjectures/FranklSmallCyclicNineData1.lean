module

public import Conjectures.FranklSmallCyclicNineWords

/-! Generated exact distinct-union tables. Every table is checked
by the Lean kernel; the producer supplies no trusted counts. -/
@[expose] public section

namespace FranklSmallCyclic

def nineChunk1 : Finset (List ℕ) :=
  {[0, 4, 10, 0, 4, 2, 0, 4, 2],
   [0, 4, 10, 0, 4, 2, 0, 4, 10],
   [0, 4, 10, 0, 4, 2, 0, 12, 2],
   [0, 4, 10, 0, 4, 10, 0, 4, 2],
   [0, 4, 10, 0, 4, 10, 0, 4, 10],
   [0, 12, 2, 0, 4, 2, 0, 4, 2],
   [0, 12, 2, 0, 4, 2, 0, 4, 10],
   [0, 12, 2, 0, 4, 2, 0, 12, 2]}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1_0 :
    maskCertificate 9 (wordMasksNine [0, 4, 10, 0, 4, 2, 0, 4, 2])
      {0, 26, 44, 60, 62, 131, 155, 175, 191, 208, 211, 218, 219, 252, 254, 255, 261, 287, 301, 317, 319, 352, 357, 364, 365, 378, 380, 381, 382, 383, 391, 415, 431, 447, 469, 471, 479, 483, 487, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1_1 :
    maskCertificate 9 (wordMasksNine [0, 4, 10, 0, 4, 2, 0, 4, 10])
      {0, 26, 44, 60, 62, 131, 155, 175, 191, 208, 211, 218, 219, 252, 254, 255, 261, 263, 287, 301, 303, 317, 319, 352, 357, 359, 364, 365, 367, 378, 380, 381, 382, 383, 391, 415, 431, 447, 469, 471, 479, 483, 487, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1_2 :
    maskCertificate 9 (wordMasksNine [0, 4, 10, 0, 4, 2, 0, 12, 2])
      {0, 26, 44, 60, 62, 131, 155, 175, 191, 208, 211, 218, 219, 252, 254, 255, 261, 287, 301, 317, 319, 352, 357, 364, 365, 378, 380, 381, 382, 383, 387, 391, 411, 415, 431, 447, 467, 469, 471, 475, 479, 483, 487, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1_3 :
    maskCertificate 9 (wordMasksNine [0, 4, 10, 0, 4, 10, 0, 4, 2])
      {0, 26, 44, 60, 62, 131, 155, 175, 191, 208, 211, 218, 219, 252, 254, 255, 261, 287, 301, 317, 319, 352, 357, 364, 365, 378, 380, 381, 382, 383, 391, 415, 431, 447, 469, 471, 479, 480, 483, 485, 487, 492, 493, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1_4 :
    maskCertificate 9 (wordMasksNine [0, 4, 10, 0, 4, 10, 0, 4, 10])
      {0, 26, 44, 60, 62, 131, 155, 175, 191, 208, 211, 218, 219, 252, 254, 255, 261, 263, 287, 301, 303, 317, 319, 352, 357, 359, 364, 365, 367, 378, 380, 381, 382, 383, 391, 415, 431, 447, 469, 471, 479, 480, 483, 485, 487, 492, 493, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1_5 :
    maskCertificate 9 (wordMasksNine [0, 12, 2, 0, 4, 2, 0, 4, 2])
      {0, 26, 30, 44, 62, 131, 155, 159, 175, 191, 208, 211, 218, 219, 222, 223, 252, 254, 255, 261, 287, 301, 319, 352, 357, 364, 365, 378, 382, 383, 391, 415, 431, 447, 469, 471, 479, 483, 487, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1_6 :
    maskCertificate 9 (wordMasksNine [0, 12, 2, 0, 4, 2, 0, 4, 10])
      {0, 26, 30, 44, 62, 131, 155, 159, 175, 191, 208, 211, 218, 219, 222, 223, 252, 254, 255, 261, 263, 287, 301, 303, 319, 352, 357, 359, 364, 365, 367, 378, 382, 383, 391, 415, 431, 447, 469, 471, 479, 483, 487, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked1_7 :
    maskCertificate 9 (wordMasksNine [0, 12, 2, 0, 4, 2, 0, 12, 2])
      {0, 26, 30, 44, 62, 131, 155, 159, 175, 191, 208, 211, 218, 219, 222, 223, 252, 254, 255, 261, 287, 301, 319, 352, 357, 364, 365, 378, 382, 383, 387, 391, 411, 415, 431, 447, 467, 469, 471, 475, 479, 483, 487, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

theorem nineChunk1_abundant {w : List ℕ} (hw : w ∈ nineChunk1) :
    Frankl.Abundant (Frankl.generatedUnions (decodedGenerators 9 (wordMasksNine w))) 0 := by
  simp only [nineChunk1, Finset.mem_insert, Finset.mem_singleton] at hw
  rcases hw with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact maskCertificate_abundant checked1_0
  · exact maskCertificate_abundant checked1_1
  · exact maskCertificate_abundant checked1_2
  · exact maskCertificate_abundant checked1_3
  · exact maskCertificate_abundant checked1_4
  · exact maskCertificate_abundant checked1_5
  · exact maskCertificate_abundant checked1_6
  · exact maskCertificate_abundant checked1_7

end FranklSmallCyclic
