module
public import Conjectures.LassalleBoxSoundness
public import Conjectures.LassalleCatalanQuotient

@[expose] public section
namespace LassalleRefinement

noncomputable def determinantInputs (n l x r : ℝ) : Component → ℝ
  | .row => x
  | .down => n*(x-l)
  | .up => n*(r-x)
  | .curvature => n*(n-1)*(l-2*x+r)

theorem determinant_normalize (n l x r : ℝ) (hn : n≠0) :
    let w := determinantInputs n l x r
    (w .down*w .up)*(1-1/n)-w .row*w .curvature =
      n*(n-1)*(x^2-l*r) := by
  dsimp [determinantInputs]
  field_simp
  ring

theorem strictLassalle_of_determinant {n l x r : ℝ} (hn : 1<n)
    (h : let w := determinantInputs n l x r
      w .row*w .curvature < (w .down*w .up)*(1-1/n)) :
    l*r < x^2 := by
  have h₀ : 0<n := by linarith
  have hp := sub_pos.mpr h
  rw [determinant_normalize n l x r h₀.ne'] at hp
  exact sub_pos.mp (pos_of_mul_pos_right hp (mul_nonneg h₀.le (by linarith)))

theorem strictLassalle_scale_iff (k l x r : ℝ) (hk : 0<k) :
    (k*l)*(k*r) < (k*x)^2 ↔ l*r < x^2 := by
  have e1 : (k*l)*(k*r) = (l*r)*(k*k) := by ring
  have e2 : (k*x)^2 = x^2*(k*k) := by ring
  rw [e1,e2]
  exact ⟨fun h => lt_of_mul_lt_mul_right h (mul_nonneg hk.le hk.le),
    fun h => mul_lt_mul_of_pos_right h (mul_pos hk hk)⟩

theorem verifiedBox_quotientRow_strict {T Z : Interval} {k a : ℕ} {R s : ℝ}
    (hbox : passesBox T Z) (hk : 1<(2*k:ℝ)) (hs : 0<s)
    (ht : T.Contains ((a:ℝ)/(2*k:ℝ))) (hz : Z.Contains (1/(2*k:ℝ)))
    (hRlo : (rootLo:ℝ)≤R) (hRhi : R≤(rootHi:ℝ))
    (herr : ∀ c, |determinantInputs (2*k) (s*quotientRow k (a-1)) (s*quotientRow k a)
      (s*quotientRow k (a+1)) c-approximant R ((a:ℝ)/(2*k:ℝ)) (1/(2*k:ℝ)) c|≤1/1000000) :
    quotientRow k (a-1)*quotientRow k (a+1) < quotientRow k a^2 := by
  have hdet := passesBox_sound hbox ht hz hRlo hRhi herr
  have hq := strictLassalle_of_determinant hk hdet
  have hq' := (strictLassalle_scale_iff s _ _ _ hs).mp hq
  exact_mod_cast hq'

end LassalleRefinement
