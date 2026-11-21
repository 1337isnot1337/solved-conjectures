import Conjectures.OravcovaSotakLoops
import Mathlib.Tactic.FinCases

/-! Exact finite certificates from `results/oravcova-sotak/certificates.json`.
All finite checks are reduced by the kernel. The loop induction proves
unbounded period coverage; there is no finite cutoff in the family results. -/

namespace OravcovaSotak

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def readWord (xs : List ℕ) (i : ℕ) : ℕ := xs[i]?.getD 0

structure ColorCertificate where
  k : ℕ
  D : List ℕ
  word : List ℕ

def ColorCertificate.Valid (c : ColorCertificate) : Prop :=
  0 < c.word.length ∧ WordCertificate c.D c.k c.word.length (readWord c.word)

instance (c : ColorCertificate) : Decidable c.Valid :=
  inferInstanceAs (Decidable (0 < c.word.length ∧
    WordCertificate c.D c.k c.word.length (readWord c.word)))

theorem ColorCertificate.hasPeriod (c : ColorCertificate) (hc : c.Valid) :
    HasPeriod c.D c.k c.word.length :=
  wordCertificate_hasPeriod c.D c.k c.word.length (readWord c.word) hc.1 hc.2

def sporadicCertificates : List ColorCertificate := [
  ⟨5, [1, 3, 4, 5, 9], [0, 4, 3, 4, 3, 2, 1, 2]⟩,
  ⟨5, [1, 3, 4, 5, 18], [0, 3, 1, 2, 1, 4, 0, 3, 0, 2, 1, 2, 4, 3]⟩,
  ⟨5, [1, 3, 4, 5, 11], [0, 4, 3, 4, 3, 2, 1, 2]⟩,
  ⟨5, [1, 7, 8, 9, 15], [0, 3, 4, 3, 1, 3, 1, 2, 1, 2, 0, 2, 0, 4]⟩,
  ⟨5, [2, 5, 7, 8, 9], [0, 4, 4, 3, 3, 4, 2, 3, 1, 2, 2, 1, 1, 0]⟩,
  ⟨5, [2, 3, 5, 8, 19], [0, 0, 2, 3, 1, 4, 2, 0, 1, 3, 3, 0, 2, 2, 1, 1, 3]⟩,
  ⟨5, [3, 5, 8, 9, 13], [0, 2, 4, 3, 4, 3, 4, 3, 2, 1, 0, 1, 0, 1]⟩,
  ⟨5, [3, 5, 8, 11, 13], [0, 2, 4, 3, 4, 3, 4, 3, 2, 1, 0, 1, 0, 1]⟩,
  ⟨5, [1, 3, 4, 5, 27], [0, 4, 3, 4, 3, 2, 1, 2]⟩,
  ⟨5, [1, 4, 5, 6, 27], [0, 4, 3, 4, 3, 2, 1, 2, 1, 0, 4, 3, 4, 3, 2, 1, 2, 1, 0, 4, 3, 4, 3, 2, 1, 2, 0, 1]⟩,
  ⟨6, [1, 2, 5, 6, 7, 8], [0, 5, 4, 3, 5, 4, 3, 2, 1, 0, 2, 1]⟩,
  ⟨6, [2, 5, 6, 8, 10, 11], [0, 5, 4, 3, 5, 4, 3, 2, 1, 0, 2, 1]⟩,
  ⟨6, [1, 4, 5, 6, 7, 22], [0, 5, 4, 3, 5, 4, 3, 2, 1, 0, 2, 1]⟩,
  ⟨6, [1, 2, 3, 5, 8, 18], [0, 5, 4, 3, 2, 5, 4, 3, 2, 1]⟩,
  ⟨6, [2, 3, 5, 6, 8, 11], [0, 0, 1, 3, 3, 2, 5, 5, 4, 2, 0, 1, 4, 3, 0, 1, 5, 3, 2, 2, 5, 4, 4]⟩,
  ⟨6, [2, 5, 6, 7, 8, 11], [0, 5, 4, 3, 5, 4, 3, 2, 1, 0, 2, 1]⟩,
  ⟨6, [1, 3, 4, 5, 18, 46], [0, 5, 4, 5, 4, 3, 2, 3, 2, 5, 4, 1, 0, 3]⟩,
  ⟨6, [1, 3, 4, 5, 7, 24], [0, 5, 4, 5, 4, 3, 2, 3, 2, 1]⟩,
  ⟨6, [1, 4, 5, 6, 7, 33], [0, 5, 4, 5, 4, 3, 2, 3, 2, 1]⟩,
  ⟨7, [1, 2, 3, 4, 5, 7, 18], [0, 1, 2, 3, 4, 6, 0, 1, 2, 5, 4, 3, 0, 6, 2, 1, 4, 3, 5, 6]⟩,
  ⟨7, [1, 2, 3, 4, 5, 7, 24], [0, 1, 2, 3, 4, 6, 0, 1, 2, 5, 4, 3, 0, 6, 2, 1, 4, 3, 5, 6]⟩,
  ⟨7, [1, 2, 5, 6, 7, 8, 39], [0, 6, 5, 4, 6, 5, 4, 3, 2, 1, 3, 2, 1, 6, 5, 4, 6, 5, 4, 3, 2, 1, 3, 2, 1]⟩,
  ⟨7, [1, 3, 4, 5, 6, 7, 11], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2]⟩,
  ⟨7, [1, 3, 4, 5, 6, 9, 28], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2, 1, 2]⟩,
  ⟨7, [1, 3, 4, 5, 7, 11, 12], [0, 6, 5, 6, 5, 4, 3, 4]⟩,
  ⟨7, [1, 3, 4, 5, 7, 11, 18], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2, 1, 2]⟩,
  ⟨7, [1, 3, 4, 5, 7, 11, 24], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2]⟩,
  ⟨7, [1, 3, 4, 5, 7, 11, 30], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2, 1, 2]⟩,
  ⟨7, [1, 3, 4, 5, 7, 11, 36], [0, 6, 5, 6, 5, 4, 3, 4]⟩,
  ⟨7, [1, 3, 4, 5, 7, 13, 18], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2, 1, 2]⟩,
  ⟨7, [1, 3, 4, 5, 7, 24, 71], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2]⟩,
  ⟨7, [1, 3, 4, 5, 13, 14, 18], [0, 6, 5, 6, 5, 4, 3, 4, 3, 6, 5, 6, 5, 4, 3, 4, 3]⟩,
  ⟨7, [1, 4, 5, 6, 7, 10, 11], [0, 6, 5, 4, 6, 5, 4, 3, 2, 1, 3, 2]⟩,
  ⟨7, [1, 4, 5, 6, 7, 11, 13], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2]⟩,
  ⟨7, [1, 4, 5, 6, 7, 11, 16], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2]⟩,
  ⟨7, [1, 4, 5, 6, 7, 11, 23], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2]⟩,
  ⟨7, [1, 4, 5, 6, 7, 11, 26], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2]⟩,
  ⟨7, [1, 4, 5, 6, 7, 11, 29], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2]⟩,
  ⟨7, [1, 4, 5, 6, 7, 11, 39], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2]⟩,
  ⟨7, [1, 4, 5, 6, 7, 11, 52], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2, 1, 2]⟩,
  ⟨7, [1, 4, 5, 6, 7, 11, 65], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2]⟩,
  ⟨7, [1, 5, 6, 11, 16, 17, 112], [0, 6, 5, 6, 5, 4, 3, 4, 3, 2, 1, 2]⟩,
  ⟨7, [2, 6, 7, 8, 10, 13, 14], [0, 6, 5, 4, 6, 5, 4, 3, 2, 1, 3, 2]⟩,
  ⟨7, [2, 7, 9, 11, 12, 13, 20], [0, 6, 6, 5, 5, 6, 4, 5, 3, 4, 4, 3, 3, 2, 2, 1, 1, 2]⟩,
  ⟨7, [2, 7, 9, 11, 13, 20, 54], [0, 6, 6, 5, 5, 6, 6, 5, 5, 4, 4, 3, 3, 4, 4, 3, 3, 2, 2, 1, 1, 2]⟩,
  ⟨8, [1, 2, 3, 4, 5, 7, 18, 40], [0, 7, 6, 5, 4, 3, 2, 7, 6, 5, 4, 3, 2, 1]⟩,
  ⟨8, [1, 2, 3, 4, 5, 7, 18, 80], [0, 7, 6, 5, 4, 3, 2, 7, 6, 5, 4, 3, 2, 1]⟩,
  ⟨8, [1, 2, 5, 6, 7, 8, 11, 13], [0, 7, 6, 5, 7, 6, 5, 4, 3, 2, 4, 3]⟩,
  ⟨8, [1, 3, 4, 5, 6, 7, 11, 32], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3, 2, 3]⟩,
  ⟨8, [1, 3, 4, 5, 7, 11, 12, 32], [0, 7, 6, 5, 4, 3, 2, 7, 6, 5, 4, 3, 2, 1]⟩,
  ⟨8, [1, 3, 4, 5, 7, 11, 13, 24], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3]⟩,
  ⟨8, [1, 3, 4, 5, 7, 11, 18, 32], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3, 2, 3]⟩,
  ⟨8, [1, 3, 4, 5, 7, 11, 24, 62], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3, 2, 3, 2, 1]⟩,
  ⟨8, [1, 3, 4, 5, 7, 11, 30, 56], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3, 2, 3]⟩,
  ⟨8, [1, 3, 4, 5, 7, 13, 18, 40], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3, 2, 3]⟩,
  ⟨8, [1, 3, 4, 5, 7, 13, 24, 29], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3]⟩,
  ⟨8, [1, 4, 5, 6, 7, 10, 11, 32], [0, 7, 6, 5, 7, 6, 5, 4, 3, 2, 4, 3]⟩,
  ⟨8, [1, 4, 5, 6, 7, 11, 23, 32], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3, 2, 3]⟩,
  ⟨8, [1, 4, 5, 6, 7, 11, 26, 32], [0, 7, 6, 5, 7, 6, 5, 4, 3, 2, 4, 3]⟩,
  ⟨8, [1, 4, 5, 6, 7, 11, 32, 36], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3, 2, 3, 2, 1]⟩,
  ⟨8, [1, 5, 6, 7, 8, 11, 13, 19], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3, 2, 3]⟩,
  ⟨8, [1, 5, 6, 7, 8, 11, 13, 21], [0, 7, 6, 7, 6, 5, 4, 5, 4, 3, 2, 3]⟩]

