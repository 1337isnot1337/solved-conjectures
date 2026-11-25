module
public import Conjectures.LassalleDerivativeIntervals

@[expose] public section
namespace LassalleRefinement

def certificateError : ℤ := divUp intervalScale 1000000

theorem certificateError_large_enough :
    (intervalScale:ℝ)*(1/1000000)≤(certificateError:ℝ) := by
  have h := le_divUp_mul intervalScale 1000000 (by decide)
  have hh : (intervalScale:ℝ)≤(certificateError:ℝ)*1000000 := by exact_mod_cast h
  linarith

def enclosureI (T Z : Interval) (c : Component) : Interval :=
  (approximantI T Z c).inflate certificateError

def passesBox (T Z : Interval) : Prop :=
  (denomGood Z .row ∧ denomGood Z .down ∧ denomGood Z .up ∧ denomGood Z .curvature) ∧
  ((enclosureI T Z .row).mul (enclosureI T Z .curvature)).hi <
    (((enclosureI T Z .down).mul (enclosureI T Z .up)).mul (Interval.one.sub Z)).lo

instance denomGoodDecidable (Z : Interval) (c : Component) : Decidable (denomGood Z c) :=
  decidable_of_iff ((List.range 29).all fun n => decide (0<(denomI Z c.degree n).lo)) (by
    constructor
    · intro h n
      exact of_decide_eq_true (List.all_eq_true.mp h n.val (List.mem_range.mpr n.isLt))
    · intro h
      apply List.all_eq_true.mpr
      intro n hn
      exact decide_eq_true (h ⟨n,List.mem_range.mp hn⟩))

instance passesBoxDecidable (T Z : Interval) : Decidable (passesBox T Z) :=
  by unfold passesBox; infer_instance

theorem enclosureI_contains {T Z : Interval} {R t z y : ℝ} (c : Component)
    (hRlo : (rootLo:ℝ)≤R) (hRhi : R≤(rootHi:ℝ)) (ht : T.Contains t) (hz : Z.Contains z)
    (hpos : denomGood Z c) (hy : |y-approximant R t z c|≤1/1000000) :
    (enclosureI T Z c).Contains y :=
  (approximantI_contains hRlo hRhi ht hz c hpos).inflate
    ((mul_le_mul_of_nonneg_left hy intervalScale_cast_pos.le).trans certificateError_large_enough)

/-- The certificate checks the determinant uniformly inside each box,
given the four analytical approximation inequalities. -/
theorem passesBox_sound {T Z : Interval} {R t z : ℝ} {w : Component → ℝ}
    (h : passesBox T Z) (ht : T.Contains t) (hz : Z.Contains z)
    (hRlo : (rootLo:ℝ)≤R) (hRhi : R≤(rootHi:ℝ))
    (herror : ∀ c, |w c-approximant R t z c|≤1/1000000) :
    w .row * w .curvature < (w .down * w .up)*(1-z) := by
  have hq := enclosureI_contains .row hRlo hRhi ht hz h.1.1 (herror .row)
  have hd := enclosureI_contains .down hRlo hRhi ht hz h.1.2.1 (herror .down)
  have hu := enclosureI_contains .up hRlo hRhi ht hz h.1.2.2.1 (herror .up)
  have hc := enclosureI_contains .curvature hRlo hRhi ht hz h.1.2.2.2 (herror .curvature)
  exact Interval.lt_of_separated ((hd.mul hu).mul (Interval.contains_one.sub hz)) (hq.mul hc) h.2

def Interval.splitLo (A : Interval) : Interval := ⟨A.lo,(A.lo+A.hi)/2⟩
def Interval.splitHi (A : Interval) : Interval := ⟨(A.lo+A.hi)/2,A.hi⟩

theorem Interval.Contains.split {A : Interval} {x : ℝ} (h : A.Contains x) :
    A.splitLo.Contains x ∨ A.splitHi.Contains x := by
  rcases le_total ((intervalScale:ℝ)*x) (((A.lo+A.hi)/2:ℤ):ℝ) with hh|hh
  · exact Or.inl ⟨h.1,hh⟩
  · exact Or.inr ⟨hh,h.2⟩

inductive BoxSplit
  | leaf
  | first (lower upper : BoxSplit)
  | second (lower upper : BoxSplit)

def ValidBoxTree : BoxSplit → Interval → Interval → Prop
  | .leaf,T,Z => passesBox T Z
  | .first a b,T,Z => ValidBoxTree a T.splitLo Z ∧ ValidBoxTree b T.splitHi Z
  | .second a b,T,Z => ValidBoxTree a T Z.splitLo ∧ ValidBoxTree b T Z.splitHi

instance validBoxTreeDecidable (u : BoxSplit) (T Z : Interval) : Decidable (ValidBoxTree u T Z) :=
  match u with
  | .leaf => passesBoxDecidable T Z
  | .first a b =>
    letI := validBoxTreeDecidable a T.splitLo Z
    letI := validBoxTreeDecidable b T.splitHi Z
    inferInstanceAs (Decidable (ValidBoxTree a T.splitLo Z ∧ ValidBoxTree b T.splitHi Z))
  | .second a b =>
    letI := validBoxTreeDecidable a T Z.splitLo
    letI := validBoxTreeDecidable b T Z.splitHi
    inferInstanceAs (Decidable (ValidBoxTree a T Z.splitLo ∧ ValidBoxTree b T Z.splitHi))

theorem validBoxTree_sound (u : BoxSplit) {T Z : Interval} {R t z : ℝ} {w : Component → ℝ}
    (h : ValidBoxTree u T Z) (ht : T.Contains t) (hz : Z.Contains z)
    (hRlo : (rootLo:ℝ)≤R) (hRhi : R≤(rootHi:ℝ))
    (herror : ∀ c, |w c-approximant R t z c|≤1/1000000) :
    w .row * w .curvature < (w .down * w .up)*(1-z) := by
  induction u generalizing T Z with
  | leaf => exact passesBox_sound h ht hz hRlo hRhi herror
  | first a b ia ib =>
    rcases ht.split with hl|hu
    · exact ia h.1 hl hz
    · exact ib h.2 hu hz
  | second a b ia ib =>
    rcases hz.split with hl|hu
    · exact ia h.1 ht hl
    · exact ib h.2 ht hu

end LassalleRefinement
