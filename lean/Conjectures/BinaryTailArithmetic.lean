import Conjectures.BinaryTailGraph

/-! Arithmetic tails represent exactly the ultimately additive sequences.
Equality on positive arguments suffices, as required for positive CUT piles. -/
namespace BinaryAutomata

def UltimatelyArithmetic (f : Nat → Nat) : Prop :=
  ∃ start period saltus, 0<period ∧
    ∀ n, start≤n → f (n+period)=f n+saltus

theorem Tail.value_add_period (T : Tail) (n : Nat) (hn : T.initialValues.length≤n) :
    T.value (n+T.period)=T.value n+T.saltus := by
  have hn' : ¬n<T.initialValues.length := by omega
  have hnp : ¬n+T.period<T.initialValues.length := by omega
  have hsub : n+T.period-T.initialValues.length=
      (n-T.initialValues.length)+T.period := by omega
  simp only [Tail.value,dite_eq_right hn',dite_eq_right hnp]
  simp only [hsub,Nat.add_div_right _ T.period_pos,Nat.add_mod,Nat.mod_self,
    Nat.add_zero,Nat.mod_mod,Nat.mul_add,Nat.mul_one]
  omega

theorem arithmetic_add_blocks (f : Nat → Nat) (start period saltus : Nat)
    (h : ∀ n, start≤n → f (n+period)=f n+saltus)
    (n k : Nat) (hn : start≤n) : f (n+period*k)=f n+saltus*k := by
  induction k with
  | zero => simp
  | succ k ih =>
    calc
      f (n+period*(k+1))=f (n+period*k)+saltus := by
        rw [Nat.mul_succ,←Nat.add_assoc]
        exact h _ (by omega)
      _=f n+saltus*(k+1) := by rw [ih,Nat.mul_succ]; omega

def Tail.ofArithmetic (f : Nat → Nat) (start period saltus : Nat) (hp : 0<period) : Tail := {
  initialValues := List.ofFn (fun i : Fin start => f i.val)
  period := period
  period_pos := hp
  block := fun r => f (start+r.val)
  saltus := saltus
}

theorem Tail.ofArithmetic_value (f : Nat → Nat) (start period saltus : Nat)
    (hp : 0<period) (h : ∀ n, start≤n → f (n+period)=f n+saltus) (n : Nat) :
    (Tail.ofArithmetic f start period saltus hp).value n=f n := by
  simp only [Tail.value,Tail.ofArithmetic,List.length_ofFn]
  split_ifs with hn
  · simp only [List.getElem_ofFn]
  · have heq : start+(n-start)%period+period*((n-start)/period)=n := by
      have hdiv := Nat.mod_add_div (n-start) period
      omega
    have hb := arithmetic_add_blocks f start period saltus h
      (start+(n-start)%period) ((n-start)/period) (by omega)
    rw [heq] at hb
    omega

theorem ultimatelyArithmetic_iff_representation (f : Nat → Nat) :
    UltimatelyArithmetic f ↔ ∃ T : Tail, ∀ n, 0<n → T.value n=f n := by
  constructor
  · rintro ⟨start,period,saltus,hp,h⟩
    exact ⟨Tail.ofArithmetic f start period saltus hp,
      fun n _ => Tail.ofArithmetic_value f start period saltus hp h n⟩
  · rintro ⟨T,hT⟩
    refine ⟨max 1 T.initialValues.length,T.period,T.saltus,T.period_pos,?_⟩
    intro n hn
    have hnpos : 0<n := by
      have := (Nat.le_max_left 1 T.initialValues.length).trans hn
      omega
    have hlarge := (Nat.le_max_right 1 T.initialValues.length).trans hn
    rw [←hT (n+T.period) (by omega),←hT n hnpos]
    exact T.value_add_period n hlarge

#print axioms Tail.value_add_period
#print axioms ultimatelyArithmetic_iff_representation
end BinaryAutomata
