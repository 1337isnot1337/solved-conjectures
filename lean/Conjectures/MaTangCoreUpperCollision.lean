import Conjectures.MaTangCoreUpperMoment
import Init.Data.List.Nat.Perm

/-!
# Ma–Tang's random subset-sum threshold conjecture
Initial occupancy energy, using the exact cross term averaged over translations.
-/
namespace MaTangCoreUpperCollision
open MaTangCoreOccupancy MaTangCoreUpperPrefixes MaTangCoreUpperShift MaTangCoreUpperMoment
open MaTangCoreUpperDyadic MaTangCoreBirthday MaTangCoreRank

theorem sum_add {α : Type} (A : List α) (f g : α → Nat) :
    (A.map (fun a => f a + g a)).sum = (A.map f).sum + (A.map g).sum :=
  sum_map_add A f g

def occ {α : Type} [BEq α] (s : List α) (b : α) : Nat :=
  tally (fun x => x == b) s

def energy {α : Type} [BEq α] (A s : List α) : Nat :=
  (A.map fun b => occ s b * occ s b).sum

theorem sum_mul_right {α : Type} (A : List α) (f : α → Nat) (m : Nat) :
    (A.map fun a => f a * m).sum = (A.map f).sum * m := by
  induction A with
  | nil => simp
  | cons a A ih => simp [ih,Nat.add_mul]

theorem sum_mul_left {α : Type} (A : List α) (f : α → Nat) (m : Nat) :
    (A.map fun a => m * f a).sum = m * (A.map f).sum := by
  simpa only [Nat.mul_comm m] using sum_mul_right A f m

theorem sum_constant {α : Type} (A : List α) (m : Nat) :
    (A.map fun _ => m).sum = A.length * m := by
  induction A with
  | nil => simp
  | cons a A ih => simp [ih,Nat.add_mul,Nat.add_comm]

theorem perm_sum {A B : List Nat} (h : A.Perm B) : A.sum = B.sum := by
  induction h with
  | nil => rfl
  | cons a _ ih => simp [ih]
  | swap a b s => simp [Nat.add_left_comm]
  | trans _ _ h₁ h₂ => exact h₁.trans h₂

theorem complete_perm {α : Type} [BEq α] [LawfulBEq α]
    (A B : List α) (hA : A.Nodup) (hB : B.Nodup)
    (cA : ∀ a, a ∈ A) (cB : ∀ a, a ∈ B) : B.Perm A := by
  apply List.perm_iff_count.mpr
  intro a
  rw [List.count_eq_length_filter,List.count_eq_length_filter,
    ← MaTangCoreGenerator.tally_filter_length, ← MaTangCoreGenerator.tally_filter_length,
    tally_eq_one B hB a (cB a),tally_eq_one A hA a (cA a)]

theorem sum_bijective {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A) (e d : α → α)
    (hl : ∀ a, d (e a) = a) (hr : ∀ a, e (d a) = a) (F : α → Nat) :
    (A.map fun a => F (e a)).sum = (A.map F).sum := by
  have hn : (A.map e).Nodup :=
    nodup_map_of_injective_on _ _ hA (by
      intro x _ y _ h
      exact (hl x).symm.trans ((congrArg d h).trans (hl y)))
  have hc (x : α) : x ∈ A.map e := List.mem_map.mpr ⟨d x,cA _,hr x⟩
  have hp := (complete_perm A (A.map e) hA hn cA hc).map F
  simpa only [List.map_map,Function.comp_def] using perm_sum hp

