import Conjectures.LonelinessSixSpectrumFieldsDefs
import Mathlib.Data.Nat.Prime.Basic

/-! Exact transport of the eighty-factor condition under coordinate
permutations, independent signs, and multiplication by a modular unit.
Distinct factor indices are retained throughout these transformations. -/

namespace Loneliness.SixSpectrumFields

private theorem sign_product (a b : Bool) : sign (a == b) = sign a * sign b := by
  cases a <;> cases b <;> decide

private theorem sign_self (a : Bool) : sign a * sign a = 1 := by
  cases a <;> decide

def coordinate (i : Fin 6) : Fin 6 → ℤ := fun j => if j = i then 1 else 0

private def coefficientsMatch (a b : Form) (e : Bool) : Bool :=
  decide (∀ i : Fin 6, eval a (coordinate i) = sign e * eval b (coordinate i))

/-- The eighty coefficient vectors are different even up to overall sign. -/
theorem form_eq_of_signed_coefficients :
    ∀ a b : Form, ∀ e : Bool,
      (∀ i : Fin 6, eval a (coordinate i) = sign e * eval b (coordinate i)) → a = b := by
  have hcheck : ∀ a ∈ (Finset.univ : Finset Form),
      ∀ b ∈ (Finset.univ : Finset Form), ∀ e ∈ ([false, true] : List Bool),
      coefficientsMatch a b e = true → a = b := by
    decide +kernel
  intro a b e h
  exact hcheck a (Finset.mem_univ a) b (Finset.mem_univ b) e
    (by cases e <;> simp) (decide_eq_true h)

private theorem ordered_form (i j k : Fin 6) (hij : i < j) (hjk : j < k)
    (a b c : Bool) :
    ∃ f : Form, ∃ e : Bool, ∀ v : Fin 6 → ℤ,
      eval f v = sign e * (sign a * v i + sign b * v j + sign c * v k) := by
  refine ⟨(⟨(i, j, k), hij, hjk⟩, a == b, a == c), a, ?_⟩
  intro v
  simp only [eval, sign_product]
  calc
    v i + sign a * sign b * v j + sign a * sign c * v k =
        (sign a * sign a) * v i + sign a * sign b * v j + sign a * sign c * v k := by
      rw [sign_self, one_mul]
    _ = sign a * (sign a * v i + sign b * v j + sign c * v k) := by ring

theorem form_of_signed_triple (i j k : Fin 6)
    (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) (a b c : Bool) :
    ∃ f : Form, ∃ e : Bool, ∀ v : Fin 6 → ℤ,
      eval f v = sign e * (sign a * v i + sign b * v j + sign c * v k) := by
  by_cases h₁ : i < j
  · by_cases h₂ : j < k
    · exact ordered_form i j k h₁ h₂ a b c
    · by_cases h₃ : i < k
      · obtain ⟨f, e, hf⟩ := ordered_form i k j h₃ (by omega) a c b
        refine ⟨f, e, ?_⟩
        intro v
        rw [hf]
        ring
      · obtain ⟨f, e, hf⟩ := ordered_form k i j (by omega) h₁ c a b
        refine ⟨f, e, ?_⟩
        intro v
        rw [hf]
        ring
  · by_cases h₂ : i < k
    · obtain ⟨f, e, hf⟩ := ordered_form j i k (by omega) h₂ b a c
      refine ⟨f, e, ?_⟩
      intro v
      rw [hf]
      ring
    · by_cases h₃ : j < k
      · obtain ⟨f, e, hf⟩ := ordered_form j k i h₃ (by omega) b c a
        refine ⟨f, e, ?_⟩
        intro v
        rw [hf]
        ring
      · obtain ⟨f, e, hf⟩ := ordered_form k j i (by omega) (by omega) c b a
        refine ⟨f, e, ?_⟩
        intro v
        rw [hf]
        ring

def transform (σ : Fin 6 → Bool) (π : Equiv.Perm (Fin 6)) (v : Fin 6 → ℤ) :
    Fin 6 → ℤ := fun i => sign (σ i) * v (π i)

