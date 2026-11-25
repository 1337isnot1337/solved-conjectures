import Conjectures.MaTangCoreRank

/-!
# Ma–Tang's random subset-sum threshold conjecture

Count noninjective random kernel-generator matrices by a union over
nonzero parameter vectors, entirely using finite duplicate-free words.
-/

namespace MaTangCoreGenerator

open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy
open MaTangCoreSubspace MaTangCoreRank

theorem tally_filter_length {α : Type} (p : α → Bool) (xs : List α) :
    tally p xs = (xs.filter p).length := by
  induction xs with
  | nil => rfl
  | cons a xs ih =>
    cases hp : p a <;> simp [tally,hp,ih] <;> omega

theorem tally_equal_of_membership {α : Type} [BEq α] [LawfulBEq α]
    (xs ys : List α) (hxs : xs.Nodup) (hys : ys.Nodup)
    (he : ∀ x, x ∈ xs ↔ x ∈ ys) (p : α → Bool) :
    tally p xs = tally p ys := by
  rw [tally_filter_length,tally_filter_length]
  have h1 := nodup_subset_length (xs.filter p) (ys.filter p)
    (List.Nodup.sublist List.filter_sublist hxs) (fun x hx =>
      List.mem_filter.mpr ⟨(he x).mp (List.mem_filter.mp hx).1,(List.mem_filter.mp hx).2⟩)
  have h2 := nodup_subset_length (ys.filter p) (xs.filter p)
    (List.Nodup.sublist List.filter_sublist hys) (fun x hx =>
      List.mem_filter.mpr ⟨(he x).mpr (List.mem_filter.mp hx).1,(List.mem_filter.mp hx).2⟩)
  omega

def expandCode (b : Nat) : List Nat := [2*b,2*b+1]

def codes : Nat → List Nat
  | 0 => [0]
  | r+1 => (codes r).flatMap expandCode

theorem codes_length (r : Nat) : (codes r).length = 2^r := by
  induction r with
  | zero => rfl
  | succ r ih =>
    rw [codes,flatMap_const_length _ _ 2 (fun _ _ => rfl),ih,Nat.pow_succ]

theorem codes_mem (r b : Nat) : b ∈ codes r ↔ b < 2^r := by
  induction r generalizing b with
  | zero => simp [codes]
  | succ r ih =>
    rw [codes,List.mem_flatMap,Nat.pow_succ]
    constructor
    · rintro ⟨a,ha,hb⟩
      have ha' := (ih a).mp ha
      simp [expandCode] at hb
      omega
    · intro hb
      refine ⟨b/2,(ih (b/2)).mpr (by omega),?_⟩
      simp [expandCode]
      omega

theorem codes_nodup (r : Nat) : (codes r).Nodup := by
  induction r with
  | zero => simp [codes]
  | succ r ih =>
    rw [codes]
    apply flatMap_nodup_of_disjoint _ _ ih
    · intro b _
      simp [expandCode]
    · intro b _ c _ hbc x hx y hy hxy
      simp [expandCode] at hx hy
      omega

theorem tally_dot_pairs (ls : List Nat) (a : Bool) (t : List Bool) :
    tally (fun b => encodedDot b (a :: t)) (ls.flatMap expandCode) =
      if a then ls.length else 2*tally (fun b => encodedDot b t) ls := by
  induction ls with
  | nil => cases a <;> rfl
  | cons b bs ih =>
    rw [List.flatMap_cons,tally_append,ih]
    have h0 := encodedDot_lift false a b t
    have h1 := encodedDot_lift true a b t
    change encodedDot (2*b) (a :: t) = ((false && a) != encodedDot b t) at h0
    change encodedDot (2*b+1) (a :: t) = ((true && a) != encodedDot b t) at h1
    cases a <;> cases hb : encodedDot b t <;>
      simp [expandCode,tally,h0,h1,hb] <;> omega

