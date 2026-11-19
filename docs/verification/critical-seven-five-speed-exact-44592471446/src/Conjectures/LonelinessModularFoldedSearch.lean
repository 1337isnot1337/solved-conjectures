import Conjectures.LonelinessModularNormalize
import Conjectures.LonelinessModularRationalWitness
import Conjectures.LonelinessModularSearch

/-! Proof-carrying binary trees on folded residues. The invariant retains
an explicit unit multiplier, so lifting and sign folding do not discard
any primitive integer speed tuple. -/

namespace Loneliness.Modular.FoldedSearch

def Represents {n : ℕ} (m : ℕ) (x v : Fin n → ℕ) : Prop :=
  ∃ a b : ℕ, (a*b)%m=1%m ∧ ∀ i, folded m (a*v i)=x i

def foldedLift {n : ℕ} (m : ℕ) (x : Fin n → ℕ) (bits : Fin n → Bool) : Fin n → ℕ :=
  fun i => if bits i then m-x i else x i

theorem folded_double_cases {m : ℕ} (hm : 0<m) (a : ℕ) :
    folded (2*m) a=folded m a ∨ folded (2*m) a=m-folded m a := by
  have hr := Nat.mod_lt a (show 0<2*m by omega)
  have hreduce : a%m=(a%(2*m))%m :=
    (Nat.mod_mod_of_dvd a (show m∣2*m from ⟨2,by omega⟩)).symm
  unfold folded
  rw [hreduce]
  by_cases h : a%(2*m)<m
  · rw [Nat.mod_eq_of_lt h]
    omega
  · have he : (a%(2*m))%m=a%(2*m)-m := by
      rw [Nat.mod_eq_sub_mod (by omega),Nat.mod_eq_of_lt (by omega : a%(2*m)-m<m)]
    rw [he]
    omega

