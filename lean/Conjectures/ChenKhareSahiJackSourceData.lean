import Conjectures.ChenKhareSahiJackSource

/-! Rational interpolation and Hall-form certificates for all partitions in degrees zero
through five. Each matrix is independently checked by the Lean kernel. -/

namespace ChenKhareSahi.Jack.Source

open Matrix

set_option maxRecDepth 65536
set_option maxHeartbeats 16000000

def block0 : Block 1 where
  sh := ![![0, 0, 0, 0, 0]]
  sampleInverse := !![1]
  transition := !![1]
  inverseSchur := !![1]
  schurRow := !![1]

theorem block0_valid : ValidBlock block0 := by
  constructor
  · ext i j; fin_cases i ; fin_cases j ; as_aux_lemma => decide +kernel
  · ext i j; fin_cases i ; fin_cases j ; as_aux_lemma => decide +kernel
  · ext i j; fin_cases i ; fin_cases j ; as_aux_lemma => decide +kernel
  · constructor
    · intro i; fin_cases i ; decide +kernel
    · intro i j; fin_cases i ; fin_cases j ; decide +kernel
  · ext i j; fin_cases i ; fin_cases j ; as_aux_lemma => decide +kernel

def block1 : Block 1 where
  sh := ![![1, 0, 0, 0, 0]]
  sampleInverse := !![1]
  transition := !![1]
  inverseSchur := !![1]
  schurRow := !![1]

theorem block1_valid : ValidBlock block1 := by
  constructor
  · ext i j; fin_cases i ; fin_cases j ; as_aux_lemma => decide +kernel
  · ext i j; fin_cases i ; fin_cases j ; as_aux_lemma => decide +kernel
  · ext i j; fin_cases i ; fin_cases j ; as_aux_lemma => decide +kernel
  · constructor
    · intro i; fin_cases i ; decide +kernel
    · intro i j; fin_cases i ; fin_cases j ; decide +kernel
  · ext i j; fin_cases i ; fin_cases j ; as_aux_lemma => decide +kernel

def block2 : Block 2 where
  sh := ![![1, 1, 0, 0, 0], ![2, 0, 0, 0, 0]]
  sampleInverse := !![1/2, -1/2;
      -1/4, 1/2]
  transition := !![1/2, -1/2;
      0, 1]
  inverseSchur := !![1, 0;
      -1, 1]
  schurRow := !![1, 0;
      1, 1]

theorem block2_valid : ValidBlock block2 := by
  constructor
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · constructor
    · intro i; fin_cases i <;> decide +kernel
    · intro i j; fin_cases i <;> fin_cases j <;> decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel

def block3 : Block 3 where
  sh := ![![1, 1, 1, 0, 0], ![2, 1, 0, 0, 0], ![3, 0, 0, 0, 0]]
  sampleInverse := !![1/6, -1/2, 1/3;
      -1/6, 2/3, -1/2;
      1/27, -1/6, 1/6]
  transition := !![1/6, -1/2, 1/3;
      0, 1, -1;
      0, 0, 1]
  inverseSchur := !![1, 0, 0;
      -2, 1, 0;
      1, -1, 1]
  schurRow := !![1, 0, 0;
      2, 1, 0;
      1, 1, 1]

theorem block3_valid : ValidBlock block3 := by
  constructor
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · constructor
    · intro i; fin_cases i <;> decide +kernel
    · intro i j; fin_cases i <;> fin_cases j <;> decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel

def block4 : Block 5 where
  sh := ![![1, 1, 1, 1, 0], ![2, 1, 1, 0, 0], ![2, 2, 0, 0, 0], ![3, 1, 0, 0, 0], ![4, 0, 0, 0, 0]]
  sampleInverse := !![1/24, -1/4, 1/8, 1/3, -1/4;
      -1/16, 7/16, -1/4, -5/8, 1/2;
      1/128, -9/128, 1/8, 1/16, -1/8;
      1/48, -7/48, 0, 7/24, -1/6;
      -1/256, 11/384, 0, -1/16, 1/24]
  transition := !![1/24, -1/4, 1/8, 1/3, -1/4;
      0, 1/2, -1/2, -1, 1;
      0, 0, 1/2, 0, -1/2;
      0, 0, 0, 1, -1;
      0, 0, 0, 0, 1]
  inverseSchur := !![1, 0, 0, 0, 0;
      -3, 1, 0, 0, 0;
      1, -1, 1, 0, 0;
      2, -1, -1, 1, 0;
      -1, 1, 0, -1, 1]
  schurRow := !![1, 0, 0, 0, 0;
      3, 1, 0, 0, 0;
      2, 1, 1, 0, 0;
      3, 2, 1, 1, 0;
      1, 1, 1, 1, 1]

