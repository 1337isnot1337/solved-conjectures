import Conjectures.ChenKhareSahiJackTheorem

namespace ChenKhareSahi.Jack.Source

noncomputable section

/-- The actual source semiring for a given normalized polynomial family in five variables. -/
inductive Generated (g : (Fin 5 → ℕ) → Pt → ℝ) : (Pt → ℝ) → Prop
  | generator (p : Fin 5 → ℕ) : Antitone p → Generated g (g p)
  | difference (a b : Fin 5 → ℕ) : Antitone a → Antitone b → Dominates a b →
      Generated g (fun x => g a x - g b x)
  | add {f h} : Generated g f → Generated g h → Generated g (fun x => f x + h x)
  | mul {f h} : Generated g f → Generated g h → Generated g (fun x => f x * h x)
  | scale (c : ℝ) {f} : 0 ≤ c → Generated g f → Generated g (fun x => c * f x)

/-- A term of degree at most five has the same three evaluations as an actual homogeneous
element of the Jacobi–Trudi semiring. Higher degrees cannot affect the witness. -/
def Agrees (d : ℕ) (f : Pt → ℝ) : Prop := d ≤ 5 → ∃ g, HomSchur d g ∧ val f = val g

theorem Agrees.mul {n m : ℕ} {f g : Pt → ℝ} (hf : Agrees n f) (hg : Agrees m g) :
    Agrees (n+m) (fun x => f x * g x) := by
  intro hn
  obtain ⟨F,hF,hv⟩ := hf (by omega)
  obtain ⟨G,hG,hw⟩ := hg (by omega)
  refine ⟨_, HomSchur.mul hF hG, ?_⟩
  change val f * val g = val F * val G
  rw [hv, hw]

theorem Agrees.scale {n : ℕ} {f : Pt → ℝ} (hf : Agrees n f) (c : ℝ) (hc : 0 ≤ c) :
    Agrees n (fun x => c * f x) := by
  intro hn
  obtain ⟨F,hF,hv⟩ := hf hn
  refine ⟨_, HomSchur.scale c hc hF, ?_⟩
  change (c,c,c) * val f = (c,c,c) * val F
  rw [hv]

theorem Generated.expand {g : (Fin 5 → ℕ) → Pt → ℝ} {f : Pt → ℝ} (hf : Generated g f)
    (hom : ∀ p, Antitone p → ∀ t x, g p (t • x) = t ^ size p * g p x)
    (values : ∀ p, Antitone p → size p ≤ 5 → val (g p) = val (nschur p)) :
    ∃ as : List GTerm, (∀ a ∈ as, Agrees a.1 a.2) ∧
      ∀ t x, f (t • x) = evalTerms as t x := by
  induction hf with
  | generator p hp =>
    refine ⟨[(size p, g p)], ?_, fun t x => ?_⟩
    · simpa using (show Agrees (size p) (g p) from fun h =>
        ⟨_, HomSchur.schur p hp, values p hp h⟩)
    · simp [evalTerms, hom p hp]
  | difference a b ha hb hab =>
    refine ⟨[(size a, fun x => g a x - g b x)], ?_, fun t x => ?_⟩
    · have h : Agrees (size a) (fun x => g a x - g b x) := by
        intro h
        refine ⟨_, HomSchur.difference a b ha hb hab, ?_⟩
        change val (g a) - val (g b) = val (nschur a) - val (nschur b)
        rw [values a ha h, values b hb (hab.1 ▸ h)]
      simpa using h
    · simp only [evalTerms, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
        add_zero, hom a ha, hom b hb, hab.1]
      ring
  | add _ _ ihf ihg =>
    obtain ⟨as, has, hfa⟩ := ihf
    obtain ⟨bs, hbs, hgb⟩ := ihg
    refine ⟨as ++ bs, fun a ha => ?_, fun t x => by rw [evalTerms_append, ← hfa, ← hgb]⟩
    rcases List.mem_append.mp ha with ha | ha
    · exact has a ha
    · exact hbs a ha
  | mul _ _ ihf ihg =>
    obtain ⟨as, has, hfa⟩ := ihf
    obtain ⟨bs, hbs, hgb⟩ := ihg
    refine ⟨termsMul as bs, fun c hc => ?_, fun t x => by rw [evalTerms_termsMul, ← hfa, ← hgb]⟩
    simp only [termsMul, List.mem_flatMap, List.mem_map] at hc
    obtain ⟨a,ha,b,hb,rfl⟩ := hc
    exact (has a ha).mul (hbs b hb)
  | scale c hc _ ih =>
    obtain ⟨as,has,hfa⟩ := ih
    refine ⟨as.map fun a => (a.1, fun x => c * a.2 x), fun a ha => ?_, fun t x => ?_⟩
    · simp only [List.mem_map] at ha
      obtain ⟨b,hb,rfl⟩ := ha
      exact (has b hb).scale c hc
    · beta_reduce
      rw [hfa]
      simp only [evalTerms, List.map_map]
      rw [← List.sum_map_mul_left]
      congr 1
      apply List.map_congr_left
      intro b _
      simp only [Function.comp_apply]
      ring

theorem degreePart_agrees (as : List GTerm) (has : ∀ a ∈ as, Agrees a.1 a.2) :
    ∃ g, HomSchur 5 g ∧ val (degreePart 5 as) = val g := by
  induction as with
  | nil => exact ⟨_, HomSchur.zero _, rfl⟩
  | cons x xs ih =>
    obtain ⟨g,hg,hv⟩ := ih (fun a h => has a (by simp [h]))
    have step : degreePart 5 (x :: xs) = fun y =>
        (if x.1 = 5 then x.2 y else 0) + degreePart 5 xs y := by
      funext y
      simp [degreePart]
    rw [step]
    by_cases hx : x.1 = 5
    · obtain ⟨f,hf,hw⟩ := has x (by simp) (by omega)
      refine ⟨_, HomSchur.add (hx ▸ hf) hg, ?_⟩
      simp only [hx, ite_true]
      change val x.2 + val (degreePart 5 xs) = val f + val g
      rw [hw, hv]
    · simpa [hx] using ⟨g, hg, hv⟩

theorem exclude_target {g : (Fin 5 → ℕ) → Pt → ℝ}
    (hom : ∀ p, Antitone p → ∀ t x, g p (t • x) = t ^ size p * g p x)
    (values : ∀ p, Antitone p → size p ≤ 5 → val (g p) = val (nschur p))
    (F : Index → Index → ℝ) (hF : IsJackFamily F) : ¬ Generated g (jackTarget F) := by
  rw [family_unique F hF]
  intro hf
  obtain ⟨as, has, hrep⟩ := hf.expand hom values
  have exactPart := eq_degreePart 5 as (jackTarget jackR) (jackTarget_smul jackR) hrep
  obtain ⟨g',hg',hv⟩ := degreePart_agrees as has
  have h := Cone.sep_nonneg tab5_sep (hg'.cone le_rfl)
  rw [← hv, ← funext exactPart, jackTarget_sep] at h
  norm_num at h

end

end ChenKhareSahi.Jack.Source
