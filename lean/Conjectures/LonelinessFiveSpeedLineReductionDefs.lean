import Conjectures.LonelinessFiveSpeedLinearReductionElimination

/-! Finite certificates for the 200 parameter relations.  Each certificate
checks a nonzero pivot and classifies the resulting two-column integer matrix.
The retained-map indices are the original 164-map indices. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def lineCriticalPattern (second : Bool) : Fin 4 → ℕ :=
  if second then ![1, 3, 4, 7] else ![1, 2, 3, 4]

structure LineCriticalPayload where
  second : Bool
  root : Fin 5
  selected : Fin 4 → Fin 5
  negative : Fin 4 → Bool

def lineCriticalSign (payload : LineCriticalPayload) (k : Fin 4) : ℤ :=
  if payload.negative k then -1 else 1

def lineCriticalRowsCheck (B : Matrix (Fin 5) (Fin 2) ℤ)
    (payload : LineCriticalPayload) : Bool :=
  decide (∀ k : Fin 4, ∀ j : Fin 2,
    B (payload.selected k) j =
      lineCriticalSign payload k * (lineCriticalPattern payload.second k : ℤ) * B payload.root j)

inductive LineDisposition where
  | image (index : Fin 164)
  | critical (payload : LineCriticalPayload)
  | repeated (left right : Fin 5) (negative : Bool)

structure LineCertificate where
  pivot : Fin 3
  disposition : LineDisposition

def lineDispositionCheck (maps : Fin 164 → Matrix (Fin 5) (Fin 2) ℤ)
    (B : Matrix (Fin 5) (Fin 2) ℤ) : LineDisposition → Bool
  | .image m => decide (∀ i : Fin 5, ∀ j : Fin 2, B i j - maps m i j = 0)
  | .critical payload => lineCriticalRowsCheck B payload
  | .repeated left right negative =>
      decide (left ≠ right) &&
        decide (∀ j : Fin 2, B left j = (if negative then (-1 : ℤ) else 1) * B right j)

def LineDispositionValid (maps : Fin 164 → Matrix (Fin 5) (Fin 2) ℤ)
    (B : Matrix (Fin 5) (Fin 2) ℤ) : LineDisposition → Prop
  | .image m => B = maps m
  | .critical payload => ∀ k : Fin 4, ∀ j : Fin 2,
      B (payload.selected k) j =
        lineCriticalSign payload k * (lineCriticalPattern payload.second k : ℤ) * B payload.root j
  | .repeated left right negative => left ≠ right ∧
      ∀ j : Fin 2, B left j = (if negative then (-1 : ℤ) else 1) * B right j

theorem lineDispositionCheck_sound (maps : Fin 164 → Matrix (Fin 5) (Fin 2) ℤ)
    (B : Matrix (Fin 5) (Fin 2) ℤ) (disposition : LineDisposition)
    (hcheck : lineDispositionCheck maps B disposition = true) :
    LineDispositionValid maps B disposition := by
  cases disposition with
  | image m =>
      have h : ∀ i : Fin 5, ∀ j : Fin 2, B i j - maps m i j = 0 := by
        simpa only [lineDispositionCheck, decide_eq_true_eq] using hcheck
      exact funext (fun i => funext (fun j => sub_eq_zero.mp (h i j)))
  | critical payload =>
      simpa only [lineDispositionCheck, lineCriticalRowsCheck, decide_eq_true_eq,
        LineDispositionValid] using hcheck
  | repeated left right negative =>
      simpa only [lineDispositionCheck, Bool.and_eq_true, decide_eq_true_eq,
        LineDispositionValid] using hcheck

def lineCaseCheck (maps : Fin 164 → Matrix (Fin 5) (Fin 2) ℤ)
    (A : ThreeParameterMap) (h : ThreeIntegerVector) (certificate : LineCertificate) : Bool :=
  decide (h certificate.pivot ≠ 0) &&
    lineDispositionCheck maps (lineEliminationMap A h certificate.pivot) certificate.disposition