/-- Exactly half of the 2^(r+1) possible column labels have dot product
one with any specified nonzero length-(r+1) coefficient vector. -/
theorem dot_tally_half (r : Nat) (t : List Bool)
    (ht : t.length = r+1) (hn : t ≠ List.replicate (r+1) false) :
    tally (fun b => encodedDot b t) (codes (r+1)) = 2^r := by
  induction r generalizing t with
  | zero =>
    cases t with
    | nil => simp at ht
    | cons a ts =>
      have hnil : ts = [] := List.eq_nil_of_length_eq_zero (by simpa using ht)
      subst ts
      cases a
      · exact False.elim (hn rfl)
      · rfl
  | succ r ih =>
    cases t with
    | nil => simp at ht
    | cons a ts =>
      have ht' : ts.length = r+1 := by simpa using ht
      rw [codes,tally_dot_pairs]
      cases a
      · have hn' : ts ≠ List.replicate (r+1) false := by
          intro he
          apply hn
          rw [he]
          exact (List.replicate_succ (n := r+1) (a := false)).symm
        simp [ih ts ht' hn',Nat.pow_succ,Nat.mul_comm]
      · simp [codes_length]

def withCoeffs (b : Nat) : List Raw := [(b,0),(b,1),(b,2)]

theorem codeAlphabet_nodup (r : Nat) :
    ((codes r).flatMap withCoeffs).Nodup := by
  apply flatMap_nodup_of_disjoint _ _ (codes_nodup r)
  · intro b _
    simp [withCoeffs]
  · intro b _ c _ hbc x hx y hy he
    simp [withCoeffs] at hx hy
    rcases hx with hx | hx | hx <;>
      rcases hy with hy | hy | hy <;>
      subst x <;> subst y <;>
      simp_all

theorem codeAlphabet_mem (r : Nat) (x : Raw) :
    x ∈ (codes r).flatMap withCoeffs ↔ x ∈ alphabet (2^r) := by
  rw [List.mem_flatMap,alphabet_mem_iff]
  rcases x with ⟨b,c⟩
  constructor
  · rintro ⟨d,hd,hx⟩
    have hlt := (codes_mem r d).mp hd
    simp [withCoeffs] at hx
    rcases hx with hx | hx | hx <;> simp_all <;> omega
  · rintro ⟨hb,hc0,hc3⟩
    refine ⟨b,(codes_mem r b).mpr hb,?_⟩
    simp [withCoeffs]
    omega

theorem tally_coeffs (ls : List Nat) (p : Nat → Bool) :
    tally (fun x => p x.1) (ls.flatMap withCoeffs) = 3*tally p ls := by
  induction ls with
  | nil => rfl
  | cons b bs ih =>
    rw [List.flatMap_cons,tally_append,ih]
    cases hp : p b <;> simp [withCoeffs,tally,hp] <;> omega

theorem occupiedDot_half (r : Nat) (t : List Bool)
    (ht : t.length = r+1) (hn : t ≠ List.replicate (r+1) false) :
    tally (fun x => encodedDot x.1 t) (alphabet (2^(r+1))) = 3*2^r := by
  rw [tally_equal_of_membership (alphabet (2^(r+1))) ((codes (r+1)).flatMap withCoeffs)
    (alphabet_nodup _) (codeAlphabet_nodup _) (fun x => (codeAlphabet_mem _ x).symm)]
  rw [tally_coeffs (codes (r+1)) (fun b => encodedDot b t),dot_tally_half r t ht hn]

theorem occupiedDot_false_half (r : Nat) (t : List Bool)
    (ht : t.length = r+1) (hn : t ≠ List.replicate (r+1) false) :
    tally (fun x => !encodedDot x.1 t) (alphabet (2^(r+1))) = 3*2^r := by
  have h := tally_compl (fun x : Raw => encodedDot x.1 t) (alphabet (2^(r+1)))
  rw [occupiedDot_half r t ht hn,alphabet_length,Nat.pow_succ] at h
  have hh : 3*(2^r*2) = 6*2^r := by
    rw [Nat.mul_comm (2^r) 2, ← Nat.mul_assoc]
  rw [hh] at h
  rw [Nat.pow_succ]
  omega

def nonzeroParams (r : Nat) : List (List Bool) :=
  (cube r).erase (List.replicate r false)

theorem nonzeroParams_mem (r : Nat) (t : List Bool) :
    t ∈ nonzeroParams r ↔ t.length = r ∧ t ≠ List.replicate r false := by
  constructor
  · intro ht
    have hne : t ≠ List.replicate r false := by
      intro he
      subst t
      exact (List.Nodup.not_mem_erase (cube_nodup r)) ht
    exact ⟨(cube_mem r t).mp ((List.mem_erase_of_ne hne).mp ht),hne⟩
  · rintro ⟨ht,hne⟩
    exact (List.mem_erase_of_ne hne).mpr ((cube_mem r t).mpr ht)

