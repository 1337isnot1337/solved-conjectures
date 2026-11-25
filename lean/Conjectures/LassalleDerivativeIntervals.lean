module
public import Conjectures.LassalleBernsteinIntervals

@[expose] public section
namespace LassalleRefinement

inductive Component
  | row | down | up | curvature
  deriving Inhabited, DecidableEq

def Component.degree : Component → ℕ
  | .row => 0
  | .down | .up => 1
  | .curvature => 2

def Component.offset : Component → ℕ
  | .row | .up => 0
  | .down | .curvature => 1

/-- Terms of the derivative of t^i(1-t)^j in the falling-factor basis. -/
def derivativeTerms (c : Component) (i j : ℕ) : List (ℕ × ℕ × ℤ) :=
  match c with
  | .row => [(i,j,1)]
  | .down | .up =>
    (if i=0 then [] else [(i-1,j,(i:ℤ))]) ++
      (if j=0 then [] else [(i,j-1,-(j:ℤ))])
  | .curvature =>
    (if i<2 then [] else [(i-2,j,(i:ℤ)*(i-1:ℕ))]) ++
    (if i=0 ∨ j=0 then [] else [(i-1,j-1,-2*(i:ℤ)*(j:ℤ))]) ++
    (if j<2 then [] else [(i,j-2,(j:ℤ)*(j-1:ℕ))])

def listIntervalSum {α : Type} (f : α → Interval) : List α → Interval
  | [] => Interval.zero
  | x::xs => (f x).add (listIntervalSum f xs)

theorem listIntervalSum_contains {α : Type} {f : α → Interval} {g : α → ℝ}
    (s : List α) (h : ∀ x∈s,(f x).Contains (g x)) :
    (listIntervalSum f s).Contains ((s.map g).sum) := by
  induction s with
  | nil => exact Interval.contains_zero
  | cons a s ih =>
    exact (h a (by simp)).add (ih (fun x hx => h x (by simp [hx])))

def certificateTerms : List (ℕ×ℕ) :=
  (List.range 15).flatMap fun i => (List.range (15-i)).map fun j => (i,j)

def derivativeI (T Z : Interval) (c : Component) (i j : ℕ) : Interval :=
  listIntervalSum (fun m => (bernsteinI T Z c.degree c.offset m.1 m.2.1).scaleBy m.2.2)
    (derivativeTerms c i j)

noncomputable def derivativeValue (t z : ℝ) (c : Component) (i j : ℕ) : ℝ :=
  ((derivativeTerms c i j).map fun m =>
    bernsteinTerm t z c.degree c.offset m.1 m.2.1 * (m.2.2:ℝ)).sum

def denomGood (Z : Interval) (c : Component) : Prop :=
  ∀ n : Fin 29, 0 < (denomI Z c.degree n).lo

private theorem eq_of_mem_optional_singleton {α : Type} {u v : α} {p : Prop}
    [Decidable p] (h : u∈(if p then [] else [v])) : u=v := by
  split_ifs at h
  · simp at h
  · exact List.mem_singleton.mp h

theorem derivativeTerm_degree {c : Component} {i j : ℕ} {u : ℕ×ℕ×ℤ}
    (h : u∈derivativeTerms c i j) : u.1+u.2.1 ≤ i+j := by
  cases c
  case row => simp only [derivativeTerms,List.mem_singleton] at h; rw [h]
  case down | up =>
    simp only [derivativeTerms,List.mem_append] at h
    rcases h with h|h
    · rw [eq_of_mem_optional_singleton h]
      exact Nat.add_le_add_right (Nat.sub_le ..) _
    · rw [eq_of_mem_optional_singleton h]
      exact Nat.add_le_add_left (Nat.sub_le ..) _
  case curvature =>
    simp only [derivativeTerms,List.mem_append] at h
    rcases h with (h|h)|h
    · rw [eq_of_mem_optional_singleton h]
      exact Nat.add_le_add_right (Nat.sub_le ..) _
    · rw [eq_of_mem_optional_singleton h]
      exact Nat.add_le_add (Nat.sub_le ..) (Nat.sub_le ..)
    · rw [eq_of_mem_optional_singleton h]
      exact Nat.add_le_add_left (Nat.sub_le ..) _

theorem derivativeI_contains {T Z : Interval} {t z : ℝ} (ht : T.Contains t) (hz : Z.Contains z)
    (c : Component) (hpos : denomGood Z c) (i j : ℕ) (hsmall : i+j≤28) :
    (derivativeI T Z c i j).Contains (derivativeValue t z c i j) := by
  apply listIntervalSum_contains
  intro u hu
  have hn : u.1+u.2.1<29 := lt_of_le_of_lt ((derivativeTerm_degree hu).trans hsmall) (by decide)
  exact (bernsteinI_contains ht hz _ _ _ _ (hpos ⟨u.1+u.2.1,hn⟩)).scaleBy _

theorem mem_certificateTerms {m : ℕ×ℕ} (h : m∈certificateTerms) :
    m.1+m.2≤14 := by
  simp only [certificateTerms,List.mem_flatMap,List.mem_range,List.mem_map] at h
  obtain ⟨i,hi,j,hj,h⟩ := h
  subst m
  omega

def approximantI (T Z : Interval) (c : Component) : Interval :=
  listIntervalSum (fun m => (coeffI m.1 m.2).mul (derivativeI T Z c (2*m.1) (2*m.2)))
    certificateTerms

noncomputable def approximant (R t z : ℝ) (c : Component) : ℝ :=
  (certificateTerms.map fun m => realCoeff R m.1 m.2 * derivativeValue t z c (2*m.1) (2*m.2)).sum

theorem approximantI_contains {T Z : Interval} {R t z : ℝ}
    (hRlo : (rootLo:ℝ)≤R) (hRhi : R≤(rootHi:ℝ)) (ht : T.Contains t) (hz : Z.Contains z)
    (c : Component) (hpos : denomGood Z c) :
    (approximantI T Z c).Contains (approximant R t z c) := by
  apply listIntervalSum_contains
  intro m hm
  have hsum := mem_certificateTerms hm
  exact (coeffI_contains hRlo hRhi m.1 m.2).mul
    (derivativeI_contains ht hz c hpos _ _ (by omega))

end LassalleRefinement
