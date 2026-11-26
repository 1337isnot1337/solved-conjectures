import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Logic.Equiv.Fin.Basic

/-! # The minimum-split expansion

The five disjoint value ranges give a permutation of the full length from a
core permutation, a tail permutation, and a cut. `Decode` recovers the cut
and the two permutations from a literal avoider.
-/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

inductive Source where
  | minimum
  | left (q : ℕ)
  | right (v : ℕ)
  deriving DecidableEq

def Valid (m t r : ℕ) : Source → Prop
  | .minimum => True
  | .left q => q ≤ m ∧ q ≠ r
  | .right v => v < t

def enc (a b r : ℕ) : Source → ℕ
  | .minimum => 0
  | .left q => if q < r then a+1+q else a+b+q
  | .right v => if v < a then 1+v else r+1+v

def dec (a b r y : ℕ) : Source :=
  if y=0 then .minimum else if y≤a then .right (y-1) else
  if y≤a+r then .left (y-a-1) else if y≤a+r+b then .right (y-r-1) else .left (y-a-b)

theorem dec_enc {m a b r : ℕ} {s : Source} (h : Valid m (a+b) r s) :
    dec a b r (enc a b r s) = s := by
  cases s <;> simp only [Valid] at h <;> simp only [enc,dec] <;> split_ifs <;> simp_all <;> omega

theorem enc_dec (a b r y : ℕ) : enc a b r (dec a b r y) = y := by
  unfold dec; split_ifs <;> simp only [enc] <;> (try split_ifs) <;> omega

theorem dec_valid {m a b r y : ℕ} (hr : r ≤ m) (hy : y < m+1+(a+b)) :
    Valid m (a+b) r (dec a b r y) := by
  unfold dec; split_ifs <;> simp only [Valid] <;> omega

theorem enc_lt {m a b r : ℕ} (hr : r ≤ m) {s : Source} (h : Valid m (a+b) r s) :
    enc a b r s < m+1+(a+b) := by
  cases s <;> simp only [Valid] at h <;> simp only [enc] <;> (try split_ifs) <;> omega

/-- The five value bands give a lossless reconstruction of all labels. -/
def valueEquiv (m a b r : ℕ) (hr : r ≤ m) : {s // Valid m (a+b) r s} ≃ Fin (m+1+(a+b)) where
  toFun s := ⟨enc a b r s,enc_lt hr s.2⟩
  invFun y := ⟨dec a b r y,dec_valid hr y.isLt⟩
  left_inv s := Subtype.ext (dec_enc s.2)
  right_inv y := Fin.ext (enc_dec a b r y.val)

/-- Use the last core position as the global minimum. -/
def posToSource {m t : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin t)) :
    Fin (m+1) ⊕ Fin t → {s // Valid m t (σ (Fin.last m)).val s}
  | .inl i => if hi : i=Fin.last m then ⟨.minimum,trivial⟩ else
    ⟨.left (σ i).val,Nat.le_of_lt_succ (σ i).isLt,fun e => hi (σ.injective (Fin.ext e))⟩
  | .inr j => ⟨.right (ν j).val,(ν j).isLt⟩

def sourceToPos {m t : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin t)) :
    {s // Valid m t (σ (Fin.last m)).val s} → Fin (m+1) ⊕ Fin t
  | ⟨.minimum,_⟩ => .inl (Fin.last m)
  | ⟨.left q,h⟩ => .inl (σ.symm ⟨q,Nat.lt_succ_of_le h.1⟩)
  | ⟨.right v,h⟩ => .inr (ν.symm ⟨v,h⟩)

def posEquiv {m t : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin t)) :
    Fin (m+1) ⊕ Fin t ≃ {s // Valid m t (σ (Fin.last m)).val s} where
  toFun := posToSource σ ν
  invFun := sourceToPos σ ν
  left_inv p := by
    rcases p with i|j
    · by_cases h : i=Fin.last m <;> simp [posToSource,sourceToPos,h]
    · simp [posToSource,sourceToPos]
  right_inv p := by
    rcases p with ⟨_ | q | v,h⟩
    · simp [sourceToPos,posToSource]
    · have hne : σ.symm (⟨q,Nat.lt_succ_of_le h.1⟩ : Fin (m+1)) ≠ Fin.last m := by
        intro e; apply h.2
        exact congrArg Fin.val (σ.symm_apply_eq.mp e)
      simp [sourceToPos,posToSource,hne]
    · simp [sourceToPos,posToSource]

/-- Expand any core and any right-hand permutation, with a specified low/high
cut, into an actual permutation of the sum length. -/
def expand {m a b : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b))) :
    Equiv.Perm (Fin (m+1+(a+b))) :=
  finSumFinEquiv.symm.trans ((posEquiv σ ν).trans (valueEquiv m a b _ (Fin.le_last (σ (Fin.last m)))))

