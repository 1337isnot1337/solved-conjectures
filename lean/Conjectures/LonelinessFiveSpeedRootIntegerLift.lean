import Conjectures.LonelinessFiveSpeedRootInteger134

/-! The generic 111-factor integer lift. Concrete prime data and complete
modular root covers remain explicit inputs. The coordinate bound is the
only size hypothesis; primitivity is not needed by this argument. -/

namespace Loneliness.FiveSpeedRoot

open Matrix
open scoped BigOperators
open Loneliness.Modular
open Loneliness.FiveSpeedCertificate

def rootBasicFactors (v : Speeds) : List ℤ :=
  List.ofFn (fun i : Fin 5 => (v i : ℤ)) ++
    (List.ofFn (fun i : Fin 5 => i)).flatMap (fun i =>
      (List.ofFn (fun j : Fin 5 => j)).flatMap (fun j =>
        if i < j then [(v i : ℤ) - (v j : ℤ), (v i : ℤ) + (v j : ℤ)] else []))

theorem rootBasicFactors_length (v : Speeds) : (rootBasicFactors v).length = 25 := by
  rfl

theorem rootBasicFactors_speed_mem (v : Speeds) (i : Fin 5) :
    (v i : ℤ) ∈ rootBasicFactors v := by
  exact List.mem_append.mpr (Or.inl (List.mem_ofFn.mpr ⟨i, rfl⟩))

theorem rootBasicFactors_sub_mem (v : Speeds) (i j : Fin 5) (hij : i < j) :
    (v i : ℤ) - (v j : ℤ) ∈ rootBasicFactors v := by
  apply List.mem_append.mpr
  right
  apply List.mem_flatMap.mpr
  refine ⟨i, List.mem_ofFn.mpr ⟨i, rfl⟩, ?_⟩
  apply List.mem_flatMap.mpr
  exact ⟨j, List.mem_ofFn.mpr ⟨j, rfl⟩, by simp [hij]⟩

theorem rootBasicFactors_add_mem (v : Speeds) (i j : Fin 5) (hij : i < j) :
    (v i : ℤ) + (v j : ℤ) ∈ rootBasicFactors v := by
  apply List.mem_append.mpr
  right
  apply List.mem_flatMap.mpr
  refine ⟨i, List.mem_ofFn.mpr ⟨i, rfl⟩, ?_⟩
  apply List.mem_flatMap.mpr
  exact ⟨j, List.mem_ofFn.mpr ⟨j, rfl⟩, by simp [hij]⟩

theorem rootBasicFactors_bound (v : Speeds) (C : ℕ) (hv : ∀ i, v i ≤ C)
    (z : ℤ) (hz : z ∈ rootBasicFactors v) : z.natAbs ≤ 4 * C := by
  rcases List.mem_append.mp hz with hz | hz
  · obtain ⟨i, rfl⟩ := List.mem_ofFn.mp hz
    rw [Int.natAbs_natCast]
    have hi := hv i
    omega
  · obtain ⟨i, _, hz⟩ := List.mem_flatMap.mp hz
    obtain ⟨j, _, hz⟩ := List.mem_flatMap.mp hz
    by_cases hij : i < j
    · simp only [ite_eq_left hij, List.mem_cons, List.not_mem_nil, or_false] at hz
      have hsum : v i + v j ≤ 4 * C := by
        have hi := hv i
        have hj := hv j
        omega
      rcases hz with rfl | rfl
      · have hle : ((v i : ℤ) - (v j : ℤ)).natAbs ≤ v i + v j := by
          simpa only [Int.natAbs_natCast] using Int.natAbs_sub_le (v i : ℤ) (v j : ℤ)
        exact hle.trans hsum
      · have hle : ((v i : ℤ) + (v j : ℤ)).natAbs ≤ v i + v j := by
          simpa only [Int.natAbs_natCast] using Int.natAbs_add_le (v i : ℤ) (v j : ℤ)
        exact hle.trans hsum
    · simp only [ite_eq_right hij, List.not_mem_nil] at hz

def rootIntegerFactors (v : Speeds) (x y : ℕ) : List ℤ :=
  (rootBasicFactors v ++ List.ofFn (fun a : Fin 80 => dot (formRows a) v)) ++
    List.ofFn (tripleExtraFactors x y)

theorem rootIntegerFactors_length (v : Speeds) (x y : ℕ) :
    (rootIntegerFactors v x y).length = 111 := by
  rfl

theorem rootIntegerFactors_basic_mem (v : Speeds) (x y : ℕ) (z : ℤ)
    (hz : z ∈ rootBasicFactors v) : z ∈ rootIntegerFactors v x y :=
  List.mem_append.mpr (Or.inl (List.mem_append.mpr (Or.inl hz)))

