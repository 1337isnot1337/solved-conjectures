module

public import Conjectures.FranklSmallCyclicNineWords

/-! Generated exact distinct-union tables. Every table is checked
by the Lean kernel; the producer supplies no trusted counts. -/
@[expose] public section

namespace FranklSmallCyclic

def nineChunk6 : Finset (List ℕ) :=
  {[10, 0, 4, 2, 0, 4, 2, 0, 12],
   [10, 0, 4, 2, 0, 4, 10, 0, 4],
   [10, 0, 4, 2, 0, 12, 2, 0, 4],
   [10, 0, 4, 2, 0, 12, 2, 0, 12],
   [10, 0, 4, 10, 0, 4, 2, 0, 4],
   [10, 0, 4, 10, 0, 4, 2, 0, 12],
   [10, 0, 4, 10, 0, 4, 10, 0, 4],
   [12, 2, 0, 4, 2, 0, 4, 2, 0]}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6_0 :
    maskCertificate 9 (wordMasksNine [10, 0, 4, 2, 0, 4, 2, 0, 12])
      {0, 11, 15, 52, 63, 88, 91, 95, 124, 127, 193, 203, 207, 217, 219, 223, 245, 253, 255, 262, 263, 271, 310, 311, 319, 350, 351, 382, 383, 416, 422, 423, 427, 431, 436, 438, 439, 447, 455, 463, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6_1 :
    maskCertificate 9 (wordMasksNine [10, 0, 4, 2, 0, 4, 10, 0, 4])
      {0, 11, 15, 52, 63, 88, 91, 95, 124, 127, 193, 203, 207, 217, 219, 223, 245, 253, 255, 262, 271, 310, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 447, 449, 455, 459, 463, 473, 475, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6_2 :
    maskCertificate 9 (wordMasksNine [10, 0, 4, 2, 0, 12, 2, 0, 4])
      {0, 11, 15, 52, 63, 88, 91, 95, 124, 127, 193, 203, 207, 217, 219, 223, 245, 253, 255, 262, 271, 310, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 447, 455, 463, 479, 480, 481, 486, 487, 491, 495, 500, 501, 502, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6_3 :
    maskCertificate 9 (wordMasksNine [10, 0, 4, 2, 0, 12, 2, 0, 12])
      {0, 11, 15, 52, 63, 88, 91, 95, 124, 127, 193, 203, 207, 217, 219, 223, 245, 253, 255, 262, 263, 271, 310, 311, 319, 350, 351, 382, 383, 416, 422, 423, 427, 431, 436, 438, 439, 447, 455, 463, 479, 480, 481, 486, 487, 491, 495, 500, 501, 502, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6_4 :
    maskCertificate 9 (wordMasksNine [10, 0, 4, 10, 0, 4, 2, 0, 4])
      {0, 11, 15, 52, 63, 88, 91, 95, 120, 123, 124, 127, 193, 203, 207, 217, 219, 223, 245, 249, 251, 253, 255, 262, 271, 310, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 447, 455, 463, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6_5 :
    maskCertificate 9 (wordMasksNine [10, 0, 4, 10, 0, 4, 2, 0, 12])
      {0, 11, 15, 52, 63, 88, 91, 95, 120, 123, 124, 127, 193, 203, 207, 217, 219, 223, 245, 249, 251, 253, 255, 262, 263, 271, 310, 311, 319, 350, 351, 382, 383, 416, 422, 423, 427, 431, 436, 438, 439, 447, 455, 463, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6_6 :
    maskCertificate 9 (wordMasksNine [10, 0, 4, 10, 0, 4, 10, 0, 4])
      {0, 11, 15, 52, 63, 88, 91, 95, 120, 123, 124, 127, 193, 203, 207, 217, 219, 223, 245, 249, 251, 253, 255, 262, 271, 310, 319, 350, 351, 382, 383, 416, 422, 427, 431, 436, 438, 447, 449, 455, 459, 463, 473, 475, 479, 481, 487, 491, 495, 501, 503, 504, 505, 507, 508, 509, 510, 511} 0 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked6_7 :
    maskCertificate 9 (wordMasksNine [12, 2, 0, 4, 2, 0, 4, 2, 0])
      {0, 13, 15, 22, 31, 104, 109, 111, 126, 127, 176, 182, 189, 191, 248, 253, 254, 255, 321, 333, 335, 343, 351, 361, 365, 367, 383, 386, 399, 406, 415, 434, 438, 447, 451, 463, 471, 479, 490, 491, 495, 497, 499, 503, 505, 506, 507, 509, 510, 511} 0 = true := by decide +kernel

theorem nineChunk6_abundant {w : List ℕ} (hw : w ∈ nineChunk6) :
    Frankl.Abundant (Frankl.generatedUnions (decodedGenerators 9 (wordMasksNine w))) 0 := by
  simp only [nineChunk6, Finset.mem_insert, Finset.mem_singleton] at hw
  rcases hw with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact maskCertificate_abundant checked6_0
  · exact maskCertificate_abundant checked6_1
  · exact maskCertificate_abundant checked6_2
  · exact maskCertificate_abundant checked6_3
  · exact maskCertificate_abundant checked6_4
  · exact maskCertificate_abundant checked6_5
  · exact maskCertificate_abundant checked6_6
  · exact maskCertificate_abundant checked6_7

end FranklSmallCyclic