theorem expand_minimum {m a b : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b))) :
    (expand σ ν ((Fin.last m).castAdd (a+b))).val = 0 := by
  simp [expand,posEquiv,valueEquiv,posToSource,enc]

theorem expand_left {m a b : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b)))
    (i : Fin (m+1)) (hi : i ≠ Fin.last m) : (expand σ ν (i.castAdd (a+b))).val =
      enc a b (σ (Fin.last m)).val (.left (σ i).val) := by
  simp [expand,posEquiv,valueEquiv,posToSource,hi]

theorem expand_right {m a b : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b)))
    (i : Fin (a+b)) : (expand σ ν (i.natAdd (m+1))).val =
      enc a b (σ (Fin.last m)).val (.right (ν i).val) := by
  simp [expand,posEquiv,valueEquiv,posToSource]

/-- For fixed bands and a prescribed terminal core rank, the data are
recoverable. Apply the decoder pointwise to recover every other core entry
and every tail entry. -/
theorem expand_injective_fixed {m a b : ℕ} {σ σ' : Equiv.Perm (Fin (m+1))}
    {ν ν' : Equiv.Perm (Fin (a+b))} (hr : σ (Fin.last m) = σ' (Fin.last m))
    (h : @expand m a b σ ν = expand σ' ν') : σ = σ' ∧ ν = ν' := by
  let r := (σ (Fin.last m)).val
  have hc {s s' : Source} (hs : Valid m (a+b) r s) (hs' : Valid m (a+b) r s')
      (h : enc a b r s = enc a b r s') : s=s' := by
    simpa only [dec_enc hs,dec_enc hs'] using congrArg (dec a b r) h
  constructor
  · apply Equiv.ext; intro i
    by_cases hi : i=Fin.last m
    · simpa [hi] using hr
    · have hh := congrArg (fun p : Equiv.Perm _ => (p (i.castAdd (a+b))).val) h
      simp only [expand_left _ _ _ hi,← hr] at hh
      have he : Source.left (σ i).val = .left (σ' i).val := hc
        ⟨Nat.le_of_lt_succ (σ i).isLt,fun e => hi (σ.injective (Fin.ext e))⟩
        ⟨Nat.le_of_lt_succ (σ' i).isLt,fun e => hi (σ'.injective ((Fin.ext e).trans hr))⟩ hh
      exact Fin.ext (Source.left.inj he)
  · apply Equiv.ext; intro i
    have hh := congrArg (fun p : Equiv.Perm _ => (p (i.natAdd (m+1))).val) h
    simp only [expand_right,← hr] at hh
    have he : Source.right (ν i).val = .right (ν' i).val := hc (ν i).isLt (ν' i).isLt hh
    exact Fin.ext (Source.right.inj he)

/-- The least value on the nonempty left side determines the low-block size
`a` without a choice of high representative. -/
theorem recover_low {m a b : ℕ} (hm : 0 < m) (σ : Equiv.Perm (Fin (m+1)))
    (ν : Equiv.Perm (Fin (a+b))) (hc : b=0 ↔ σ (Fin.last m)=0) :
    (∀ i : Fin (m+1), i ≠ Fin.last m → a+1 ≤ (expand σ ν (i.castAdd (a+b))).val) ∧
    ∃ i : Fin (m+1), i ≠ Fin.last m ∧ (expand σ ν (i.castAdd (a+b))).val = a+1 := by
  constructor
  · intro i hi
    rw [expand_left _ _ _ hi]
    have hq : (σ i).val ≠ (σ (Fin.last m)).val := fun e => hi (σ.injective (Fin.ext e))
    simp only [enc]; split_ifs <;> omega
  · by_cases hb : b=0
    · have hr := hc.mp hb
      let q : Fin (m+1) := ⟨1,by omega⟩
      have hne : σ.symm q ≠ Fin.last m := by
        intro e; have h := (σ.symm_apply_eq.mp e).trans hr
        exact (by decide : (1 : ℕ) ≠ 0) (congrArg Fin.val h)
      exact ⟨_,hne,by rw [expand_left _ _ _ hne,Equiv.apply_symm_apply,hr,hb]; simp [enc,q]⟩
    · have hr : σ (Fin.last m) ≠ 0 := fun e => hb (hc.mpr e)
      have hne : σ.symm 0 ≠ Fin.last m := fun e => hr (σ.symm_apply_eq.mp e).symm
      have hpos : 0 < (σ (Fin.last m)).val := by exact Fin.pos_iff_ne_zero.mpr hr
      exact ⟨_,hne,by rw [expand_left _ _ _ hne,Equiv.apply_symm_apply]; simp [enc,hpos]⟩

end Conjectures.ChernFuLinThreeStatistic.Expansion