theorem transform_surjective (σ : Fin 6 → Bool) (π : Equiv.Perm (Fin 6)) :
    Function.Surjective (transform σ π) := by
  intro w
  refine ⟨fun i => sign (σ (π.symm i)) * w (π.symm i), ?_⟩
  funext i
  simp only [transform, Equiv.symm_apply_apply, ← mul_assoc, sign_self, one_mul]

theorem transformed_form (σ : Fin 6 → Bool) (π : Equiv.Perm (Fin 6)) (f : Form) :
    ∃ g : Form, ∃ e : Bool, ∀ v : Fin 6 → ℤ,
      eval g v = sign e * eval f (transform σ π v) := by
  let i := f.1.val.1
  let j := f.1.val.2.1
  let k := f.1.val.2.2
  have hij : π i ≠ π j := π.injective.ne (ne_of_lt f.1.property.1)
  have hik : π i ≠ π k := π.injective.ne (ne_of_lt (lt_trans f.1.property.1 f.1.property.2))
  have hjk : π j ≠ π k := π.injective.ne (ne_of_lt f.1.property.2)
  obtain ⟨g, e, hg⟩ := form_of_signed_triple (π i) (π j) (π k) hij hik hjk
    (σ i) (f.2.1 == σ j) (f.2.2 == σ k)
  refine ⟨g, e, ?_⟩
  intro v
  simpa only [eval, transform, sign_product, mul_assoc] using hg v

theorem relations_of_transform (p : ℕ) (σ : Fin 6 → Bool) (π : Equiv.Perm (Fin 6))
    (v : Fin 6 → ℤ) (h : TwoRelations p (transform σ π v)) : TwoRelations p v := by
  obtain ⟨a, b, hab, ha, hb⟩ := h
  obtain ⟨a', ea, hfa⟩ := transformed_form σ π a
  obtain ⟨b', eb, hfb⟩ := transformed_form σ π b
  have hne : a' ≠ b' := by
    intro heq
    apply hab
    apply form_eq_of_signed_coefficients a b (ea == eb)
    intro i
    obtain ⟨w, hw⟩ := transform_surjective σ π (coordinate i)
    have he : sign ea * eval a (coordinate i) = sign eb * eval b (coordinate i) := by
      rw [← hw, ← hfa, ← hfb, heq]
    calc
      eval a (coordinate i) = sign ea * (sign ea * eval a (coordinate i)) := by
        rw [← mul_assoc, sign_self, one_mul]
      _ = sign ea * (sign eb * eval b (coordinate i)) := congrArg (sign ea * ·) he
      _ = sign (ea == eb) * eval b (coordinate i) := by rw [sign_product, mul_assoc]
  refine ⟨a', b', hne, ?_, ?_⟩
  · rw [hfa]
    exact ha.trans (dvd_mul_left _ _)
  · rw [hfb]
    exact hb.trans (dvd_mul_left _ _)

theorem relations_of_perm (p : ℕ) (π : Equiv.Perm (Fin 6)) (v : Fin 6 → ℤ)
    (h : TwoRelations p (v ∘ π)) : TwoRelations p v := by
  apply relations_of_transform p (fun _ => true) π v
  have he : transform (fun _ => true) π v = v ∘ π := by
    funext i
    exact one_mul _
  rw [he]
  exact h

theorem eval_congruence (p : ℕ) (f : Form) (v w : Fin 6 → ℤ)
    (h : ∀ i, (p : ℤ) ∣ v i - w i) : (p : ℤ) ∣ eval f v - eval f w := by
  have he : eval f v - eval f w =
      (v f.1.val.1 - w f.1.val.1) +
      sign f.2.1 * (v f.1.val.2.1 - w f.1.val.2.1) +
      sign f.2.2 * (v f.1.val.2.2 - w f.1.val.2.2) := by
    simp only [eval]
    ring
  rw [he]
  exact dvd_add (dvd_add (h _) ((h _).trans (dvd_mul_left _ _)))
    ((h _).trans (dvd_mul_left _ _))