theorem lineCaseCheck_conditions (maps : Fin 164 → Matrix (Fin 5) (Fin 2) ℤ)
    (A : ThreeParameterMap) (h : ThreeIntegerVector) (certificate : LineCertificate)
    (hcheck : lineCaseCheck maps A h certificate = true) :
    h certificate.pivot ≠ 0 ∧
      LineDispositionValid maps (lineEliminationMap A h certificate.pivot)
        certificate.disposition := by
  have hc : decide (h certificate.pivot ≠ 0) = true ∧
      lineDispositionCheck maps (lineEliminationMap A h certificate.pivot)
        certificate.disposition = true := Bool.and_eq_true_iff.mp hcheck
  exact ⟨of_decide_eq_true hc.1,
    lineDispositionCheck_sound maps _ certificate.disposition hc.2⟩

/-- A checked table covers every form and rejects either length mismatch. -/
def lineTableCheck (maps : Fin 164 → Matrix (Fin 5) (Fin 2) ℤ)
    (A : ThreeParameterMap) : List ThreeIntegerVector → List LineCertificate → Bool
  | [], [] => true
  | h :: hs, certificate :: certificates =>
      lineCaseCheck maps A h certificate && lineTableCheck maps A hs certificates
  | _, _ => false

theorem lineTableCheck_mem (maps : Fin 164 → Matrix (Fin 5) (Fin 2) ℤ)
    (A : ThreeParameterMap) (forms : List ThreeIntegerVector)
    (certificates : List LineCertificate)
    (hcheck : lineTableCheck maps A forms certificates = true)
    {h : ThreeIntegerVector} (hmem : h ∈ forms) :
    ∃ certificate ∈ certificates, lineCaseCheck maps A h certificate = true := by
  induction forms generalizing certificates with
  | nil => simp at hmem
  | cons g gs ih =>
      cases certificates with
      | nil => simp [lineTableCheck] at hcheck
      | cons certificate certificates =>
          have hc : lineCaseCheck maps A g certificate = true ∧
              lineTableCheck maps A gs certificates = true := Bool.and_eq_true_iff.mp hcheck
          rcases List.mem_cons.mp hmem with rfl | hmem
          · exact ⟨certificate, by simp, hc.1⟩
          · obtain ⟨chosen, hchosen, hvalid⟩ := ih certificates hc.2 hmem
            exact ⟨chosen, by simp [hchosen], hvalid⟩

structure LineMapFactsPayload where
  xRow : Fin 5
  yRow : Fin 5
  maxRow : Fin 5

def lineMapFactsCheck (B : Matrix (Fin 5) (Fin 2) ℤ) (L : ℕ)
    (payload : LineMapFactsPayload) : Bool :=
  decide (0 < L ∧ L ≤ 17 ∧
    (∀ i : Fin 5, (B i 0).natAbs + (B i 1).natAbs ≤ L) ∧
    (B payload.maxRow 0).natAbs + (B payload.maxRow 1).natAbs = L ∧
    B payload.xRow 1 = 0 ∧ B payload.xRow 0 ≠ 0 ∧
    B payload.yRow 0 = 0 ∧ B payload.yRow 1 ≠ 0)

theorem lineMapFactsCheck_sound (B : Matrix (Fin 5) (Fin 2) ℤ) (L : ℕ)
    (payload : LineMapFactsPayload) (hcheck : lineMapFactsCheck B L payload = true) :
    0 < L ∧ L ≤ 17 ∧
      (∀ i : Fin 5, (B i 0).natAbs + (B i 1).natAbs ≤ L) ∧
      (B payload.maxRow 0).natAbs + (B payload.maxRow 1).natAbs = L ∧
      B payload.xRow 1 = 0 ∧ B payload.xRow 0 ≠ 0 ∧
      B payload.yRow 0 = 0 ∧ B payload.yRow 1 ≠ 0 := by
  simpa only [lineMapFactsCheck, decide_eq_true_eq] using hcheck

end Loneliness.FiveSpeedCertificate
