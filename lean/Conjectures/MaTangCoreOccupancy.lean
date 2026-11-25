import Conjectures.MaTangCoreMatrix

/-!
# Ma–Tang's random subset-sum threshold conjecture

Exact counting of independent-column words with singleton occupancy.
The counts are finite list counts, rather than a limiting probability
or a statement about the distribution of a random kernel basis.
-/

namespace MaTangCoreOccupancy

open MaTangCoreIndexed

def tally {α : Type} (p : α → Bool) : List α → Nat
  | [] => 0
  | x :: xs => (if p x then 1 else 0) + tally p xs

theorem tally_append {α : Type} (p : α → Bool) (xs ys : List α) :
    tally p (xs ++ ys) = tally p xs + tally p ys := by
  induction xs with
  | nil => simp [tally]
  | cons x xs ih => simp [tally,ih,Nat.add_assoc]

theorem tally_map {α β : Type} (p : β → Bool) (f : α → β) (xs : List α) :
    tally p (xs.map f) = tally (fun x => p (f x)) xs := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [tally,ih]

theorem tally_false {α : Type} (xs : List α) :
    tally (fun _ => false) xs = 0 := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [tally,ih]

theorem tally_compl {α : Type} (p : α → Bool) (xs : List α) :
    tally (fun x => !p x) xs + tally p xs = xs.length := by
  induction xs with
  | nil => rfl
  | cons x xs ih => cases hp : p x <;> simp [tally,hp] <;> omega

theorem tally_or_le {α : Type} (p q : α → Bool) (xs : List α) :
    tally (fun x => p x || q x) xs ≤ tally p xs + tally q xs := by
  induction xs with
  | nil => simp [tally]
  | cons x xs ih =>
    cases hp : p x <;> cases hq : q x <;> simp [tally,hp,hq] <;> omega

def extend {α : Type} (alphabet : List α) (ws : List (List α)) : List (List α) :=
  match alphabet with
  | [] => []
  | a :: rest => ws.map (fun w => a :: w) ++ extend rest ws

def words {α : Type} (alphabet : List α) : Nat → List (List α)
  | 0 => [[]]
  | k+1 => extend alphabet (words alphabet k)

theorem extend_length {α : Type} (alphabet : List α) (ws : List (List α)) :
    (extend alphabet ws).length = alphabet.length * ws.length := by
  induction alphabet with
  | nil => simp [extend]
  | cons a rest ih =>
    simp [extend,ih,Nat.add_mul,Nat.add_comm]

theorem words_length {α : Type} (alphabet : List α) (k : Nat) :
    (words alphabet k).length = alphabet.length ^ k := by
  induction k with
  | zero => rfl
  | succ k ih => simp [words,extend_length,ih,Nat.pow_succ,Nat.mul_comm]

def hitZero {α : Type} (p : α → Bool) (w : List α) : Bool :=
  tally p w == 0

def hitOne {α : Type} (p : α → Bool) (w : List α) : Bool :=
  tally p w == 1

theorem hitZero_cons {α : Type} (p : α → Bool) (a : α) (w : List α) :
    hitZero p (a :: w) = (!p a && hitZero p w) := by
  cases hp : p a <;> simp [hitZero,tally,hp]

theorem hitOne_cons {α : Type} (p : α → Bool) (a : α) (w : List α) :
    hitOne p (a :: w) = (if p a then hitZero p w else hitOne p w) := by
  cases hp : p a <;> simp [hitOne,hitZero,tally,hp,Nat.add_comm]

theorem count_extend_zero {α : Type} (p : α → Bool)
    (alphabet : List α) (ws : List (List α)) :
    tally (hitZero p) (extend alphabet ws) =
      tally (fun x => !p x) alphabet * tally (hitZero p) ws := by
  induction alphabet with
  | nil => simp [extend,tally]
  | cons a rest ih =>
    rw [extend,tally_append,tally_map,ih]
    cases hp : p a
    · simp [tally,hp,hitZero_cons,Nat.add_mul]
    · simp [tally,hp,hitZero_cons,tally_false]