theorem nonzeroParams_length (r : Nat) : (nonzeroParams r).length = 2^r-1 := by
  rw [nonzeroParams,List.length_erase_of_mem ((cube_mem r _).mpr (by simp)),cube_length]

def badGenerator (r : Nat) (w : List Raw) : Bool :=
  (nonzeroParams r).any fun t => hitZero (fun x => encodedDot x.1 t) w

theorem tally_eq_zero_iff_all_false {α : Type} (p : α → Bool) (xs : List α) :
    tally p xs = 0 ↔ ∀ x ∈ xs, p x = false := by
  induction xs with
  | nil => simp [tally]
  | cons a xs ih =>
    cases ha : p a
    · simp [tally,ha,ih]
    · simp [tally,ha]

theorem kernelVector_all_false (w : List Raw) (t : List Bool) :
    kernelVector w t = List.replicate w.length false ↔
      tally (fun x => encodedDot x.1 t) w = 0 := by
  induction w with
  | nil => simp [kernelVector,maskBits,tally]
  | cons x xs ih =>
    change encodedDot x.1 t :: kernelVector xs t =
      List.replicate (xs.length+1) false ↔ _
    rw [List.replicate_succ]
    cases hx : encodedDot x.1 t <;> simp [tally,hx,ih]

theorem badGenerator_iff (r : Nat) (w : List Raw) :
    badGenerator r w = true ↔
    ∃ t : List Bool, t.length = r ∧ t ≠ List.replicate r false ∧
      kernelVector w t = List.replicate w.length false := by
  rw [badGenerator,List.any_eq_true]
  constructor
  · rintro ⟨t,ht,hz⟩
    obtain ⟨hl,hn⟩ := (nonzeroParams_mem r t).mp ht
    refine ⟨t,hl,hn,(kernelVector_all_false w t).mpr ?_⟩
    simpa [hitZero] using hz
  · rintro ⟨t,ht,hn,hz⟩
    refine ⟨t,(nonzeroParams_mem r t).mpr ⟨ht,hn⟩,?_⟩
    simp [hitZero,(kernelVector_all_false w t).mp hz]

/-- Noninjectivity union bound in the exact independent-column sample
space, including all independent ternary coefficient choices. -/
theorem badGenerator_count_le (r k : Nat) :
    tally (badGenerator (r+1)) (words (alphabet (2^(r+1))) k) ≤
      (2^(r+1)-1)*(3*2^r)^k := by
  have he := tally_any_le (nonzeroParams (r+1))
    (fun t w => hitZero (fun x => encodedDot x.1 t) w)
    (words (alphabet (2^(r+1))) k) ((3*2^r)^k)
    (fun t ht => by
      obtain ⟨hl,hn⟩ := (nonzeroParams_mem (r+1) t).mp ht
      rw [count_words_zero,occupiedDot_false_half r t hl hn]
      exact Nat.le_refl _)
  rw [nonzeroParams_length] at he
  exact he


theorem encodedDot_xor (b : Nat) (t u : List Bool)
    (h : t.length = u.length) :
    encodedDot b (xorVec t u) = (encodedDot b t != encodedDot b u) := by
  induction t generalizing b u with
  | nil =>
    cases u with
    | nil => rfl
    | cons c cs => simp at h
  | cons a ts ih =>
    cases u with
    | nil => simp at h
    | cons c us =>
      have ht : ts.length = us.length := by simpa using h
      have he := ih (b/2) us ht
      cases a <;> cases c <;>
        cases hb : (b%2 == 1) <;>
        simp [encodedDot,xorVec,hb,he] <;>
        cases (encodedDot (b/2) ts) <;>
        cases (encodedDot (b/2) us) <;> rfl

theorem kernelVector_xor (w : List Raw) (t u : List Bool)
    (h : t.length = u.length) :
    kernelVector w (xorVec t u) =
      xorVec (kernelVector w t) (kernelVector w u) := by
  induction w with
  | nil => rfl
  | cons x xs ih =>
    change encodedDot x.1 (xorVec t u) :: kernelVector xs (xorVec t u) =
      (encodedDot x.1 t != encodedDot x.1 u) ::
      xorVec (kernelVector xs t) (kernelVector xs u)
    rw [encodedDot_xor x.1 t u h,ih]

