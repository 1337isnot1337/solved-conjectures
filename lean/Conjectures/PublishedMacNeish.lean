import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fintype.Card
import Mathlib.Data.Fintype.Prod
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Tactic.Abel

/-!
# MacNeish's conjecture

E. T. Parker, Proc. AMS 10 (1959), 946–949.
Bose, Shrikhande and Parker, Can. J. Math. 12 (1960), 189–203, §1.
Three order-21 squares reconstructed by the cyclic block-design method.
-/
namespace PublishedMacNeish

abbrev Square (n : ℕ) := ZMod n → ZMod n → ZMod n

def Latin {n : ℕ} (s : Square n) : Prop :=
  (∀ i, Function.Bijective (s i)) ∧
  (∀ j, Function.Bijective (fun i => s i j))

def Orthogonal {n : ℕ} (s t : Square n) : Prop :=
  Function.Bijective (fun p : ZMod n × ZMod n =>
    (s p.1 p.2, t p.1 p.2))

def HasMOLS (n k : ℕ) : Prop :=
  ∃ A : Fin k → Square n, (∀ i, Latin (A i)) ∧
    ∀ i j, i ≠ j → Orthogonal (A i) (A j)

/-- Being bounded by the minimum exact prime-power factor minus one. -/
def MacNeishBound (n k : ℕ) : Prop :=
  ∀ p e : ℕ, p.Prime → 0 < e → p ^ e ∣ n →
    ¬ p ^ (e + 1) ∣ n → k ≤ p ^ e - 1

/-- N(n) equals the minimum prime-power factor minus one, expressed
as the equivalence between attainable family sizes and the bound. -/
def MacNeishConjecture : Prop :=
  ∀ n k : ℕ, 2 ≤ n → (HasMOLS n k ↔ MacNeishBound n k)

/-- First rows of three cyclic squares obtained from translations of the
(21,5,1) difference set {0,1,4,14,16}. -/
def firstRow : Fin 3 → ZMod 21 → ZMod 21 :=
  ![![0, 4, 7, 13, 16, 6, 19, 11, 2, 5, 12, 8, 18, 20, 1, 3, 14, 10, 17, 9, 15], ![0, 14, 8, 15, 1, 9, 5, 2, 11, 19, 17, 7, 10, 3, 16, 20, 4, 18, 12, 6, 13], ![0, 16, 11, 20, 14, 19, 9, 8, 7, 6, 18, 2, 17, 15, 4, 13, 1, 12, 10, 5, 3]]

private def rowInv : Fin 3 → ZMod 21 → ZMod 21 :=
  ![![0, 14, 8, 15, 1, 9, 5, 2, 11, 19, 17, 7, 10, 3, 16, 20, 4, 18, 12, 6, 13], ![0, 4, 7, 13, 16, 6, 19, 11, 2, 5, 12, 8, 18, 20, 1, 3, 14, 10, 17, 9, 15], ![0, 16, 11, 20, 14, 19, 9, 8, 7, 6, 18, 2, 17, 15, 4, 13, 1, 12, 10, 5, 3]]

private def colInv : Fin 3 → ZMod 21 → ZMod 21 :=
  ![![0, 5, 10, 1, 7, 2, 12, 13, 14, 15, 3, 19, 4, 6, 17, 8, 20, 9, 11, 16, 18], ![0, 17, 14, 8, 5, 15, 2, 10, 19, 16, 9, 13, 3, 1, 20, 18, 7, 11, 4, 12, 6], ![0, 7, 13, 6, 20, 12, 16, 19, 10, 2, 4, 14, 11, 18, 5, 1, 17, 3, 9, 15, 8]]