theorem count_extend_one {α : Type} (p : α → Bool)
    (alphabet : List α) (ws : List (List α)) :
    tally (hitOne p) (extend alphabet ws) =
      tally p alphabet * tally (hitZero p) ws +
        tally (fun x => !p x) alphabet * tally (hitOne p) ws := by
  induction alphabet with
  | nil => simp [extend,tally]
  | cons a rest ih =>
    rw [extend,tally_append,tally_map,ih]
    cases hp : p a
    · have he : (fun w => hitOne p (a :: w)) = hitOne p := by
        funext w
        simp [hitOne_cons,hp]
      rw [he]
      simp [tally,hp,Nat.add_mul,Nat.add_left_comm,Nat.add_comm]
    · have he : (fun w => hitOne p (a :: w)) = hitZero p := by
        funext w
        simp [hitOne_cons,hp]
      rw [he]
      simp [tally,hp,Nat.add_mul,Nat.add_assoc,Nat.add_comm]

theorem count_words_zero {α : Type} (p : α → Bool) (alphabet : List α) (k : Nat) :
    tally (hitZero p) (words alphabet k) = tally (fun x => !p x) alphabet ^ k := by
  induction k with
  | zero => rfl
  | succ k ih => simp [words,count_extend_zero,ih,Nat.pow_succ,Nat.mul_comm]

theorem count_words_one_succ {α : Type} (p : α → Bool)
    (alphabet : List α) (k : Nat) :
    tally (hitOne p) (words alphabet (k+1)) =
      (k+1) * tally p alphabet * tally (fun x => !p x) alphabet ^ k := by
  induction k with
  | zero =>
    rw [words,count_extend_one]
    simp [words,tally,hitZero,hitOne]
  | succ k ih =>
    rw [words,count_extend_one,count_words_zero,ih]
    simp [Nat.pow_succ,Nat.add_mul,Nat.mul_add,Nat.mul_assoc,Nat.mul_comm,Nat.mul_left_comm,Nat.add_comm,Nat.add_left_comm]
    rw [Nat.two_mul, Nat.mul_add]
    omega

theorem count_words_one {α : Type} (p : α → Bool) (alphabet : List α) (k : Nat) :
    tally (hitOne p) (words alphabet k) =
      k * tally p alphabet * tally (fun x => !p x) alphabet ^ (k-1) := by
  cases k with
  | zero => simp [words,tally,hitOne]
  | succ k => simpa using count_words_one_succ p alphabet k


/-- Counting union bound, with arbitrary finite lists of events. -/
theorem tally_any_le {α β : Type} (labels : List β) (p : β → α → Bool)
    (ws : List α) (B : Nat)
    (h : ∀ b ∈ labels, tally (p b) ws ≤ B) :
    tally (fun w => labels.any (fun b => p b w)) ws ≤ labels.length * B := by
  induction labels with
  | nil => simp [tally_false]
  | cons b rest ih =>
    have hb := h b (by simp)
    have ht := ih (fun c hc => h c (by simp [hc]))
    have hu := tally_or_le (p b) (fun w => rest.any (fun c => p c w)) ws
    simp only [List.any_cons,List.length_cons,Nat.add_mul,Nat.one_mul]
    omega

def occupied (d : Nat) (x : Raw) : Bool :=
  (x.1 == d) && (x.2 % 3 != 0)

theorem tally_occupied_eq (xs : List Raw) (d : Nat) :
    tally (occupied d) xs = countType xs d := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    rcases x with ⟨b,c⟩
    by_cases hbd : b = d <;> by_cases hc : c % 3 = 0 <;>
      simp [tally,occupied,countType,hbd,hc,ih]

/-- Alphabet of all column labels from 0 through m−1, each with exactly
one occurrence of every representative 0, 1, 2 of F3. -/
def alphabet : Nat → List Raw
  | 0 => []
  | m+1 => [(m,0),(m,1),(m,2)] ++ alphabet m

theorem alphabet_length (m : Nat) : (alphabet m).length = 3*m := by
  induction m with
  | zero => rfl
  | succ m ih => simp [alphabet,ih]; omega

