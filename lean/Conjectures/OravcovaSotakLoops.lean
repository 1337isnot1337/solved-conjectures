import Conjectures.OravcovaSotakBasic

/-! Finite words with a common boundary state concatenate, and every such
loop gives an actual periodic coloring of the integer distance graph. -/

namespace OravcovaSotak

/-- A word of length `p+w`, with equal initial and final windows of
length `w`, and all required color inequalities in that word. -/
def IsLoop (D : List ℕ) (k w p : ℕ) (u f : ℕ → ℕ) : Prop :=
  0 < p ∧
  (∀ i : Fin (p+w), f i.val < k) ∧
  (∀ d ∈ D, ∀ i : Fin (p+w), i.val+d < p+w → f i.val ≠ f (i.val+d)) ∧
  (∀ j : Fin w, f j.val = u j.val) ∧
  (∀ j : Fin w, f (p+j.val) = u j.val)

instance (D : List ℕ) (k w p : ℕ) (u f : ℕ → ℕ) : Decidable (IsLoop D k w p u f) :=
  inferInstanceAs (Decidable (0 < p ∧
    (∀ i : Fin (p+w), f i.val < k) ∧
    (∀ d ∈ D, ∀ i : Fin (p+w), i.val+d < p+w → f i.val ≠ f (i.val+d)) ∧
    (∀ j : Fin w, f j.val = u j.val) ∧
    (∀ j : Fin w, f (p+j.val) = u j.val)))

def LoopExists (D : List ℕ) (k w : ℕ) (u : ℕ → ℕ) (p : ℕ) : Prop :=
  ∃ f : ℕ → ℕ, IsLoop D k w p u f

theorem loop_step {D : List ℕ} {k w p : ℕ} {u f : ℕ → ℕ}
    (h : IsLoop D k w p u f) (j : ℕ) (hj : j < w) : f (p+j) = f j :=
  (h.2.2.2.2 ⟨j,hj⟩).trans (h.2.2.2.1 ⟨j,hj⟩).symm

theorem loop_reduce {D : List ℕ} {k w p : ℕ} {u f : ℕ → ℕ}
    (h : IsLoop D k w p u f) (i : ℕ) (hi : i < p+w) : f i = f (i%p) := by
  have hp := h.1
  induction i using Nat.strong_induction_on with
  | h i ih =>
      by_cases hip : i < p
      · rw [Nat.mod_eq_of_lt hip]
      · have hpi : p ≤ i := by omega
        have hmod : (i-p)%p = i%p := by
          conv_rhs => rw [← Nat.sub_add_cancel hpi]
          simp only [Nat.add_mod, Nat.mod_self, Nat.add_zero, Nat.mod_mod]
        calc
          f i = f (p+(i-p)) := by congr 1; omega
          _ = f (i-p) := loop_step h (i-p) (by omega)
          _ = f ((i-p)%p) := ih (i-p) (by omega) (by omega)
          _ = f (i%p) := congrArg f hmod

theorem loop_wordCertificate {D : List ℕ} {k w p : ℕ} {u f : ℕ → ℕ}
    (hwidth : ∀ d ∈ D, d ≤ w) (h : IsLoop D k w p u f) :
    WordCertificate D k p f := by
  constructor
  · intro i
    exact h.2.1 ⟨i.val, by have := i.isLt; omega⟩
  · intro d hd i
    have hdw := hwidth d hd
    have hi := i.isLt
    have hproper := h.2.2.1 d hd ⟨i.val, by omega⟩
      (by change i.val+d < p+w; omega)
    rwa [loop_reduce h (i.val+d) (by omega)] at hproper

theorem loop_hasPeriod {D : List ℕ} {k w p : ℕ} {u f : ℕ → ℕ}
    (hwidth : ∀ d ∈ D, d ≤ w) (h : IsLoop D k w p u f) : HasPeriod D k p :=
  wordCertificate_hasPeriod D k p f h.1 (loop_wordCertificate hwidth h)

theorem loopExists_hasPeriod {D : List ℕ} {k w p : ℕ} {u : ℕ → ℕ}
    (hwidth : ∀ d ∈ D, d ≤ w) (h : LoopExists D k w u p) : HasPeriod D k p := by
  obtain ⟨f,hf⟩ := h
  exact loop_hasPeriod hwidth hf

def concatenate (p : ℕ) (f g : ℕ → ℕ) (i : ℕ) : ℕ :=
  if i < p then f i else g (i-p)