theorem sporadicCertificates_valid : ∀ c ∈ sporadicCertificates, c.Valid := by
  decide +kernel

def sporadic5 : List (List ℕ) := [
  [1, 3, 4, 5, 9],
  [1, 2, 3, 5, 8],
  [1, 3, 4, 5, 18],
  [1, 4, 5, 6, 7],
  [1, 3, 4, 5, 11],
  [1, 7, 8, 9, 15],
  [2, 5, 7, 8, 9],
  [2, 3, 5, 8, 19],
  [3, 5, 8, 9, 13],
  [3, 5, 8, 11, 13],
  [1, 3, 4, 5, 27],
  [1, 4, 5, 6, 27]]

def sporadic6 : List (List ℕ) := [
  [1, 2, 5, 6, 7, 8],
  [2, 5, 6, 8, 10, 11],
  [1, 4, 5, 6, 7, 22],
  [1, 2, 3, 5, 8, 18],
  [2, 3, 5, 6, 8, 11],
  [2, 5, 6, 7, 8, 11],
  [1, 3, 4, 5, 18, 46],
  [1, 3, 4, 5, 7, 24],
  [1, 4, 5, 6, 7, 33]]

def sporadic7 : List (List ℕ) := [
  [1, 2, 3, 4, 5, 7, 12],
  [1, 2, 3, 4, 5, 7, 18],
  [1, 2, 3, 4, 5, 7, 24],
  [1, 2, 5, 6, 7, 8, 39],
  [1, 3, 4, 5, 6, 7, 11],
  [1, 3, 4, 5, 6, 9, 28],
  [1, 3, 4, 5, 7, 11, 12],
  [1, 3, 4, 5, 7, 11, 18],
  [1, 3, 4, 5, 7, 11, 24],
  [1, 3, 4, 5, 7, 11, 30],
  [1, 3, 4, 5, 7, 11, 36],
  [1, 3, 4, 5, 7, 13, 18],
  [1, 3, 4, 5, 7, 24, 71],
  [1, 3, 4, 5, 13, 14, 18],
  [1, 4, 5, 6, 7, 10, 11],
  [1, 4, 5, 6, 7, 11, 13],
  [1, 4, 5, 6, 7, 11, 16],
  [1, 4, 5, 6, 7, 11, 23],
  [1, 4, 5, 6, 7, 11, 26],
  [1, 4, 5, 6, 7, 11, 29],
  [1, 4, 5, 6, 7, 11, 39],
  [1, 4, 5, 6, 7, 11, 52],
  [1, 4, 5, 6, 7, 11, 65],
  [1, 5, 6, 11, 16, 17, 112],
  [2, 6, 7, 8, 10, 13, 14],
  [2, 7, 9, 11, 12, 13, 20],
  [2, 7, 9, 11, 13, 20, 54]]

