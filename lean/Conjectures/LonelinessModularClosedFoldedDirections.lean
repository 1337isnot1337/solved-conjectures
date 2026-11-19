import Conjectures.LonelinessModularClosedFoldedSearch
import Conjectures.LonelinessModularClosedShortVector
import Conjectures.LonelinessModularSearchDirections
import Conjectures.LonelinessModularPlaneGap
import Mathlib.Data.List.FinRange

/-! Short-direction leaves for closed-threshold folded searches. Primitive
recovery justifies candidate, zero-coordinate, and repeated-coordinate leaves.
The ten-speed wrapper derives its plane gap from an explicit nine-speed
runner bound; finite root coverage and checked trees remain inputs. -/

namespace Loneliness.Modular.FoldedSearch.Closed

open Loneliness.SubspaceDensity

/-- Center a residue without choosing or certifying a sign bit. -/
def centered (m r : ℕ) : ℤ :=
  if r%m ≤ m-r%m then ((r%m : ℕ) : ℤ) else -((m-r%m : ℕ) : ℤ)

theorem centered_natAbs (m r : ℕ) : (centered m r).natAbs = folded m r := by
  unfold centered folded
  split_ifs with h
  · simp only [Int.natAbs_natCast, Nat.min_eq_left h]
  · simp only [Int.natAbs_neg, Int.natAbs_natCast,
      Nat.min_eq_right (by omega : m-r%m ≤ r%m)]

theorem centered_congr (m r : ℕ) (hm : 0 < m) :
    (m : ℤ) ∣ centered m r-(r : ℤ) := by
  have hres : (m : ℤ) ∣ ((r%m : ℕ) : ℤ)-(r : ℤ) :=
    Int.dvd_sub_self_of_emod_eq rfl
  unfold centered
  split_ifs with h
  · exact hres
  · have hle : r%m ≤ m := (Nat.mod_lt r hm).le
    rw [Nat.cast_sub hle]
    convert dvd_sub hres (dvd_refl (m : ℤ)) using 1
    ring

