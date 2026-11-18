import Conjectures.CutPeriodGraph

/-! Exact additive-period parameters of the proposed sequence. These become
parameters of the games only after their mex equations are established. -/
namespace CutPeriod

def AdditiveFrom (start period saltus : Nat) : Prop :=
  ∀ n, start≤n → value (n+period)=value n+saltus

theorem value_add_twelve (n : Nat) (hn : 7≤n) : value (n+12)=value n+8 := by
  have hn' : 7≤n+12 := by omega
  rw [value_tail _ hn',value_tail _ hn]
  have hsub : n+12-7=(n-7)+12 := by omega
  rw [hsub]
  simp only [Nat.add_mod,Nat.mod_self,Nat.add_zero,Nat.mod_mod]
  omega

theorem value_add_blocks (n k : Nat) (hn : 7≤n) :
    value (n+12*k)=value n+8*k := by
  induction k with
  | zero => simp
  | succ k ih =>
    have harg : n+12*(k+1)=(n+12*k)+12 := by omega
    rw [harg,value_add_twelve _ (by omega),ih]
    omega

/-- An eventual additive identity descends to every position in the tail. -/
theorem descend_additive (start period saltus : Nat)
    (h : AdditiveFrom start period saltus) : AdditiveFrom 7 period saltus := by
  intro n hn
  have hlate := h (n+12*start) (by omega)
  have harg : n+12*start+period=(n+period)+12*start := by omega
  rw [harg,value_add_blocks _ _ (by omega),value_add_blocks _ _ hn] at hlate
  omega

theorem candidate_period : AdditiveFrom 7 12 8 := value_add_twelve

/-- No positive period below twelve can have any eventual additive saltus. -/
theorem candidate_least_period (start period saltus : Nat) (hp : 0<period)
    (h : AdditiveFrom start period saltus) : 12≤period := by
  by_contra hsmall
  have hcheck : ∀ p : Fin 12, 0<p.val → ∃ r : Fin 12,
      value (7+r.val+p.val)+value 7 ≠ value (7+r.val)+value (7+p.val) := by decide
  obtain ⟨r,hr⟩ := hcheck ⟨period,by omega⟩ hp
  have htail := descend_additive start period saltus h
  have hzero := htail 7 (by omega)
  have hrow := htail (7+r.val) (by omega)
  dsimp only at hr
  omega

theorem candidate_saltus (start saltus : Nat)
    (h : AdditiveFrom start 12 saltus) : saltus=8 := by
  have hseven := descend_additive start 12 saltus h 7 (by omega)
  have h7 : value 7=3 := by decide
  have h19 : value 19=11 := by decide
  rw [h7] at hseven
  change value 19=3+saltus at hseven
  omega

/-- The identity starts at pile seven and cannot start at pile six or earlier. -/
theorem candidate_least_start (start : Nat) : AdditiveFrom start 12 8 ↔ 7≤start := by
  constructor
  · intro h
    by_contra hs
    have hbad := h 6 (by omega)
    have hfinite : value 18≠value 6+8 := by decide
    exact hfinite hbad
  · intro hs n hn
    exact value_add_twelve n (by omega)

#print axioms candidate_least_period
#print axioms candidate_least_start
end CutPeriod
