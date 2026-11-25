module

public import Conjectures.LassalleDerivativeNorm
public import Conjectures.LassalleBernsteinBounds

@[expose] public section
namespace LassalleRefinement

private theorem mem_optional_cons_exact {α : Type} {x y : α} {p : Prop}
    [Decidable p] (h : x∈(if p then [] else [y])) : ¬p ∧ x=y := by
  split_ifs at h with hp
  · simp at h
  · exact ⟨hp,List.mem_singleton.mp h⟩

theorem derivativeTerm_total_degree {c : Component} {i j : ℕ} {u : ℕ×ℕ×ℤ}
    (h : u∈derivativeTerms c i j) : u.1+u.2.1+c.degree=i+j := by
  cases c
  case row => simp only [derivativeTerms,List.mem_singleton] at h; subst u; rfl
  case down | up =>
    simp only [derivativeTerms,List.mem_append] at h
    rcases h with h|h
    · obtain ⟨hi,rfl⟩ := mem_optional_cons_exact h
      change i-1+j+1=i+j
      omega
    · obtain ⟨hj,rfl⟩ := mem_optional_cons_exact h
      change i+(j-1)+1=i+j
      omega
  case curvature =>
    simp only [derivativeTerms,List.mem_append] at h
    rcases h with (h|h)|h
    · obtain ⟨hi,rfl⟩ := mem_optional_cons_exact h
      change i-2+j+2=i+j
      omega
    · obtain ⟨hij,rfl⟩ := mem_optional_cons_exact h
      change i-1+(j-1)+2=i+j
      omega
    · obtain ⟨hj,rfl⟩ := mem_optional_cons_exact h
      change i+(j-2)+2=i+j
      omega

noncomputable def fallingDerivative (c : Component) (x y i j : ℕ) : ℝ :=
  ((derivativeTerms c i j).map fun u => fallingRatio x y u.1 u.2.1*(u.2.2:ℝ)).sum

theorem derivativeValue_at_index {n a : ℕ} (hn : 0<n) (ha : a≤n)
    (c : Component) (i j : ℕ) (hdeg : i+j≤n)
    (hx : c.offset≤a) (hy : c.degree-c.offset≤n-a) :
    derivativeValue ((a:ℝ)/n) (1/(n:ℝ)) c i j =
      fallingDerivative c (a-c.offset) (n-a-(c.degree-c.offset)) i j := by
  unfold derivativeValue fallingDerivative
  congr 1
  apply List.map_congr_left
  intro u hu
  have htotal := derivativeTerm_total_degree hu
  have hdeg' : u.1+u.2.1≤n-c.degree := by omega
  rw [bernsteinTerm_at_index hn ha _ _ _ _ hdeg']
  have hsum : (a-c.offset)+(n-a-(c.degree-c.offset))=n-c.degree := by
    cases c <;> simp only [Component.offset,Component.degree] at * <;> omega
  unfold fallingRatio
  rw [hsum]

private theorem abs_sum_list_mono {α : Type} (s : List α) (f g : α→ℝ)
    (h : ∀ a∈s, |f a|≤g a) : |(s.map f).sum|≤(s.map g).sum := by
  induction s with
  | nil => simp
  | cons a s ih =>
    simp only [List.map_cons,List.sum_cons]
    exact (abs_add_le _ _).trans (add_le_add (h a (by simp)) (ih (fun b hb => h b (by simp [hb]))))

theorem abs_fallingDerivative_le (c : Component) (x y i j : ℕ) :
    |fallingDerivative c x y i j|≤derivativeSupNorm i j := by
  unfold fallingDerivative
  apply le_trans (abs_sum_list_mono (derivativeTerms c i j) _ _ ?_) (derivativeMass_bound c i j)
  intro u _
  rw [abs_mul]
  exact (mul_le_mul_of_nonneg_right (abs_fallingRatio_le_one ..) (abs_nonneg _)).trans_eq (one_mul _)

end LassalleRefinement