/-- A short folded multiple determines the ordered primitive speed vector.
The bound on the line is closed, and the shortness inequality is strict. -/
theorem recover_folded_primitive_vector_of_le {n : ℕ}
    (v : Fin (n+1) → ℕ) (hp : Search.Primitive v)
    (m a b : ℕ) (hm : 0 < m) (hunit : (a*b)%m = 1%m)
    (x : Fin (n+1) → ℕ) (hrep : ∀ i, folded m (a*v i) = x i)
    (t R : ℕ) (ht : 0 < t) (htm : t < m)
    (hbound : ∀ i, folded m (t*x i) ≤ R)
    (threshold gap : ℝ) (hshort : (R : ℝ)/(2*m) < gap-threshold)
    (hbelow : value (List.ofFn v) ≤ threshold) (hgap : Search.PlaneGap gap v) :
    Normalization.normalize (List.ofFn (fun i => folded m (t*x i))) =
      List.ofFn v := by
  let A := (t*a)%m
  have hApos : 0 < A := by
    have h := folded_unit_pos hm hunit ht htm
    unfold folded at h
    dsimp [A]
    rw [Nat.mul_comm a t] at h
    omega
  have hAm : A < m := Nat.mod_lt _ hm
  let w : Fin (n+1) → ℤ := fun i => centered m (A*v i)
  have hwabs (i : Fin (n+1)) : (w i).natAbs = folded m (t*x i) := by
    change (centered m (A*v i)).natAbs = _
    rw [centered_natAbs]
    calc
      folded m (A*v i) = folded m ((t*a)*v i) := by
        apply folded_eq_of_mod_eq
        simp only [A, Nat.mul_mod, Nat.mod_mod]
      _ = folded m (t*(a*v i)) := by rw [Nat.mul_assoc]
      _ = folded m (t*x i) := by
        rw [← hrep i, folded_mul_folded m (a*v i) t hm]
  have hcong (i : Fin (n+1)) : (m : ℤ) ∣ w i-(A : ℤ)*(v i : ℤ) := by
    simpa only [Nat.cast_mul] using centered_congr m (A*v i) hm
  have hboundR (i : Fin (n+1)) : |(w i : ℝ)| ≤ (R : ℝ) := by
    have hn : (w i).natAbs ≤ R := by rw [hwabs]; exact hbound i
    have hR : ((w i).natAbs : ℝ) ≤ (R : ℝ) := by exact_mod_cast hn
    simpa only [Nat.cast_natAbs, Int.cast_abs] using hR
  have hvalue : spaceValue (integerLine (fun i => (v i : ℤ))) =
      value (List.ofFn v) := by
    have he : integerVector (fun i => (v i : ℤ)) = (fun i => (v i : ℝ)) := by
      funext i
      rfl
    change spaceValue (Submodule.span ℝ {integerVector (fun i => (v i : ℤ))}) = _
    rw [he]
    exact spaceValue_speed_line v
  have hline : integerVector w ∈ integerLine (fun i => (v i : ℤ)) := by
    apply short_congruent_vector_mem_line_of_le (fun i => (v i : ℤ)) w
      (A : ℤ) (m : ℤ) (by exact_mod_cast hm) hcong
      (R : ℝ) threshold gap hboundR
    · rwa [hvalue]
    · simpa using hshort
    · exact hgap
  have hp' : Normalization.gcd (absoluteSpeeds (fun i => (v i : ℤ))) = 1 := by
    simpa only [Search.Primitive, absoluteSpeeds, Int.natAbs_natCast] using hp
  have hw : w ≠ 0 := congruent_primitive_vector_ne_zero (fun i => (v i : ℤ)) w
    (A : ℤ) (m : ℤ) (by exact_mod_cast hApos) (by exact_mod_cast hAm) hp' hcong
  have hrecover := recover_primitive_direction v w hp hw hline
  have habs : absoluteSpeeds w = List.ofFn (fun i => folded m (t*x i)) := by
    simp only [absoluteSpeeds, hwabs]
  rwa [habs] at hrecover

structure DirectionLeaf where
  time : ℕ
  radius : ℕ
  direction : List ℕ

def DirectionLeaf.Valid {n : ℕ} (leaf : DirectionLeaf) (num den m : ℕ)
    (gap : ℚ) (candidates : List (List ℕ)) (x : Fin n → ℕ) : Prop :=
  0 < leaf.time ∧ leaf.time < m ∧
    (∀ i, folded m (leaf.time*x i) ≤ leaf.radius) ∧
    (leaf.radius : ℚ)/(2*m) < gap-(num : ℚ)/den ∧
    leaf.direction ∈ candidates ∧
    (Normalization.normalize (List.ofFn (fun i => folded m (leaf.time*x i)))).Perm
      leaf.direction

instance {n : ℕ} (leaf : DirectionLeaf) (num den m : ℕ)
    (gap : ℚ) (candidates : List (List ℕ)) (x : Fin n → ℕ) :
    Decidable (leaf.Valid num den m gap candidates x) :=
  inferInstanceAs (Decidable (_ ∧ _ ∧ _ ∧ _ ∧ _ ∧ _))

def directionTerminal {n : ℕ} (num den : ℕ) (gap : ℚ)
    (candidates : List (List ℕ)) (leaves : ℕ → DirectionLeaf)
    (m : ℕ) (x : Fin n → ℕ) (index : ℕ) : Bool :=
  decide ((leaves index).Valid num den m gap candidates x)