theorem block4_valid : ValidBlock block4 := by
  constructor
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · constructor
    · intro i; fin_cases i <;> decide +kernel
    · intro i j; fin_cases i <;> fin_cases j <;> decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel

def block5 : Block 7 where
  sh := ![![1, 1, 1, 1, 1], ![2, 1, 1, 1, 0], ![2, 2, 1, 0, 0], ![3, 1, 1, 0, 0], ![3, 2, 0, 0, 0], ![4, 1, 0, 0, 0], ![5, 0, 0, 0, 0]]
  sampleInverse := !![1/120, -1/12, 1/8, 1/6, -1/6, -1/4, 1/5;
      -1/60, 11/60, -3/10, -23/60, 5/12, 3/5, -1/2;
      1/200, -13/200, 7/40, 11/100, -1/4, -9/40, 1/4;
      1/150, -7/100, 1/20, 59/300, -1/12, -4/15, 1/6;
      -1/750, 9/500, -1/20, -1/30, 1/12, 1/15, -1/12;
      -1/500, 61/3000, 0, -41/600, 0, 11/120, -1/24;
      1/3125, -1/300, 0, 7/600, 0, -1/60, 1/120]
  transition := !![1/120, -1/12, 1/8, 1/6, -1/6, -1/4, 1/5;
      0, 1/6, -1/2, -1/2, 5/6, 1, -1;
      0, 0, 1/2, 0, -1, -1/2, 1;
      0, 0, 0, 1/2, -1/2, -1, 1;
      0, 0, 0, 0, 1, 0, -1;
      0, 0, 0, 0, 0, 1, -1;
      0, 0, 0, 0, 0, 0, 1]
  inverseSchur := !![1, 0, 0, 0, 0, 0, 0;
      -4, 1, 0, 0, 0, 0, 0;
      3, -2, 1, 0, 0, 0, 0;
      3, -1, -1, 1, 0, 0, 0;
      -2, 2, -1, -1, 1, 0, 0;
      -2, 1, 1, -1, -1, 1, 0;
      1, -1, 0, 1, 0, -1, 1]
  schurRow := !![1, 0, 0, 0, 0, 0, 0;
      4, 1, 0, 0, 0, 0, 0;
      5, 2, 1, 0, 0, 0, 0;
      6, 3, 1, 1, 0, 0, 0;
      5, 3, 2, 1, 1, 0, 0;
      4, 3, 2, 2, 1, 1, 0;
      1, 1, 1, 1, 1, 1, 1]

theorem block5_valid : ValidBlock block5 := by
  constructor
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel
  · constructor
    · intro i; fin_cases i <;> decide +kernel
    · intro i j; fin_cases i <;> fin_cases j <;> decide +kernel
  · ext i j; fin_cases i <;> fin_cases j <;> as_aux_lemma => decide +kernel

def dimension : Fin 6 → ℕ := ![1, 1, 2, 3, 5, 7]

def degreeBlock : (d : Fin 6) → Block (dimension d) :=
  fun d => match d with
  | 0 => block0 | 1 => block1 | 2 => block2
  | 3 => block3 | 4 => block4 | 5 => block5

theorem degreeBlock_valid (d : Fin 6) : ValidBlock (degreeBlock d) := by
  fin_cases d
  · exact block0_valid
  · exact block1_valid
  · exact block2_valid
  · exact block3_valid
  · exact block4_valid
  · exact block5_valid

end ChenKhareSahi.Jack.Source