theorem concatenate_left {D : List ℕ} {k w p q : ℕ} {u f g : ℕ → ℕ}
    (hf : IsLoop D k w p u f) (hg : IsLoop D k w q u g)
    (i : ℕ) (hi : i < p+w) : concatenate p f g i = f i := by
  by_cases hip : i < p
  · simp only [concatenate, ite_eq_left hip]
  · have hj : i-p < w := by omega
    calc
      concatenate p f g i = g (i-p) := by simp only [concatenate, ite_eq_right hip]
      _ = u (i-p) := hg.2.2.2.1 ⟨i-p,hj⟩
      _ = f (p+(i-p)) := (hf.2.2.2.2 ⟨i-p,hj⟩).symm
      _ = f i := by congr 1; omega

theorem concatenate_right (p : ℕ) (f g : ℕ → ℕ) (i : ℕ) (hi : p ≤ i) :
    concatenate p f g i = g (i-p) := by
  simp only [concatenate, ite_eq_right (by omega : ¬i < p)]

theorem loop_concatenate {D : List ℕ} {k w p q : ℕ} {u f g : ℕ → ℕ}
    (hwidth : ∀ d ∈ D, d ≤ w)
    (hf : IsLoop D k w p u f) (hg : IsLoop D k w q u g) :
    IsLoop D k w (p+q) u (concatenate p f g) := by
  have hp := hf.1
  have hq := hg.1
  refine ⟨by omega, ?_, ?_, ?_, ?_⟩
  · intro i
    have hi := i.isLt
    by_cases hip : i.val < p
    · rw [concatenate_left hf hg i.val (by omega)]
      exact hf.2.1 ⟨i.val,by omega⟩
    · rw [concatenate_right p f g i.val (by omega)]
      exact hg.2.1 ⟨i.val-p,by omega⟩
  · intro d hd i hid
    have hi := i.isLt
    have hdw := hwidth d hd
    by_cases hip : i.val < p
    · rw [concatenate_left hf hg i.val (by omega),
        concatenate_left hf hg (i.val+d) (by omega)]
      exact hf.2.2.1 d hd ⟨i.val,by omega⟩
        (by change i.val+d < p+w; omega)
    · rw [concatenate_right p f g i.val (by omega),
        concatenate_right p f g (i.val+d) (by omega)]
      rw [show i.val+d-p = (i.val-p)+d by omega]
      exact hg.2.2.1 d hd ⟨i.val-p,by omega⟩
        (by change i.val-p+d < q+w; omega)
  · intro j
    rw [concatenate_left hf hg j.val (by have := j.isLt; omega)]
    exact hf.2.2.2.1 j
  · intro j
    rw [concatenate_right p f g (p+q+j.val) (by omega)]
    rw [show p+q+j.val-p = q+j.val by omega]
    exact hg.2.2.2.2 j

theorem loopExists_add {D : List ℕ} {k w p q : ℕ} {u : ℕ → ℕ}
    (hwidth : ∀ d ∈ D, d ≤ w)
    (hp : LoopExists D k w u p) (hq : LoopExists D k w u q) :
    LoopExists D k w u (p+q) := by
  obtain ⟨f,hf⟩ := hp
  obtain ⟨g,hg⟩ := hq
  exact ⟨concatenate p f g, loop_concatenate hwidth hf hg⟩

/-- A run of `q` consecutive available loop lengths, together with an
available loop of length `q`, supplies every subsequent period. -/
theorem loopExists_all_ge {D : List ℕ} {k w q B : ℕ} {u : ℕ → ℕ}
    (hwidth : ∀ d ∈ D, d ≤ w) (hq : 0 < q)
    (hstep : LoopExists D k w u q)
    (hbase : ∀ r : Fin q, LoopExists D k w u (B+r.val)) :
    ∀ p : ℕ, B ≤ p → LoopExists D k w u p := by
  intro p
  induction p using Nat.strong_induction_on with
  | h p ih =>
      intro hp
      by_cases hsmall : p < B+q
      · have hr : p-B < q := by omega
        have hh := hbase ⟨p-B,hr⟩
        simpa only [show B+(p-B) = p by omega] using hh
      · have hh := ih (p-q) (by omega) (by omega)
        have hsum := loopExists_add hwidth hh hstep
        simpa only [Nat.sub_add_cancel (by omega : q ≤ p)] using hsum

/-- All sufficiently large periods for the auxiliary distance `r` give
a coloring for every sufficiently large added distance. -/
theorem extra_distance_of_large_periods (W : List ℕ) (k r g x : ℕ)
    (hr : 0 < r) (hx : g+r < x)
    (hperiods : ∀ p : ℕ, g < p → HasPeriod (r :: W) k p) :
    (graph (x :: W)).Colorable k := by
  have hp : g < x-r := by omega
  apply hasPeriod_colorable (transport_extra_distance W k (x-r) r x hr
    (hperiods (x-r) hp) ?_)
  left
  refine ⟨1, ?_⟩
  rw [mul_one]
  exact (Int.natCast_sub (by omega : r ≤ x)).symm

end OravcovaSotak