theorem rootIntegerFactors_form_mem (v : Speeds) (x y : ℕ) (a : Fin 80) :
    dot (formRows a) v ∈ rootIntegerFactors v x y :=
  List.mem_append.mpr (Or.inl (List.mem_append.mpr
    (Or.inr (List.mem_ofFn.mpr ⟨a, rfl⟩))))

theorem rootIntegerFactors_extra_mem (v : Speeds) (x y : ℕ) (e : Fin 6) :
    tripleExtraFactors x y e ∈ rootIntegerFactors v x y :=
  List.mem_append.mpr (Or.inr (List.mem_ofFn.mpr ⟨e, rfl⟩))

theorem rootIntegerFactors_bound (v : Speeds) (C : ℕ) (hv : ∀ i, v i ≤ C)
    (x y : ℕ) (hxy : x + y ≤ C) (z : ℤ) (hz : z ∈ rootIntegerFactors v x y) :
    z.natAbs ≤ 4 * C := by
  rcases List.mem_append.mp hz with hz | hz
  · rcases List.mem_append.mp hz with hz | hz
    · exact rootBasicFactors_bound v C hv z hz
    · obtain ⟨a, rfl⟩ := List.mem_ofFn.mp hz
      exact (form_dot_natAbs_le_three_mul a v C hv).trans
        (Nat.mul_le_mul_right C (by decide : 3 ≤ 4))
  · obtain ⟨e, rfl⟩ := List.mem_ofFn.mp hz
    exact tripleExtraFactors_natAbs_le x y C hxy e

theorem exists_root_prime_detecting_zeros (v : Speeds) (C : ℕ) (hC : 0 < C)
    (hv : ∀ i, v i ≤ C) (ps : Finset ℕ) (hprime : ∀ p ∈ ps, p.Prime)
    (hproduct : (4 * C) ^ 111 < ∏ p ∈ ps, p)
    (x y : ℕ) (hxy : x + y ≤ C) :
    ∃ p ∈ ps, ∀ z ∈ rootIntegerFactors v x y, (p : ℤ) ∣ z → z = 0 := by
  apply exists_prime_detecting_zeros ps (rootIntegerFactors v x y) (4 * C)
    (by omega) hprime
  · exact rootIntegerFactors_bound v C hv x y hxy
  · simpa only [rootIntegerFactors_length] using hproduct

theorem basic_detection_avoids_speeds (p : ℕ) (v : Speeds) (hpos : ∀ i, 0 < v i)
    (hbasic : ∀ z ∈ rootBasicFactors v, (p : ℤ) ∣ z → z = 0) :
    ∀ i, ¬(p : ℤ) ∣ (v i : ℤ) := by
  intro i hdiv
  have hz := hbasic (v i : ℤ) (rootBasicFactors_speed_mem v i) hdiv
  have hi : (0 : ℤ) < v i := by exact_mod_cast hpos i
  exact (ne_of_gt hi) hz

theorem root_structural_of_basic_detection (p : ℕ) (hp : 0 < p)
    (hcover : GlobalRootCover p) (v : Speeds)
    (hpos : ∀ i, 0 < v i) (hdistinct : Function.Injective v)
    (hbelow : Loneliness.value (List.ofFn v) < (1 : ℝ) / 5)
    (hbasic : ∀ z ∈ rootBasicFactors v, (p : ℤ) ∣ z → z = 0) :
    TwoShortRelations p v ∨ Folded134 p v := by
  have havoid := basic_detection_avoids_speeds p v hpos hbasic
  have hnz : ¬ZeroCoordinate p v := by
    rintro ⟨i, hdiv⟩
    exact havoid i hdiv
  have hnc : ¬SignedCollision p v := by
    rintro ⟨i, j, hij, hdiv | hdiv⟩
    · have hz := hbasic ((v i : ℤ) - (v j : ℤ)) (rootBasicFactors_sub_mem v i j hij) hdiv
      have heq : v i = v j := by exact_mod_cast (sub_eq_zero.mp hz)
      exact hij.ne (hdistinct heq)
    · have hz := hbasic ((v i : ℤ) + (v j : ℤ)) (rootBasicFactors_add_mem v i j hij) hdiv
      have hi : (0 : ℤ) < v i := by exact_mod_cast hpos i
      have hj : (0 : ℤ) < v j := by exact_mod_cast hpos j
      exact (ne_of_gt (add_pos hi hj)) hz
  exact ((rootOutcome_of_value_lt p hp hcover v hbelow).resolve_left hnz).resolve_left hnc

def IntegerRootOutcome (v : Speeds) : Prop :=
  (∃ a b : Fin 50, a ≠ b ∧
    relationRows a ⬝ᵥ (fun i => (v i : ℤ)) = 0 ∧
    relationRows b ⬝ᵥ (fun i => (v i : ℤ)) = 0) ∨
  (∃ π : Equiv.Perm (Fin 5), special134Relations *ᵥ (fun i => (v (π i) : ℤ)) = 0)