theorem alphabet_occupied (m d : Nat) :
    tally (occupied d) (alphabet m) = if d < m then 2 else 0 := by
  induction m with
  | zero => simp [alphabet,tally]
  | succ m ih =>
    rw [alphabet,tally_append,ih]
    have hprefix :
        tally (occupied d) [(m,0),(m,1),(m,2)] = if d = m then 2 else 0 := by
      by_cases h : m = d
      · subst d
        simp [tally,occupied]
      · have hn : d ≠ m := fun he => h he.symm
        simp [tally,occupied,h,hn]
    rw [hprefix]
    by_cases he : d = m
    · subst d
      simp
    · by_cases hl : d < m
      · have hlt : d < m+1 := by omega
        simp [he,hl,hlt]
      · have hn : ¬d < m+1 := by omega
        simp [he,hl,hn]

theorem alphabet_miss (m d : Nat) (h : d < m) :
    tally (fun x => !occupied d x) (alphabet m) = 3*m-2 := by
  have ht := tally_compl (occupied d) (alphabet m)
  rw [alphabet_occupied, alphabet_length] at ht
  simp [h] at ht
  omega

def nonzeroTypes : Nat → List Nat
  | 0 => []
  | m+1 => if m = 0 then [] else m :: nonzeroTypes m

theorem nonzeroTypes_length (m : Nat) :
    (nonzeroTypes m).length = m-1 := by
  induction m with
  | zero => rfl
  | succ m ih =>
    by_cases h : m = 0
    · subst m
      rfl
    · simp [nonzeroTypes,h,ih]
      omega

theorem nonzeroTypes_range (m d : Nat) (h : d ∈ nonzeroTypes m) :
    0 < d ∧ d < m := by
  induction m with
  | zero => simp [nonzeroTypes] at h
  | succ m ih =>
    by_cases hz : m = 0
    · subst m
      simp [nonzeroTypes] at h
    · simp [nonzeroTypes,hz] at h
      rcases h with he | ht
      · subst d
        omega
      · have hh := ih ht
        omega

/-- Exact sample-space size for k independent uniform column labels
and ternary coefficients. -/
theorem total_word_count (m k : Nat) :
    (words (alphabet m) k).length = (3*m)^k := by
  rw [words_length,alphabet_length]

/-- Exact number of length-k samples with exactly one occupied index
for a specified column label. -/
theorem singleton_word_count (m d k : Nat) (hd : d < m) :
    tally (fun w => countType w d == 1) (words (alphabet m) k) =
      k*2*(3*m-2)^(k-1) := by
  have he : (fun w => countType w d == 1) = hitOne (occupied d) := by
    funext w
    rw [hitOne,tally_occupied_eq]
  rw [he,count_words_one,alphabet_occupied,alphabet_miss m d hd]
  simp [hd]

/-- The source's finite union bound, before division by the sample
space size (3*m)^k. It holds for all m,k, including empty cases. -/
theorem singleton_union_word_count_le (m k : Nat) :
    tally (fun w => (nonzeroTypes m).any (fun d => countType w d == 1))
        (words (alphabet m) k) ≤
      (m-1)*k*2*(3*m-2)^(k-1) := by
  have he := tally_any_le (nonzeroTypes m)
    (fun d w => countType w d == 1) (words (alphabet m) k)
    (k*2*(3*m-2)^(k-1))
    (fun d hd => by rw [singleton_word_count m d k (nonzeroTypes_range m d hd).2]; exact Nat.le_refl _)
  rw [nonzeroTypes_length] at he
  simpa [Nat.mul_assoc] using he


theorem mem_extend {α : Type} (alphabet : List α)
    (ws : List (List α)) (w : List α) :
    w ∈ extend alphabet ws ↔ ∃ a ∈ alphabet, ∃ v ∈ ws, a :: v = w := by
  induction alphabet with
  | nil => simp [extend]
  | cons a rest ih =>
    rw [extend,List.mem_append,List.mem_map,ih]
    constructor
    · intro h
      rcases h with ⟨v,hv,he⟩ | ⟨b,hb,v,hv,he⟩
      · exact ⟨a,by simp,v,hv,he⟩
      · exact ⟨b,by simp [hb],v,hv,he⟩
    · rintro ⟨b,hb,v,hv,he⟩
      rcases List.mem_cons.mp hb with heq | hm
      · subst b
        exact Or.inl ⟨v,hv,he⟩
      · exact Or.inr ⟨b,hm,v,hv,he⟩