theorem direction_leaf_sound {n num den m : ℕ} (hm : 0 < m)
    (gap : ℚ) (candidates : List (List ℕ)) (leaf : DirectionLeaf)
    (x v : Fin (n+1) → ℕ) (hvalid : leaf.Valid num den m gap candidates x)
    (hrep : Represents m x v) (hp : Search.Primitive v)
    (hlow : value (List.ofFn v) ≤ (num : ℝ)/den)
    (hgap : Search.PlaneGap (gap : ℝ) v) :
    ∃ ds ∈ candidates, (List.ofFn v).Perm ds := by
  obtain ⟨ht, htm, hbound, hshort, hmember, hperm⟩ := hvalid
  obtain ⟨a, b, hunit, hrep⟩ := hrep
  have hshortR : (leaf.radius : ℝ)/(2*m) < (gap : ℝ)-(num : ℝ)/den := by
    have hh := (Rat.cast_lt (K := ℝ)).mpr hshort
    push_cast at hh
    exact hh
  have hrecover := recover_folded_primitive_vector_of_le v hp m a b hm hunit x hrep
    leaf.time leaf.radius ht htm hbound ((num : ℝ)/den) (gap : ℝ)
    hshortR hlow hgap
  rw [hrecover] at hperm
  exact ⟨leaf.direction, hmember, hperm⟩

theorem directionTerminal_sound {n num den : ℕ} (gap : ℚ)
    (candidates : List (List ℕ)) (leaves : ℕ → DirectionLeaf)
    (admissible : (Fin (n+1) → ℕ) → Prop)
    (hgap : ∀ v, admissible v → Search.PlaneGap (gap : ℝ) v) :
    TerminalSound num den (directionTerminal num den gap candidates leaves) admissible
      (fun v => ∃ ds ∈ candidates, (List.ofFn v).Perm ds) := by
  intro m x index hm hcheck v hrep hp hadm hlow
  exact direction_leaf_sound (by omega : 0 < m) gap candidates (leaves index) x v
    (of_decide_eq_true hcheck) hrep hp hlow (hgap v hadm)

/-- The producer may also stop on a short vector whose absolute coordinates
contain zero or a repetition. Such a vector cannot recover a distinct,
positive actual tuple. The candidate branch avoids executable sorting. -/
def DirectionLeaf.Prunes {n : ℕ} (leaf : DirectionLeaf) (num den m : ℕ)
    (gap : ℚ) (candidates : List (List ℕ)) (x : Fin n → ℕ) : Prop :=
  0 < leaf.time ∧ leaf.time < m ∧
    (∀ i, folded m (leaf.time*x i) ≤ leaf.radius) ∧
    (leaf.radius : ℚ)/(2*m) < gap-(num : ℚ)/den ∧
    ((∃ i, folded m (leaf.time*x i) = 0) ∨
      (∃ i j, i≠j ∧ folded m (leaf.time*x i) = folded m (leaf.time*x j)) ∨
      (leaf.direction ∈ candidates ∧
        (Normalization.normalize (List.ofFn (fun i => folded m (leaf.time*x i)))).Perm
          leaf.direction))

instance {n : ℕ} (leaf : DirectionLeaf) (num den m : ℕ)
    (gap : ℚ) (candidates : List (List ℕ)) (x : Fin n → ℕ) :
    Decidable (leaf.Prunes num den m gap candidates x) :=
  inferInstanceAs (Decidable (_ ∧ _ ∧ _ ∧ _ ∧ _))

def pruningTerminal {n : ℕ} (num den : ℕ) (gap : ℚ)
    (candidates : List (List ℕ)) (leaves : ℕ → DirectionLeaf)
    (m : ℕ) (x : Fin n → ℕ) (index : ℕ) : Bool :=
  decide ((leaves index).Prunes num den m gap candidates x)