def sporadic8 : List (List ℕ) := [
  [1, 2, 3, 4, 5, 7, 18, 40],
  [1, 2, 3, 4, 5, 7, 18, 80],
  [1, 2, 5, 6, 7, 8, 11, 13],
  [1, 3, 4, 5, 6, 7, 11, 32],
  [1, 3, 4, 5, 7, 11, 12, 32],
  [1, 3, 4, 5, 7, 11, 13, 24],
  [1, 3, 4, 5, 7, 11, 18, 32],
  [1, 3, 4, 5, 7, 11, 24, 62],
  [1, 3, 4, 5, 7, 11, 30, 56],
  [1, 3, 4, 5, 7, 13, 18, 40],
  [1, 3, 4, 5, 7, 13, 24, 29],
  [1, 4, 5, 6, 7, 10, 11, 32],
  [1, 4, 5, 6, 7, 11, 23, 32],
  [1, 4, 5, 6, 7, 11, 26, 32],
  [1, 4, 5, 6, 7, 11, 32, 36],
  [1, 5, 6, 7, 8, 11, 13, 19],
  [1, 5, 6, 7, 8, 11, 13, 21]]


def sporadicSets (k : ℕ) : List (List ℕ) :=
  match k with
  | 5 => sporadic5
  | 6 => sporadic6
  | 7 => sporadic7
  | 8 => sporadic8
  | _ => []

def Exceptional (k : ℕ) (D : List ℕ) : Prop :=
  (k = 5 ∧ (D = [1,2,3,5,8] ∨ D = [1,4,5,6,7])) ∨
  (k = 7 ∧ D = [1,2,3,4,5,7,12])

instance (k : ℕ) (D : List ℕ) : Decidable (Exceptional k D) :=
  inferInstanceAs (Decidable ((k = 5 ∧ (D = [1,2,3,5,8] ∨ D = [1,4,5,6,7])) ∨
    (k = 7 ∧ D = [1,2,3,4,5,7,12])))

theorem sporadic_covered : ∀ k ∈ [5,6,7,8], ∀ D ∈ sporadicSets k,
    Exceptional k D ∨ ∃ c ∈ sporadicCertificates, c.k = k ∧ c.D = D := by
  decide +kernel

theorem sporadic_colorable (k : ℕ) (hk : k ∈ [5,6,7,8]) (D : List ℕ)
    (hD : D ∈ sporadicSets k) (h : ¬Exceptional k D) :
    (graph D).Colorable k := by
  rcases sporadic_covered k hk D hD with he | ⟨c,hc,hk',hD'⟩
  · exact False.elim (h he)
  · have hp := c.hasPeriod (sporadicCertificates_valid c hc)
    rw [hk',hD'] at hp
    exact hasPeriod_colorable hp

def A5_distances : List ℕ := [15, 1, 3, 4, 7]
def A5_state : ℕ → ℕ := readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4]
theorem A5_width : ∀ d ∈ A5_distances, d ≤ 15 := by decide +kernel

theorem A5_loop_16 : LoopExists A5_distances 5 15 A5_state 16 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_19 : LoopExists A5_distances 5 15 A5_state 19 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 3, 1, 0, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_24 : LoopExists A5_distances 5 15 A5_state 24 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 1, 0, 2, 0, 2, 4, 1, 4, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_27 : LoopExists A5_distances 5 15 A5_state 27 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 3, 1, 2, 1, 2, 4, 3, 4, 3, 1, 0, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_30 : LoopExists A5_distances 5 15 A5_state 30 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 3, 1, 2, 1, 2, 4, 3, 0, 3, 0, 2, 4, 1, 4, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_33 : LoopExists A5_distances 5 15 A5_state 33 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 3, 1, 0, 1, 0, 2, 3, 2, 3, 1, 0, 4, 0, 2, 3, 1, 4, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_34 : LoopExists A5_distances 5 15 A5_state 34 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 1, 0, 2, 0, 2, 4, 1, 4, 1, 0, 3, 0, 2, 4, 2, 3, 1, 0, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_36 : LoopExists A5_distances 5 15 A5_state 36 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 3, 0, 2, 0, 1, 4, 1, 4, 2, 3, 2, 0, 1, 0, 1, 4, 2, 4, 3, 0, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_37 : LoopExists A5_distances 5 15 A5_state 37 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 3, 1, 2, 1, 0, 4, 0, 2, 3, 1, 3, 1, 0, 2, 0, 4, 3, 4, 3, 1, 0, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_41 : LoopExists A5_distances 5 15 A5_state 41 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 3, 1, 2, 1, 2, 4, 3, 4, 3, 1, 2, 1, 0, 4, 3, 2, 3, 1, 0, 4, 0, 2, 3, 1, 4, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_42 : LoopExists A5_distances 5 15 A5_state 42 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 1, 0, 2, 0, 2, 4, 1, 4, 1, 0, 2, 0, 2, 4, 1, 3, 1, 0, 2, 4, 2, 3, 0, 3, 1, 4, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_44 : LoopExists A5_distances 5 15 A5_state 44 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 1, 0, 2, 0, 2, 4, 1, 4, 3, 0, 2, 0, 1, 4, 1, 4, 2, 3, 2, 0, 1, 0, 1, 4, 2, 4, 3, 0, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_45 : LoopExists A5_distances 5 15 A5_state 45 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 3, 1, 0, 1, 0, 2, 3, 4, 3, 4, 0, 1, 0, 1, 3, 2, 3, 2, 4, 1, 4, 1, 0, 2, 0, 2, 4, 3, 4, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_loop_47 : LoopExists A5_distances 5 15 A5_state 47 := by
  refine ⟨readWord [0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4, 3, 1, 2, 1, 0, 4, 0, 2, 3, 1, 3, 4, 0, 2, 0, 1, 4, 1, 3, 2, 3, 2, 4, 1, 0, 1, 0, 2, 4, 3, 4, 1, 0, 2, 3, 2, 4, 1, 4, 3, 0, 2, 1, 2, 4, 3, 4], ?_⟩
  decide +kernel

