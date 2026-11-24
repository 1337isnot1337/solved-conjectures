module

public import Mathlib.Tactic

/-! Local signed-mass count for a two-vertex part of the cocktail-party graph. -/

@[expose] public section
namespace HKMEhrhart
open Finset

def positiveMass (a : ℤ) : ℤ := max a 0
def negativeMass (a : ℤ) : ℤ := max (-a) 0

def pairMass (w : ℤ × ℤ) (u v : ℕ) : Prop :=
  positiveMass w.1 + positiveMass w.2 = u ∧
    negativeMass w.1 + negativeMass w.2 = v

def nonnegPair (u : ℕ) : ℕ ↪ (ℤ × ℤ) :=
  ⟨fun j => (↑j, (u : ℤ) - j), by
    intro a b h
    have hh := congrArg Prod.fst h
    exact Int.ofNat.inj hh⟩

def nonposPair (v : ℕ) : ℕ ↪ (ℤ × ℤ) :=
  ⟨fun j => (-(j : ℤ), (j : ℤ) - v), by
    intro a b h
    have hh := congrArg Prod.fst h
    change -(a : ℤ) = -(b : ℤ) at hh
    omega⟩

def pairs (u v : ℕ) : Finset (ℤ × ℤ) :=
  if v = 0 then (range (u+1)).map (nonnegPair u)
  else if u = 0 then (range (v+1)).map (nonposPair v)
  else {((u : ℤ), -(v : ℤ)), (-(v : ℤ), (u : ℤ))}

private theorem pair_cases (a b : ℤ) (u v : ℕ) :
    pairMass (a,b) u v ↔
      (v = 0 ∧ 0 ≤ a ∧ 0 ≤ b ∧ a+b = u) ∨
      (u = 0 ∧ a ≤ 0 ∧ b ≤ 0 ∧ -(a+b) = v) ∨
      (0 < u ∧ 0 < v ∧
        ((a = (u : ℤ) ∧ b = -(v : ℤ)) ∨ (a = -(v : ℤ) ∧ b = (u : ℤ)))) := by
  unfold pairMass positiveMass negativeMass
  omega

theorem mem_pairs_iff (w : ℤ × ℤ) (u v : ℕ) : w ∈ pairs u v ↔ pairMass w u v := by
  obtain ⟨a,b⟩ := w
  rw [pair_cases]
  by_cases hv : v = 0
  · simp only [pairs, hv, ite_true, mem_map, mem_range, nonnegPair,
      Function.Embedding.coeFn_mk, Prod.mk.injEq]
    constructor
    · rintro ⟨j,hj,haj,hbj⟩
      exact Or.inl ⟨True.intro, by omega, by omega, by omega⟩
    · intro h
      refine ⟨a.toNat, ?_, ?_, ?_⟩ <;> omega
  · by_cases hu : u = 0
    · simp only [pairs, hv, hu, ite_false, ite_true, mem_map, mem_range, nonposPair,
        Function.Embedding.coeFn_mk, Prod.mk.injEq]
      constructor
      · rintro ⟨j,hj,haj,hbj⟩
        exact Or.inr (Or.inl ⟨True.intro, by omega, by omega, by omega⟩)
      · intro h
        have hs : a ≤ 0 ∧ b ≤ 0 ∧ -(a+b) = v := by
          simpa [hv,hu] using h
        refine ⟨(-a).toNat, ?_, ?_, ?_⟩ <;> omega
    · have hup : 0 < u := by omega
      have hvp : 0 < v := by omega
      simp [pairs, hv, hu, hup, hvp]

theorem card_pairs (u v : ℕ) :
    (pairs u v).card = if u = 0 ∨ v = 0 then u+v+1 else 2 := by
  by_cases hv : v = 0
  · simp [pairs, hv]
  · by_cases hu : u = 0
    · simp [pairs, hv, hu]
    · have h : ((u : ℤ), -(v : ℤ)) ≠ (-(v : ℤ), (u : ℤ)) := by
        intro h'
        have hh := congrArg Prod.fst h'
        change (u : ℤ) = -(v : ℤ) at hh
        omega
      simp [pairs, hv, hu, h]

end HKMEhrhart
