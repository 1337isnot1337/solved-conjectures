module
public import Conjectures.PomeranceSarkozyArithmeticTV
public import Conjectures.PomeranceSarkozyProductVariation

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

def offsetCounts (I P : Finset ℕ) (S : Finset Incidence) (h : ↥I) : Fin (P.card+1) :=
  ⟨(P.filter fun p => (h.val,p)∈S).card,
    Nat.lt_succ_of_le (Finset.card_le_card (Finset.filter_subset _ _))⟩

theorem offsetCounts_arithmetic (I P : Finset ℕ) (L N : ℕ) (j : Fin N) (h : ↥I) :
    (offsetCounts I P (arithmeticObservation (I×ˢP) L j) h).val =
      (P.filter fun p => p∣L+j.val-h.val).card := by
  change (P.filter fun p => (h.val,p)∈arithmeticObservation (I×ˢP) L j).card=_
  congr 1
  ext p
  simp [arithmeticObservation,Finset.mem_product,h.property]

def crtWindowL1Bound (J : Finset Incidence) (N R : ℕ) : ℚ :=
  (((2*J.card+1)^R:ℕ):ℚ)/(N:ℚ) +
    ((2:ℚ)^(R+1)+1)*
      (2*((incidenceReciprocalMass J)^(R+1)/((R+1).factorial:ℚ)) +
        (J.card.choose (R+1):ℚ)/(N:ℚ))

/-- The same finite error bound holds for the joint vector of shifted
divisibility counts, not merely for the individual incidence atom laws. -/
theorem arithmetic_residue_offset_counts_l1 (I P : Finset ℕ) (L N R : ℕ)
    (hN : 0<N) (hP : ∀ p∈P,p.Prime) (hI : ∀ h∈I,∀ p∈P,h<p)
    (hstart : ∀ h∈I,h≤L) :
    finiteLawL1
      (pushFiniteLaw (fun S : ↥(I×ˢP).powerset => offsetCounts I P S.val)
        (fun S : ↥(I×ˢP).powerset => observationLaw (arithmeticObservation (I×ˢP) L (N:=N)) S.val))
      (pushFiniteLaw (fun S : ↥(I×ˢP).powerset => offsetCounts I P S.val)
        (fun S : ↥(I×ˢP).powerset => observationLaw (modelObservation (I×ˢP) (P:=P)) S.val))
      ≤ crtWindowL1Bound (I×ˢP) N R := by
  classical
  refine (push_finiteLawL1_le _ _ _).trans ?_
  unfold finiteLawL1
  rw [Finset.sum_coe_sort (I×ˢP).powerset (fun S =>
    |observationLaw (arithmeticObservation (I×ˢP) L (N:=N)) S -
      observationLaw (modelObservation (I×ˢP) (P:=P)) S|)]
  exact arithmetic_model_window_l1 (I×ˢP) P L N R hN hP
    (fun _ he => (Finset.mem_product.mp he).2)
    (fun _ he => hI _ (Finset.mem_product.mp he).1 _ (Finset.mem_product.mp he).2)
    (fun _ he => hstart _ (Finset.mem_product.mp he).1)

end PomeranceSarkozy
