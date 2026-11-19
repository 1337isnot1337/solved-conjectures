module

public import Conjectures.FranklSmallCyclicNineWords

/-! Generated exact distinct-union tables. Every table is checked
by the Lean kernel; the producer supplies no trusted counts. -/
@[expose] public section

namespace FranklSmallCyclic

def nineChunk3 : Finset (List ℕ) :=
  {[2, 0, 4, 2, 0, 12, 2, 0, 4],
   [2, 0, 4, 2, 0, 12, 2, 0, 12],
   [2, 0, 4, 10, 0, 4, 2, 0, 4],
   [2, 0, 4, 10, 0, 4, 2, 0, 12],
   [2, 0, 4, 10, 0, 4, 10, 0, 4],
   [2, 0, 12, 2, 0, 4, 2, 0, 4],
   [2, 0, 12, 2, 0, 4, 2, 0, 12],
   [2, 0, 12, 2, 0, 4, 10, 0, 4]}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3_0 :
    maskCertificate 9 (wordMasksNine [2, 0, 4, 2, 0, 12, 2, 0, 4])
      {0, 11, 52, 63, 88, 91, 124, 127, 193, 203, 217, 219, 245, 253, 255, 262, 271, 310, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 447, 455, 463, 479, 480, 481, 486, 487, 491, 495, 500, 501, 502, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3_1 :
    maskCertificate 9 (wordMasksNine [2, 0, 4, 2, 0, 12, 2, 0, 12])
      {0, 11, 52, 63, 88, 91, 124, 127, 193, 203, 217, 219, 245, 253, 255, 262, 263, 271, 310, 311, 319, 350, 351, 382, 383, 416, 422, 423, 427, 431, 436, 438, 439, 447, 455, 463, 479, 480, 481, 486, 487, 491, 495, 500, 501, 502, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3_2 :
    maskCertificate 9 (wordMasksNine [2, 0, 4, 10, 0, 4, 2, 0, 4])
      {0, 11, 52, 63, 88, 91, 120, 123, 124, 127, 193, 203, 217, 219, 245, 249, 251, 253, 255, 262, 271, 310, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 447, 455, 463, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3_3 :
    maskCertificate 9 (wordMasksNine [2, 0, 4, 10, 0, 4, 2, 0, 12])
      {0, 11, 52, 63, 88, 91, 120, 123, 124, 127, 193, 203, 217, 219, 245, 249, 251, 253, 255, 262, 263, 271, 310, 311, 319, 350, 351, 382, 383, 416, 422, 423, 427, 431, 436, 438, 439, 447, 455, 463, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3_4 :
    maskCertificate 9 (wordMasksNine [2, 0, 4, 10, 0, 4, 10, 0, 4])
      {0, 11, 52, 63, 88, 91, 120, 123, 124, 127, 193, 203, 217, 219, 245, 249, 251, 253, 255, 262, 271, 310, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 447, 449, 455, 459, 463, 473, 475, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3_5 :
    maskCertificate 9 (wordMasksNine [2, 0, 12, 2, 0, 4, 2, 0, 4])
      {0, 11, 52, 60, 63, 88, 91, 124, 127, 193, 203, 217, 219, 245, 253, 255, 262, 271, 310, 318, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 444, 446, 447, 455, 463, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3_6 :
    maskCertificate 9 (wordMasksNine [2, 0, 12, 2, 0, 4, 2, 0, 12])
      {0, 11, 52, 60, 63, 88, 91, 124, 127, 193, 203, 217, 219, 245, 253, 255, 262, 263, 271, 310, 311, 318, 319, 350, 351, 382, 383, 416, 422, 423, 427, 431, 436, 438, 439, 444, 446, 447, 455, 463, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked3_7 :
    maskCertificate 9 (wordMasksNine [2, 0, 12, 2, 0, 4, 10, 0, 4])
      {0, 11, 52, 60, 63, 88, 91, 124, 127, 193, 203, 217, 219, 245, 253, 255, 262, 271, 310, 318, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 444, 446, 447, 449, 455, 459, 463, 473, 475, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

theorem nineChunk3_abundant {w : List ℕ} (hw : w ∈ nineChunk3) :
    Frankl.Abundant (Frankl.generatedUnions (decodedGenerators 9 (wordMasksNine w))) 0 := by
  simp only [nineChunk3, Finset.mem_insert, Finset.mem_singleton] at hw
  rcases hw with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact maskCertificate_abundant checked3_0
  · exact maskCertificate_abundant checked3_1
  · exact maskCertificate_abundant checked3_2
  · exact maskCertificate_abundant checked3_3
  · exact maskCertificate_abundant checked3_4
  · exact maskCertificate_abundant checked3_5
  · exact maskCertificate_abundant checked3_6
  · exact maskCertificate_abundant checked3_7

end FranklSmallCyclic
