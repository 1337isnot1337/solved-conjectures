import Conjectures.MaTangCoreLinear

/-!
# Ma–Tang's random subset-sum threshold conjecture

Bijection between bounded encoded labels and literal binary rows.
-/
namespace MaTangCoreEncoding
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear

def codeRow : List Bool → Nat
  | [] => 0
  | b :: bs => 2 * codeRow bs + (if b then 1 else 0)

def decodeRow : Nat → Nat → List Bool
  | 0, _ => []
  | n+1, b => (b % 2 == 1) :: decodeRow n (b/2)

theorem decodeRow_length (n b : Nat) : (decodeRow n b).length = n := by
  induction n generalizing b with
  | zero => rfl
  | succ n ih => simp [decodeRow,ih]

theorem codeRow_bound (u : List Bool) : codeRow u < 2^u.length := by
  induction u with
  | nil => decide
  | cons b bs ih =>
    simp only [List.length_cons,Nat.pow_succ,codeRow]
    cases b <;> simp <;> omega

theorem codeRow_decode (n b : Nat) (h : b < 2^n) :
    codeRow (decodeRow n b) = b := by
  induction n generalizing b with
  | zero =>
    simp at h
    have e : b = 0 := by omega
    simp [e,codeRow,decodeRow]
  | succ n ih =>
    simp only [Nat.pow_succ] at h
    have h' : b/2 < 2^n := by omega
    simp only [decodeRow,codeRow,ih (b/2) h']
    by_cases hb : b%2 = 1
    · simp [hb]; omega
    · have hz : b%2 = 0 := by omega
      simp [hz]; omega

theorem decodeRow_code (u : List Bool) : decodeRow u.length (codeRow u) = u := by
  induction u with
  | nil => rfl
  | cons b bs ih =>
    simp only [List.length_cons,codeRow,decodeRow]
    cases b
    · have hd : (2*codeRow bs+0)/2 = codeRow bs := by omega
      have hm : (2*codeRow bs+0)%2 = 0 := by omega
      simp [ih]
    · have hd : (2*codeRow bs+1)/2 = codeRow bs := by omega
      have hm : (2*codeRow bs+1)%2 = 1 := by omega
      simp [hd,hm,ih]

theorem encodedDot_code (u v : List Bool) :
    encodedDot (codeRow u) v = rowDot u v := by
  induction u generalizing v with
  | nil => exact encodedDot_zero v
  | cons b bs ih =>
    cases v with
    | nil => rfl
    | cons c cs =>
      simp only [codeRow,encodedDot_lift,rowDot,ih]

def generatorRows (r : Nat) (ls : List Nat) : List (List Bool) :=
  ls.map (decodeRow r)

theorem generatorRows_size (r : Nat) (ls : List Nat) :
    RowsOfSize (generatorRows r ls) r := by
  intro u hu
  obtain ⟨b,_,e⟩ := List.mem_map.mp hu
  rw [← e,decodeRow_length]

theorem generatorRows_length (r : Nat) (ls : List Nat) :
    (generatorRows r ls).length = ls.length := by simp [generatorRows]

theorem generatorRows_apply (r : Nat) (ls : List Nat)
    (h : ∀ b ∈ ls, b < 2^r) (u : List Bool) :
    applyMatrix (generatorRows r ls) u = labelVector ls u := by
  induction ls with
  | nil => rfl
  | cons b bs ih =>
    have hb := h b (by simp)
    have hbs : ∀ c ∈ bs, c < 2^r := fun c hc => h c (by simp [hc])
    change rowDot (decodeRow r b) u :: applyMatrix (generatorRows r bs) u =
      encodedDot b u :: labelVector bs u
    rw [ih hbs, ← encodedDot_code,codeRow_decode r b hb]

theorem generatorRows_code (r : Nat) (rows : List (List Bool))
    (h : RowsOfSize rows r) :
    generatorRows r (rows.map codeRow) = rows := by
  induction rows with
  | nil => rfl
  | cons a as ih =>
    have ha := h a (by simp)
    have hs : RowsOfSize as r := fun u hu => h u (by simp [hu])
    change decodeRow r (codeRow a) :: generatorRows r (as.map codeRow) = a :: as
    rw [ih hs,← ha,decodeRow_code]

theorem generatorRows_decode (r : Nat) (ls : List Nat) (h : ∀ b ∈ ls, b < 2^r) :
    (generatorRows r ls).map codeRow = ls := by
  induction ls with
  | nil => rfl
  | cons b bs ih =>
    change codeRow (decodeRow r b) :: (generatorRows r bs).map codeRow = b :: bs
    rw [codeRow_decode r b (h b (by simp)),ih (fun c hc => h c (by simp [hc]))]

theorem labels_ext (r : Nat) (a b : List Nat)
    (ha : ∀ c ∈ a, c < 2^r) (hb : ∀ c ∈ b, c < 2^r)
    (h : ∀ t, t.length = r → labelVector a t = labelVector b t) : a = b := by
  have e : generatorRows r a = generatorRows r b := by
    apply matrix_ext r _ _ (generatorRows_size r a) (generatorRows_size r b)
    intro t ht
    rw [generatorRows_apply r a ha,generatorRows_apply r b hb,h t ht]
  have he := congrArg (List.map codeRow) e
  rwa [generatorRows_decode r a ha,generatorRows_decode r b hb] at he

theorem labelVector_linear (r : Nat) (ls : List Nat) (h : ∀ b ∈ ls, b < 2^r) :
    LinearOn r ls.length (labelVector ls) := by
  constructor
  · intro u _
    exact labelVector_length ls u
  · intro u v hu hv
    rw [← generatorRows_apply r ls h, ← generatorRows_apply r ls h,
      ← generatorRows_apply r ls h,applyMatrix_xor _ _ _ (hu.trans hv.symm)]

end MaTangCoreEncoding
