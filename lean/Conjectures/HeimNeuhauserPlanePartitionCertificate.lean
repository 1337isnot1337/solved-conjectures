import Conjectures.HeimNeuhauserPlanePartitionData

/-! An integer certificate simultaneously checks the two evaluations and the
coefficientwise comparison for all real parameters at and above one. -/

namespace PlanePartition

open Polynomial
open OrdinaryDarcais (rowPoly compareDigits eval_lt_of_packed_check)

def turanLeft (a : ℕ → ℕ) (n : ℕ) := (n + 1) * a n ^ 2

def turanRight (a : ℕ → ℕ) (n : ℕ) := n * a (n - 1) * a (n + 1)

/-- Exact bounds on every base digit and the strict constant coefficient. -/
def SignCertificate (n : ℕ) : Prop :=
  turanLeft massAt n < digitBase ∧ turanRight massAt n < digitBase ∧
  compareDigits digitBase (2 * n + 1) (turanLeft packedAt n) (turanRight packedAt n) = true ∧
  turanRight packedAt n % digitBase < turanLeft packedAt n % digitBase

instance (n : ℕ) : Decidable (SignCertificate n) := by unfold SignCertificate; infer_instance

def IndexCertificate (n : ℕ) : Prop :=
  massAt (n + 1) = 2 * nestedSum n massAt n ∧
  packedAt (n + 1) = (1 + digitBase) * nestedSum n packedAt n ∧
  (12 ≤ n → SignCertificate n)

instance (n : ℕ) : Decidable (IndexCertificate n) := by unfold IndexCertificate; infer_instance

theorem strictTuran_of_certificates {N : ℕ} (h₀ : massAt 0 = 1 ∧ packedAt 0 = 1)
    (cert : ∀ j < N, IndexCertificate j) {n : ℕ} (hn : 12 ≤ n) (hn' : n < N)
    {x : ℝ} (hx : 1 ≤ x) :
    planePartition x (n - 1) * planePartition x (n + 1) < planePartition x n ^ 2 := by
  let p (i : ℕ) := rowPoly (checkedRow 1 i)
  have mass (j : ℕ) (hj : j ≤ N) : massAt j = (p j).eval 1 :=
    scalarCandidate_eval (e := 1) h₀.1 (fun k hk => (cert k hk).1) hj
  have packed (j : ℕ) (hj : j ≤ N) : packedAt j = (p j).eval digitBase :=
    scalarCandidate_eval (e := 1) h₀.2 (fun k hk => (cert k hk).2.1) hj
  let l := C (n + 1) * p n ^ 2
  let r := C n * p (n - 1) * p (n + 1)
  have Hl {a : ℕ → ℕ} {d : ℕ} (ha : ∀ j, j ≤ N → a j = (p j).eval d) :
      turanLeft a n = l.eval d := by
    simp [turanLeft, l, ha n (by omega)]
  have Hr {a : ℕ → ℕ} {d : ℕ} (ha : ∀ j, j ≤ N → a j = (p j).eval d) :
      turanRight a n = r.eval d := by
    simp [turanRight, r, ha (n - 1) (by omega), ha (n + 1) (by omega)]
  obtain ⟨hL, hR, hd, hstrict⟩ := (cert n hn').2.2 hn
  rw [Hl mass] at hL
  rw [Hr mass] at hR
  rw [Hl packed, Hr packed] at hd
  rw [Hl packed, Hr packed] at hstrict
  have hh := eval_lt_of_packed_check hL hR hd hstrict (sub_nonneg.mpr hx)
  simp only [l, r, p, eval₂_mul, eval₂_pow, eval₂_C, Nat.coe_castRingHom, checkedRow_eval] at hh
  have h := strictTuran_of_scaled (by omega : 0 < n) hh
  simpa only [Nat.cast_one, add_sub_cancel] using h

end PlanePartition
