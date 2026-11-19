import Std

namespace SolitaireCounterexample

def insertPile (x : Nat) : List Nat → List Nat
  | [] => if x = 0 then [] else [x]
  | y::ys => if x = 0 then y::ys else if y ≤ x then x::y::ys else y::insertPile x ys

def normalize : List Nat → List Nat
  | [] => []
  | x::xs => insertPile x (normalize xs)

def step (b : Nat) (piles : List Nat) : List Nat :=
  insertPile ((piles.map (fun x => min b x)).sum)
    (normalize (piles.map (fun x => x-b)))

theorem cycle_first (n b : Nat) (hb : 0 < b) (hn : b < n) (h2 : n < 2*b) :
    step b [n] = [b,n-b] := by
  have hs : 0 < n-b := by omega
  have hle : n-b ≤ b := by omega
  simp [step, normalize, insertPile, Nat.min_eq_left (by omega : b ≤ n),
    Nat.ne_of_gt hb, Nat.ne_of_gt hs, hle]

theorem cycle_second (n b : Nat) (hb : 0 < b) (hn : b < n) (h2 : n < 2*b) :
    step b [b,n-b] = [n] := by
  have hs : 0 < n-b := by omega
  have hle : n-b ≤ b := by omega
  have hadd : b+(n-b) = n := by omega
  have hn0 : n ≠ 0 := by omega
  simp [step, normalize, insertPile, Nat.min_eq_right hle, Nat.sub_eq_zero_of_le hle,
    hadd, hn0]

def b (n : Nat) : Nat := n/2+1

theorem two_cycle (n : Nat) (hn : 3 ≤ n) :
    step (b n) [n] = [b n,n-b n] ∧ step (b n) [b n,n-b n] = [n] := by
  have hb : 0 < b n := by simp [b]
  have hbn : b n < n := by simp [b]; omega
  have h2 : n < 2 * b n := by simp [b]; omega
  exact ⟨cycle_first n (b n) hb hbn h2, cycle_second n (b n) hb hbn h2⟩
#print axioms two_cycle
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem stable_pair (h b : Nat) (hb : 0 < b) (hh : b < h) (h2 : h ≤ 2*b) :
    step b [h,h-b] = [h,h-b] := by
  have hs : 0 < h-b := by omega
  have hle : h-b ≤ b := by omega
  have hadd : b+(h-b) = h := by omega
  have htop : h-b ≤ h := by omega
  have hh0 : h ≠ 0 := by omega
  simp [step, normalize, insertPile, Nat.min_eq_left (by omega : b ≤ h),
    Nat.min_eq_right hle, Nat.sub_eq_zero_of_le hle,
    Nat.ne_of_gt hs, hadd, htop, hh0]

def h (n : Nat) : Nat := (n+b n)/2

theorem displayed_stable (n : Nat) (hn : 5 ≤ n) :
    step (b n) [h n,h n-b n] = [h n,h n-b n] := by
  have hb : 0 < b n := by simp [b]
  have hh : b n < h n := by simp [h,b]; omega
  have h2 : h n ≤ 2*b n := by simp [h,b]; omega
  exact stable_pair (h n) (b n) hb hh h2
#print axioms displayed_stable
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem stable_mass_bounds (n : Nat) (hn : 5 ≤ n) :
    n-1 ≤ h n + (h n-b n) ∧ h n + (h n-b n) ≤ n ∧
      n < (h n+1) + (h n+1-b n) := by
  simp [h, b]
  omega

theorem larger_top_exceeds (n j : Nat) (hn : 5 ≤ n) (hj : h n < j) :
    n < j + (j-b n) := by
  have hs := stable_mass_bounds n hn
  omega
#print axioms stable_mass_bounds
#print axioms larger_top_exceeds
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem insert_preserves (x y : Nat) (xs : List Nat) (hx : x ∈ xs) : x ∈ insertPile y xs := by
  induction xs with
  | nil => simp at hx
  | cons a xs ih =>
    simp only [List.mem_cons] at hx
    simp only [insertPile]
    split
    · simp [hx]
    · split
      · simp [hx]
      · simp only [List.mem_cons]
        rcases hx with h | h
        · exact Or.inl h
        · exact Or.inr (ih h)

