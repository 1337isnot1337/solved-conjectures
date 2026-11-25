import Conjectures.MaTangCoreUpperShift

/-!
# Ma–Tang's random subset-sum threshold conjecture
Discrete initial second-moment algebra. The only probability input
is a finite squared-occupancy total bounded by the equal-sum pair count.
-/
namespace MaTangCoreUpperMoment
open MaTangCoreBirthday MaTangCoreOccupancy MaTangCoreUpperDyadic MaTangCoreUpperShift MaTangCoreUpperPrefixes

def zeroCount (xs : List Nat) : Nat := tally (fun x => decide (x=0)) xs
def squareSum (xs : List Nat) : Nat := (xs.map fun x => x*x).sum

theorem square_amgm (a b : Nat) : 2*(a*b) ≤ a*a+b*b := by
  suffices h : ∀ u v : Nat, 2*(u*(u+v)) ≤ u*u+(u+v)*(u+v) by
    rcases Nat.le_total a b with hab | hba
    · obtain ⟨c,rfl⟩ := Nat.exists_eq_add_of_le hab
      exact h a c
    · obtain ⟨c,rfl⟩ := Nat.exists_eq_add_of_le hba
      simpa only [Nat.mul_comm (b+c) b, Nat.add_comm] using h b c
  intro u v
  rw [Nat.mul_add u u v, Nat.mul_add 2, Nat.add_mul, Nat.mul_add u u v, Nat.mul_add v u v]
  rw [Nat.mul_comm v u]
  omega

theorem one_entry (n q x : Nat) :
    2*(n*q*x)+(if x=0 then q*q else 0) ≤ (n*n)*(x*x)+q*q := by
  by_cases hx : x=0
  · subst x; simp
  · simp only [hx,ite_false,Nat.add_zero]
    have h := square_amgm (n*x) q
    have h₁ : n*x*q=n*q*x := by ac_rfl
    have h₂ : (n*x)*(n*x)=(n*n)*(x*x) := by ac_rfl
    simpa only [h₁,h₂] using h

theorem row_bound (n q : Nat) (xs : List Nat) :
    2*(n*q*xs.sum)+zeroCount xs*(q*q) ≤ n*n*squareSum xs + xs.length*(q*q) := by
  induction xs with
  | nil => simp [zeroCount,tally,squareSum]
  | cons x xs ih =>
    have hx := one_entry n q x
    simp only [List.sum_cons,zeroCount,tally,squareSum,List.map_cons,List.length_cons,
      Nat.mul_add,Nat.add_mul,Nat.one_mul] at *
    by_cases hz : x=0
    · subst x; simp at *; omega
    · simp [hz] at hx ⊢
      omega

theorem fixed_row (n q : Nat) (xs : List Nat) (hlen : xs.length = n)
    (hsum : xs.sum = q) :
    zeroCount xs*(q*q) + n*(q*q) ≤ n*n*squareSum xs := by
  have h := row_bound n q xs
  rw [hlen,hsum] at h
  rw [Nat.mul_assoc n q q] at h
  omega

theorem all_rows (n q : Nat) (rows : List (List Nat))
    (hrows : ∀ xs ∈ rows, xs.length = n ∧ xs.sum = q) :
    ((rows.map zeroCount).sum)*(q*q) + rows.length*(n*(q*q)) ≤
      (n*n)*((rows.map squareSum).sum) := by
  induction rows with
  | nil => simp
  | cons x xs ih =>
    have hx := hrows x (by simp)
    have h₀ := fixed_row n q x hx.1 hx.2
    have h₁ := ih (fun w hw => hrows w (by simp [hw]))
    simp only [List.map_cons,List.sum_cons,List.length_cons,Nat.mul_add,Nat.add_mul,Nat.one_mul]
    omega

