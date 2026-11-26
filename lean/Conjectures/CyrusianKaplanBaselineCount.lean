module
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
public import Mathlib.Data.Finset.Powerset
public import Mathlib.Data.Finset.Prod
public import Mathlib.Order.Interval.Finset.Nat

@[expose] public section
namespace CyrusianKaplan

open Finset
open scoped BigOperators

abbrev BaselineRow := Σ _ : ℕ, Finset ℕ × Finset ℕ

/-- For each allowed least positive low member t, choose r high
gaps from (g,g+t] and r−1 further low members from (t,g]. -/
def baselineRows (g r : ℕ) : Finset BaselineRow :=
  (Finset.Ioc (g/2) g).sigma (fun t=>
    (Finset.Ioc g (g+t)).powersetCard r ×ˢ (Finset.Ioc t g).powersetCard (r-1))

def baselineDecode (z : BaselineRow) : Finset ℕ × Finset ℕ :=
  (z.2.1,insert z.1 z.2.2)

def baselinePairs (g r : ℕ) : Finset (Finset ℕ × Finset ℕ) :=
  (baselineRows g r).image baselineDecode

private theorem baseline_tail_subset {g r t : ℕ} {A B : Finset ℕ}
    (h : (⟨t,A,B⟩:BaselineRow)∈baselineRows g r) : B⊆Finset.Ioc t g := by
  exact (Finset.mem_powersetCard.mp (Finset.mem_product.mp (Finset.mem_sigma.mp h).2).2).1

theorem baselineDecode_injOn (g r : ℕ) :
    ((baselineRows g r : Finset BaselineRow) : Set BaselineRow).InjOn baselineDecode := by
  rintro ⟨t,A,B⟩ hx ⟨s,C,D⟩ hy he
  have hxB := baseline_tail_subset hx
  have hyD := baseline_tail_subset hy
  have hA : A=C := congrArg Prod.fst he
  have hB : insert t B=insert s D := congrArg Prod.snd he
  have h1 : s≤t := by
    have ht : t∈insert s D := by rw [← hB]; exact Finset.mem_insert_self _ _
    rcases Finset.mem_insert.mp ht with h|h
    · exact h.ge
    · exact (Finset.mem_Ioc.mp (hyD h)).1.le
  have h2 : t≤s := by
    have hs : s∈insert t B := by rw [hB]; exact Finset.mem_insert_self _ _
    rcases Finset.mem_insert.mp hs with h|h
    · exact h.ge
    · exact (Finset.mem_Ioc.mp (hxB h)).1.le
  have ht : t=s := le_antisymm h2 h1
  subst s
  have hNt : t∉B := fun h=>lt_irrefl _ (Finset.mem_Ioc.mp (hxB h)).1
  have hMt : t∉D := fun h=>lt_irrefl _ (Finset.mem_Ioc.mp (hyD h)).1
  have hRest : B=D := by
    ext n
    by_cases hn : n=t
    · simp [hn,hNt,hMt]
    · have h : n∈insert t B ↔ n∈insert t D := by rw [hB]
      simpa only [Finset.mem_insert,hn,false_or] using h
  rw [hA,hRest]

/-- Exact finite version of the binomial baseline (3) of the
written proof, for every genus and fixed positive r. -/
theorem card_baselinePairs (g r : ℕ) :
    (baselinePairs g r).card =
      ∑ t ∈ Finset.Ioc (g/2) g, (g-t).choose (r-1)*t.choose r := by
  unfold baselinePairs
  rw [Finset.card_image_of_injOn (baselineDecode_injOn g r)]
  unfold baselineRows
  rw [Finset.card_sigma]
  simp only [Finset.card_product,Finset.card_powersetCard,Nat.card_Ioc,Nat.add_sub_cancel_left]
  apply Finset.sum_congr rfl
  intro t _
  exact Nat.mul_comm _ _

end CyrusianKaplan
