import Conjectures.OravcovaSotakBaseChange
import Conjectures.LonelinessProductFamily
import Mathlib.Data.List.Perm.Subperm

/-! The integer and primitive-parameter reductions used to interpret R5 and R6.
These are proved here rather than folded into the classification hypotheses. -/

namespace OravcovaSotak

/-- A real dilation of an integer set containing 1 has an integer scale
as soon as all its values belong to an integer distance list. -/
theorem real_dilation_integer (W D : List ℕ) (hone : 1 ∈ W)
    (r : ℝ) (hr : 0 < r)
    (hsub : ∀ w ∈ W, ∃ d ∈ D, (d : ℝ) = r*(w : ℝ)) :
    ∃ A : ℕ, 0 < A ∧ W.map (fun w => A*w) ⊆ D := by
  obtain ⟨A,_hA,heA⟩ := hsub 1 hone
  have hAr : (A : ℝ) = r := by simpa only [Nat.cast_one, mul_one] using heA
  refine ⟨A,by exact_mod_cast (hAr.symm ▸ hr),?_⟩
  intro d hd
  obtain ⟨w,hw,rfl⟩ := List.mem_map.mp hd
  obtain ⟨e,he,hew⟩ := hsub w hw
  have heq : e = A*w := by
    have hR : (e : ℝ) = (A : ℝ)*(w : ℝ) := by rw [hAr]; exact hew
    exact_mod_cast hR
  simpa only [heq] using he

/-- A contained dilation with one fewer entries leaves exactly one extra
positive distance. -/
theorem complete_scaled_subset (D W : List ℕ) (A : ℕ) (hA : 0 < A)
    (hlen : D.length = W.length+1) (hW : W.Nodup)
    (hpositive : ∀ d ∈ D, 0 < d)
    (hsub : W.map (fun w => A*w) ⊆ D) :
    ∃ b : ℕ, 0 < b ∧ D.Perm (Loneliness.ProductFamily.speeds W A b) := by
  have hinj : Function.Injective (fun w : ℕ => A*w) := mul_right_injective₀ (ne_of_gt hA)
  have hn := List.Nodup.map hinj hW
  obtain ⟨E,hED,hWE⟩ := List.subperm_iff.mp (hn.subperm hsub)
  obtain ⟨rest,hrest⟩ := hWE.exists_perm_append
  have hperm := hED.symm.trans hrest
  have hrestlen : rest.length = 1 := by
    have hL := hperm.length_eq
    simp only [List.length_append, List.length_map] at hL
    omega
  obtain ⟨b,rfl⟩ := List.length_eq_one_iff.mp hrestlen
  refine ⟨b,hpositive b (hperm.mem_iff.mpr (by simp)),hperm⟩

theorem dvd_list_gcd (D : List ℕ) (g : ℕ) (h : ∀ d ∈ D, g ∣ d) :
    g ∣ Loneliness.Normalization.gcd D := by
  induction D with
  | nil => exact dvd_zero g
  | cons d D ih =>
      exact Nat.dvd_gcd (h d (by simp)) (ih (fun e he => h e (by simp [he])))

/-- Primitivity of any nonempty list of integer linear forms forces the
parameter gcd to be one. -/
theorem primitive_form_parameters (F : List (ℤ × ℤ)) (s t : ℤ)
    (hprimitive : Loneliness.Normalization.gcd (formDistances F s t) = 1) :
    Int.gcd s t = 1 := by
  apply Nat.dvd_one.mp
  rw [← hprimitive]
  apply dvd_list_gcd
  intro d hd
  obtain ⟨f,_hf,rfl⟩ := List.mem_map.mp hd
  have hs := Int.gcd_dvd_left s t
  have ht := Int.gcd_dvd_right s t
  have hform : ((Int.gcd s t : ℕ) : ℤ) ∣ linearValue s t f :=
    dvd_add (dvd_mul_of_dvd_right hs f.1) (dvd_mul_of_dvd_right ht f.2)
  simpa only [Int.natAbs_natCast] using Int.natAbs_dvd_natAbs.mpr hform

end OravcovaSotak
