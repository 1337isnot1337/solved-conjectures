import Conjectures.MaTangCoreUpperPrefixes

/-!
# Ma–Tang's random subset-sum threshold conjecture
Literal subset-sum missing counts and their exact translation second
moment. Only commutative translations and their inverses are needed.
-/
namespace MaTangCoreUpperShift
open MaTangCoreBirthday MaTangCoreOccupancy MaTangCoreRank MaTangCoreUpperDyadic
open MaTangCoreUpperPrefixes

structure TranslationData (α : Type) where
  zero : α
  add : α → α → α
  preimage : α → α → α
  add_comm : ∀ x y, add x y = add y x
  left_inv : ∀ x y, preimage x (add x y) = y
  right_inv : ∀ x y, add x (preimage x y) = y

def subsetValues {α : Type} (g : TranslationData α) : List α → List α
  | [] => [g.zero]
  | a::w => let s := subsetValues g w; s ++ s.map (g.add a)

def missingB {α : Type} [BEq α] (s : List α) (x : α) : Bool := !containsB x s

def missingCount {α : Type} [BEq α] (g : TranslationData α)
    (A : List α) (w : List α) : Nat := tally (missingB (subsetValues g w)) A

theorem preimage_involutive {α : Type} (g : TranslationData α) (x y : α) :
    g.preimage (g.preimage x y) y = x := by
  calc
    _ = g.preimage (g.preimage x y) (g.add x (g.preimage x y)) := by rw [g.right_inv]
    _ = g.preimage (g.preimage x y) (g.add (g.preimage x y) x) := by
      rw [g.add_comm x]
    _ = x := g.left_inv _ _

