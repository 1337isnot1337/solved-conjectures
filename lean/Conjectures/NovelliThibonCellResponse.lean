module
public import Conjectures.NovelliThibonLinearResponse
public import Conjectures.NovelliThibonDiagram

@[expose] public section
namespace NovelliThibon

open Classical

variable {A R : Type*} [LinearOrder A] [Fintype A] [CommSemiring R]

def cellWordWeight {μ : YoungDiagram} (x : A → R) (w : Cell μ → A) : R :=
  ∏ c : Cell μ,x (w c)

theorem cell_words_comparison {μ : YoungDiagram} (x : A → R) {a b : Cell μ} (hab : a ≠ b) :
    (∑ w : (Cell μ → A) with w b < w a,cellWordWeight x w) =
      alphabetPairSum x*(alphabetSum x)^(μ.card-2) := by
  classical
  let e := readingLabel μ
  let f : (Cell μ → A) ≃ (Fin μ.card → A) := Equiv.arrowCongr e (Equiv.refl A)
  have hf (w : Cell μ → A) (c : Cell μ) : f w (e c) = w c := by
    change w (e.symm (e c)) = w c
    rw [Equiv.symm_apply_apply]
  have hwt (w : Cell μ → A) : cellWordWeight x w = wordWeight x (f w) := by
    unfold cellWordWeight wordWeight
    have h := e.prod_comp (fun i => x (f w i))
    simpa only [hf] using h
  rw [← words_strict_comparison_weight x (show e a ≠ e b from fun h => hab (e.injective h)),
    Finset.sum_filter,Finset.sum_filter]
  apply Fintype.sum_equiv f
  intro w
  rw [hf,hf,hwt]

theorem cell_words_linear_response {μ : YoungDiagram} (x : A → R)
    (E : Finset (Cell μ × Cell μ)) (c : Cell μ × Cell μ → R) (hE : ∀ p ∈ E,p.1≠p.2) :
    (∑ w : (Cell μ → A),
      cellWordWeight x w * (∑ p ∈ E,if w p.2 < w p.1 then c p else 0)) =
      (∑ p ∈ E,c p)*(alphabetPairSum x*(alphabetSum x)^(μ.card-2)) := by
  classical
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm,Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro p hp
  rw [← cell_words_comparison x (hE p hp),Finset.mul_sum,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro w _
  by_cases h : w p.2 < w p.1
  · simp [h,mul_comm]
  · simp [h]

end NovelliThibon
