import Conjectures.BinaryArithmetic

/-! Fixed-width binary words and complete padding of both numerical tracks. -/
namespace BinaryAutomata

def encodeLow : Nat → Nat → Nat → List Digit
  | 0,_,_ => []
  | L+1,n,g =>
    ⟨2*(n%2)+g%2,by have := Nat.mod_lt n (by decide : 0<2); have := Nat.mod_lt g (by decide : 0<2); omega⟩ ::
      encodeLow L (n/2) (g/2)

def encodeHigh (L n g : Nat) : List Digit := (encodeLow L n g).reverse

theorem encodeLow_length (L n g : Nat) : (encodeLow L n g).length=L := by
  induction L generalizing n g with
  | zero => rfl
  | succ L ih => simp only [encodeLow,List.length_cons,ih]

theorem encodeHigh_length (L n g : Nat) : (encodeHigh L n g).length=L := by
  simp only [encodeHigh,List.length_reverse,encodeLow_length]

/-- Both tracks are represented exactly whenever they fit in the chosen width. -/
theorem encodeLow_correct (L n g : Nat) (hn : n<2^L) (hg : g<2^L) :
    decode sizeBit (encodeLow L n g)=n ∧ decode valueBit (encodeLow L n g)=g := by
  induction L generalizing n g with
  | zero =>
    have hn0 : n=0 := by simpa using hn
    have hg0 : g=0 := by simpa using hg
    subst n
    subst g
    exact ⟨rfl,rfl⟩
  | succ L ih =>
    have hn' : n/2<2^L := by rw [pow_succ] at hn; omega
    have hg' : g/2<2^L := by rw [pow_succ] at hg; omega
    obtain ⟨hN,hG⟩ := ih (n/2) (g/2) hn' hg'
    have hnmod := Nat.mod_lt n (by decide : 0<2)
    have hgmod := Nat.mod_lt g (by decide : 0<2)
    have hnrel := Nat.mod_add_div n 2
    have hgrel := Nat.mod_add_div g 2
    simp only [encodeLow,decode,sizeBit,valueBit,hN,hG]
    constructor <;> omega

theorem encodeHigh_correct (L n g : Nat) (hn : n<2^L) (hg : g<2^L) :
    decodeHigh sizeBit (encodeHigh L n g)=n ∧ decodeHigh valueBit (encodeHigh L n g)=g := by
  simpa only [encodeHigh,decodeHigh,List.reverse_reverse] using encodeLow_correct L n g hn hg

/-- Every pair of naturals has a common finite-width binary representation. -/
theorem exists_encoding (n g : Nat) : ∃ w : List Digit,
    decodeHigh sizeBit w=n ∧ decodeHigh valueBit w=g := by
  have hn : n<2^(n+g) := (Nat.le_add_right n g).trans_lt Nat.lt_two_pow_self
  have hg : g<2^(n+g) := (Nat.le_add_left g n).trans_lt Nat.lt_two_pow_self
  exact ⟨encodeHigh (n+g) n g,encodeHigh_correct _ _ _ hn hg⟩

/-- A fixed-width pair of bit tracks uniquely determines the digit word. -/
theorem decode_injective (a b : List Digit) (hlen : a.length=b.length)
    (hn : decode sizeBit a=decode sizeBit b) (hg : decode valueBit a=decode valueBit b) : a=b := by
  induction a generalizing b with
  | nil =>
    have hb : b=[] := List.eq_nil_of_length_eq_zero (by simpa using hlen.symm)
    subst b
    rfl
  | cons d ds ih =>
    cases b with
    | nil => simp at hlen
    | cons e es =>
      have hdN := sizeBit_bound d
      have heN := sizeBit_bound e
      have hdG := valueBit_bound d
      have heG := valueBit_bound e
      simp only [decode] at hn hg
      have hbitN : sizeBit d=sizeBit e := by omega
      have hbitG : valueBit d=valueBit e := by omega
      have htailN : decode sizeBit ds=decode sizeBit es := by omega
      have htailG : decode valueBit ds=decode valueBit es := by omega
      have hde : d=e := by
        apply Fin.ext
        have hD := Nat.mod_add_div d.val 2
        have hE := Nat.mod_add_div e.val 2
        dsimp [sizeBit,valueBit] at hbitN hbitG
        omega
      have htail := ih es (by simpa using hlen) htailN htailG
      subst e
      subst es
      rfl

theorem decodeHigh_injective (a b : List Digit) (hlen : a.length=b.length)
    (hn : decodeHigh sizeBit a=decodeHigh sizeBit b)
    (hg : decodeHigh valueBit a=decodeHigh valueBit b) : a=b := by
  have hr : a.reverse=b.reverse := decode_injective _ _ (by simpa using hlen) hn hg
  simpa using congrArg List.reverse hr

/-- Every actual digit word is its own fixed-width encoding. -/
theorem encodeHigh_decoded (w : List Digit) :
    encodeHigh w.length (decodeHigh sizeBit w) (decodeHigh valueBit w)=w := by
  obtain ⟨hn,hg⟩ := encodeHigh_correct w.length _ _
    (decodeHigh_bound sizeBit sizeBit_bound w) (decodeHigh_bound valueBit valueBit_bound w)
  exact decodeHigh_injective _ w (encodeHigh_length _ _ _) hn hg

/-- Three equally long words admit one common list of arithmetic columns. -/
theorem columns_of_words (a b w : List Digit) (ha : a.length=w.length) (hb : b.length=w.length) :
    ∃ cols : List Column, cols.map Column.left=a ∧ cols.map Column.right=b ∧ cols.map Column.out=w := by
  induction w generalizing a b with
  | nil =>
    have ha0 : a=[] := List.eq_nil_of_length_eq_zero (by simpa using ha)
    have hb0 : b=[] := List.eq_nil_of_length_eq_zero (by simpa using hb)
    subst a; subst b
    exact ⟨[],rfl,rfl,rfl⟩
  | cons d ds ih =>
    cases a with
    | nil => simp at ha
    | cons x xs =>
      cases b with
      | nil => simp at hb
      | cons y ys =>
        obtain ⟨cols,hl,hr,ho⟩ := ih xs ys (by simpa using ha) (by simpa using hb)
        exact ⟨⟨x,y,d⟩::cols,by simp [hl],by simp [hr],by simp [ho]⟩

#print axioms encodeHigh_decoded
end BinaryAutomata