/-- A uniform collision bound on ordered subset pairs is enough for the
required missing-count inequality using only integer arithmetic. -/
theorem initial_mass_from_squares (n q : Nat) (rows : List (List Nat))
    (hn : 0 < n) (hq : 0 < q) (hscale : 512*n ≤ q)
    (hrows : ∀ xs ∈ rows, xs.length = n ∧ xs.sum = q)
    (hcollision : n*(rows.map squareSum).sum ≤ rows.length*(n*q+q*q)) :
    512*(rows.map zeroCount).sum ≤ rows.length*n := by
  let M := (rows.map zeroCount).sum
  let T := rows.length
  let S := (rows.map squareSum).sum
  have hbase : M*(q*q)+T*(n*(q*q)) ≤ (n*n)*S := all_rows n q rows hrows
  have hbig : M*(q*q)+T*(n*(q*q)) ≤ T*(n*n*q)+T*(n*(q*q)) := by
    calc
      M*(q*q)+T*(n*(q*q)) ≤ (n*n)*S := hbase
      _ = n*(n*S) := Nat.mul_assoc ..
      _ ≤ n*(T*(n*q+q*q)) := Nat.mul_le_mul_left _ hcollision
      _ = T*(n*n*q)+T*(n*(q*q)) := by
        simp only [Nat.mul_add]
        congr 1 <;> ac_rfl
  have hM : M*(q*q) ≤ T*(n*n*q) := Nat.le_of_add_le_add_right hbig
  have hMq : M*q ≤ T*(n*n) := by
    apply Nat.le_of_mul_le_mul_right _ hq
    calc
      (M*q)*q = M*(q*q) := Nat.mul_assoc ..
      _ ≤ T*(n*n*q) := hM
      _ = (T*(n*n))*q := (Nat.mul_assoc ..).symm
  have hlast : (512*M)*n ≤ (T*n)*n := by
    calc
      (512*M)*n = M*(512*n) := by ac_rfl
      _ ≤ M*q := Nat.mul_le_mul_left _ hscale
      _ ≤ T*(n*n) := hMq
      _ = (T*n)*n := (Nat.mul_assoc ..).symm
  exact Nat.le_of_mul_le_mul_right hlast hn

theorem dyadic_seed_budget (n : Nat) (hn : n ≠ 0) :
    512*n ≤ 2^(n.log2+10) := by
  have h := ((Nat.log2_eq_iff hn).mp (rfl : n.log2=n.log2)).2
  calc
    512*n ≤ 512*2^(n.log2+1) := Nat.mul_le_mul_left _ (Nat.le_of_lt h)
    _ = 2^(n.log2+10) := by
      rw [show n.log2+10 = 9+(n.log2+1) by omega, Nat.pow_add 2 9 (n.log2+1)] <;> rfl

/-- The occupancy row lists the multiplicities of the literal subset
sums at every point of the duplicate-free alphabet. -/
def occupancyRow {α : Type} [BEq α] (g : TranslationData α)
    (A : List α) (w : List α) : List Nat :=
  A.map fun b => tally (fun x => x == b) (subsetValues g w)

