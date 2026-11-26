import Conjectures.CircularInsertionRotations

/-! The internal edges of the second matching in the three-block construction,
indexed by half their length inside the long interval. -/

namespace CircularIndex.Insertion.ThreeBlock

/-- Offsets in the long interval. The two nests are taken on its even and
odd vertices. In each congruence class one of the nest edges is replaced. -/
inductive Internal (N : ℕ) : ℕ → ℕ → ℕ → Prop where
  | evenNest {i t : ℕ} (hi : 2≤i) (ht : 0<t) (center : 2*i+t+1=N)
      (h1 : N%4≠1 ∨ 4*i+1≠N) (h2 : N%4≠2 ∨ 4*i+2≠N)
      (h3 : N%4≠3 ∨ 4*i≠N+1) : Internal N t (2*i) (2*(i+t))
  | oddNest {i t : ℕ} (ht : 0<t) (center : 2*i+t+2=N)
      (h0 : N%4≠0 ∨ 4*i+4≠N) : Internal N t (2*i+1) (2*(i+t)+1)
  | evenReplacement (he : N%2=0) : Internal N (N/2) (N-1) (2*N-1)
  | oneReplacement (h1 : N%4=1) : Internal N ((N-1)/2) 0 (N-1)
  | threeReplacement (h3 : N%4=3) : Internal N ((N-3)/2) 2 (N-1)

/-- All differences from one to N−2 occur except N−3. -/
theorem internal_exists {N t : ℕ} (hN : 12≤N) (ht : 1≤t) (hl : t≤N-2) (hx : t≠N-3) :
    ∃ a b, Internal N t a b := by
  by_cases h₀ : N%2=0 ∧ t=N/2
  · exact h₀.2 ▸ ⟨_,_,.evenReplacement h₀.1⟩
  by_cases h₁ : N%4=1 ∧ t=(N-1)/2
  · exact h₁.2 ▸ ⟨_,_,.oneReplacement h₁.1⟩
  by_cases h₃ : N%4=3 ∧ t=(N-3)/2
  · exact h₃.2 ▸ ⟨_,_,.threeReplacement h₃.1⟩
  by_cases h : (N-1-t)%2=0
  · let i := (N-1-t)/2
    have hc : 2*i+t+1=N := by dsimp [i]; omega
    exact ⟨_,_,.evenNest (i := i) (by omega) ht hc (by omega) (by omega) (by omega)⟩
  · let i := (N-2-t)/2
    have hc : 2*i+t+2=N := by dsimp [i]; omega
    exact ⟨_,_,.oddNest ht hc (by omega)⟩

theorem internal_bounds {N t a b : ℕ} (hN : 12≤N) (h : Internal N t a b) :
    a<b ∧ b<2*N ∧ b=a+2*t := by
  cases h <;> omega

theorem internal_matching {N t s a b c d : ℕ} (hN : 12≤N)
    (h : Internal N t a b) (k : Internal N s c d)
    (hv : a=c ∨ a=d ∨ b=c ∨ b=d) : t=s := by
  cases h <;> cases k <;> omega

/-- The six cross edges occupy exactly the holes of the two nests described
in Section 4.2. Each listed offset is unused by every internal edge. -/
def Hole (N v : ℕ) : Prop :=
  (N%2=0 ∧ (v=0 ∨ v=2 ∨ v=2*N-4 ∨ v=2*N-2 ∨ v=N/2-1 ∨ v=3*N/2-1)) ∨
  (N%4=1 ∧ (v=2 ∨ v=2*N-4 ∨ v=2*N-2 ∨ v=2*N-1 ∨ v=(N-1)/2 ∨ v=3*(N-1)/2)) ∨
  (N%4=3 ∧ (v=0 ∨ v=2*N-4 ∨ v=2*N-2 ∨ v=2*N-1 ∨ v=(N+1)/2 ∨ v=(3*N-5)/2))

theorem internal_avoids_holes {N t a b v : ℕ} (hN : 12≤N)
    (h : Internal N t a b) (hv : Hole N v) : a≠v ∧ b≠v := by
  unfold Hole at hv
  cases h <;> omega

end CircularIndex.Insertion.ThreeBlock
