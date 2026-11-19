import Conjectures.LonelinessModularLift
import Conjectures.LonelinessNormalization

/-! Finite proof-carrying binary search trees. Every branch contains all bit
choices. A successful check therefore proves coverage of every integer tuple
in the parent residue class without any assumption that a search terminates. -/

namespace Loneliness.Modular.Search

def Represents {n : ℕ} (m : ℕ) (x v : Fin n → ℕ) : Prop :=
  ∀ i, v i%m=x i

def Primitive {n : ℕ} (v : Fin n → ℕ) : Prop :=
  Normalization.gcd (List.ofFn v)=1

inductive Tree (n : ℕ) where
  | witness (time : ℕ)
  | allEven
  | terminal (index : ℕ)
  | branch (children : (Fin n → Bool) → Tree n)

def check {n : ℕ} (k : ℕ) (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool) :
    Tree n → ℕ → (Fin n → ℕ) → Bool
  | .witness t, m, x => decide (Witness k m t (List.ofFn x))
  | .allEven, m, x => decide (m%2=0 ∧ ∀ i, x i%2=0)
  | .terminal index, m, x => terminal m x index
  | .branch children, m, x =>
      decide (∀ bits : Fin n → Bool, check k terminal (children bits)
        (2*m) (binaryLift m x bits)=true)

theorem common_dvd_gcd (d : ℕ) (ds : List ℕ)
    (h : ∀ a∈ds, d∣a) : d∣Normalization.gcd ds := by
  induction ds with
  | nil => exact dvd_zero _
  | cons a ds ih =>
    apply Nat.dvd_gcd
    · exact h a (by simp)
    · exact ih (fun b hb => h b (by simp [hb]))

theorem allEven_not_primitive {n m : ℕ} {x v : Fin n → ℕ}
    (hm : m%2=0) (hx : ∀ i, x i%2=0) (hrep : Represents m x v) :
    ¬ Primitive v := by
  have hmdvd : 2∣m := Nat.dvd_of_mod_eq_zero hm
  have hdiv (i : Fin n) : 2∣v i := by
    apply Nat.dvd_of_mod_eq_zero
    calc
      v i%2 = (v i%m)%2 := (Nat.mod_mod_of_dvd _ hmdvd).symm
      _ = 0 := by rw [hrep i,hx i]
  intro hp
  have hg := common_dvd_gcd 2 (List.ofFn v) (by
    intro a ha
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp ha
    exact hdiv i)
  rw [hp] at hg
  norm_num at hg

/-- A terminal validator has to prove its own mathematical conclusion.
The generic tree checker never accepts an unresolved node. -/
def TerminalSound {n : ℕ} (k : ℕ)
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool)
    (conclusion : (Fin n → ℕ) → Prop) : Prop :=
  ∀ m x index, 0<m → (∀ i, x i<m) → terminal m x index=true →
    ∀ v, Represents m x v → Primitive v →
      value (List.ofFn v)<(1 : ℝ)/k → conclusion v

theorem check_sound {n k : ℕ} (hk : 2≤k)
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool)
    (conclusion : (Fin n → ℕ) → Prop) (hterminal : TerminalSound k terminal conclusion)
    (tree : Tree n) : ∀ m x, 0<m → (∀ i, x i<m) → check k terminal tree m x=true →
      ∀ v, Represents m x v → Primitive v →
        value (List.ofFn v)<(1 : ℝ)/k → conclusion v := by
  induction tree with
  | witness t =>
    intro m x hm hx hcheck v hrep _hp hlow
    have hw : Witness k m t (List.ofFn x) := of_decide_eq_true hcheck
    have hmods (i : Fin n) : v i%m=x i%m := by
      rw [hrep i,Nat.mod_eq_of_lt (hx i)]
    have hwv := (witness_ofFn_mod_congr hmods).mpr hw
    exact False.elim ((not_le_of_gt hlow) (witness_value_lower hk hm hwv))
  | allEven =>
    intro m x _hm _hx hcheck v hrep hp _hlow
    have he : m%2=0 ∧ ∀ i, x i%2=0 := of_decide_eq_true hcheck
    exact False.elim (allEven_not_primitive he.1 he.2 hrep hp)
  | terminal index =>
    intro m x hm hx hcheck v hrep hp hlow
    exact hterminal m x index hm hx hcheck v hrep hp hlow
  | branch children ih =>
    intro m x hm hx hcheck v hrep hp hlow
    have hall : ∀ bits, check k terminal (children bits) (2*m) (binaryLift m x bits)=true :=
      of_decide_eq_true hcheck
    have hparent (i : Fin n) : (v i%(2*m))%m=x i := by
      rw [Nat.mod_mod_of_dvd _ (show m∣2*m from ⟨2,by omega⟩)]
      exact hrep i
    obtain ⟨bits,hbits⟩ := binaryLift_complete hx
      (fun i => Nat.mod_lt (v i) (show 0<2*m by omega)) hparent
    exact ih bits (2*m) (binaryLift m x bits) (by omega)
      (binaryLift_lt hx bits) (hall bits) v (fun i => congrFun hbits i) hp hlow

def rejectTerminal {n : ℕ} : ℕ → (Fin n → ℕ) → ℕ → Bool := fun _ _ _ => false

theorem rejectTerminal_sound {n k : ℕ} (conclusion : (Fin n → ℕ) → Prop) :
    TerminalSound k rejectTerminal conclusion := by
  intro m x index _hm _hx hcheck
  exact False.elim (Bool.false_ne_true hcheck)

/-- A finite witness-only tree proves an actual lower bound for every
primitive integer tuple in its initial residue class. -/
theorem checked_lower_bound {n k m : ℕ} (hk : 2≤k) (hm : 0<m)
    (x : Fin n → ℕ) (hx : ∀ i, x i<m) (tree : Tree n)
    (hcheck : check k rejectTerminal tree m x=true)
    (v : Fin n → ℕ) (hrep : Represents m x v) (hp : Primitive v) :
    (1 : ℝ)/k≤value (List.ofFn v) := by
  by_contra h
  have hlow : value (List.ofFn v)<(1 : ℝ)/k := lt_of_not_ge h
  exact check_sound hk rejectTerminal (fun _ => False) (rejectTerminal_sound _)
    tree m x hm hx hcheck v hrep hp hlow

/-- The four residues above `(1,2)` modulo five. Three have witnesses;
the remaining child consists entirely of even coordinates. -/
def pairExample : Tree 2 := .branch (fun bits =>
  if bits 0 then
    if bits 1 then .witness 1 else .allEven
  else
    if bits 1 then .witness 5 else .witness 3)

theorem pairExample_checked :
    check 4 rejectTerminal pairExample 5 ![1,2]=true := by decide

theorem pair_example_lower_bound (v : Fin 2 → ℕ)
    (hrep : Represents 5 ![1,2] v) (hp : Primitive v) :
    (1/4 : ℝ)≤value (List.ofFn v) := by
  exact checked_lower_bound (k:=4) (m:=5) (by decide) (by decide) ![1,2]
    (by decide) pairExample pairExample_checked v hrep hp

end Loneliness.Modular.Search
