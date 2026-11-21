import Conjectures.ChenKhareSahiGraded
import Mathlib.Algebra.Polynomial.Roots

namespace ChenKhareSahi

theorem orbit_degree (a b c : ℕ) (e : Partition) (he : e ∈ orbit a b c) : degree e = a+b+c := by
  simp only [orbit, Finset.mem_insert, Finset.mem_singleton] at he
  rcases he with rfl | rfl | rfl | rfl | rfl | rfl <;> simp [degree] <;> omega

theorem realP_homogeneous (p : Partition) (t x y z : ℝ) :
    realP p (t*x) (t*y) (t*z) = t^(degree p) * realP p x y z := by
  unfold realP realM
  rw [← mul_div_assoc]
  congr 1
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro e he
  have hd := orbit_degree p.1 p.2.1 p.2.2 e he
  simp only [degree] at hd ⊢
  rw [← hd, pow_add, pow_add, mul_pow, mul_pow, mul_pow]
  ring


abbrev GTerm := ℕ × SymFun

def termMul (a b : GTerm) : GTerm :=
  (a.1+b.1, fun x y z => a.2 x y z * b.2 x y z)

def termsMul (as bs : List GTerm) : List GTerm := as.flatMap (fun a => bs.map (termMul a))

def termsScale (s : ℝ) (as : List GTerm) : List GTerm :=
  as.map (fun a => (a.1, fun x y z => s * a.2 x y z))

def evalTerms (as : List GTerm) (t x y z : ℝ) : ℝ :=
  (as.map (fun a => t^a.1 * a.2 x y z)).sum

theorem evalTerms_append (as bs : List GTerm) (t x y z : ℝ) :
    evalTerms (as ++ bs) t x y z = evalTerms as t x y z + evalTerms bs t x y z := by
  simp [evalTerms]

theorem list_sum_scale (s : ℝ) (vs : List ℝ) : (vs.map (s * ·)).sum = s * vs.sum := by
  induction vs with
  | nil => simp
  | cons a vs ih => simp [ih, mul_add]

theorem evalTerms_scale (s : ℝ) (as : List GTerm) (t x y z : ℝ) :
    evalTerms (termsScale s as) t x y z = s * evalTerms as t x y z := by
  simp only [evalTerms, termsScale, List.map_map]
  change (as.map (fun a => t^a.1 * (s * a.2 x y z))).sum = s * (as.map (fun a => t^a.1 * a.2 x y z)).sum
  have heq : (fun a : GTerm => t^a.1 * (s * a.2 x y z)) =
      (fun a : GTerm => s * (t^a.1 * a.2 x y z)) := by funext; ring
  rw [heq]
  simpa only [List.map_map, Function.comp_def] using list_sum_scale s (as.map (fun a => t^a.1 * a.2 x y z))

theorem evalTerms_mul_single (a : GTerm) (bs : List GTerm) (t x y z : ℝ) :
    evalTerms (bs.map (termMul a)) t x y z = (t^a.1 * a.2 x y z) * evalTerms bs t x y z := by
  simp only [evalTerms, List.map_map]
  change (bs.map (fun b => t^(a.1+b.1) * (a.2 x y z * b.2 x y z))).sum = _
  simp only [pow_add]
  have heq : (fun b : GTerm => t^a.1 * t^b.1 * (a.2 x y z * b.2 x y z)) =
      (fun b : GTerm => (t^a.1 * a.2 x y z) * (t^b.1 * b.2 x y z)) := by funext; ring
  rw [heq]
  simpa only [List.map_map, Function.comp_def] using list_sum_scale (t^a.1 * a.2 x y z) (bs.map (fun b => t^b.1 * b.2 x y z))

theorem evalTerms_mul (as bs : List GTerm) (t x y z : ℝ) :
    evalTerms (termsMul as bs) t x y z = evalTerms as t x y z * evalTerms bs t x y z := by
  induction as with
  | nil => simp [evalTerms, termsMul]
  | cons a as ih =>
    change evalTerms (bs.map (termMul a) ++ termsMul as bs) t x y z = _
    rw [evalTerms_append, evalTerms_mul_single, ih]
    simp only [evalTerms, List.map_cons, List.sum_cons]
    ring