theorem translated_occ {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (a b : α) (s : List α) :
    occ (s.map (g.add a)) b = occ s (g.preimage a b) := by
  unfold occ
  rw [tally_map]
  congr 1
  funext x
  have he : g.add a x = b ↔ x = g.preimage a b := by
    constructor
    · intro h
      rw [← h,g.left_inv]
    · intro h
      rw [h,g.right_inv]
  cases h₁ : (g.add a x == b) <;> cases h₂ : (x == g.preimage a b)
  · rfl
  · have hh := he.mpr (eq_of_beq h₂)
    rw [hh] at h₁
    simp at h₁
  · have hh := he.mp (eq_of_beq h₁)
    rw [hh] at h₂
    simp at h₂
  · rfl

theorem sum_occ {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A) (s : List α) :
    (A.map (occ s)).sum = s.length := by
  have hf : occ s = fun b => (s.map fun x => if x == b then 1 else 0).sum := by
    funext b
    exact (sum_indicator s _).symm
  have hh (x : α) : (A.map fun b => if x == b then 1 else 0).sum = 1 := by
    rw [sum_indicator]
    have he : BEq.beq x = (fun b => b == x) := by
      funext b
      change (x == b) = (b == x)
      cases h₁ : (x == b) <;> cases h₂ : (b == x)
      · rfl
      · have e := eq_of_beq h₂
        subst b; simp at h₁
      · have e := eq_of_beq h₁
        subst b; simp at h₂
      · rfl
    rw [he]
    exact tally_eq_one A hA x (cA x)
  rw [hf,sum_transpose, show (fun x => (A.map fun b => if x == b then 1 else 0).sum) =
    (fun _ => 1) from funext hh,sum_constant,Nat.mul_one]

theorem energy_step_sum {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A)
    (s : List α) :
    (A.map fun a => energy A (s ++ s.map (g.add a))).sum =
      A.length * (2*energy A s) + 2*(s.length*s.length) := by
  let m := occ s
  let cross := fun a => (A.map fun b => m b * m (g.preimage a b)).sum
  have hOne (a : α) : energy A (s ++ s.map (g.add a)) = 2*energy A s + 2*cross a := by
    have ht (b : α) : occ (s ++ s.map (g.add a)) b = m b + m (g.preimage a b) := by
      unfold occ
      rw [tally_append]
      change occ s b + occ (s.map (g.add a)) b = _
      rw [translated_occ]
    have hSq (b : α) :
        occ (s ++ s.map (g.add a)) b * occ (s ++ s.map (g.add a)) b =
          (m b*m b + m (g.preimage a b)*m (g.preimage a b)) +
            2*(m b*m (g.preimage a b)) := by
      rw [ht]
      simp only [Nat.add_mul,Nat.mul_add,Nat.two_mul]
      rw [Nat.mul_comm (m (g.preimage a b)) (m b)]
      omega
    have hp := sum_bijective A hA cA (g.preimage a) (g.add a)
      (g.right_inv a) (g.left_inv a) (fun b => m b*m b)
    unfold energy
    rw [show _ = _ from funext hSq,
      sum_add A (fun b => m b*m b + m (g.preimage a b)*m (g.preimage a b))
        (fun b => 2*(m b*m (g.preimage a b))),
      sum_add A (fun b => m b*m b) (fun b => m (g.preimage a b)*m (g.preimage a b)),
      sum_mul_left,hp]
    change _ + _ + 2*cross a = _
    dsimp only [m]
    omega
  have hInner (b : α) : (A.map fun a => m b*m (g.preimage a b)).sum = m b*s.length := by
    rw [sum_mul_left, sum_bijective A hA cA (fun a => g.preimage a b)
      (fun a => g.preimage a b) (fun a => preimage_involutive g a b)
      (fun a => preimage_involutive g a b) m,sum_occ A hA cA s]
  rw [show _ = _ from funext hOne,
    sum_add A (fun _ => 2*energy A s) (fun a => 2*cross a),sum_constant,sum_mul_left]
  unfold cross
  rw [sum_transpose,show _ = _ from funext hInner,sum_mul_right,sum_occ A hA cA s]


theorem extend_sum {α : Type} (A : List α) (W : List (List α)) (F : List α → Nat) :
    ((extend A W).map F).sum = (A.map fun a => (W.map fun w => F (a::w)).sum).sum := by
  induction A with
  | nil => rfl
  | cons a A ih => simp [extend,List.map_map,Function.comp_def,ih]

def totalEnergy {α : Type} [BEq α] (g : TranslationData α) (A : List α) (k : Nat) : Nat :=
    ((words A k).map fun w => energy A (subsetValues g w)).sum

theorem totalEnergy_step {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A) (k : Nat) :
    totalEnergy g A (k+1) = (2*A.length)*totalEnergy g A k + 2*A.length^k*(2^k*2^k) := by
  let W := words A k
  have he (w : List α) : (A.map fun a => energy A (subsetValues g (a::w))).sum =
      A.length * (2*energy A (subsetValues g w)) +
      2*((subsetValues g w).length*(subsetValues g w).length) :=
    energy_step_sum g A hA cA _
  change ((extend A W).map fun w => energy A (subsetValues g w)).sum = _
  rw [extend_sum,sum_transpose, show _ = _ from funext he,
    sum_add W (fun w => A.length * (2*energy A (subsetValues g w)))
      (fun w => 2*((subsetValues g w).length*(subsetValues g w).length)),
    sum_mul_left,sum_mul_left,sum_mul_left]
  have hh : (W.map fun w => (subsetValues g w).length*(subsetValues g w).length) =
      W.map (fun _ => 2^k*2^k) := by
    apply List.map_congr_left
    intro w hw
    rw [subsetValues_length,word_length A k w hw]
  rw [hh,sum_constant,words_length]
  change A.length * (2*totalEnergy g A k) + 2*(A.length^k*(2^k*2^k)) = _
  ac_rfl

theorem totalEnergy_zero {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A) :
    totalEnergy g A 0 = 1 := by
  have h (b : α) : occ [g.zero] b*occ [g.zero] b = occ [g.zero] b := by
    cases hb : (g.zero == b) <;> simp [occ,tally,hb]
  change energy A [g.zero] + 0 = 1
  rw [Nat.add_zero]
  unfold energy
  rw [funext h,sum_occ A hA cA]
  rfl

theorem advance_arithmetic (n q m : Nat) :
    (2*n)*(q*(n*m+m*m)) + n*(2*q*(m*m)) = (q*n)*(n*(m*2)+(m*2)*(m*2)) := by
  calc
    _ = (q*n)*(2*(n*m)+2*(m*m)+2*(m*m)) := by
      simp only [Nat.mul_add]
      ac_rfl
    _ = _ := by
      congr 1
      rw [show n*(m*2) = 2*(n*m) by ac_rfl,
        show (m*2)*(m*2) = (2+2)*(m*m) by change (m*2)*(m*2) = (2*2)*(m*m); ac_rfl,
        Nat.add_mul,Nat.add_assoc]

/-- The exact finite proof does not assume pairwise independence. -/
theorem totalEnergy_bound {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A) (k : Nat) :
    A.length * totalEnergy g A k ≤ A.length^k*(A.length*2^k+2^k*2^k) := by
  induction k with
  | zero => simp [totalEnergy_zero g A hA cA]
  | succ k ih =>
    rw [totalEnergy_step g A hA cA,Nat.mul_add,
      show A.length*((2*A.length)*totalEnergy g A k) =
         (2*A.length)*(A.length*totalEnergy g A k) by ac_rfl]
    calc
      _ ≤ (2*A.length)*(A.length^k*(A.length*2^k+2^k*2^k)) +
           A.length*(2*A.length^k*(2^k*2^k)) :=
        Nat.add_le_add_right (Nat.mul_le_mul_left _ ih) _
      _ = _ := by
        rw [Nat.pow_succ A.length,Nat.pow_succ 2]
        exact advance_arithmetic A.length (A.length^k) (2^k)

theorem energy_occupancy {α : Type} [BEq α] (g : TranslationData α) (A w : List α) :
    squareSum (occupancyRow g A w) = energy A (subsetValues g w) := by
  unfold squareSum occupancyRow energy
  simp only [List.map_map,Function.comp_def,occ]

theorem initial_occupancy_bound {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A)
    (hN : 2^16 ≤ A.length) :
    512*((words A (A.length.log2+10)).map (missingCount g A)).sum ≤
      (words A (A.length.log2+10)).length*A.length := by
  have hn : 0 < A.length := by omega
  apply initial_bound_from_collisions g A hA cA hn
  · exact dyadic_seed_budget A.length (Nat.ne_of_gt hn)
  · simp only [energy_occupancy,words_length]
    exact totalEnergy_bound g A hA cA _

theorem conditioned_cover {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A)
    (hN : 2^16 ≤ A.length) :
    (distinctWords A (upperSampleSize A.length)).length <
      2*tally (fun w => !(decide (0 < missingCount g A w)))
        (distinctWords A (upperSampleSize A.length)) :=
  conditioned_cover_from_initial g A hA cA hN (initial_occupancy_bound g A hA cA hN)

end MaTangCoreUpperCollision