theorem preimage_contains {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (s : List α) (a x : α) :
    containsB x (s.map (g.add a)) = containsB (g.preimage a x) s := by
  have h : containsB x (s.map (g.add a)) = true ↔ containsB (g.preimage a x) s = true := by
    rw [containsB_true,containsB_true,List.mem_map]
    constructor
    · intro ⟨y,hy,hxy⟩
      rw [← hxy,g.left_inv]
      exact hy
    · intro hy
      exact ⟨g.preimage a x,hy,g.right_inv a x⟩
  cases h₁ : containsB x (s.map (g.add a)) <;>
    cases h₂ : containsB (g.preimage a x) s <;> simp_all

theorem missing_step {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (a x : α) (w : List α) :
    missingB (subsetValues g (a::w)) x =
      (missingB (subsetValues g w) x && missingB (subsetValues g w) (g.preimage a x)) := by
  let s := subsetValues g w
  change (!containsB x (s ++ s.map (g.add a))) =
    (!containsB x s && !containsB (g.preimage a x) s)
  have ha : containsB x (s ++ s.map (g.add a)) =
        (containsB x s || containsB x (s.map (g.add a))) := by
    simp [containsB,List.any_append]
  rw [ha,preimage_contains]
  cases h₁ : containsB x s <;> cases h₂ : containsB (g.preimage a x) s <;> rfl

theorem filter_nodup {α : Type} (p : α → Bool) (A : List α)
    (hA : A.Nodup) : (A.filter p).Nodup := by
  induction A with
  | nil => simp
  | cons a as ih =>
    obtain ⟨hn,hd⟩ := List.nodup_cons.mp hA
    cases hp : p a with
    | false => simpa [hp] using ih hd
    | true =>
      rw [List.filter_cons,hp]
      simp only [ite_true]
      exact List.nodup_cons.mpr ⟨fun hm => hn (List.mem_filter.mp hm).1, ih hd⟩

theorem tally_preimage {α : Type} [BEq α] [LawfulBEq α] (g : TranslationData α)
    (A : List α) (hA : A.Nodup) (complete : ∀ x, x ∈ A)
    (p : α → Bool) (x : α) :
    tally (fun a => p (g.preimage a x)) A = tally p A := by
  let B := A.map (fun a => g.preimage a x)
  have hB : B.Nodup := by
    apply nodup_map_of_injective_on _ _ hA
    intro a _ b _ h
    calc
      a = g.preimage (g.preimage a x) x := (preimage_involutive g a x).symm
      _ = g.preimage (g.preimage b x) x := by rw [h]
      _ = b := preimage_involutive g b x
  have cB (a : α) : a ∈ B :=
    List.mem_map.mpr ⟨g.preimage a x, complete _, preimage_involutive g a x⟩
  rw [← tally_map p (fun a => g.preimage a x) A]
  change tally p B = tally p A
  rw [MaTangCoreGenerator.tally_filter_length,MaTangCoreGenerator.tally_filter_length]
  apply Nat.le_antisymm
  · apply nodup_subset_length _ _ (filter_nodup p B hB)
    intro a ha
    exact List.mem_filter.mpr ⟨complete a,(List.mem_filter.mp ha).2⟩
  · apply nodup_subset_length _ _ (filter_nodup p A hA)
    intro a ha
    exact List.mem_filter.mpr ⟨cB a,(List.mem_filter.mp ha).2⟩

theorem sum_transpose {α β : Type} (A : List α) (B : List β) (f : α → β → Nat) :
    (A.map (fun a => (B.map (f a)).sum)).sum =
      (B.map (fun b => (A.map (fun a => f a b)).sum)).sum := by
  induction A with
  | nil =>
    induction B with
    | nil => rfl
    | cons b bs ih => simpa using ih
  | cons a as ih =>
    simp only [List.map_cons,List.sum_cons,ih]
    rw [← sum_map_add]

theorem constant_mark_sum {α : Type} (A : List α) (p : α → Bool) (m : Nat) :
    (A.map (fun a => if p a then m else 0)).sum = tally p A*m := by
  induction A with
  | nil => simp [tally]
  | cons a as ih =>
    cases h : p a <;> simp [tally,h,ih,Nat.add_mul,Nat.add_comm]

/-- Counting ordered pairs of missing points gives the exact shift-square
identity for the subset-value enumerator. The alphabet lists every point
once; the subset-value list itself may contain repeated sums. -/
theorem shift_second_moment {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup)
    (complete : ∀ x, x ∈ A) (w : List α) :
    (A.map (fun a => missingCount g A (a::w))).sum =
      missingCount g A w*missingCount g A w := by
  let p := missingB (subsetValues g w)
  let f := fun a x => if p x && p (g.preimage a x) then 1 else 0
  have h₁ (a : α) : missingCount g A (a::w) = (A.map (f a)).sum := by
    rw [sum_indicator]
    unfold missingCount
    congr 1
    funext x
    exact missing_step g a x w
  have h₂ (x : α) : (A.map (fun a => f a x)).sum =
      (if p x then tally p A else 0) := by
    rw [sum_indicator]
    cases h : p x with
    | false => simpa using (tally_false A)
    | true => simpa using (tally_preimage g A hA complete p x)
  rw [show (fun a => missingCount g A (a::w)) = (fun a => (A.map (f a)).sum) from funext h₁]
  rw [sum_transpose]
  rw [show (fun x => (A.map (fun a => f a x)).sum) = (fun x => if p x then tally p A else 0)
    from funext h₂,constant_mark_sum]
  rfl

theorem missingCount_zero_iff {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (complete : ∀ x, x ∈ A) (w : List α) :
    missingCount g A w = 0 ↔ ∀ x, x ∈ subsetValues g w := by
  rw [missingCount, MaTangCoreGenerator.tally_eq_zero_iff_all_false]
  constructor
  · intro h x
    have hh := h x (complete x)
    apply (containsB_true x (subsetValues g w)).mp
    simpa [missingB] using hh
  · intro h x _
    have hx := (containsB_true x (subsetValues g w)).mpr (h x)
    simp [missingB,hx]

theorem conditioned_cover_from_initial {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (complete : ∀ x, x ∈ A)
    (hN : 2^16 ≤ A.length)
    (hinit : 512*((words A (A.length.log2+10)).map (missingCount g A)).sum ≤
      (words A (A.length.log2+10)).length*A.length) :
    (distinctWords A (upperSampleSize A.length)).length <
      2*tally (fun w => !(decide (0 < missingCount g A w)))
        (distinctWords A (upperSampleSize A.length)) := by
  exact distinct_missing_success A hA (missingCount g A) hN hinit
    (shift_second_moment g A hA complete)

end MaTangCoreUpperShift