inductive FullSemiring : SymFun → Prop
  | zero : FullSemiring (fun _ _ _ => 0)
  | monomial (p : Partition) : p.2.1 ≤ p.1 → p.2.2 ≤ p.2.1 →
      FullSemiring (fun x y z => realP p x y z)
  | difference (a b : Partition) : a.2.1 ≤ a.1 → a.2.2 ≤ a.2.1 →
      b.2.1 ≤ b.1 → b.2.2 ≤ b.2.1 → dominates a b →
      FullSemiring (fun x y z => realD a b x y z)
  | add {f g} : FullSemiring f → FullSemiring g → FullSemiring (fun x y z => f x y z + g x y z)
  | mul {f g} : FullSemiring f → FullSemiring g → FullSemiring (fun x y z => f x y z * g x y z)
  | scale (s : ℝ) {f} : 0 ≤ s → FullSemiring f → FullSemiring (fun x y z => s * f x y z)

theorem FullSemiring.expand {f : SymFun} (hf : FullSemiring f) :
    ∃ as : List GTerm, (∀ a ∈ as, HomSemiring a.1 a.2) ∧
      ∀ t x y z : ℝ, f (t*x) (t*y) (t*z) = evalTerms as t x y z := by
  induction hf with
  | zero => exact ⟨[], by simp, by simp [evalTerms]⟩
  | monomial p hp1 hp2 =>
    refine ⟨[(degree p, fun x y z => realP p x y z)], ?_, ?_⟩
    · simp only [List.mem_singleton]
      rintro a rfl
      exact HomSemiring.monomial (degree p) p hp1 hp2 rfl
    · intro t x y z
      simpa [evalTerms] using realP_homogeneous p t x y z
  | difference a b ha1 ha2 hb1 hb2 hab =>
    refine ⟨[(degree a, fun x y z => realD a b x y z)], ?_, ?_⟩
    · simp only [List.mem_singleton]
      rintro q rfl
      exact HomSemiring.difference (degree a) a b ha1 ha2 rfl hb1 hb2 hab.1.symm hab
    · intro t x y z
      simp only [evalTerms, List.map_singleton, List.sum_singleton, realD]
      rw [realP_homogeneous, realP_homogeneous, ← hab.1]
      ring
  | @add f g hf hg ihf ihg =>
    obtain ⟨as, has, hfa⟩ := ihf
    obtain ⟨bs, hbs, hgb⟩ := ihg
    refine ⟨as ++ bs, ?_, ?_⟩
    · intro a ha
      rcases List.mem_append.mp ha with ha | ha
      · exact has a ha
      · exact hbs a ha
    · intro t x y z
      rw [evalTerms_append, ← hfa, ← hgb]
  | @mul f g hf hg ihf ihg =>
    obtain ⟨as, has, hfa⟩ := ihf
    obtain ⟨bs, hbs, hgb⟩ := ihg
    refine ⟨termsMul as bs, ?_, ?_⟩
    · intro a ha
      obtain ⟨u, hu, hv⟩ := List.mem_flatMap.mp ha
      obtain ⟨v, hvb, heq⟩ := List.mem_map.mp hv
      rw [← heq]
      exact HomSemiring.mul (has u hu) (hbs v hvb)
    · intro t x y z
      rw [evalTerms_mul, ← hfa, ← hgb]
  | @scale s f hs hf ih =>
    obtain ⟨as, has, hfa⟩ := ih
    refine ⟨termsScale s as, ?_, ?_⟩
    · intro a ha
      obtain ⟨u, hu, rfl⟩ := List.mem_map.mp ha
      exact HomSemiring.scale s hs (has u hu)
    · intro t x y z
      rw [evalTerms_scale, ← hfa]


noncomputable def termsPoly : List GTerm → ℝ → ℝ → ℝ → Polynomial ℝ
  | [], _, _, _ => 0
  | a::as, x, y, z => Polynomial.monomial a.1 (a.2 x y z) + termsPoly as x y z

def degreeTerms (n : ℕ) (as : List GTerm) : List GTerm := as.filter (fun a => a.1 = n)

