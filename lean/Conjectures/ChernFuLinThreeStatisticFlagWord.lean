import Conjectures.ChernFuLinThreeStatisticMoment

/-! # The affine dependence of the extension series on the active flags

For fixed `a`, extending a flag word to the right leaves the non-high children
unchanged except for the same suffix. Subtracting the two extension equations
therefore factors out the value of `L` on the added suffix. Uniqueness only
needs reduction modulo successive powers of `X`.
-/

namespace Conjectures.ChernFuLinThreeStatistic.Kernel

open PowerSeries Finset

variable {K : Type*} [Field K]
noncomputable section
local notation "S" => PowerSeries K

def factor (u iz : S) (w : List Bool) : S := u^w.length * iz^(w.count true)

def L (u iz : S) : List Bool → S
  | [] => 0
  | b::w => u*(if b then iz else 1)*(1+L u iz w)

theorem factor_append (u iz : S) (p w : List Bool) : factor u iz (p++w)=factor u iz p*factor u iz w := by
  simp [factor,pow_add]; ring

theorem L_append (u iz : S) (p w : List Bool) : L u iz (p++w)=L u iz p + factor u iz p*L u iz w := by
  induction p with
  | nil => simp [L,factor]
  | cons b p ih => cases b <;> simp [L,factor,ih,pow_succ] <;> ring

theorem L_zeros (u iz k : S) (hu : u*(1-k)=1) (d : ℕ) : k*L u iz (List.replicate d false)=u^d-1 := by
  induction d with
  | zero => simp [L]
  | succ d ih => simp only [List.replicate_succ,L,Bool.false_eq_true,ite_false,mul_one,pow_succ]; linear_combination u*ih - hu

def pre (d : ℕ) := List.replicate d false ++ [true]

theorem factor_pre (u iz : S) (d : ℕ) : factor u iz (pre d)=u^(d+1)*iz := by simp [pre,factor,List.count_replicate]

theorem L_pre (u iz k : S) (hu : u*(1-k)=1) (d : ℕ) :
    k*L u iz (pre d) = (1+k*u*iz)*u^d-1 := by
  rw [pre,L_append]; simp [factor,List.count_replicate,L]; linear_combination L_zeros u iz k hu d

/-- The compressed flag recurrence from the generating tree. `A` is its
extension series; `B0` is the base of the trailing run of B states. -/
structure Flags (k u iz v g : S) where
  A : ℕ → List Bool → S
  B0 : ℕ → S
  base : ∀ a, B0 a = g*v^a+k*∑ j ∈ range (a+1), A (j+1) (List.replicate (a-j) false)
  node : ∀ a W, A a W = v^a + X*A (a+1) W +
    k*(∑ j ∈ range a, A (j+1) (pre (a-1-j) ++ W)) + X*B0 a*L u iz W

private theorem shift_unique {k u iz v g : S} (H : Flags k u iz v g) (hk : X ∣ k)
    (W V : List Bool) (s : S) (hs : L u iz W=s*L u iz V) :
    ∀ a P, H.A a (P++W)-H.A a P = s*(H.A a (P++V)-H.A a P) := by
  let D (a : ℕ) (P : List Bool) := H.A a (P++W)-H.A a P-s*(H.A a (P++V)-H.A a P)
  have step (a P) : D a P = X*D (a+1) P + k*∑ j ∈ range a, D (j+1) (pre (a-1-j)++P) := by
    unfold D
    simp only [List.append_assoc,sum_sub_distrib,← mul_sum]
    have hW := H.node a (P++W); have hV := H.node a (P++V); have hP := H.node a P
    rw [L_append,hs] at hW; rw [L_append] at hV
    linear_combination hW - s*hV + (s-1)*hP
  have divides (n : ℕ) : ∀ a P, X^n ∣ D a P := by
    induction n with
    | zero => simp
    | succ n ih =>
      intro a P; rw [step,pow_succ']
      exact dvd_add (mul_dvd_mul (dvd_refl _) (ih ..))
        (mul_dvd_mul hk (Finset.dvd_sum (fun j _ => ih ..)))
  intro a P
  apply sub_eq_zero.mp
  change D a P=0
  apply PowerSeries.ext; intro n
  simpa using (X_pow_dvd_iff.mp (divides (n+1) a P) n (by omega))

theorem flags_affine {k u iz v g : S} (H : Flags k u iz v g) (hk : X ∣ k) (hu : u*(1-k)=1) :
    ∃ α β : ℕ → S, (∀ a, β a = H.A a []) ∧ ∀ a W, H.A a W = α a*L u iz W + β a := by
  let α a := (1-k)*(H.A a [false]-H.A a [])
  refine ⟨α,fun a => H.A a [],fun _ => rfl,?_⟩
  intro a W
  have hs : L u iz W = ((1-k)*L u iz W)*L u iz [false] := by
    simp only [L,Bool.false_eq_true,ite_false,mul_one,add_zero]; linear_combination -(L u iz W)*hu
  have he := shift_unique H hk W [false] _ hs a []
  simp only [List.nil_append] at he; dsimp [α]; linear_combination he

end
end Conjectures.ChernFuLinThreeStatistic.Kernel