private def diffInv : Fin 3 → Fin 3 → ZMod 21 → ZMod 21 :=
  ![![![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 2, 3, 5, 13, 10, 4, 6, 17, 8, 1, 16, 7, 12, 9, 14, 18, 15, 19, 20, 11], ![0, 9, 17, 14, 2, 8, 10, 3, 16, 20, 15, 6, 1, 5, 18, 11, 13, 19, 7, 4, 12]], ![![0, 11, 20, 19, 15, 18, 14, 9, 12, 7, 16, 1, 8, 17, 6, 4, 10, 13, 5, 3, 2], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], ![0, 10, 1, 2, 6, 3, 7, 12, 9, 14, 5, 20, 13, 4, 15, 17, 11, 8, 16, 18, 19]], ![![0, 12, 4, 7, 19, 13, 11, 18, 5, 1, 6, 15, 20, 16, 3, 10, 8, 2, 14, 17, 9], ![0, 19, 18, 16, 8, 11, 17, 15, 4, 13, 20, 5, 14, 9, 12, 7, 3, 6, 2, 1, 10], ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]]

set_option maxRecDepth 100000
set_option maxHeartbeats 0

private theorem rowCert : ∀ k : Fin 3, ∀ x : ZMod 21,
    firstRow k (rowInv k x) = x := by decide

private theorem colCert : ∀ k : Fin 3, ∀ x : ZMod 21,
    firstRow k (colInv k x) - colInv k x = x := by decide

private theorem diffCert : ∀ k l : Fin 3, k ≠ l → ∀ x : ZMod 21,
    firstRow l (diffInv k l x) - firstRow k (diffInv k l x) = x := by decide

def squares (k : Fin 3) : Square 21 :=
  fun a b => a + firstRow k (b - a)

theorem squares_latin (k : Fin 3) : Latin (squares k) := by
  constructor
  · intro a
    apply Finite.surjective_iff_bijective.mp
    intro z
    let d := rowInv k (z - a)
    have hd : firstRow k d = z - a := rowCert k (z - a)
    refine ⟨a + d, ?_⟩
    change a + firstRow k (a + d - a) = z
    rw [show a + d - a = d by abel, hd]
    abel
  · intro b
    apply Finite.surjective_iff_bijective.mp
    intro z
    let d := colInv k (z - b)
    have hd : firstRow k d - d = z - b := colCert k (z - b)
    refine ⟨b - d, ?_⟩
    change b - d + firstRow k (b - (b - d)) = z
    rw [show b - (b - d) = d by abel]
    calc
      b - d + firstRow k d = b + (firstRow k d - d) := by abel
      _ = z := by rw [hd]; abel

theorem squares_orthogonal (k l : Fin 3) (h : k ≠ l) :
    Orthogonal (squares k) (squares l) := by
  apply Finite.surjective_iff_bijective.mp
  intro z
  let d := diffInv k l (z.2 - z.1)
  let a := z.1 - firstRow k d
  let b := a + d
  have hd : firstRow l d - firstRow k d = z.2 - z.1 :=
    diffCert k l h (z.2 - z.1)
  refine ⟨(a, b), ?_⟩
  change (a + firstRow k (b - a), a + firstRow l (b - a)) = z
  rw [show b - a = d by dsimp [b]; abel]
  apply Prod.ext
  · change a + firstRow k d = z.1
    dsimp [a]
    abel
  · change a + firstRow l d = z.2
    calc
      a + firstRow l d = z.1 + (firstRow l d - firstRow k d) := by
        dsimp [a]; abel
      _ = z.2 := by rw [hd]; abel

theorem three_order21 : HasMOLS 21 3 :=
  ⟨squares, squares_latin, squares_orthogonal⟩

theorem not_bound : ¬ MacNeishBound 21 3 := by
  intro h
  exact (by decide : ¬ 3 ≤ 3 ^ 1 - 1)
    (h 3 1 (by decide) (by decide) (by decide) (by decide))

theorem macneish_conjecture_false : ¬ MacNeishConjecture := by
  intro h
  exact not_bound ((h 21 3 (by decide)).mp three_order21)

end PublishedMacNeish