/-- The enumerated words are exactly all k-letter sequences over the
alphabet, with the order of their coefficient positions retained. -/
theorem mem_words {α : Type} (alphabet : List α) (k : Nat) (w : List α) :
    w ∈ words alphabet k ↔ w.length = k ∧ ∀ a ∈ w, a ∈ alphabet := by
  induction k generalizing w with
  | zero =>
    cases w with
    | nil => simp [words]
    | cons a rest => simp [words]
  | succ k ih =>
    rw [words,mem_extend]
    constructor
    · rintro ⟨a,ha,v,hv,he⟩
      subst w
      obtain ⟨hl,hm⟩ := (ih v).mp hv
      constructor
      · simp [hl]
      · intro b hb
        rcases List.mem_cons.mp hb with he | ht
        · simpa [he] using ha
        · exact hm b ht
    · rintro ⟨hl,hm⟩
      cases w with
      | nil => simp at hl
      | cons a rest =>
        have hlen : rest.length = k := by simpa using hl
        exact ⟨a,hm a (by simp),rest,(ih rest).mpr
          ⟨hlen,fun b hb => hm b (by simp [hb])⟩,rfl⟩

theorem nodup_prepend {α : Type} (a : α) (ws : List (List α))
    (h : ws.Nodup) : (ws.map (fun w => a :: w)).Nodup := by
  induction ws with
  | nil => simp
  | cons v rest ih =>
    have hn := List.nodup_cons.mp h
    simp only [List.map_cons,List.nodup_cons]
    refine ⟨?_,ih hn.2⟩
    intro he
    obtain ⟨w,hw,heq⟩ := List.mem_map.mp he
    have hv : w = v := (List.cons.inj heq).2
    exact hn.1 (hv ▸ hw)

theorem nodup_extend {α : Type} (alphabet : List α) (ws : List (List α))
    (ha : alphabet.Nodup) (hw : ws.Nodup) : (extend alphabet ws).Nodup := by
  induction alphabet with
  | nil => simp [extend]
  | cons a rest ih =>
    have hn := List.nodup_cons.mp ha
    rw [extend,List.nodup_append]
    refine ⟨nodup_prepend a ws hw,ih hn.2,?_⟩
    intro x hx y hy he
    obtain ⟨v,hv,hxv⟩ := List.mem_map.mp hx
    obtain ⟨b,hb,w,hw',hyw⟩ := (mem_extend rest ws y).mp hy
    have hcons : a :: v = b :: w := hxv.trans (he.trans hyw.symm)
    have hab := (List.cons.inj hcons).1
    exact hn.1 (hab.symm ▸ hb)

theorem nodup_words {α : Type} (alphabet : List α) (k : Nat)
    (ha : alphabet.Nodup) : (words alphabet k).Nodup := by
  induction k with
  | zero => simp [words]
  | succ k ih => exact nodup_extend alphabet (words alphabet k) ha ih

theorem alphabet_label_lt (m : Nat) (x : Raw) (h : x ∈ alphabet m) :
    x.1 < m := by
  induction m with
  | zero => simp [alphabet] at h
  | succ m ih =>
    simp only [alphabet,List.mem_append,List.mem_cons,List.not_mem_nil,or_false] at h
    rcases h with (h | h | h) | h
    · subst x
      omega
    · subst x
      omega
    · subst x
      omega
    · have ht := ih h
      omega

theorem alphabet_nodup (m : Nat) : (alphabet m).Nodup := by
  induction m with
  | zero => simp [alphabet]
  | succ m ih =>
    rw [alphabet,List.nodup_append]
    refine ⟨by simp,ih,?_⟩
    intro a ha b hb he
    subst b
    have hlt := alphabet_label_lt m a hb
    simp only [List.mem_cons,List.not_mem_nil,or_false] at ha
    rcases ha with he | he | he <;> subst a <;> omega

theorem nonzeroTypes_complete (m d : Nat) (hd : 0 < d) (hm : d < m) :
    d ∈ nonzeroTypes m := by
  induction m with
  | zero => omega
  | succ m ih =>
    have hn : m ≠ 0 := by omega
    by_cases h : d = m
    · simp [nonzeroTypes,hn,h]
    · have hlt : d < m := by omega
      have ht := ih hlt
      simp [nonzeroTypes,hn,ht]

