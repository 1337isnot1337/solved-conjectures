module

public import Conjectures.FranklSmallCyclicNineWords

/-! Generated exact distinct-union tables. Every table is checked
by the Lean kernel; the producer supplies no trusted counts. -/
@[expose] public section

namespace FranklSmallCyclic

def nineChunk4 : Finset (List ℕ) :=
  {[2, 0, 12, 2, 0, 12, 2, 0, 4],
   [2, 0, 12, 2, 0, 12, 2, 0, 12],
   [4, 2, 0, 4, 2, 0, 4, 2, 0],
   [4, 2, 0, 4, 2, 0, 4, 10, 0],
   [4, 2, 0, 4, 2, 0, 12, 2, 0],
   [4, 2, 0, 4, 10, 0, 4, 2, 0],
   [4, 2, 0, 4, 10, 0, 4, 10, 0],
   [4, 2, 0, 12, 2, 0, 4, 2, 0]}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4_0 :
    maskCertificate 9 (wordMasksNine [2, 0, 12, 2, 0, 12, 2, 0, 4])
      {0, 11, 52, 60, 63, 88, 91, 124, 127, 193, 203, 217, 219, 245, 253, 255, 262, 271, 310, 318, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 444, 446, 447, 455, 463, 479, 480, 481, 486, 487, 491, 495, 500, 501, 502, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4_1 :
    maskCertificate 9 (wordMasksNine [2, 0, 12, 2, 0, 12, 2, 0, 12])
      {0, 11, 52, 60, 63, 88, 91, 124, 127, 193, 203, 217, 219, 245, 253, 255, 262, 263, 271, 310, 311, 318, 319, 350, 351, 382, 383, 416, 422, 423, 427, 431, 436, 438, 439, 444, 446, 447, 455, 463, 479, 480, 481, 486, 487, 491, 495, 500, 501, 502, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4_2 :
    maskCertificate 9 (wordMasksNine [4, 2, 0, 4, 2, 0, 4, 2, 0])
      {0, 13, 22, 31, 104, 109, 126, 127, 176, 182, 189, 191, 248, 253, 254, 255, 321, 333, 343, 351, 361, 365, 383, 386, 399, 406, 415, 434, 438, 447, 451, 463, 471, 479, 490, 491, 495, 497, 499, 503, 505, 506, 507, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4_3 :
    maskCertificate 9 (wordMasksNine [4, 2, 0, 4, 2, 0, 4, 10, 0])
      {0, 13, 22, 31, 104, 109, 126, 127, 176, 182, 189, 191, 248, 253, 254, 255, 321, 333, 343, 351, 361, 365, 383, 386, 387, 399, 406, 407, 415, 434, 435, 438, 439, 447, 451, 463, 471, 479, 490, 491, 495, 497, 499, 503, 505, 506, 507, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4_4 :
    maskCertificate 9 (wordMasksNine [4, 2, 0, 4, 2, 0, 12, 2, 0])
      {0, 13, 22, 31, 104, 109, 126, 127, 176, 182, 189, 191, 248, 253, 254, 255, 321, 333, 343, 351, 361, 365, 383, 386, 399, 406, 415, 434, 438, 447, 449, 451, 461, 463, 471, 479, 489, 490, 491, 493, 495, 497, 499, 503, 505, 506, 507, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4_5 :
    maskCertificate 9 (wordMasksNine [4, 2, 0, 4, 10, 0, 4, 2, 0])
      {0, 13, 22, 31, 104, 109, 126, 127, 176, 182, 189, 191, 240, 246, 248, 253, 254, 255, 321, 333, 343, 351, 361, 365, 383, 386, 399, 406, 415, 434, 438, 447, 451, 463, 471, 479, 490, 491, 495, 497, 498, 499, 502, 503, 505, 506, 507, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4_6 :
    maskCertificate 9 (wordMasksNine [4, 2, 0, 4, 10, 0, 4, 10, 0])
      {0, 13, 22, 31, 104, 109, 126, 127, 176, 182, 189, 191, 240, 246, 248, 253, 254, 255, 321, 333, 343, 351, 361, 365, 383, 386, 387, 399, 406, 407, 415, 434, 435, 438, 439, 447, 451, 463, 471, 479, 490, 491, 495, 497, 498, 499, 502, 503, 505, 506, 507, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked4_7 :
    maskCertificate 9 (wordMasksNine [4, 2, 0, 12, 2, 0, 4, 2, 0])
      {0, 13, 22, 31, 104, 109, 120, 125, 126, 127, 176, 182, 189, 191, 248, 253, 254, 255, 321, 333, 343, 351, 361, 365, 377, 381, 383, 386, 399, 406, 415, 434, 438, 447, 451, 463, 471, 479, 490, 491, 495, 497, 499, 503, 505, 506, 507, 509, 510, 511} 0 = true := by decide +kernel

theorem nineChunk4_abundant {w : List ℕ} (hw : w ∈ nineChunk4) :
    Frankl.Abundant (Frankl.generatedUnions (decodedGenerators 9 (wordMasksNine w))) 0 := by
  simp only [nineChunk4, Finset.mem_insert, Finset.mem_singleton] at hw
  rcases hw with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact maskCertificate_abundant checked4_0
  · exact maskCertificate_abundant checked4_1
  · exact maskCertificate_abundant checked4_2
  · exact maskCertificate_abundant checked4_3
  · exact maskCertificate_abundant checked4_4
  · exact maskCertificate_abundant checked4_5
  · exact maskCertificate_abundant checked4_6
  · exact maskCertificate_abundant checked4_7

end FranklSmallCyclic
