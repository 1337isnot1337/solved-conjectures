import Conjectures.ChenKhareSahi
import Mathlib.Data.Rat.BigOperators
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.NormNum

namespace ChenKhareSahi

noncomputable def realM (a b c : ℕ) (x y z : ℝ) : ℝ :=
  (∑ e ∈ orbit a b c, x^e.1 * y^e.2.1 * z^e.2.2) / (orbit a b c).card

theorem realM_cast (a b c : ℕ) (x y z : ℚ) :
    realM a b c x y z = (M a b c x y z : ℝ) := by
  push_cast [realM, M]
  simp only [← Rat.coe_castHom (α := ℝ), map_pow]

noncomputable def realSep (f : ℝ → ℝ → ℝ → ℝ) : ℝ :=
  175*f 0 0 1 - (209/2)*f 0 1 1 + (87/5)*f 0 2 1 - (8/5)*f 0 3 1 -
    (33/4)*f 1 1 1 + (3/2)*f 1 2 1 + (1/4)*f 1 3 1

theorem realSep_cast (f : ℚ → ℚ → ℚ → ℚ) (g : ℝ → ℝ → ℝ → ℝ)
    (h : ∀ x y z : ℚ, g x y z = (f x y z : ℝ)) : realSep g = (sep f : ℝ) := by
  simp only [realSep, sep, Rat.cast_sub, Rat.cast_add, Rat.cast_mul, Rat.cast_div, Rat.cast_ofNat]
  rw [← h 0 0 1, ← h 0 1 1, ← h 0 2 1, ← h 0 3 1, ← h 1 1 1, ← h 1 2 1, ← h 1 3 1]
  norm_num


noncomputable def realMonomial (a b c : ℕ) (x y z : ℝ) : ℝ :=
  (orbit a b c).card * realM a b c x y z

noncomputable def realP420 (x y z : ℝ) : ℝ :=
  realMonomial 4 2 0 x y z + (11/91)*(realMonomial 4 1 1 x y z + realMonomial 3 3 0 x y z) +
    (1143098/9092629)*realMonomial 3 2 1 x y z + (27053496033/90189787051)*realMonomial 2 2 2 x y z

noncomputable def realP411 (x y z : ℝ) : ℝ :=
  realMonomial 4 1 1 x y z + (111/991)*realMonomial 3 2 1 x y z + (1221/90181)*realMonomial 2 2 2 x y z

theorem realMonomial_cast (a b c : ℕ) (x y z : ℚ) :
    realMonomial a b c x y z = (monomial a b c x y z : ℝ) := by
  simp [realMonomial, monomial, realM_cast]

theorem realP420_cast (x y z : ℚ) : realP420 x y z = (P420 x y z : ℝ) := by
  simp [realP420, P420, realMonomial_cast]

theorem realP411_cast (x y z : ℚ) : realP411 x y z = (P411 x y z : ℝ) := by
  simp [realP411, P411, realMonomial_cast]

theorem real_separation_negative :
    realSep (fun x y z => realP420 x y z / realP420 1 1 1 - realP411 x y z / realP411 1 1 1) < 0 := by
  have h : ∀ x y z : ℚ,
      (realP420 x y z / realP420 1 1 1 - realP411 x y z / realP411 1 1 1 : ℝ) =
        ((P420 x y z / P420 1 1 1 - P411 x y z / P411 1 1 1 : ℚ) : ℝ) := by
    intro x y z
    push_cast
    rw [realP420_cast, realP411_cast]
    have h420 : realP420 1 1 1 = (P420 1 1 1 : ℝ) := by simpa using realP420_cast 1 1 1
    have h411 : realP411 1 1 1 = (P411 1 1 1 : ℝ) := by simpa using realP411_cast 1 1 1
    rw [h420, h411]
  rw [realSep_cast _ _ h]
  exact_mod_cast separation_negative


noncomputable def realP (a : ℕ × ℕ × ℕ) (x y z : ℝ) : ℝ := realM a.1 a.2.1 a.2.2 x y z
noncomputable def realD (a b : ℕ × ℕ × ℕ) (x y z : ℝ) : ℝ := realP a x y z - realP b x y z

theorem realP_cast (a : ℕ × ℕ × ℕ) (x y z : ℚ) : realP a x y z = (P a x y z : ℝ) := by
  exact realM_cast _ _ _ _ _ _

theorem realD_cast (a b : ℕ × ℕ × ℕ) (x y z : ℚ) : realD a b x y z = (D a b x y z : ℝ) := by
  simp [realD, D, realP_cast]

@[simp] theorem realSep_product1 (a b c : ℕ × ℕ × ℕ) :
    realSep (fun x y z => realD a b x y z * realP c x y z) =
      (sep (fun x y z => D a b x y z * P c x y z) : ℝ) := by
  apply realSep_cast
  intro x y z
  simp [realD_cast, realP_cast]

