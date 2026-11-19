module

public import Conjectures.FranklSmallCyclicNineWords

/-! Generated exact distinct-union tables. Every table is checked
by the Lean kernel; the producer supplies no trusted counts. -/
@[expose] public section

namespace FranklSmallCyclic

def nineChunk2 : Finset (List ℕ) :=
  {[0, 12, 2, 0, 4, 10, 0, 4, 2],
   [0, 12, 2, 0, 4, 10, 0, 4, 10],
   [0, 12, 2, 0, 12, 2, 0, 4, 2],
   [0, 12, 2, 0, 12, 2, 0, 4, 10],
   [0, 12, 2, 0, 12, 2, 0, 12, 2],
   [2, 0, 4, 2, 0, 4, 2, 0, 4],
   [2, 0, 4, 2, 0, 4, 2, 0, 12],
   [2, 0, 4, 2, 0, 4, 10, 0, 4]}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2_0 :
    maskCertificate 9 (wordMasksNine [0, 12, 2, 0, 4, 10, 0, 4, 2])
      {0, 26, 30, 44, 62, 131, 155, 159, 175, 191, 208, 211, 218, 219, 222, 223, 252, 254, 255, 261, 287, 301, 319, 352, 357, 364, 365, 378, 382, 383, 391, 415, 431, 447, 469, 471, 479, 480, 483, 485, 487, 492, 493, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2_1 :
    maskCertificate 9 (wordMasksNine [0, 12, 2, 0, 4, 10, 0, 4, 10])
      {0, 26, 30, 44, 62, 131, 155, 159, 175, 191, 208, 211, 218, 219, 222, 223, 252, 254, 255, 261, 263, 287, 301, 303, 319, 352, 357, 359, 364, 365, 367, 378, 382, 383, 391, 415, 431, 447, 469, 471, 479, 480, 483, 485, 487, 492, 493, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2_2 :
    maskCertificate 9 (wordMasksNine [0, 12, 2, 0, 12, 2, 0, 4, 2])
      {0, 26, 30, 44, 62, 131, 155, 159, 175, 191, 208, 211, 218, 219, 222, 223, 240, 243, 250, 251, 252, 254, 255, 261, 287, 301, 319, 352, 357, 364, 365, 378, 382, 383, 391, 415, 431, 447, 469, 471, 479, 483, 487, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2_3 :
    maskCertificate 9 (wordMasksNine [0, 12, 2, 0, 12, 2, 0, 4, 10])
      {0, 26, 30, 44, 62, 131, 155, 159, 175, 191, 208, 211, 218, 219, 222, 223, 240, 243, 250, 251, 252, 254, 255, 261, 263, 287, 301, 303, 319, 352, 357, 359, 364, 365, 367, 378, 382, 383, 391, 415, 431, 447, 469, 471, 479, 483, 487, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2_4 :
    maskCertificate 9 (wordMasksNine [0, 12, 2, 0, 12, 2, 0, 12, 2])
      {0, 26, 30, 44, 62, 131, 155, 159, 175, 191, 208, 211, 218, 219, 222, 223, 240, 243, 250, 251, 252, 254, 255, 261, 287, 301, 319, 352, 357, 364, 365, 378, 382, 383, 387, 391, 411, 415, 431, 447, 467, 469, 471, 475, 479, 483, 487, 495, 496, 499, 501, 503, 506, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2_5 :
    maskCertificate 9 (wordMasksNine [2, 0, 4, 2, 0, 4, 2, 0, 4])
      {0, 11, 52, 63, 88, 91, 124, 127, 193, 203, 217, 219, 245, 253, 255, 262, 271, 310, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 447, 455, 463, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2_6 :
    maskCertificate 9 (wordMasksNine [2, 0, 4, 2, 0, 4, 2, 0, 12])
      {0, 11, 52, 63, 88, 91, 124, 127, 193, 203, 217, 219, 245, 253, 255, 262, 263, 271, 310, 311, 319, 350, 351, 382, 383, 416, 422, 423, 427, 431, 436, 438, 439, 447, 455, 463, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked2_7 :
    maskCertificate 9 (wordMasksNine [2, 0, 4, 2, 0, 4, 10, 0, 4])
      {0, 11, 52, 63, 88, 91, 124, 127, 193, 203, 217, 219, 245, 253, 255, 262, 271, 310, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 447, 449, 455, 459, 463, 473, 475, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

theorem nineChunk2_abundant {w : List ℕ} (hw : w ∈ nineChunk2) :
    Frankl.Abundant (Frankl.generatedUnions (decodedGenerators 9 (wordMasksNine w))) 0 := by
  simp only [nineChunk2, Finset.mem_insert, Finset.mem_singleton] at hw
  rcases hw with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact maskCertificate_abundant checked2_0
  · exact maskCertificate_abundant checked2_1
  · exact maskCertificate_abundant checked2_2
  · exact maskCertificate_abundant checked2_3
  · exact maskCertificate_abundant checked2_4
  · exact maskCertificate_abundant checked2_5
  · exact maskCertificate_abundant checked2_6
  · exact maskCertificate_abundant checked2_7

end FranklSmallCyclic