theorem insert_contains (x : Nat) (xs : List Nat) (hx : x ≠ 0) : x ∈ insertPile x xs := by
  induction xs with
  | nil => simp [insertPile, hx]
  | cons a xs ih =>
    simp only [insertPile, hx, ↓reduceIte]
    split
    · simp
    · simp [ih]

theorem normalize_contains (x : Nat) (xs : List Nat) (hx : x ∈ xs) (hx0 : x ≠ 0) :
    x ∈ normalize xs := by
  induction xs with
  | nil => simp at hx
  | cons a xs ih =>
    simp only [List.mem_cons] at hx
    simp only [normalize]
    rcases hx with h | h
    · subst a
      exact insert_contains x _ hx0
    · exact insert_preserves x a _ (ih h)

theorem step_contains_survivor (b j : Nat) (xs : List Nat) (hj : j ∈ xs) (h : b < j) :
    j-b ∈ step b xs := by
  have hn : j-b ≠ 0 := by omega
  have hm : j-b ∈ xs.map (fun x => x-b) := List.mem_map.mpr ⟨j,hj,rfl⟩
  exact insert_preserves _ _ _ (normalize_contains _ _ hm hn)

theorem member_le_sum (x : Nat) (xs : List Nat) (h : x ∈ xs) : x ≤ xs.sum := by
  induction xs with
  | nil => simp at h
  | cons a xs ih =>
    simp only [List.mem_cons] at h
    simp only [List.sum_cons]
    rcases h with h | h
    · omega
    · have := ih h; omega

theorem two_members_le_sum (x y : Nat) (xs : List Nat) (hne : x ≠ y)
    (hx : x ∈ xs) (hy : y ∈ xs) : x+y ≤ xs.sum := by
  induction xs with
  | nil => simp at hx
  | cons a xs ih =>
    simp only [List.mem_cons] at hx hy
    simp only [List.sum_cons]
    rcases hx with hx | hx
    · subst a
      rcases hy with hy | hy
      · exact False.elim (hne hy.symm)
      · have := member_le_sum y xs hy; omega
    · rcases hy with hy | hy
      · subst a
        have := member_le_sum x xs hx; omega
      · have := ih hx hy; omega

theorem stable_top_bound (n j : Nat) (hn : 5 ≤ n) (xs : List Nat)
    (hstable : step (b n) xs = xs) (hmass : xs.sum ≤ n) (hj : j ∈ xs) : j ≤ h n := by
  by_cases htop : j ≤ h n
  · exact htop
  ·
    have hlarge : h n < j := by omega
    have hb : 0 < b n := by simp [b]
    have hh : b n < h n := by simp [h,b]; omega
    have hs : j-b n ∈ xs := by
      have h := step_contains_survivor (b n) j xs hj (by omega)
      simpa [hstable] using h
    have hne : j ≠ j-b n := by omega
    have hsum := two_members_le_sum j (j-b n) xs hne hj hs
    have hbound := larger_top_exceeds n j hn hlarge
    omega
#print axioms stable_top_bound
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem insert_zero (xs : List Nat) : insertPile 0 xs = xs := by
  cases xs <;> rfl

theorem normalize_sub_small (b : Nat) (xs : List Nat) (h : ∀ x ∈ xs, x ≤ b) :
    normalize (xs.map (fun x => x-b)) = [] := by
  induction xs with
  | nil => rfl
  | cons a xs ih =>
    have ha : a ≤ b := h a (by simp)
    have ht : ∀ x ∈ xs, x ≤ b := by intro x hx; exact h x (by simp [hx])
    simp [normalize, Nat.sub_eq_zero_of_le ha, ih ht, insert_zero]

theorem normalize_sub_shape (b : Nat) (xs : List Nat) (h : xs.sum < 2*b) :
    ∃ k, normalize (xs.map (fun x => x-b)) = if k = 0 then [] else [k] := by
  induction xs with
  | nil => exact ⟨0, rfl⟩
  | cons a xs ih =>
    have htail : xs.sum < 2*b := by simp only [List.sum_cons] at h; omega
    by_cases ha : a ≤ b
    · obtain ⟨k,hk⟩ := ih htail
      refine ⟨k, ?_⟩
      simpa [normalize, Nat.sub_eq_zero_of_le ha, insert_zero] using hk
    · have hsmall : ∀ x ∈ xs, x ≤ b := by
        intro x hx
        have hxsum := member_le_sum x xs hx
        simp only [List.sum_cons] at h
        omega
      have ht := normalize_sub_small b xs hsmall
      refine ⟨a-b, ?_⟩
      simp [normalize, ht, insertPile]