theorem A5_all_large_loops : ∀ p : ℕ, 40 ≤ p →
    LoopExists A5_distances 5 15 A5_state p := by
  apply loopExists_all_ge A5_width (by decide : 0 < 16) A5_loop_16
  intro r
  fin_cases r
  · exact (loopExists_add (p := 24) (q := 16) A5_width A5_loop_24 A5_loop_16)
  · exact A5_loop_41
  · exact A5_loop_42
  · exact (loopExists_add (p := 27) (q := 16) A5_width A5_loop_27 A5_loop_16)
  · exact A5_loop_44
  · exact A5_loop_45
  · exact (loopExists_add (p := 30) (q := 16) A5_width A5_loop_30 A5_loop_16)
  · exact A5_loop_47
  · exact (loopExists_add (p := 32) (q := 16) A5_width (loopExists_add (p := 16) (q := 16) A5_width A5_loop_16 A5_loop_16) A5_loop_16)
  · exact (loopExists_add (p := 33) (q := 16) A5_width A5_loop_33 A5_loop_16)
  · exact (loopExists_add (p := 34) (q := 16) A5_width A5_loop_34 A5_loop_16)
  · exact (loopExists_add (p := 35) (q := 16) A5_width (loopExists_add (p := 19) (q := 16) A5_width A5_loop_19 A5_loop_16) A5_loop_16)
  · exact (loopExists_add (p := 36) (q := 16) A5_width A5_loop_36 A5_loop_16)
  · exact (loopExists_add (p := 37) (q := 16) A5_width A5_loop_37 A5_loop_16)
  · exact (loopExists_add (p := 38) (q := 16) A5_width (loopExists_add (p := 19) (q := 19) A5_width A5_loop_19 A5_loop_19) A5_loop_16)
  · exact (loopExists_add (p := 36) (q := 19) A5_width A5_loop_36 A5_loop_19)

theorem A5_all_large_periods (p : ℕ) (hp : 40 ≤ p) :
    HasPeriod A5_distances 5 p :=
  loopExists_hasPeriod A5_width (A5_all_large_loops p hp)

theorem A5_direct_5 : HasPeriod [5, 1, 3, 4, 7] 5 8 := by
  apply wordCertificate_hasPeriod [5, 1, 3, 4, 7] 5 8 (readWord [0, 4, 3, 4, 3, 2, 1, 2]) (by decide)
  decide +kernel

theorem A5_direct_10 : HasPeriod [10, 1, 3, 4, 7] 5 14 := by
  apply wordCertificate_hasPeriod [10, 1, 3, 4, 7] 5 14 (readWord [0, 3, 0, 2, 4, 1, 3, 1, 0, 2, 4, 2, 4, 1]) (by decide)
  decide +kernel

theorem A5_small (s : Fin 11) (hs : 0 < s.val) :
    (graph (5*s.val :: [1, 3, 4, 7])).Colorable 5 := by
  fin_cases s
  · exact (Nat.lt_irrefl 0 hs).elim
  · exact hasPeriod_colorable A5_direct_5
  · exact hasPeriod_colorable A5_direct_10
  · exact hasPeriod_colorable (transport_extra_distance [1, 3, 4, 7] 5 30 15 15
      (by decide) (loopExists_hasPeriod A5_width A5_loop_30) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 3, 4, 7] 5 35 15 20
      (by decide) (loopExists_hasPeriod A5_width (loopExists_add (p := 19) (q := 16) A5_width A5_loop_19 A5_loop_16)) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 3, 4, 7] 5 40 15 25
      (by decide) (loopExists_hasPeriod A5_width (loopExists_add (p := 24) (q := 16) A5_width A5_loop_24 A5_loop_16)) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 3, 4, 7] 5 45 15 30
      (by decide) (loopExists_hasPeriod A5_width A5_loop_45) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 3, 4, 7] 5 50 15 35
      (by decide) (loopExists_hasPeriod A5_width (loopExists_add (p := 34) (q := 16) A5_width A5_loop_34 A5_loop_16)) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 3, 4, 7] 5 55 15 40
      (by decide) (loopExists_hasPeriod A5_width (loopExists_add (p := 36) (q := 19) A5_width A5_loop_36 A5_loop_19)) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 3, 4, 7] 5 30 15 45
      (by decide) (loopExists_hasPeriod A5_width A5_loop_30) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 3, 4, 7] 5 35 15 50
      (by decide) (loopExists_hasPeriod A5_width (loopExists_add (p := 19) (q := 16) A5_width A5_loop_19 A5_loop_16)) (by decide +kernel))

theorem A5_family (s : ℕ) (hs : 0 < s) :
    (graph (5*s :: [1, 3, 4, 7])).Colorable 5 := by
  by_cases h : 54 < 5*s
  · apply extra_distance_of_large_periods [1, 3, 4, 7] 5 15 39 (5*s) (by decide) h
    intro p hp
    exact A5_all_large_periods p (by omega)
  · exact A5_small ⟨s,by omega⟩ hs

def A6_distances : List ℕ := [7, 1, 3, 4, 5, 9]
def A6_state : ℕ → ℕ := readWord [0, 3, 2, 3, 4, 5, 4, 5, 0]
theorem A6_width : ∀ d ∈ A6_distances, d ≤ 9 := by decide +kernel

theorem A6_loop_8 : LoopExists A6_distances 6 9 A6_state 8 := by
  refine ⟨readWord [0, 3, 2, 3, 4, 5, 4, 5, 0, 3, 2, 3, 4, 5, 4, 5, 0], ?_⟩
  decide +kernel

theorem A6_loop_10 : LoopExists A6_distances 6 9 A6_state 10 := by
  refine ⟨readWord [0, 3, 2, 3, 4, 5, 4, 5, 0, 1, 0, 3, 2, 3, 4, 5, 4, 5, 0], ?_⟩
  decide +kernel

theorem A6_loop_14 : LoopExists A6_distances 6 9 A6_state 14 := by
  refine ⟨readWord [0, 3, 2, 3, 4, 5, 4, 5, 0, 1, 2, 1, 4, 5, 0, 3, 2, 3, 4, 5, 4, 5, 0], ?_⟩
  decide +kernel

theorem A6_loop_21 : LoopExists A6_distances 6 9 A6_state 21 := by
  refine ⟨readWord [0, 3, 2, 3, 4, 5, 4, 5, 0, 1, 0, 1, 4, 2, 3, 2, 3, 1, 5, 1, 5, 0, 3, 2, 3, 4, 5, 4, 5, 0], ?_⟩
  decide +kernel

theorem A6_loop_23 : LoopExists A6_distances 6 9 A6_state 23 := by
  refine ⟨readWord [0, 3, 2, 3, 4, 5, 4, 5, 0, 1, 0, 1, 4, 2, 4, 2, 3, 1, 3, 1, 5, 0, 5, 0, 3, 2, 3, 4, 5, 4, 5, 0], ?_⟩
  decide +kernel

