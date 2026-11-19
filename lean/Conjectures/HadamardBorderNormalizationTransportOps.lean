import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Group.Units.Equiv
import Mathlib.Data.Fintype.Fin

/-!
# Row operations and quotient compression

Permuting four rows, multiplying them independently by signs, and translating
them independently preserve their combined periodic autocorrelation. Their
effect on quotient compression is an explicit sign and quotient translation.
These identities require no chosen quotient splitting or cardinality premise.
-/

namespace HadamardBorderNormalizationTransport

open scoped BigOperators

abbrev Rows (G : Type*) := Fin 4 → G → ℤ

def SignValued {X : Type*} (f : X → ℤ) : Prop := ∀ x, f x = 1 ∨ f x = -1

variable {G Q : Type*}

section Definitions

variable [Fintype G] [AddCommGroup G]

def correlation (f : G → ℤ) (u : G) : ℤ := ∑ x, f x * f (x + u)

def combinedCorrelation (f : Rows G) (u : G) : ℤ := ∑ i, correlation (f i) u

def transformRows (f : Rows G) (σ : Equiv.Perm (Fin 4))
    (s : Fin 4 → ℤ) (t : Fin 4 → G) : Rows G :=
  fun i x => s i * f (σ i) (x + t i)

end Definitions

section Compression

variable [Fintype G] [AddCommGroup G] [AddCommGroup Q] [DecidableEq Q]

def compress (π : G →+ Q) (f : G → ℤ) (q : Q) : ℤ :=
  ∑ x, if π x = q then f x else 0

theorem compress_mul (π : G →+ Q) (ε : ℤ) (f : G → ℤ) (q : Q) :
    compress π (fun x => ε * f x) q = ε * compress π f q := by
  simp only [compress, Finset.mul_sum, mul_ite, mul_zero]

theorem compress_translate (π : G →+ Q) (f : G → ℤ) (t : G) (q : Q) :
    compress π (fun x => f (x + t)) q = compress π f (q + π t) := by
  unfold compress
  apply Fintype.sum_equiv (Equiv.addRight t)
  intro x
  change (if π x = q then f (x + t) else 0) =
    (if π (x + t) = q + π t then f (x + t) else 0)
  simp [map_add]

theorem transformRows_compress (π : G →+ Q) (f : Rows G)
    (σ : Equiv.Perm (Fin 4)) (s : Fin 4 → ℤ) (t : Fin 4 → G)
    (i : Fin 4) (q : Q) :
    compress π (transformRows f σ s t i) q =
      s i * compress π (f (σ i)) (q + π (t i)) := by
  change compress π (fun x => s i * f (σ i) (x + t i)) q = _
  rw [compress_mul, compress_translate]

end Compression

section Sign

variable [AddCommGroup G]

theorem transformRows_preserves_sign (f : Rows G) (σ : Equiv.Perm (Fin 4))
    (s : Fin 4 → ℤ) (t : Fin 4 → G) (hs : SignValued s)
    (hf : ∀ i, SignValued (f i)) : ∀ i, SignValued (transformRows f σ s t i) := by
  intro i x
  rcases hs i with hs | hs <;>
    rcases hf (σ i) (x + t i) with hf | hf <;>
    simp [transformRows, hs, hf]

end Sign

section Correlation

variable [Fintype G] [AddCommGroup G]

theorem correlation_translate (f : G → ℤ) (t u : G) :
    correlation (fun x => f (x + t)) u = correlation f u := by
  unfold correlation
  apply Fintype.sum_equiv (Equiv.addRight t)
  intro x
  change f (x + t) * f ((x + u) + t) = f (x + t) * f ((x + t) + u)
  rw [add_right_comm x u t]

theorem correlation_mul_sign (f : G → ℤ) (ε : ℤ) (hε : ε = 1 ∨ ε = -1)
    (u : G) : correlation (fun x => ε * f x) u = correlation f u := by
  rcases hε with rfl | rfl <;> simp [correlation]

theorem transformRows_preserves_correlation (f : Rows G)
    (σ : Equiv.Perm (Fin 4)) (s : Fin 4 → ℤ) (t : Fin 4 → G)
    (hs : SignValued s) (u : G) :
    combinedCorrelation (transformRows f σ s t) u = combinedCorrelation f u := by
  unfold combinedCorrelation
  calc
    (∑ i, correlation (transformRows f σ s t i) u) =
        ∑ i, correlation (f (σ i)) u := by
      apply Finset.sum_congr rfl
      intro i hi
      change correlation (fun x => s i * f (σ i) (x + t i)) u =
        correlation (f (σ i)) u
      rw [correlation_mul_sign (fun x => f (σ i) (x + t i)) (s i) (hs i) u,
        correlation_translate]
    _ = ∑ i, correlation (f i) u :=
      Equiv.sum_comp σ (fun i => correlation (f i) u)

end Correlation

end HadamardBorderNormalizationTransport