theorem tally_eq_one {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (a : α) (ha : a ∈ A) :
    tally (fun x => x == a) A = 1 := by
  have hu := tally_eq_le_one a A hA
  have hl : tally (fun x => x == a) A ≠ 0 := by
    intro hz
    have hh := (MaTangCoreGenerator.tally_eq_zero_iff_all_false _ _).mp hz a ha
    simp at hh
  omega

theorem occupancyRow_total {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup)
    (complete : ∀ x, x ∈ A) (w : List α) :
    (occupancyRow g A w).sum = (subsetValues g w).length := by
  let S := subsetValues g w
  let f : α → α → Nat := fun b x => if x == b then 1 else 0
  change (A.map fun b => tally (fun x => x == b) S).sum = S.length
  have h₀ : (fun b => tally (fun x => x == b) S) = fun b => (S.map (f b)).sum := by
    funext b
    exact (sum_indicator S _).symm
  have h₁ : (fun x => (A.map (fun b => f b x)).sum) = fun _ => 1 := by
    funext x
    rw [sum_indicator]
    have he : BEq.beq x = (fun b => b == x) := by
      funext b
      change (x == b) = (b == x)
      by_cases h : x = b
      · subst b; rfl
      · have h' : b ≠ x := fun e => h e.symm
        cases h₁ : (x == b) <;> cases h₂ : (b == x)
        · rfl
        · exact False.elim (h' (eq_of_beq h₂))
        · exact False.elim (h (eq_of_beq h₁))
        · exact False.elim (h (eq_of_beq h₁))
    rw [he]
    exact tally_eq_one A hA x (complete x)
  rw [h₀,sum_transpose,h₁]
  induction S with
  | nil => rfl
  | cons x xs ih => simp [ih,Nat.add_comm]

theorem tally_eq_zero_iff_absent {α : Type} [BEq α] [LawfulBEq α]
    (S : List α) (a : α) : tally (fun x => x == a) S = 0 ↔ a ∉ S := by
  rw [MaTangCoreGenerator.tally_eq_zero_iff_all_false]
  constructor
  · intro h ha
    have hh := h a ha
    simp at hh
  · intro h b hb
    have hn : b ≠ a := by
      intro he; exact h (he ▸ hb)
    simp [hn]

theorem occupancyRow_zeros {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A w : List α) :
    zeroCount (occupancyRow g A w) = missingCount g A w := by
  unfold zeroCount occupancyRow missingCount
  rw [tally_map]
  congr 1
  funext a
  have h₀ := tally_eq_zero_iff_absent (subsetValues g w) a
  have h₁ := containsB_false a (subsetValues g w)
  cases hb : containsB a (subsetValues g w)
  · have hz := h₀.mpr (h₁.mp hb)
    simp [hz,missingB,hb]
  · have hn : tally (fun x => x == a) (subsetValues g w) ≠ 0 := by
      intro hz
      have hf := h₁.mpr (h₀.mp hz)
      simp [hb] at hf
    simp [hn,missingB,hb]

theorem subsetValues_length {α : Type} (g : TranslationData α) (w : List α) :
    (subsetValues g w).length = 2^w.length := by
  induction w with
  | nil => rfl
  | cons a w ih => simp [subsetValues,ih,Nat.pow_succ,Nat.mul_two]

theorem word_length {α : Type} (A : List α) (k : Nat) (w : List α)
    (hw : w ∈ words A k) : w.length = k := by
  induction k generalizing w with
  | zero => simpa [words] using hw
  | succ k ih =>
    change w ∈ extend A (words A k) at hw
    have hExt (B : List α) : ∀ v ∈ extend B (words A k), v.length = k+1 := by
      induction B with
      | nil => simp [extend]
      | cons a as he =>
        intro v hv
        simp only [extend,List.mem_append,List.mem_map] at hv
        rcases hv with ⟨u,hu,rfl⟩ | ht
        · simp [ih u hu]
        · exact he v ht
    exact hExt A w hw

/-- Converts an ordered-pair collision bound for the true occupancy rows
into precisely the initial hypothesis consumed by the shift bridge. -/
theorem initial_bound_from_collisions {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (cA : ∀ x, x ∈ A)
    (hn : 0 < A.length) (k : Nat) (hscale : 512*A.length ≤ 2^k)
    (hcollision : A.length*((words A k).map (fun w => squareSum (occupancyRow g A w))).sum ≤
       (words A k).length*(A.length*2^k+2^k*2^k)) :
    512*((words A k).map (missingCount g A)).sum ≤ (words A k).length*A.length := by
  let rows := (words A k).map (occupancyRow g A)
  have hrows : ∀ xs ∈ rows, xs.length = A.length ∧ xs.sum = 2^k := by
    intro xs hx
    obtain ⟨w,hw,rfl⟩ := List.mem_map.mp hx
    constructor
    · simp [occupancyRow]
    · rw [occupancyRow_total g A hA cA,subsetValues_length,word_length A k w hw]
  have hc : A.length*(rows.map squareSum).sum ≤ rows.length*(A.length*2^k+2^k*2^k) := by
    simpa [rows,List.map_map,Function.comp_def] using hcollision
  have h := initial_mass_from_squares A.length (2^k) rows hn (Nat.two_pow_pos _) hscale hrows hc
  rw [show rows.map zeroCount = (words A k).map (missingCount g A) by
    simp only [rows,List.map_map,Function.comp_def,occupancyRow_zeros]] at h
  simpa [rows] using h

end MaTangCoreUpperMoment