theorem A6_loop_27 : LoopExists A6_distances 6 9 A6_state 27 := by
  refine ⟨readWord [0, 3, 2, 3, 4, 5, 4, 5, 0, 1, 0, 1, 4, 2, 3, 2, 0, 1, 5, 1, 3, 2, 3, 4, 5, 4, 5, 0, 3, 2, 3, 4, 5, 4, 5, 0], ?_⟩
  decide +kernel

theorem A6_all_large_loops : ∀ p : ℕ, 26 ≤ p →
    LoopExists A6_distances 6 9 A6_state p := by
  apply loopExists_all_ge A6_width (by decide : 0 < 8) A6_loop_8
  intro r
  fin_cases r
  · exact (loopExists_add (p := 18) (q := 8) A6_width (loopExists_add (p := 10) (q := 8) A6_width A6_loop_10 A6_loop_8) A6_loop_8)
  · exact A6_loop_27
  · exact (loopExists_add (p := 20) (q := 8) A6_width (loopExists_add (p := 10) (q := 10) A6_width A6_loop_10 A6_loop_10) A6_loop_8)
  · exact (loopExists_add (p := 21) (q := 8) A6_width A6_loop_21 A6_loop_8)
  · exact (loopExists_add (p := 22) (q := 8) A6_width (loopExists_add (p := 14) (q := 8) A6_width A6_loop_14 A6_loop_8) A6_loop_8)
  · exact (loopExists_add (p := 23) (q := 8) A6_width A6_loop_23 A6_loop_8)
  · exact (loopExists_add (p := 24) (q := 8) A6_width (loopExists_add (p := 16) (q := 8) A6_width (loopExists_add (p := 8) (q := 8) A6_width A6_loop_8 A6_loop_8) A6_loop_8) A6_loop_8)
  · exact (loopExists_add (p := 23) (q := 10) A6_width A6_loop_23 A6_loop_10)

theorem A6_all_large_periods (p : ℕ) (hp : 26 ≤ p) :
    HasPeriod A6_distances 6 p :=
  loopExists_hasPeriod A6_width (A6_all_large_loops p hp)

theorem A6_direct_6 : HasPeriod [6, 1, 3, 4, 5, 9] 6 10 := by
  apply wordCertificate_hasPeriod [6, 1, 3, 4, 5, 9] 6 10 (readWord [0, 5, 4, 5, 4, 3, 2, 3, 2, 1]) (by decide)
  decide +kernel

theorem A6_direct_12 : HasPeriod [12, 1, 3, 4, 5, 9] 6 8 := by
  apply wordCertificate_hasPeriod [12, 1, 3, 4, 5, 9] 6 8 (readWord [0, 5, 4, 5, 4, 3, 2, 3]) (by decide)
  decide +kernel

theorem A6_direct_18 : HasPeriod [18, 1, 3, 4, 5, 9] 6 12 := by
  apply wordCertificate_hasPeriod [18, 1, 3, 4, 5, 9] 6 12 (readWord [0, 5, 4, 5, 4, 3, 2, 3, 2, 1, 0, 1]) (by decide)
  decide +kernel

theorem A6_small (s : Fin 6) (hs : 0 < s.val) :
    (graph (6*s.val :: [1, 3, 4, 5, 9])).Colorable 6 := by
  fin_cases s
  · exact (Nat.lt_irrefl 0 hs).elim
  · exact hasPeriod_colorable A6_direct_6
  · exact hasPeriod_colorable A6_direct_12
  · exact hasPeriod_colorable A6_direct_18
  · exact hasPeriod_colorable (transport_extra_distance [1, 3, 4, 5, 9] 6 31 7 24
      (by decide) (loopExists_hasPeriod A6_width (loopExists_add (p := 23) (q := 8) A6_width A6_loop_23 A6_loop_8)) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 3, 4, 5, 9] 6 23 7 30
      (by decide) (loopExists_hasPeriod A6_width A6_loop_23) (by decide +kernel))

theorem A6_family (s : ℕ) (hs : 0 < s) :
    (graph (6*s :: [1, 3, 4, 5, 9])).Colorable 6 := by
  by_cases h : 32 < 6*s
  · apply extra_distance_of_large_periods [1, 3, 4, 5, 9] 6 7 25 (6*s) (by decide) h
    intro p hp
    exact A6_all_large_periods p (by omega)
  · exact A6_small ⟨s,by omega⟩ hs

def W2_distances : List ℕ := [10, 1, 2, 3, 4, 5, 7, 12]
def W2_state : ℕ → ℕ := readWord [0, 5, 6, 7, 1, 2, 3, 4, 0, 5, 6, 7]
theorem W2_width : ∀ d ∈ W2_distances, d ≤ 12 := by decide +kernel

theorem W2_loop_8 : LoopExists W2_distances 8 12 W2_state 8 := by
  refine ⟨readWord [0, 5, 6, 7, 1, 2, 3, 4, 0, 5, 6, 7, 1, 2, 3, 4, 0, 5, 6, 7], ?_⟩
  decide +kernel

theorem W2_loop_14 : LoopExists W2_distances 8 12 W2_state 14 := by
  refine ⟨readWord [0, 5, 6, 7, 1, 2, 3, 4, 0, 5, 6, 7, 1, 2, 0, 5, 6, 7, 1, 2, 3, 4, 0, 5, 6, 7], ?_⟩
  decide +kernel

theorem W2_loop_23 : LoopExists W2_distances 8 12 W2_state 23 := by
  refine ⟨readWord [0, 5, 6, 7, 1, 2, 3, 4, 0, 5, 6, 7, 3, 1, 2, 4, 6, 0, 5, 1, 7, 4, 2, 0, 5, 6, 7, 1, 2, 3, 4, 0, 5, 6, 7], ?_⟩
  decide +kernel

theorem W2_loop_43 : LoopExists W2_distances 8 12 W2_state 43 := by
  refine ⟨readWord [0, 5, 6, 7, 1, 2, 3, 4, 0, 5, 6, 7, 1, 4, 2, 5, 6, 7, 1, 0, 2, 3, 4, 5, 6, 0, 7, 1, 4, 5, 6, 2, 7, 1, 0, 3, 4, 2, 5, 6, 7, 3, 4, 0, 5, 6, 7, 1, 2, 3, 4, 0, 5, 6, 7], ?_⟩
  decide +kernel