theorem relations_of_congruence (p : ℕ) (v w : Fin 6 → ℤ)
    (h : ∀ i, (p : ℤ) ∣ v i - w i) (hv : TwoRelations p v) : TwoRelations p w := by
  obtain ⟨a, b, hab, ha, hb⟩ := hv
  refine ⟨a, b, hab, ?_, ?_⟩
  · have hd := dvd_sub ha (eval_congruence p a v w h)
    simpa only [sub_sub_cancel] using hd
  · have hd := dvd_sub hb (eval_congruence p b v w h)
    simpa only [sub_sub_cancel] using hd

theorem eval_scale (f : Form) (u : ℤ) (v : Fin 6 → ℤ) :
    eval f (fun i => u * v i) = u * eval f v := by
  simp only [eval]
  ring

theorem relations_of_unit_scale (p : ℕ) (hp : p.Prime) (u inverse : ℕ)
    (hunit : (u * inverse) % p = 1 % p) (v : Fin 6 → ℤ)
    (h : TwoRelations p (fun i => (u : ℤ) * v i)) : TwoRelations p v := by
  have hpu : ¬ p ∣ u := by
    intro hd
    have hz : (u * inverse) % p = 0 :=
      Nat.mod_eq_zero_of_dvd (hd.trans (dvd_mul_right _ _))
    rw [hz, Nat.mod_eq_of_lt hp.one_lt] at hunit
    omega
  have cancel (f : Form) (hf : (p : ℤ) ∣ eval f (fun i => (u : ℤ) * v i)) :
      (p : ℤ) ∣ eval f v := by
    rw [eval_scale] at hf
    have hnat := Int.natCast_dvd.mp hf
    rw [Int.natAbs_mul, Int.natAbs_natCast] at hnat
    exact Int.natCast_dvd.mpr ((hp.dvd_mul.mp hnat).resolve_left hpu)
  obtain ⟨a, b, hab, ha, hb⟩ := h
  exact ⟨a, b, hab, cancel a ha, cancel b hb⟩

theorem folded_congruence_sign (p : ℕ) (hp : 0 < p) (a : ℕ) :
    ∃ b : Bool, (p : ℤ) ∣ (Modular.folded p a : ℤ) - sign b * (a : ℤ) := by
  have hmod : a % p ≤ p := (Nat.mod_lt a hp).le
  have hdecomp : (a : ℤ) = (a % p : ℕ) + (p : ℤ) * (a / p : ℕ) := by
    exact_mod_cast (Nat.mod_add_div a p).symm
  by_cases h : a % p ≤ p - a % p
  · refine ⟨true, -((a / p : ℕ) : ℤ), ?_⟩
    rw [Modular.folded, min_eq_left h]
    norm_num only [sign, ite_true, one_mul]
    nlinarith [hdecomp]
  · refine ⟨false, 1 + ((a / p : ℕ) : ℤ), ?_⟩
    rw [Modular.folded, min_eq_right (by omega), Nat.cast_sub hmod]
    norm_num only [sign, Bool.false_eq_true, ite_false, neg_one_mul]
    nlinarith [hdecomp]

theorem relations_of_folded_unit (p : ℕ) (hp : p.Prime) (u inverse : ℕ)
    (hunit : (u * inverse) % p = 1 % p) (v : Fin 6 → ℕ)
    (h : TwoRelations p (fun i => (Modular.folded p (u * v i) : ℤ))) :
    TwoRelations p (fun i => (v i : ℤ)) := by
  classical
  choose σ hσ using fun i => folded_congruence_sign p hp.pos (u * v i)
  have hcong : ∀ i, (p : ℤ) ∣ (Modular.folded p (u * v i) : ℤ) -
      transform σ (Equiv.refl _) (fun j => (u : ℤ) * (v j : ℤ)) i := by
    intro i
    simpa only [transform, Equiv.refl_apply, Nat.cast_mul] using hσ i
  have ht := relations_of_congruence p _ _ hcong h
  have hs := relations_of_transform p σ (Equiv.refl _) _ ht
  exact relations_of_unit_scale p hp u inverse hunit _ hs

end Loneliness.SixSpectrumFields