#print axioms normalize_sub_shape
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem insert_sum (x : Nat) (xs : List Nat) : (insertPile x xs).sum = x + xs.sum := by
  induction xs with
  | nil => simp [insertPile]; split <;> simp_all [List.count_cons]
  | cons a xs ih =>
    simp only [insertPile]
    split
    · simp_all
    · split <;> simp_all <;> omega

theorem insert_source (x a : Nat) (xs : List Nat) (hx : x ∈ insertPile a xs) : x = a ∨ x ∈ xs := by
  induction xs with
  | nil =>
    simp only [insertPile] at hx
    split at hx <;> simp_all
  | cons z xs ih =>
    simp only [insertPile] at hx
    split at hx
    · exact Or.inr hx
    · split at hx
      · simp only [List.mem_cons] at hx ⊢
        rcases hx with hx | hx | hx <;> simp_all
      · simp only [List.mem_cons] at hx ⊢
        rcases hx with hx | hx
        · exact Or.inr (Or.inl hx)
        · rcases ih hx with hx | hx
          · exact Or.inl hx
          · exact Or.inr (Or.inr hx)

theorem normalize_source (x : Nat) (xs : List Nat) (hx : x ∈ normalize xs) : x ∈ xs := by
  induction xs with
  | nil => simp [normalize] at hx
  | cons a xs ih =>
    simp only [normalize] at hx
    rcases insert_source x a _ hx with h | h
    · simp [h]
    · simp [ih h]