theorem root_integer_relation_lift (v : Speeds) (C : ℕ)
    (hpos : ∀ i, 0 < v i) (hdistinct : Function.Injective v)
    (hbound : ∀ i, v i ≤ C)
    (hbelow : Loneliness.value (List.ofFn v) < (1 : ℝ) / 5)
    (ps : Finset ℕ) (hprime : ∀ p ∈ ps, p.Prime) (hlarge : ∀ p ∈ ps, 7 < p)
    (hcovers : ∀ p ∈ ps, GlobalRootCover p)
    (hproduct : (4 * C) ^ 111 < ∏ p ∈ ps, p) : IntegerRootOutcome v := by
  classical
  have hC : 0 < C := (hpos 0).trans_le (hbound 0)
  by_cases htwo : ∃ a b : Fin 80, a ≠ b ∧
      dot (formRows a) v = 0 ∧ dot (formRows b) v = 0
  · obtain ⟨a, b, hab, ha, hb⟩ := htwo
    exact Or.inl (two_zero_forms_give_two_integer_relations a b hab v hpos ha hb)
  by_cases hany : ∃ a : Fin 80, dot (formRows a) v = 0
  · obtain ⟨a₀, ha₀⟩ := hany
    obtain ⟨i, j, k, hik, hjk, hadd, hrow⟩ := zero_form_additive a₀ v hpos ha₀
    have hunique : ∀ a : Fin 80, dot (formRows a) v = 0 → a = a₀ := by
      intro a ha
      by_contra hne
      exact htwo ⟨a, a₀, hne, ha, ha₀⟩
    have hxy : v i + v j ≤ C := by rw [hadd]; exact hbound k
    obtain ⟨p, hp, hdetect⟩ := exists_root_prime_detecting_zeros
      v C hC hbound ps hprime hproduct (v i) (v j) hxy
    have hbasic : ∀ z ∈ rootBasicFactors v, (p : ℤ) ∣ z → z = 0 := by
      intro z hz hdiv
      exact hdetect z (rootIntegerFactors_basic_mem v (v i) (v j) z hz) hdiv
    have hforms : ∀ a : Fin 80, (p : ℤ) ∣ dot (formRows a) v → dot (formRows a) v = 0 :=
      fun a hdiv => hdetect _ (rootIntegerFactors_form_mem v (v i) (v j) a) hdiv
    have hextra : ∀ e : Fin 6, (p : ℤ) ∣ tripleExtraFactors (v i) (v j) e →
        tripleExtraFactors (v i) (v j) e = 0 :=
      fun e hdiv => hdetect _ (rootIntegerFactors_extra_mem v (v i) (v j) e) hdiv
    rcases root_structural_of_basic_detection p (hprime p hp).pos (hcovers p hp)
      v hpos hdistinct hbelow hbasic with hrel | h134
    · obtain ⟨a, b, hab, ha, hb⟩ := (twoShortRelations_iff p v).mp hrel
      exact Or.inl (two_zero_forms_give_two_integer_relations a b hab v hpos
        (hforms a ha) (hforms b hb))
    · exact Or.inr (folded134_unique_additive p (hprime p hp) (hlarge p hp) v
        (basic_detection_avoids_speeds p v hpos hbasic) a₀ i j k hpos hik hjk hadd hrow
        hforms hunique hextra h134).2
  · obtain ⟨p, hp, hdetect⟩ := exists_root_prime_detecting_zeros
      v C hC hbound ps hprime hproduct 0 0 (by omega)
    have hbasic : ∀ z ∈ rootBasicFactors v, (p : ℤ) ∣ z → z = 0 := by
      intro z hz hdiv
      exact hdetect z (rootIntegerFactors_basic_mem v 0 0 z hz) hdiv
    have hforms : ∀ a : Fin 80, (p : ℤ) ∣ dot (formRows a) v → dot (formRows a) v = 0 :=
      fun a hdiv => hdetect _ (rootIntegerFactors_form_mem v 0 0 a) hdiv
    rcases root_structural_of_basic_detection p (hprime p hp).pos (hcovers p hp)
      v hpos hdistinct hbelow hbasic with hrel | h134
    · obtain ⟨a, b, hab, ha, hb⟩ := (twoShortRelations_iff p v).mp hrel
      exact Or.inl (two_zero_forms_give_two_integer_relations a b hab v hpos
        (hforms a ha) (hforms b hb))
    · exact False.elim (hany (folded134_gives_short_zero p (hprime p hp) (hlarge p hp)
        v (basic_detection_avoids_speeds p v hpos hbasic) hforms h134))

end Loneliness.FiveSpeedRoot