theorem W2_all_large_loops : ∀ p : ℕ, 50 ≤ p →
    LoopExists W2_distances 8 12 W2_state p := by
  apply loopExists_all_ge W2_width (by decide : 0 < 8) W2_loop_8
  intro r
  fin_cases r
  · exact (loopExists_add (p := 42) (q := 8) W2_width (loopExists_add (p := 28) (q := 14) W2_width (loopExists_add (p := 14) (q := 14) W2_width W2_loop_14 W2_loop_14) W2_loop_14) W2_loop_8)
  · exact (loopExists_add (p := 43) (q := 8) W2_width W2_loop_43 W2_loop_8)
  · exact (loopExists_add (p := 44) (q := 8) W2_width (loopExists_add (p := 36) (q := 8) W2_width (loopExists_add (p := 28) (q := 8) W2_width (loopExists_add (p := 14) (q := 14) W2_width W2_loop_14 W2_loop_14) W2_loop_8) W2_loop_8) W2_loop_8)
  · exact (loopExists_add (p := 45) (q := 8) W2_width (loopExists_add (p := 37) (q := 8) W2_width (loopExists_add (p := 23) (q := 14) W2_width W2_loop_23 W2_loop_14) W2_loop_8) W2_loop_8)
  · exact (loopExists_add (p := 46) (q := 8) W2_width (loopExists_add (p := 38) (q := 8) W2_width (loopExists_add (p := 30) (q := 8) W2_width (loopExists_add (p := 22) (q := 8) W2_width (loopExists_add (p := 14) (q := 8) W2_width W2_loop_14 W2_loop_8) W2_loop_8) W2_loop_8) W2_loop_8) W2_loop_8)
  · exact (loopExists_add (p := 47) (q := 8) W2_width (loopExists_add (p := 39) (q := 8) W2_width (loopExists_add (p := 31) (q := 8) W2_width (loopExists_add (p := 23) (q := 8) W2_width W2_loop_23 W2_loop_8) W2_loop_8) W2_loop_8) W2_loop_8)
  · exact (loopExists_add (p := 48) (q := 8) W2_width (loopExists_add (p := 40) (q := 8) W2_width (loopExists_add (p := 32) (q := 8) W2_width (loopExists_add (p := 24) (q := 8) W2_width (loopExists_add (p := 16) (q := 8) W2_width (loopExists_add (p := 8) (q := 8) W2_width W2_loop_8 W2_loop_8) W2_loop_8) W2_loop_8) W2_loop_8) W2_loop_8) W2_loop_8)
  · exact (loopExists_add (p := 43) (q := 14) W2_width W2_loop_43 W2_loop_14)

theorem W2_all_large_periods (p : ℕ) (hp : 50 ≤ p) :
    HasPeriod W2_distances 8 p :=
  loopExists_hasPeriod W2_width (W2_all_large_loops p hp)

theorem W2_direct_8 : HasPeriod [8, 1, 2, 3, 4, 5, 7, 12] 8 16 := by
  apply wordCertificate_hasPeriod [8, 1, 2, 3, 4, 5, 7, 12] 8 16 (readWord [0, 2, 5, 1, 6, 3, 0, 2, 4, 7, 6, 3, 5, 1, 4, 7]) (by decide)
  decide +kernel

theorem W2_direct_16 : HasPeriod [16, 1, 2, 3, 4, 5, 7, 12] 8 14 := by
  apply wordCertificate_hasPeriod [16, 1, 2, 3, 4, 5, 7, 12] 8 14 (readWord [0, 7, 6, 5, 4, 3, 2, 7, 6, 5, 4, 3, 2, 1]) (by decide)
  decide +kernel

theorem W2_small (s : Fin 8) (hs : 0 < s.val) :
    (graph (8*s.val :: [1, 2, 3, 4, 5, 7, 12])).Colorable 8 := by
  fin_cases s
  · exact (Nat.lt_irrefl 0 hs).elim
  · exact hasPeriod_colorable W2_direct_8
  · exact hasPeriod_colorable W2_direct_16
  · exact hasPeriod_colorable (transport_extra_distance [1, 2, 3, 4, 5, 7, 12] 8 14 10 24
      (by decide) (loopExists_hasPeriod W2_width W2_loop_14) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 2, 3, 4, 5, 7, 12] 8 22 10 32
      (by decide) (loopExists_hasPeriod W2_width (loopExists_add (p := 14) (q := 8) W2_width W2_loop_14 W2_loop_8)) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 2, 3, 4, 5, 7, 12] 8 30 10 40
      (by decide) (loopExists_hasPeriod W2_width (loopExists_add (p := 22) (q := 8) W2_width (loopExists_add (p := 14) (q := 8) W2_width W2_loop_14 W2_loop_8) W2_loop_8)) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 2, 3, 4, 5, 7, 12] 8 38 10 48
      (by decide) (loopExists_hasPeriod W2_width (loopExists_add (p := 30) (q := 8) W2_width (loopExists_add (p := 22) (q := 8) W2_width (loopExists_add (p := 14) (q := 8) W2_width W2_loop_14 W2_loop_8) W2_loop_8) W2_loop_8)) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 2, 3, 4, 5, 7, 12] 8 46 10 56
      (by decide) (loopExists_hasPeriod W2_width (loopExists_add (p := 38) (q := 8) W2_width (loopExists_add (p := 30) (q := 8) W2_width (loopExists_add (p := 22) (q := 8) W2_width (loopExists_add (p := 14) (q := 8) W2_width W2_loop_14 W2_loop_8) W2_loop_8) W2_loop_8) W2_loop_8)) (by decide +kernel))

theorem W2_family (s : ℕ) (hs : 0 < s) :
    (graph (8*s :: [1, 2, 3, 4, 5, 7, 12])).Colorable 8 := by
  by_cases h : 59 < 8*s
  · apply extra_distance_of_large_periods [1, 2, 3, 4, 5, 7, 12] 8 10 49 (8*s) (by decide) h
    intro p hp
    exact W2_all_large_periods p (by omega)
  · exact W2_small ⟨s,by omega⟩ hs

def W3_distances : List ℕ := [8, 1, 4, 5, 6, 7, 11, 13]
def W3_state : ℕ → ℕ := readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4]
theorem W3_width : ∀ d ∈ W3_distances, d ≤ 13 := by decide +kernel