theorem encodedDot_zero_param (b n : Nat) :
    encodedDot b (List.replicate n false) = false := by
  induction n generalizing b with
  | zero => rfl
  | succ n ih => simp [encodedDot,List.replicate_succ,ih]

theorem kernelVector_zero_param (w : List Raw) (r : Nat) :
    kernelVector w (List.replicate r false) = List.replicate w.length false := by
  induction w with
  | nil => rfl
  | cons x xs ih =>
    change encodedDot x.1 (List.replicate r false) :: kernelVector xs (List.replicate r false) =
      List.replicate (xs.length+1) false
    rw [encodedDot_zero_param,ih,List.replicate_succ]

def InjectiveParams (w : List Raw) (r : Nat) : Prop :=
  ∀ t u : List Bool, t.length = r → u.length = r →
    kernelVector w t = kernelVector w u → t = u

/-- The counted event is precisely noninjectivity of the generator map
on its true r-dimensional domain, not a proxy event. -/
theorem goodGenerator_iff_injective (w : List Raw) (r : Nat) :
    badGenerator r w = false ↔ InjectiveParams w r := by
  constructor
  · intro hg t u ht hu he
    have htu : t.length = u.length := ht.trans hu.symm
    let v := xorVec t u
    have hv : v.length = r := (xorVec_length t u htu).trans ht
    have hz : kernelVector w v = List.replicate w.length false := by
      dsimp [v]
      rw [kernelVector_xor w t u htu,he,xorVec_self]
      simp [kernelVector,maskBits]
    have hzero : v = List.replicate r false := by
      by_cases hvz : v = List.replicate r false
      · exact hvz
      · have hh := (badGenerator_iff r w).mpr ⟨v,hv,hvz,hz⟩
        rw [hg] at hh
        contradiction
    have heq := congrArg (xorVec t) hzero
    change xorVec t (xorVec t u) = xorVec t (List.replicate r false) at heq
    rw [xorVec_cancel t u htu,← ht,xorVec_zero_right] at heq
    exact heq.symm
  · intro hi
    cases hbad : badGenerator r w
    · rfl
    · obtain ⟨t,ht,hn,hz⟩ := (badGenerator_iff r w).mp hbad
      have he := hi t (List.replicate r false) ht (by simp)
        (hz.trans (kernelVector_zero_param w r).symm)
      exact False.elim (hn he)

/-- The exact unconditioned noninjectivity probability bound expressed
without real division. k=d+r+1 and the failure probability is at most
2^(-d). -/
theorem badGenerator_scaled_bound (d r : Nat) :
    2^d * tally (badGenerator (r+1))
      (words (alphabet (2^(r+1))) (d+r+1)) ≤
      (words (alphabet (2^(r+1))) (d+r+1)).length := by
  let k := d+r+1
  have h := Nat.mul_le_mul_left (2^d) (badGenerator_count_le r k)
  change 2^d * tally (badGenerator (r+1)) (words (alphabet (2^(r+1))) k) ≤ _
  rw [total_word_count]
  apply Nat.le_trans h
  have ha : 2^d * (2^(r+1)-1) ≤ 2^k := by
    have hle : 2^(r+1)-1 ≤ 2^(r+1) := Nat.sub_le _ _
    calc
      _ ≤ 2^d * 2^(r+1) := Nat.mul_le_mul_left _ hle
      _ = 2^k := by rw [← Nat.pow_add]; simp [k,Nat.add_assoc]
  calc
    2^d * ((2^(r+1)-1)*(3*2^r)^k)
        = (2^d * (2^(r+1)-1))*(3*2^r)^k := by rw [Nat.mul_assoc]
    _ ≤ 2^k*(3*2^r)^k := Nat.mul_le_mul_right _ ha
    _ = (3*2^(r+1))^k := by
      have hb : 2*(3*2^r) = 3*2^(r+1) := by
        rw [Nat.pow_succ]
        omega
      rw [← Nat.mul_pow,hb]

end MaTangCoreGenerator