@[simp] theorem realSep_product2 (a b c d e : ℕ × ℕ × ℕ) :
    realSep (fun x y z => realD a b x y z * realD c d x y z * realP e x y z) =
      (sep (fun x y y₃ => D a b x y y₃ * D c d x y y₃ * P e x y y₃) : ℝ) := by
  apply realSep_cast
  intro x y z
  simp [realD_cast, realP_cast]

@[simp] theorem realSep_cube (a b : ℕ × ℕ × ℕ) :
    realSep (fun x y z => (realD a b x y z)^3) =
      (sep (fun x y z => (D a b x y z)^3) : ℝ) := by
  apply realSep_cast
  intro x y z
  rw [realD_cast]
  exact (map_pow (Rat.castHom ℝ) _ 3).symm

noncomputable def realGeneratorValues : List ℝ :=
  [realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realP (4,0,0) x y z),
   realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realP (3,1,0) x y z),
   realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realP (2,2,0) x y z),
   realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realP (2,1,1) x y z),
   realSep (fun x y z => realD (3,0,0) (2,1,0) x y z * realP (3,0,0) x y z),
   realSep (fun x y z => realD (3,0,0) (2,1,0) x y z * realP (2,1,0) x y z),
   realSep (fun x y z => realD (3,0,0) (2,1,0) x y z * realP (1,1,1) x y z),
   realSep (fun x y z => realD (2,1,0) (1,1,1) x y z * realP (3,0,0) x y z),
   realSep (fun x y z => realD (2,1,0) (1,1,1) x y z * realP (2,1,0) x y z),
   realSep (fun x y z => realD (2,1,0) (1,1,1) x y z * realP (1,1,1) x y z),
   realSep (fun x y z => realD (4,0,0) (3,1,0) x y z * realP (2,0,0) x y z),
   realSep (fun x y z => realD (4,0,0) (3,1,0) x y z * realP (1,1,0) x y z),
   realSep (fun x y z => realD (3,1,0) (2,2,0) x y z * realP (2,0,0) x y z),
   realSep (fun x y z => realD (3,1,0) (2,2,0) x y z * realP (1,1,0) x y z),
   realSep (fun x y z => realD (2,2,0) (2,1,1) x y z * realP (2,0,0) x y z),
   realSep (fun x y z => realD (2,2,0) (2,1,1) x y z * realP (1,1,0) x y z),
   realSep (fun x y z => realD (5,0,0) (4,1,0) x y z * realP (1,0,0) x y z),
   realSep (fun x y z => realD (4,1,0) (3,2,0) x y z * realP (1,0,0) x y z),
   realSep (fun x y z => realD (3,2,0) (3,1,1) x y z * realP (1,0,0) x y z),
   realSep (fun x y z => realD (3,1,1) (2,2,1) x y z * realP (1,0,0) x y z),
   realSep (fun x y z => realD (6,0,0) (5,1,0) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (5,1,0) (4,2,0) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (4,2,0) (4,1,1) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (4,2,0) (3,3,0) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (4,1,1) (3,2,1) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (3,3,0) (3,2,1) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (3,2,1) (2,2,2) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realD (2,0,0) (1,1,0) x y z * realP (2,0,0) x y z),
   realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realD (2,0,0) (1,1,0) x y z * realP (1,1,0) x y z),
   realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realD (3,0,0) (2,1,0) x y z * realP (1,0,0) x y z),
   realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realD (2,1,0) (1,1,1) x y z * realP (1,0,0) x y z),
   realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realD (4,0,0) (3,1,0) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realD (3,1,0) (2,2,0) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (2,0,0) (1,1,0) x y z * realD (2,2,0) (2,1,1) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (3,0,0) (2,1,0) x y z * realD (3,0,0) (2,1,0) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (3,0,0) (2,1,0) x y z * realD (2,1,0) (1,1,1) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => realD (2,1,0) (1,1,1) x y z * realD (2,1,0) (1,1,1) x y z * realP (0,0,0) x y z),
   realSep (fun x y z => (realD (2,0,0) (1,1,0) x y z)^3)]


theorem realGeneratorValues_cast : realGeneratorValues = generatorValues.map (fun v : ℚ => (v : ℝ)) := by
  simp [realGeneratorValues, generatorValues]

theorem realGeneratorValues_nonnegative : ∀ v ∈ realGeneratorValues, 0 ≤ v := by
  rw [realGeneratorValues_cast]
  intro v hv
  obtain ⟨q, hq, hval⟩ := List.mem_map.mp hv
  have hq' := generatorValues_nonnegative q hq
  rw [← hval]
  exact_mod_cast hq'

end ChenKhareSahi