theorem W3_loop_21 : LoopExists W3_distances 8 13 W3_state 21 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 1, 7, 4, 1, 7, 0, 3, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_24 : LoopExists W3_distances 8 13 W3_state 24 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 1, 0, 4, 1, 7, 5, 6, 5, 6, 3, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_26 : LoopExists W3_distances 8 13 W3_state 26 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 1, 0, 4, 1, 0, 5, 7, 5, 6, 7, 6, 3, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_30 : LoopExists W3_distances 8 13 W3_state 30 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 1, 2, 0, 1, 7, 0, 3, 5, 4, 5, 6, 4, 1, 7, 0, 3, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_33 : LoopExists W3_distances 8 13 W3_state 33 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 1, 0, 4, 0, 7, 5, 3, 2, 6, 3, 2, 4, 1, 7, 4, 1, 7, 0, 3, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_36 : LoopExists W3_distances 8 13 W3_state 36 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 1, 0, 4, 0, 7, 5, 3, 2, 6, 1, 2, 4, 1, 0, 4, 5, 7, 5, 6, 7, 6, 3, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_38 : LoopExists W3_distances 8 13 W3_state 38 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 3, 7, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 3, 0, 4, 1, 7, 1, 7, 5, 6, 5, 6, 0, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_39 : LoopExists W3_distances 8 13 W3_state 39 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 1, 2, 0, 1, 0, 5, 6, 3, 4, 3, 7, 4, 1, 2, 0, 1, 2, 5, 6, 7, 4, 6, 7, 0, 3, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_40 : LoopExists W3_distances 8 13 W3_state 40 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 1, 0, 4, 0, 7, 5, 3, 2, 6, 1, 2, 4, 1, 0, 4, 0, 3, 5, 3, 5, 7, 1, 6, 7, 6, 0, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_41 : LoopExists W3_distances 8 13 W3_state 41 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 3, 1, 4, 1, 7, 5, 0, 7, 2, 0, 2, 6, 3, 6, 3, 1, 4, 1, 0, 4, 5, 7, 5, 6, 7, 6, 3, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_43 : LoopExists W3_distances 8 13 W3_state 43 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 1, 2, 0, 1, 0, 5, 3, 5, 7, 4, 6, 7, 1, 6, 0, 1, 0, 2, 4, 5, 2, 4, 5, 7, 1, 6, 7, 6, 0, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_44 : LoopExists W3_distances 8 13 W3_state 44 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 3, 2, 4, 1, 0, 1, 7, 0, 6, 7, 6, 5, 3, 5, 3, 1, 0, 1, 2, 0, 4, 2, 4, 5, 7, 5, 6, 7, 6, 3, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_loop_46 : LoopExists W3_distances 8 13 W3_state 46 := by
  refine ⟨readWord [0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4, 3, 2, 7, 1, 0, 1, 6, 0, 4, 3, 5, 7, 3, 5, 7, 1, 6, 1, 6, 0, 2, 0, 4, 2, 4, 5, 7, 5, 6, 7, 6, 3, 2, 0, 3, 2, 4, 1, 7, 5, 6, 5, 6, 3, 2, 4], ?_⟩
  decide +kernel

theorem W3_all_large_loops : ∀ p : ℕ, 59 ≤ p →
    LoopExists W3_distances 8 13 W3_state p := by
  apply loopExists_all_ge W3_width (by decide : 0 < 21) W3_loop_21
  intro r
  fin_cases r
  · exact (loopExists_add (p := 38) (q := 21) W3_width W3_loop_38 W3_loop_21)
  · exact (loopExists_add (p := 39) (q := 21) W3_width W3_loop_39 W3_loop_21)
  · exact (loopExists_add (p := 40) (q := 21) W3_width W3_loop_40 W3_loop_21)
  · exact (loopExists_add (p := 41) (q := 21) W3_width W3_loop_41 W3_loop_21)
  · exact (loopExists_add (p := 42) (q := 21) W3_width (loopExists_add (p := 21) (q := 21) W3_width W3_loop_21 W3_loop_21) W3_loop_21)
  · exact (loopExists_add (p := 43) (q := 21) W3_width W3_loop_43 W3_loop_21)
  · exact (loopExists_add (p := 44) (q := 21) W3_width W3_loop_44 W3_loop_21)
  · exact (loopExists_add (p := 45) (q := 21) W3_width (loopExists_add (p := 24) (q := 21) W3_width W3_loop_24 W3_loop_21) W3_loop_21)
  · exact (loopExists_add (p := 46) (q := 21) W3_width W3_loop_46 W3_loop_21)
  · exact (loopExists_add (p := 47) (q := 21) W3_width (loopExists_add (p := 26) (q := 21) W3_width W3_loop_26 W3_loop_21) W3_loop_21)
  · exact (loopExists_add (p := 48) (q := 21) W3_width (loopExists_add (p := 24) (q := 24) W3_width W3_loop_24 W3_loop_24) W3_loop_21)
  · exact (loopExists_add (p := 46) (q := 24) W3_width W3_loop_46 W3_loop_24)
  · exact (loopExists_add (p := 50) (q := 21) W3_width (loopExists_add (p := 26) (q := 24) W3_width W3_loop_26 W3_loop_24) W3_loop_21)
  · exact (loopExists_add (p := 51) (q := 21) W3_width (loopExists_add (p := 30) (q := 21) W3_width W3_loop_30 W3_loop_21) W3_loop_21)
  · exact (loopExists_add (p := 52) (q := 21) W3_width (loopExists_add (p := 26) (q := 26) W3_width W3_loop_26 W3_loop_26) W3_loop_21)
  · exact (loopExists_add (p := 50) (q := 24) W3_width (loopExists_add (p := 26) (q := 24) W3_width W3_loop_26 W3_loop_24) W3_loop_24)
  · exact (loopExists_add (p := 54) (q := 21) W3_width (loopExists_add (p := 33) (q := 21) W3_width W3_loop_33 W3_loop_21) W3_loop_21)
  · exact (loopExists_add (p := 52) (q := 24) W3_width (loopExists_add (p := 26) (q := 26) W3_width W3_loop_26 W3_loop_26) W3_loop_24)
  · exact (loopExists_add (p := 56) (q := 21) W3_width (loopExists_add (p := 30) (q := 26) W3_width W3_loop_30 W3_loop_26) W3_loop_21)
  · exact (loopExists_add (p := 57) (q := 21) W3_width (loopExists_add (p := 36) (q := 21) W3_width W3_loop_36 W3_loop_21) W3_loop_21)
  · exact (loopExists_add (p := 46) (q := 33) W3_width W3_loop_46 W3_loop_33)

theorem W3_all_large_periods (p : ℕ) (hp : 59 ≤ p) :
    HasPeriod W3_distances 8 p :=
  loopExists_hasPeriod W3_width (W3_all_large_loops p hp)