theorem pruning_leaf_sound {n num den m : ℕ} (hm : 0 < m)
    (gap : ℚ) (candidates : List (List ℕ)) (leaf : DirectionLeaf)
    (x v : Fin (n+1) → ℕ) (hvalid : leaf.Prunes num den m gap candidates x)
    (hrep : Represents m x v) (hp : Search.Primitive v)
    (hpositive : ∀ i, 0 < v i) (hinjective : Function.Injective v)
    (hlow : value (List.ofFn v) ≤ (num : ℝ)/den)
    (hgap : Search.PlaneGap (gap : ℝ) v) :
    ∃ ds ∈ candidates, (List.ofFn v).Perm ds := by
  obtain ⟨ht, htm, hbound, hshort, hresult⟩ := hvalid
  obtain ⟨a, b, hunit, hrep⟩ := hrep
  have hshortR : (leaf.radius : ℝ)/(2*m) < (gap : ℝ)-(num : ℝ)/den := by
    have hh := (Rat.cast_lt (K := ℝ)).mpr hshort
    push_cast at hh
    exact hh
  have hrecover := recover_folded_primitive_vector_of_le v hp m a b hm hunit x hrep
    leaf.time leaf.radius ht htm hbound ((num : ℝ)/den) (gap : ℝ)
    hshortR hlow hgap
  have hcoords (i : Fin (n+1)) : folded m (leaf.time*x i)/
      Normalization.gcd (List.ofFn (fun j => folded m (leaf.time*x j))) = v i := by
    have h := hrecover
    unfold Normalization.normalize at h
    rw [List.map_ofFn] at h
    exact congrFun (List.ofFn_injective h) i
  rcases hresult with hzero | hrepeat | hmember
  · obtain ⟨i, hi⟩ := hzero
    have hc := hcoords i
    simp only [hi, Nat.zero_div] at hc
    have hpv := hpositive i
    omega
  · obtain ⟨i, j, hne, heq⟩ := hrepeat
    apply False.elim
    apply hne
    apply hinjective
    rw [← hcoords i, ← hcoords j, heq]
  · rw [hrecover] at hmember
    exact ⟨leaf.direction, hmember.1, hmember.2⟩

theorem pruningTerminal_sound {n num den : ℕ} (gap : ℚ)
    (candidates : List (List ℕ)) (leaves : ℕ → DirectionLeaf)
    (admissible : (Fin (n+1) → ℕ) → Prop)
    (hpositive : ∀ v, admissible v → ∀ i, 0 < v i)
    (hinjective : ∀ v, admissible v → Function.Injective v)
    (hgap : ∀ v, admissible v → Search.PlaneGap (gap : ℝ) v) :
    TerminalSound num den (pruningTerminal num den gap candidates leaves) admissible
      (fun v => ∃ ds ∈ candidates, (List.ofFn v).Perm ds) := by
  intro m x index hm hcheck v hrep hp hadm hlow
  exact pruning_leaf_sound (by omega : 0 < m) gap candidates (leaves index) x v
    (of_decide_eq_true hcheck) hrep hp (hpositive v hadm) (hinjective v hadm)
    hlow (hgap v hadm)

def tenConsecutive : List ℕ := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