theorem eval_termsPoly (as : List GTerm) (t x y z : ℝ) :
    (termsPoly as x y z).eval t = evalTerms as t x y z := by
  induction as with
  | nil => simp [termsPoly, evalTerms]
  | cons a as ih =>
    simp [termsPoly, evalTerms, Polynomial.eval_add, Polynomial.eval_monomial, ih, mul_comm]

theorem coeff_termsPoly (as : List GTerm) (n : ℕ) (x y z : ℝ) :
    (termsPoly as x y z).coeff n = evalTerms (degreeTerms n as) 1 x y z := by
  induction as with
  | nil => simp [termsPoly, degreeTerms, evalTerms]
  | cons a as ih =>
    by_cases h : a.1 = n <;>
      simp [termsPoly, degreeTerms, evalTerms, Polynomial.coeff_add, Polynomial.coeff_monomial, h, ih]

theorem degreePart_homogeneous (as : List GTerm) (n : ℕ)
    (ha : ∀ a ∈ as, HomSemiring a.1 a.2) :
    HomSemiring n (fun x y z => evalTerms (degreeTerms n as) 1 x y z) := by
  induction as with
  | nil => simpa [degreeTerms, evalTerms] using HomSemiring.zero n
  | cons a as ih =>
    have ht : ∀ a ∈ as, HomSemiring a.1 a.2 := fun a h => ha a (by simp [h])
    have htail := ih ht
    by_cases h : a.1 = n
    · have hfirst : HomSemiring n a.2 := by simpa [h] using ha a (by simp)
      have hs := HomSemiring.add hfirst htail
      simpa [degreeTerms, evalTerms, h] using hs
    · simpa [degreeTerms, evalTerms, h] using htail

theorem FullSemiring.homogeneous_component {f : SymFun} (hf : FullSemiring f)
    (hhom : ∀ t x y z : ℝ, f (t*x) (t*y) (t*z) = t^6 * f x y z) : HomSemiring 6 f := by
  obtain ⟨as, has, hscale⟩ := hf.expand
  have hpoint : ∀ x y z : ℝ, f x y z = evalTerms (degreeTerms 6 as) 1 x y z := by
    intro x y z
    have heq : termsPoly as x y z = Polynomial.monomial 6 (f x y z) := by
      apply Polynomial.eq_of_infinite_eval_eq
      have hu : {t : ℝ | (termsPoly as x y z).eval t = (Polynomial.monomial 6 (f x y z)).eval t} = Set.univ := by
        ext t
        simp only [Set.mem_ofPred_eq, Set.mem_univ, iff_true]
        rw [eval_termsPoly, Polynomial.eval_monomial, ← hscale, hhom]
        ring
      rw [hu]
      let : Infinite ℝ := Infinite.of_injective (fun n : ℕ => (n : ℝ)) Nat.cast_injective
      exact Set.infinite_univ
    have hc := congrArg (fun p : Polynomial ℝ => p.coeff 6) heq
    simpa [coeff_termsPoly, Polynomial.coeff_monomial] using hc.symm
  have hfun : f = (fun x y z => evalTerms (degreeTerms 6 as) 1 x y z) := by
    funext x y z
    exact hpoint x y z
  rw [hfun]
  exact degreePart_homogeneous as 6 has


theorem realMonomial_homogeneous (a b c : ℕ) (t x y z : ℝ) :
    realMonomial a b c (t*x) (t*y) (t*z) = t^(a+b+c) * realMonomial a b c x y z := by
  unfold realMonomial
  have h := realP_homogeneous (a,b,c) t x y z
  simp only [realP, degree] at h
  rw [h]
  ring

theorem counterexample_homogeneous (t x y z : ℝ) :
    (realP420 (t*x) (t*y) (t*z) / realP420 1 1 1 - realP411 (t*x) (t*y) (t*z) / realP411 1 1 1) =
      t^6 * (realP420 x y z / realP420 1 1 1 - realP411 x y z / realP411 1 1 1) := by
  simp only [realP420, realP411, realMonomial_homogeneous]
  norm_num
  ring

theorem FullSemiring.excludes_counterexample :
    ¬ FullSemiring (fun x y z => realP420 x y z / realP420 1 1 1 - realP411 x y z / realP411 1 1 1) := by
  intro h
  have hh := h.homogeneous_component counterexample_homogeneous
  exact HomSemiring.excludes_counterexample hh

end ChenKhareSahi