theorem countType_outside (w : List Raw) (m d : Nat) (hd : m ≤ d)
    (h : ∀ a ∈ w, a.1 < m) : countType w d = 0 := by
  induction w with
  | nil => rfl
  | cons a w ih =>
    rcases a with ⟨b,c⟩
    have hb := h (b,c) (by simp)
    have hne : b ≠ d := by omega
    have ht := ih (fun a ha => h a (by simp [ha]))
    simp [countType,hne,ht]

/-- Not being counted by the singleton event implies the exact
nonzero-type occupancy hypothesis in the checked matrix obstruction. -/
theorem good_word_no_singletons (m k : Nat) (w : List Raw)
    (hw : w ∈ words (alphabet m) k)
    (hgood : (nonzeroTypes m).any (fun d => countType w d == 1) = false) :
    ∀ d, d ≠ 0 → countType w d ≠ 1 := by
  intro d hd
  by_cases hlt : d < m
  · have hm := nonzeroTypes_complete m d (by omega) hlt
    have he := (List.any_eq_false.mp hgood) d hm
    intro h
    exact he (by simp [h])
  · have hmem := (mem_words (alphabet m) k w).mp hw
    have hz := countType_outside w m d (by omega)
      (fun a ha => alphabet_label_lt m a (hmem.2 a ha))
    omega


/-- The alphabet contains every possible label/coefficient pair exactly
once, with ternary residues represented by the integers 0, 1, 2. -/
theorem alphabet_mem_iff (m : Nat) (x : Raw) :
    x ∈ alphabet m ↔ x.1 < m ∧ 0 ≤ x.2 ∧ x.2 < 3 := by
  rcases x with ⟨d,c⟩
  induction m with
  | zero => simp [alphabet]
  | succ m ih =>
    simp [alphabet,ih]
    omega

theorem tally_mono_on {α : Type} (p q : α → Bool) (xs : List α)
    (h : ∀ a ∈ xs, p a = true → q a = true) :
    tally p xs ≤ tally q xs := by
  induction xs with
  | nil => simp [tally]
  | cons a xs ih =>
    have ht := ih (fun b hb => h b (by simp [hb]))
    have ha := h a (by simp)
    cases hp : p a <;> cases hq : q a <;> simp [tally,hp,hq] at * <;> omega

/-- Conditional finite sample-space bound combining the deterministic
matrix obstruction with the independent-column occupancy count. For
every sample word, the supplied matrix must have its kernel spanned by
the encoded columns of that word. A successful word must cover the
actual dimension-matched binary/ternary codomain. -/
theorem successful_word_count_le (m k : Nat)
    (rows : List Raw → List (List Bool)) (success : List Raw → Bool)
    (hker : ∀ w ∈ words (alphabet m) k, ∀ v : List Bool,
      v.length = w.length →
      MaTangCoreMatrix.applyMatrix (rows w) v =
        List.replicate (rows w).length false →
      ∃ t : List Bool, v = MaTangCoreMatrix.kernelVector w t)
    (hcover : ∀ w ∈ words (alphabet m) k, success w = true →
      ∀ b : List Bool, b.length = (rows w).length →
      ∀ z : Int, 0 ≤ z → z < 3 →
      ∃ v : List Bool, v.length = w.length ∧
        MaTangCoreMatrix.applyMatrix (rows w) v = b ∧ sumBits w v % 3 = z) :
    tally success (words (alphabet m) k) ≤
      (m-1)*k*2*(3*m-2)^(k-1) := by
  let bad := fun w : List Raw =>
    (nonzeroTypes m).any (fun d => countType w d == 1)
  have hsub : ∀ w ∈ words (alphabet m) k, success w = true → bad w = true := by
    intro w hw hs
    cases hb : bad w
    · have hgood : (nonzeroTypes m).any (fun d => countType w d == 1) = false := hb
      exact False.elim ((MaTangCoreMatrix.not_covers_of_matrix_kernel
        w (rows w) (good_word_no_singletons m k w hw hgood) (hker w hw))
        (hcover w hw hs))
    · rfl
  exact Nat.le_trans (tally_mono_on success bad (words (alphabet m) k) hsub)
    (singleton_union_word_count_le m k)

end MaTangCoreOccupancy