theorem W3_direct_8 : HasPeriod [8, 1, 4, 5, 6, 7, 11, 13] 8 12 := by
  apply wordCertificate_hasPeriod [8, 1, 4, 5, 6, 7, 11, 13] 8 12 (readWord [0, 7, 6, 7, 6, 5, 4, 5, 4, 3, 2, 3]) (by decide)
  decide +kernel

theorem W3_direct_24 : HasPeriod [24, 1, 4, 5, 6, 7, 11, 13] 8 10 := by
  apply wordCertificate_hasPeriod [24, 1, 4, 5, 6, 7, 11, 13] 8 10 (readWord [0, 7, 6, 7, 6, 5, 4, 5, 4, 3]) (by decide)
  decide +kernel

theorem W3_small (s : Fin 9) (hs : 0 < s.val) :
    (graph (8*s.val :: [1, 4, 5, 6, 7, 11, 13])).Colorable 8 := by
  fin_cases s
  · exact (Nat.lt_irrefl 0 hs).elim
  · exact hasPeriod_colorable W3_direct_8
  · exact hasPeriod_colorable (transport_extra_distance [1, 4, 5, 6, 7, 11, 13] 8 24 8 16
      (by decide) (loopExists_hasPeriod W3_width W3_loop_24) (by decide +kernel))
  · exact hasPeriod_colorable W3_direct_24
  · exact hasPeriod_colorable (transport_extra_distance [1, 4, 5, 6, 7, 11, 13] 8 24 8 32
      (by decide) (loopExists_hasPeriod W3_width W3_loop_24) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 4, 5, 6, 7, 11, 13] 8 48 8 40
      (by decide) (loopExists_hasPeriod W3_width (loopExists_add (p := 24) (q := 24) W3_width W3_loop_24 W3_loop_24)) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 4, 5, 6, 7, 11, 13] 8 40 8 48
      (by decide) (loopExists_hasPeriod W3_width W3_loop_40) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 4, 5, 6, 7, 11, 13] 8 48 8 56
      (by decide) (loopExists_hasPeriod W3_width (loopExists_add (p := 24) (q := 24) W3_width W3_loop_24 W3_loop_24)) (by decide +kernel))
  · exact hasPeriod_colorable (transport_extra_distance [1, 4, 5, 6, 7, 11, 13] 8 56 8 64
      (by decide) (loopExists_hasPeriod W3_width (loopExists_add (p := 30) (q := 26) W3_width W3_loop_30 W3_loop_26)) (by decide +kernel))

theorem W3_family (s : ℕ) (hs : 0 < s) :
    (graph (8*s :: [1, 4, 5, 6, 7, 11, 13])).Colorable 8 := by
  by_cases h : 66 < 8*s
  · apply extra_distance_of_large_periods [1, 4, 5, 6, 7, 11, 13] 8 8 58 (8*s) (by decide) h
    intro p hp
    exact W3_all_large_periods p (by omega)
  · exact W3_small ⟨s,by omega⟩ hs

def base_distances : List ℕ := [1, 2, 3, 5, 7, 8]
def base_state : ℕ → ℕ := readWord [0, 5, 1, 2, 3, 4, 0, 5]
theorem base_width : ∀ d ∈ base_distances, d ≤ 8 := by decide +kernel

theorem base_loop_6 : LoopExists base_distances 6 8 base_state 6 := by
  refine ⟨readWord [0, 5, 1, 2, 3, 4, 0, 5, 1, 2, 3, 4, 0, 5], ?_⟩
  decide +kernel

theorem base_loop_10 : LoopExists base_distances 6 8 base_state 10 := by
  refine ⟨readWord [0, 5, 1, 2, 3, 4, 0, 5, 1, 2, 0, 5, 1, 2, 3, 4, 0, 5], ?_⟩
  decide +kernel

theorem base_loop_29 : LoopExists base_distances 6 8 base_state 29 := by
  refine ⟨readWord [0, 5, 1, 2, 3, 4, 0, 5, 3, 4, 0, 5, 2, 1, 3, 4, 2, 1, 3, 0, 5, 4, 2, 0, 3, 4, 5, 1, 2, 0, 5, 1, 2, 3, 4, 0, 5], ?_⟩
  decide +kernel

theorem base_loop_43 : LoopExists base_distances 6 8 base_state 43 := by
  refine ⟨readWord [0, 5, 1, 2, 3, 4, 0, 5, 1, 4, 0, 5, 2, 3, 1, 4, 0, 3, 1, 4, 0, 5, 2, 3, 1, 5, 2, 3, 4, 0, 1, 5, 4, 0, 1, 5, 2, 3, 4, 0, 2, 3, 4, 0, 5, 1, 2, 3, 4, 0, 5], ?_⟩
  decide +kernel

theorem base_all_large_loops : ∀ p : ℕ, 38 ≤ p →
    LoopExists base_distances 6 8 base_state p := by
  apply loopExists_all_ge base_width (by decide : 0 < 6) base_loop_6
  intro r
  fin_cases r
  · exact (loopExists_add (p := 32) (q := 6) base_width (loopExists_add (p := 26) (q := 6) base_width (loopExists_add (p := 20) (q := 6) base_width (loopExists_add (p := 10) (q := 10) base_width base_loop_10 base_loop_10) base_loop_6) base_loop_6) base_loop_6)
  · exact (loopExists_add (p := 29) (q := 10) base_width base_loop_29 base_loop_10)
  · exact (loopExists_add (p := 34) (q := 6) base_width (loopExists_add (p := 28) (q := 6) base_width (loopExists_add (p := 22) (q := 6) base_width (loopExists_add (p := 16) (q := 6) base_width (loopExists_add (p := 10) (q := 6) base_width base_loop_10 base_loop_6) base_loop_6) base_loop_6) base_loop_6) base_loop_6)
  · exact (loopExists_add (p := 35) (q := 6) base_width (loopExists_add (p := 29) (q := 6) base_width base_loop_29 base_loop_6) base_loop_6)
  · exact (loopExists_add (p := 36) (q := 6) base_width (loopExists_add (p := 30) (q := 6) base_width (loopExists_add (p := 24) (q := 6) base_width (loopExists_add (p := 18) (q := 6) base_width (loopExists_add (p := 12) (q := 6) base_width (loopExists_add (p := 6) (q := 6) base_width base_loop_6 base_loop_6) base_loop_6) base_loop_6) base_loop_6) base_loop_6) base_loop_6)
  · exact base_loop_43

theorem base_all_large_periods (p : ℕ) (hp : 38 ≤ p) :
    HasPeriod base_distances 6 p :=
  loopExists_hasPeriod base_width (base_all_large_loops p hp)

end OravcovaSotak