theorem stable_mass_maximal (n : Nat) (hn : 5 ≤ n) (xs : List Nat)
    (hstable : step (b n) xs = xs) (hmass : xs.sum ≤ n) :
    xs.sum ≤ h n + (h n-b n) := by
  let b' := b n
  let t := (xs.map (fun x => min b' x)).sum
  let rest := normalize (xs.map (fun x => x-b'))
  have h2 : n < 2*b' := by simp [b',b]; omega
  have hshape := normalize_sub_shape b' xs (by omega)
  change ∃ k, rest = if k = 0 then [] else [k] at hshape
  obtain ⟨k,hk⟩ := hshape
  have ht : t ≤ h n := by
    by_cases hz : t = 0
    · simp [hz]
    · have hmem : t ∈ xs := by
        have hh : t ∈ insertPile t rest := insert_contains t rest hz
        change t ∈ step b' xs at hh
        simpa [b', hstable] using hh
      exact stable_top_bound n t hn xs hstable hmass hmem
  have hrest : rest.sum ≤ h n-b' := by
    by_cases hk0 : k = 0
    · simp [hk, hk0]
    · have hkmem : k ∈ rest := by simp [hk, hk0]
      have hsource := normalize_source k (xs.map (fun x => x-b')) hkmem
      obtain ⟨j, hj, hjk⟩ := List.mem_map.mp hsource
      have hjtop := stable_top_bound n j hn xs hstable hmass hj
      have hkle : k ≤ h n-b' := by omega
      simpa [hk, hk0] using hkle
  have hsum : xs.sum = t + rest.sum := by
    have hh := congrArg List.sum hstable
    change (insertPile t rest).sum = xs.sum at hh
    rw [insert_sum] at hh
    exact hh.symm
  rw [hsum]
  omega
#print axioms stable_mass_maximal
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem stable_mass_unique (n : Nat) (hn : 5 ≤ n) (xs : List Nat)
    (hstable : step (b n) xs = xs) (hmass : xs.sum = h n + (h n-b n)) :
    xs = [h n,h n-b n] := by
  let b' := b n
  let t := (xs.map (fun x => min b' x)).sum
  let rest := normalize (xs.map (fun x => x-b'))
  have hle : xs.sum ≤ n := by rw [hmass]; exact (stable_mass_bounds n hn).2.1
  have h2 : n < 2*b' := by simp [b',b]; omega
  have ⟨k,hk⟩ := normalize_sub_shape b' xs (by omega)
  change rest = if k = 0 then [] else [k] at hk
  have ht : t ≤ h n := by
    by_cases hz : t = 0
    · simp [hz]
    · have hmem : t ∈ xs := by
        have hh : t ∈ insertPile t rest := insert_contains t rest hz
        change t ∈ step b' xs at hh
        simpa [b', hstable] using hh
      exact stable_top_bound n t hn xs hstable hle hmem
  have hrest : rest.sum ≤ h n-b' := by
    by_cases hk0 : k = 0
    · simp [hk, hk0]
    · have hkmem : k ∈ rest := by simp [hk, hk0]
      have hsource := normalize_source k (xs.map (fun x => x-b')) hkmem
      obtain ⟨j, hj, hjk⟩ := List.mem_map.mp hsource
      have hjtop := stable_top_bound n j hn xs hstable hle hj
      have hkle : k ≤ h n-b' := by omega
      simpa [hk, hk0] using hkle
  have hsum : xs.sum = t + rest.sum := by
    have hh := congrArg List.sum hstable
    change (insertPile t rest).sum = xs.sum at hh
    rw [insert_sum] at hh
    exact hh.symm
  have hb : b n < h n := by simp [h,b]; omega
  have hpos : 0 < h n-b n := by omega
  have teq : t = h n := by omega
  have rests : rest.sum = h n-b n := by omega
  have k0 : k ≠ 0 := by
    intro he
    simp [hk, he] at rests
    omega
  have keq : k = h n-b n := by simpa [hk,k0] using rests
  have rest_eq : rest = [h n-b n] := by simpa [k0,keq, Nat.ne_of_gt hpos] using hk
  have heq : insertPile t rest = xs := by
    change step (b n) xs = xs
    exact hstable
  rw [teq, rest_eq] at heq
  have htop : h n-b n ≤ h n := by omega
  have hnzero : h n ≠ 0 := by omega
  simp [insertPile, htop, hnzero] at heq
  exact heq.symm
#print axioms stable_mass_unique
end SolitaireCounterexample

namespace SolitaireCounterexample

def mass (n : Nat) : Nat := h n + (h n-b n)

theorem stable_ratio_error (n : Nat) (hn : 5 ≤ n) :
    3*mass n ≤ 4*h n + 6 ∧ 4*h n ≤ 3*mass n + 6 := by
  simp [mass,h,b]
  omega
#print axioms stable_ratio_error
end SolitaireCounterexample

namespace SolitaireCounterexample

-- Zero-based index i represents the (i+1)th layer above the bottom.
def pickedLayers (cutoff size : Nat) : Nat :=
  ((List.range size).filter (fun i => i < cutoff)).length

theorem pickedLayers_eq_min (cutoff size : Nat) : pickedLayers cutoff size = min cutoff size := by
  induction size with
  | zero => simp [pickedLayers]
  | succ size ih =>
    by_cases ht : size < cutoff
    · simp [pickedLayers, List.range_succ, ht] at ih ⊢
      omega
    · simp [pickedLayers, List.range_succ, ht] at ih ⊢
      omega

def layerStep (cutoff : Nat) (piles : List Nat) : List Nat :=
  insertPile ((piles.map (pickedLayers cutoff)).sum)
    (normalize (piles.map (fun size => size - pickedLayers cutoff size)))

theorem layerStep_eq_step (cutoff : Nat) (piles : List Nat) : layerStep cutoff piles = step cutoff piles := by
  have hp : pickedLayers cutoff = fun x => min cutoff x := by
    funext x; exact pickedLayers_eq_min cutoff x
  have hs : ∀ x, x - min cutoff x = x-cutoff := by intro x; omega
  simp [layerStep, step, hp, hs]
#print axioms pickedLayers_eq_min
#print axioms layerStep_eq_step
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem insert_sorted (x : Nat) (xs : List Nat) (hs : xs.Pairwise (· ≥ ·)) :
    (insertPile x xs).Pairwise (· ≥ ·) := by
  induction xs with
  | nil => simp [insertPile]; split <;> simp
  | cons a xs ih =>
    have ⟨ha, ht⟩ := List.pairwise_cons.mp hs
    simp only [insertPile]
    split
    · exact hs
    · split
      · apply List.pairwise_cons.mpr
        constructor
        · intro y hy
          simp only [List.mem_cons] at hy
          rcases hy with rfl | hy
          · assumption
          · have := ha y hy; omega
        · exact hs
      · apply List.pairwise_cons.mpr
        constructor
        · intro y hy
          rcases insert_source y x xs hy with hy | hy
          · subst y; omega
          · exact ha y hy
        · exact ih ht

theorem normalize_sorted (xs : List Nat) : (normalize xs).Pairwise (· ≥ ·) := by
  induction xs with
  | nil => simp [normalize]
  | cons a xs ih => exact insert_sorted a _ ih

theorem insert_positive (x : Nat) (xs : List Nat) (hs : ∀ y ∈ xs, 0 < y) :
    ∀ y ∈ insertPile x xs, 0 < y := by
  intro y hy
  rcases insert_source y x xs hy with hy | hy
  · subst y
    by_cases hx : x = 0
    · subst x
      rw [insert_zero] at hy
      exact hs 0 hy
    · exact Nat.pos_of_ne_zero hx
  · exact hs y hy

theorem normalize_positive (xs : List Nat) : ∀ y ∈ normalize xs, 0 < y := by
  induction xs with
  | nil => simp [normalize]
  | cons a xs ih => exact insert_positive a _ ih
#print axioms normalize_sorted
#print axioms normalize_positive
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem insert_count (x y : Nat) (xs : List Nat) :
    (insertPile x xs).count y = xs.count y + (if x ≠ 0 ∧ x = y then 1 else 0) := by
  induction xs with
  | nil =>
    simp only [insertPile, List.count_nil, Nat.zero_add]
    split <;> simp_all [List.count_cons]
  | cons a xs ih =>
    simp only [insertPile]
    split
    · simp_all
    · split <;> simp_all [List.count_cons] <;> omega

theorem normalize_count (y : Nat) (ys : List Nat) (hy : y ≠ 0) :
    (normalize ys).count y = ys.count y := by
  induction ys with
  | nil => rfl
  | cons a ys ih =>
    simp only [normalize, insert_count, ih, List.count_cons]
    by_cases ha : a = y <;> simp_all <;> omega
#print axioms normalize_count
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem map_min_self (b : Nat) (xs : List Nat) (h : ∀ x ∈ xs, x ≤ b) :
    xs.map (fun x => min b x) = xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih =>
    have ha : a ≤ b := h a (by simp)
    have ht : ∀ x ∈ xs, x ≤ b := by intro x hx; exact h x (by simp [hx])
    simp [Nat.min_eq_right ha, ih ht]

theorem full_pick_fixed_unique (n : Nat) (hn : 0 < n) (xs : List Nat)
    (hfix : step n xs = xs) (hmass : xs.sum = n) : xs = [n] := by
  have hsmall : ∀ x ∈ xs, x ≤ n := by
    intro x hx
    have := member_le_sum x xs hx
    omega
  have hrest := normalize_sub_small n xs hsmall
  have hpick := map_min_self n xs hsmall
  unfold step at hfix
  rw [hpick, hrest, hmass] at hfix
  simpa [insertPile, Nat.ne_of_gt hn] using hfix.symm
#print axioms full_pick_fixed_unique
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem layerStep_sorted (cutoff : Nat) (piles : List Nat) :
    (layerStep cutoff piles).Pairwise (· ≥ ·) := by
  exact insert_sorted _ _ (normalize_sorted _)

theorem layerStep_positive (cutoff : Nat) (piles : List Nat) :
    ∀ y ∈ layerStep cutoff piles, 0 < y := by
  exact insert_positive _ _ (normalize_positive _)

theorem layerStep_counts (cutoff : Nat) (piles : List Nat) (value : Nat) (hv : value ≠ 0) :
    (layerStep cutoff piles).count value =
      (piles.map (fun size => size - pickedLayers cutoff size)).count value +
      (if (piles.map (pickedLayers cutoff)).sum ≠ 0 ∧
          (piles.map (pickedLayers cutoff)).sum = value then 1 else 0) := by
  rw [layerStep, insert_count, normalize_count _ _ hv]
#print axioms layerStep_sorted
#print axioms layerStep_positive
#print axioms layerStep_counts
end SolitaireCounterexample