theorem represents_child {n m : ℕ} {x v : Fin n → ℕ} (hm : 1<m)
    (hrep : Represents m x v) :
    ∃ bits : Fin n → Bool, Represents (2*m) (foldedLift m x bits) v := by
  obtain ⟨a,b,hab,hx⟩ := hrep
  obtain ⟨a',b',ha',_hb',_haodd,hab'⟩ := unit_binaryLift hm hab
  have hparent (i : Fin n) : folded m (a'*v i)=x i := by
    calc
      _ = folded m (a*v i) := folded_eq_of_mod_eq (by simp [Nat.mul_mod,ha'])
      _ = x i := hx i
  let bits : Fin n → Bool := fun i => decide (folded (2*m) (a'*v i)≠x i)
  refine ⟨bits,a',b',hab',?_⟩
  intro i
  have hc := folded_double_cases (by omega : 0<m) (a'*v i)
  rw [hparent i] at hc
  by_cases he : folded (2*m) (a'*v i)=x i
  · simp [foldedLift,bits,he]
  · simp only [foldedLift,bits,decide_eq_true he,ite_true]
    exact hc.resolve_left he

theorem folded_even_mod {m : ℕ} (hm : 0<m) (he : m%2=0) (a : ℕ) :
    folded m a%2=a%2 := by
  have hr := Nat.mod_lt a hm
  have hd : 2∣m := Nat.dvd_of_mod_eq_zero he
  have hmod : (a%m)%2=a%2 := Nat.mod_mod_of_dvd a hd
  unfold folded
  omega

theorem represents_allEven_not_primitive {n m : ℕ} {x v : Fin n → ℕ}
    (hm : 1<m) (he : m%2=0) (hx : ∀ i, x i%2=0)
    (hrep : Represents m x v) : ¬ Search.Primitive v := by
  obtain ⟨a,b,hab,hrep⟩ := hrep
  have hd : 2∣m := Nat.dvd_of_mod_eq_zero he
  have hu : (a*b)%m=1 := by simpa only [Nat.mod_eq_of_lt hm] using hab
  have hu2 := congrArg (fun z => z%2) hu
  rw [Nat.mod_mod_of_dvd _ hd] at hu2
  have ha : a%2=1 := by
    rw [Nat.mul_mod] at hu2
    by_contra h
    have hz : a%2=0 := by omega
    simp [hz] at hu2
  have hv (i : Fin n) : v i%2=0 := by
    have hi := hx i
    rw [←hrep i,folded_even_mod (by omega) he,Nat.mul_mod,ha] at hi
    simpa using hi
  exact Search.allEven_not_primitive (m:=2) (x:=fun _ => 0) (v:=v)
    (by decide) (by simp) hv

theorem represents_witness {n num den m t : ℕ} {x v : Fin n → ℕ}
    (hm : 0<m) (hrep : Represents m x v)
    (hw : RationalWitness num den m t (List.ofFn x)) :
    HasRationalWitness num den m (List.ofFn v) := by
  obtain ⟨a,b,hab,hrep⟩ := hrep
  apply (hasRationalWitness_folded_unit hm hab (List.ofFn v)).mp
  refine ⟨t,?_⟩
  simpa only [List.map_ofFn,Function.comp_def,hrep] using hw

inductive Tree (n : ℕ) where
  | witness (time : ℕ)
  | allEven
  | terminal (index : ℕ)
  | branch (children : (Fin n → Bool) → Tree n)

def check {n : ℕ} (num den : ℕ)
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool) : Tree n → ℕ → (Fin n → ℕ) → Bool
  | .witness t,m,x => decide (RationalWitness num den m t (List.ofFn x))
  | .allEven,m,x => decide (m%2=0 ∧ ∀ i, x i%2=0)
  | .terminal index,m,x => terminal m x index
  | .branch children,m,x =>
      decide (∀ bits : Fin n → Bool, check num den terminal (children bits)
        (2*m) (foldedLift m x bits)=true)

def TerminalSound {n : ℕ} (num den : ℕ)
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool)
    (conclusion : (Fin n → ℕ) → Prop) : Prop :=
  ∀ m x index, 1<m → terminal m x index=true →
    ∀ v, Represents m x v → Search.Primitive v →
      value (List.ofFn v)<(num : ℝ)/den → conclusion v

theorem check_sound {n num den : ℕ} (hden : 0<den) (hhalf : 2*num≤den)
    (terminal : ℕ → (Fin n → ℕ) → ℕ → Bool)
    (conclusion : (Fin n → ℕ) → Prop)
    (hterminal : TerminalSound num den terminal conclusion) (tree : Tree n) :
    ∀ m x, 1<m → check num den terminal tree m x=true →
      ∀ v, Represents m x v → Search.Primitive v →
        value (List.ofFn v)<(num : ℝ)/den → conclusion v := by
  induction tree with
  | witness t =>
    intro m x hm hcheck v hrep _hp hlow
    have hw : RationalWitness num den m t (List.ofFn x) := of_decide_eq_true hcheck
    have hv := hasRationalWitness_value_lower hden hhalf (by omega : 0<m)
      (represents_witness (by omega) hrep hw)
    exact False.elim ((not_le_of_gt hlow) hv)
  | allEven =>
    intro m x hm hcheck v hrep hp _hlow
    have he : m%2=0 ∧ ∀ i, x i%2=0 := of_decide_eq_true hcheck
    exact False.elim (represents_allEven_not_primitive hm he.1 he.2 hrep hp)
  | terminal index =>
    intro m x hm hcheck v hrep hp hlow
    exact hterminal m x index hm hcheck v hrep hp hlow
  | branch children ih =>
    intro m x hm hcheck v hrep hp hlow
    have hall : ∀ bits, check num den terminal (children bits)
        (2*m) (foldedLift m x bits)=true := of_decide_eq_true hcheck
    obtain ⟨bits,hbits⟩ := represents_child hm hrep
    exact ih bits (2*m) (foldedLift m x bits) (by omega) (hall bits) v hbits hp hlow

end Loneliness.Modular.FoldedSearch