/-- Conditional interpretation of a ten-speed binary trace. The two
unproved geometric inputs are displayed in the theorem: the nine-speed
runner bound used by parity, and the plane gap through the actual tuple.
Initial prime-level residue coverage is a separate obligation. -/
theorem checked_ten_speed_consecutive_of_plane_gap
    (hLRC : CoordinateSubspace.LonelyRunnerBound 9)
    (leaves : ℕ → DirectionLeaf) (m : ℕ) (hm : 1 < m) (x : Fin 10 → ℕ)
    (tree : Tree 10)
    (hcheck : check 1 11 (directionTerminal 1 11 (1/10) [tenConsecutive] leaves)
      tree m x = true)
    (v : Fin 10 → ℕ) (hrep : Represents m x v) (hp : Search.Primitive v)
    (hpositive : ∀ i, 0 < v i) (hnodup : (List.ofFn v).Nodup)
    (hlow : value (List.ofFn v) ≤ (1/11 : ℝ))
    (hgap : Search.PlaneGap (1/10 : ℝ) v) :
    (List.ofFn v).Perm tenConsecutive := by
  let admissible : (Fin 10 → ℕ) → Prop := fun w =>
    (∀ i, 0 < w i) ∧ (List.ofFn w).Nodup ∧ Search.PlaneGap (1/10 : ℝ) w
  have hterminal := directionTerminal_sound (num := 1) (den := 11)
    (1/10) [tenConsecutive] leaves admissible (by
      intro w hw
      simpa only [Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using hw.2.2)
  have honeOdd := ten_speed_oneOddSound hLRC admissible
    (fun _ hw => hw.1) (fun _ hw => hw.2.1)
  obtain ⟨ds, hmem, hperm⟩ := check_sound (by decide : 0 < 11)
    (by decide : 2*1 < 11) _ admissible _ hterminal honeOdd
    tree m x hm hcheck v hrep hp ⟨hpositive, hnodup, hgap⟩ (by simpa using hlow)
  have he : ds = tenConsecutive := List.mem_singleton.mp hmem
  rwa [he] at hperm

/-- The geometric plane bound follows from the same nine-speed runner
hypothesis already used for parity. A checked tree and root representation
remain explicit inputs. -/
theorem checked_ten_speed_consecutive
    (hLRC : CoordinateSubspace.LonelyRunnerBound 9)
    (leaves : ℕ → DirectionLeaf) (m : ℕ) (hm : 1 < m) (x : Fin 10 → ℕ)
    (tree : Tree 10)
    (hcheck : check 1 11 (directionTerminal 1 11 (1/10) [tenConsecutive] leaves)
      tree m x = true)
    (v : Fin 10 → ℕ) (hrep : Represents m x v) (hp : Search.Primitive v)
    (hpositive : ∀ i, 0 < v i) (hnodup : (List.ofFn v).Nodup)
    (hlow : value (List.ofFn v) ≤ (1/11 : ℝ)) :
    (List.ofFn v).Perm tenConsecutive := by
  apply checked_ten_speed_consecutive_of_plane_gap hLRC leaves m hm x tree hcheck
    v hrep hp hpositive hnodup hlow
  exact PlaneGeometry.ten_speed_plane_gap hLRC v hpositive

/-- The same conditional endpoint with zero-coordinate and repeated-coordinate
short-vector pruning, matching the deletion rules of the binary producer. -/
theorem checked_ten_speed_pruning_consecutive
    (hLRC : CoordinateSubspace.LonelyRunnerBound 9)
    (leaves : ℕ → DirectionLeaf) (m : ℕ) (hm : 1 < m) (x : Fin 10 → ℕ)
    (tree : Tree 10)
    (hcheck : check 1 11 (pruningTerminal 1 11 (1/10) [tenConsecutive] leaves)
      tree m x = true)
    (v : Fin 10 → ℕ) (hrep : Represents m x v) (hp : Search.Primitive v)
    (hpositive : ∀ i, 0 < v i) (hnodup : (List.ofFn v).Nodup)
    (hlow : value (List.ofFn v) ≤ (1/11 : ℝ)) :
    (List.ofFn v).Perm tenConsecutive := by
  let admissible : (Fin 10 → ℕ) → Prop := fun w =>
    (∀ i, 0 < w i) ∧ (List.ofFn w).Nodup
  have hterminal := pruningTerminal_sound (num := 1) (den := 11)
    (1/10) [tenConsecutive] leaves admissible
    (fun _ hw => hw.1) (fun _ hw => List.nodup_ofFn.mp hw.2) (by
      intro w hw z hz
      simpa only [Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using
        PlaneGeometry.ten_speed_plane_gap hLRC w hw.1 z hz)
  have honeOdd := ten_speed_oneOddSound hLRC admissible
    (fun _ hw => hw.1) (fun _ hw => hw.2)
  obtain ⟨ds, hmem, hperm⟩ := check_sound (by decide : 0 < 11)
    (by decide : 2*1 < 11) _ admissible _ hterminal honeOdd
    tree m x hm hcheck v hrep hp ⟨hpositive, hnodup⟩ (by simpa using hlow)
  have he : ds = tenConsecutive := List.mem_singleton.mp hmem
  rwa [he] at hperm

end Loneliness.Modular.FoldedSearch.Closed
