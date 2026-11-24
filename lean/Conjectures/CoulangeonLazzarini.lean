module

public import Mathlib.Analysis.Normed.Lp.PiLp
public import Mathlib.Data.Fintype.Pi
public import Mathlib.Data.Finset.Card
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.Ring
public import Lean.Elab.Tactic.Omega

/-! # Coulangeon–Lazzarini's two-shell conjecture

An index-two superlattice of $2\mathbb Z^{10}$, with first three squared
radii 4, 8, 9. The coordinate second-moment criterion is tested on its exact shells.
-/

public section

open scoped BigOperators
open Finset

namespace CoulangeonLazzarini

abbrev Coord := Fin 10
abbrev Point := Coord → ℤ

def normSq (x : Point) : ℤ := ∑ i : Coord, (x i)^2

def Parity (x : Point) : Prop :=
  x 0 % 2 = 0 ∧ ∀ i : Coord, i ≠ 0 → x i % 2 = x 1 % 2

def lat : AddSubgroup Point where
  carrier := {x | Parity x}
  zero_mem' := by simp [Parity]
  add_mem' := by
    intro x y hx hy
    change Parity x at hx
    change Parity y at hy
    change Parity (x+y)
    refine ⟨?_, ?_⟩
    · change (x 0+y 0)%2=0
      have h := hx.1
      have hh := hy.1
      omega
    · intro i hi
      change (x i+y i)%2=(x 1+y 1)%2
      have h := hx.2 i hi
      have hh := hy.2 i hi
      omega
  neg_mem' := by
    intro x hx
    change Parity x at hx
    change Parity (-x)
    refine ⟨?_, ?_⟩
    · change (-x 0)%2=0
      have h := hx.1
      omega
    · intro i hi
      change (-x i)%2=(-x 1)%2
      have h := hx.2 i hi
      omega

private theorem even_mem {x : Point} (hx : ∀ i, x i % 2=0) : x ∈ lat := by
  exact ⟨hx 0, fun i _ => (hx i).trans (hx 1).symm⟩

/-- Finite-index/full-rank witness in the integral coordinate lattice. -/
theorem all_doubles (x : Point) : (fun i => 2 * x i) ∈ lat := by
  apply even_mem
  intro i
  omega

private def decode (r : ℕ) (x : Coord → Fin (2*r+1)) : Point :=
  fun i => ((x i).val:ℤ) - (r:ℤ)

private noncomputable def box (r : ℕ) : Finset Point := by
  classical
  exact (Finset.univ : Finset (Coord → Fin (2*r+1))).image (decode r)

private theorem mem_box {r : ℕ} {x : Point} :
    x ∈ box r ↔ ∀ i, -(r:ℤ)≤x i ∧ x i≤(r:ℤ) := by
  classical
  simp only [box, Finset.mem_image, Finset.mem_univ, true_and]
  constructor
  · rintro ⟨v,rfl⟩ i
    have h : (v i).val < 2*r+1 := (v i).isLt
    unfold decode
    constructor <;> omega
  · intro hx
    let v : Coord → Fin (2*r+1) := fun i =>
      ⟨(x i+(r:ℤ)).toNat, by have := hx i; omega⟩
    refine ⟨v, ?_⟩
    funext i
    unfold decode
    change (((x i+(r:ℤ)).toNat : ℕ):ℤ)-(r:ℤ)=x i
    have := hx i
    omega

private theorem int_bounds_by_square (z : ℤ) : -z ≤ z^2 ∧ z≤z^2 := by
  rcases (show z ≤ -1 ∨ z = 0 ∨ 1 ≤ z by omega) with h | h | h
  · have hh : 0 ≤ (-z-1)*(-z) :=
      mul_nonneg (by omega) (by omega)
    constructor <;> nlinarith
  · simp [h]
  · have hh : 0 ≤ (z-1)*z :=
      mul_nonneg (by omega) (by omega)
    constructor <;> nlinarith

noncomputable def shell (r : ℕ) : Finset Point := by
  classical
  exact (box r).filter (fun x => x ∈ lat ∧ normSq x=(r:ℤ))

theorem mem_shell {r : ℕ} {x : Point} :
    x ∈ shell r ↔ x ∈ lat ∧ normSq x=(r:ℤ) := by
  classical
  simp only [shell, Finset.mem_filter]
  constructor
  · exact And.right
  · intro hx
    refine ⟨mem_box.mpr ?_,hx⟩
    intro i
    have hsq : (x i)^2 ≤ normSq x :=
      Finset.single_le_sum (fun j _ => sq_nonneg (x j)) (Finset.mem_univ i)
    rw [hx.2] at hsq
    have h := int_bounds_by_square (x i)
    omega

private def unitTail (i : Coord) : ℤ := if i=0 then 0 else 1

private theorem unitTail_sum : (∑ i : Coord, unitTail i)=9 := by decide

private theorem odd_square_lower {z : ℤ} (h : z%2=1) : 1≤z^2 := by
  rcases (show z≤-1 ∨ 1≤z by omega) with h' | h'
  · have hc : 0≤(-z-1)*(-z+1) := mul_nonneg (by omega) (by omega)
    nlinarith
  · have hc : 0≤(z-1)*(z+1) := mul_nonneg (by omega) (by omega)
    nlinarith

private theorem odd_component_bound {x : Point} (hx : x ∈ lat) (ho : x 1%2=1) (i : Coord) :
    unitTail i ≤ (x i)^2 := by
  change Parity x at hx
  by_cases hi : i=0
  · simpa [unitTail, hi] using sq_nonneg (x i)
  · have h := (hx.2 i hi).trans ho
    simpa [unitTail, hi] using odd_square_lower h

private theorem even_small {r : ℕ} {x : Point} (hr : r<9) (hx : x ∈ shell r) :
    ∀ i, x i%2=0 := by
  have hh := mem_shell.mp hx
  have hxmem : Parity x := hh.1
  have he : x 1%2=0 := by
    by_contra h
    have ho : x 1%2=1 := by omega
    have hn : (∑ i : Coord, unitTail i) ≤ normSq x :=
      Finset.sum_le_sum (fun i _ => odd_component_bound hh.1 ho i)
    rw [unitTail_sum, hh.2] at hn
    omega
  intro i
  by_cases hi : i=0
  · simpa [hi] using hxmem.1
  · exact (hxmem.2 i hi).trans he

private theorem four_dvd_even_norm {x : Point} (he : ∀ i, x i%2=0) : (4:ℤ) ∣ normSq x := by
  unfold normSq
  apply Finset.dvd_sum
  intro i _
  have h : x i=2*(x i/2) := by have := he i; omega
  refine ⟨(x i/2)^2, ?_⟩
  calc
    (x i)^2 = (2*(x i/2))^2 := congrArg (fun u : ℤ => u^2) h
    _ = _ := by ring

theorem small_shell_radii {r : ℕ} (hr0 : 0<r) (hr9 : r<9) (h : (shell r).Nonempty) :
    r=4 ∨ r=8 := by
  obtain ⟨x,hx⟩ := h
  have hd := four_dvd_even_norm (even_small hr9 hx)
  rw [(mem_shell.mp hx).2] at hd
  omega

private def sample (r : ℕ) : Point :=
  fun i => if r=9 then unitTail i else if i.val < r/4 then 2 else 0

private theorem sample_4 : sample 4 ∈ shell 4 := by
  apply mem_shell.mpr
  refine ⟨even_mem ?_, by decide⟩
  intro i
  change (if i.val < 1 then (2:ℤ) else 0)%2=0
  split <;> decide

private theorem sample_8 : sample 8 ∈ shell 8 := by
  apply mem_shell.mpr
  refine ⟨even_mem ?_, by decide⟩
  intro i
  change (if i.val < 2 then (2:ℤ) else 0)%2=0
  split <;> decide

private theorem sample_9 : sample 9 ∈ shell 9 := by
  apply mem_shell.mpr
  refine ⟨?_, by decide⟩
  change Parity (sample 9)
  refine ⟨by decide, ?_⟩
  intro i hi
  simp [sample, unitTail, hi]

private theorem shell_9_coords {x : Point} (hx : x ∈ shell 9) :
    (x 0)^2=0 ∧ (x 1)^2=1 := by
  have hh := mem_shell.mp hx
  have hp : Parity x := hh.1
  have ho : x 1%2=1 := by
    by_contra h
    have he : x 1%2=0 := by omega
    have hall : ∀ i, x i%2=0 := by
      intro i
      by_cases hi : i=0
      · simpa [hi] using hp.1
      · exact (hp.2 i hi).trans he
    have hd := four_dvd_even_norm hall
    rw [hh.2] at hd
    norm_num at hd
  have pointwise : ∀ i ∈ (Finset.univ : Finset Coord), unitTail i≤(x i)^2 :=
    fun i _ => odd_component_bound hh.1 ho i
  have hsum : (∑ i : Coord, unitTail i) = ∑ i : Coord, (x i)^2 := by
    change (∑ i : Coord, unitTail i) = normSq x
    rw [unitTail_sum, hh.2]
    rfl
  have he := (Finset.sum_eq_sum_iff_of_le pointwise).mp hsum
  exact ⟨by simpa [unitTail] using (he 0 (Finset.mem_univ _)).symm,
    by simpa [unitTail] using (he 1 (Finset.mem_univ _)).symm⟩

private def flip (i : Coord) (x : Point) : Point :=
  fun j => if j=i then -x j else x j

private theorem flip_invol (i : Coord) (x : Point) : flip i (flip i x)=x := by
  funext j
  by_cases h : j=i <;> simp [flip,h]

private theorem flip_mem_small {r : ℕ} (hr : r<9) (i : Coord) {x : Point}
    (hx : x ∈ shell r) : flip i x ∈ shell r := by
  have he := even_small hr hx
  have hnorm := (mem_shell.mp hx).2
  apply mem_shell.mpr
  refine ⟨even_mem ?_, ?_⟩
  · intro j
    by_cases h : j=i
    · simp [flip,h]
      have := he i
      omega
    · simpa [flip,h] using he j
  · rw [← hnorm]
    unfold normSq
    apply Finset.sum_congr rfl
    intro j _
    by_cases h : j=i <;> simp [flip,h]

private def swap (i j : Coord) (x : Point) : Point := fun k => x (Equiv.swap i j k)

private theorem swap_invol (i j : Coord) (x : Point) : swap i j (swap i j x)=x := by
  funext k
  simp [swap]

private theorem swap_mem_small {r : ℕ} (hr : r<9) (i j : Coord) {x : Point}
    (hx : x ∈ shell r) : swap i j x ∈ shell r := by
  have he := even_small hr hx
  have hn := (mem_shell.mp hx).2
  apply mem_shell.mpr
  refine ⟨even_mem (fun k => he _), ?_⟩
  rw [← hn]
  unfold normSq swap
  exact Equiv.sum_comp (Equiv.swap i j) (fun k => (x k)^2)

private theorem first_zero {r : ℕ} (hr : r<9) (i : Coord) : (∑ x ∈ shell r, x i)=0 := by
  have heq : (∑ x ∈ shell r, x i) = ∑ x ∈ shell r, -(x i) := by
    refine Finset.sum_nbij' (flip i) (flip i) (fun x hx => flip_mem_small hr i hx)
      (fun x hx => flip_mem_small hr i hx) (fun x _ => flip_invol i x)
      (fun x _ => flip_invol i x) ?_
    intro x _
    simp [flip]
  rw [Finset.sum_neg_distrib] at heq
  omega

private theorem offdiag_zero {r : ℕ} (hr : r<9) {i j : Coord} (hij : i≠j) :
    (∑ x ∈ shell r, x i*x j)=0 := by
  have heq : (∑ x ∈ shell r, x i*x j) = ∑ x ∈ shell r, -(x i*x j) := by
    refine Finset.sum_nbij' (flip i) (flip i) (fun x hx => flip_mem_small hr i hx)
      (fun x hx => flip_mem_small hr i hx) (fun x _ => flip_invol i x)
      (fun x _ => flip_invol i x) ?_
    intro x _
    simp [flip,hij.symm]
  rw [Finset.sum_neg_distrib] at heq
  omega

private theorem diag_equal {r : ℕ} (hr : r<9) (i j : Coord) :
    (∑ x ∈ shell r, (x i)^2)=∑ x ∈ shell r, (x j)^2 := by
  refine Finset.sum_nbij' (swap i j) (swap i j) (fun x hx => swap_mem_small hr i j hx)
    (fun x hx => swap_mem_small hr i j hx) (fun x _ => swap_invol i j x)
    (fun x _ => swap_invol i j x) ?_
  intro x _
  simp [swap]

/-- The usual coordinate-moment characterization of a spherical 2-design:
zero first moments, zero mixed quadratic moments and equal diagonal quadratic
moments. The squared norm is constant on a shell, so equality of the diagonal
moments fixes their normalized value to the squared radius divided by 10. -/
def TwoDesign (S : Finset Point) : Prop :=
  S.Nonempty ∧ (∀ i : Coord, (∑ x ∈ S, x i)=0) ∧
  (∀ i j : Coord, i≠j → (∑ x ∈ S, x i*x j)=0) ∧
  ∀ i j : Coord, (∑ x ∈ S, (x i)^2) = ∑ x ∈ S, (x j)^2

private theorem twoDesign_small {r : ℕ} (hr : r<9) (h : (shell r).Nonempty) :
    TwoDesign (shell r) := by
  exact ⟨h, first_zero hr, fun _ _ hij => offdiag_zero hr hij, diag_equal hr⟩

private theorem sum_ones_card (S : Finset Point) :
    (∑ _x ∈ S, (1:ℤ)) = (S.card:ℤ) := by simp

private theorem nonzero_int_card {S : Finset Point} (h : S.Nonempty) :
    (S.card:ℤ) ≠ 0 := by exact_mod_cast (Finset.card_ne_zero.mpr h)

private theorem not_twoDesign_nine : ¬ TwoDesign (shell 9) := by
  intro hd
  have h := hd.2.2.2 0 1
  have hleft : (∑ x ∈ shell 9, (x 0)^2)=0 :=
    Finset.sum_eq_zero (fun x hx => (shell_9_coords hx).1)
  have hright : (∑ x ∈ shell 9, (x 1)^2)=((shell 9).card : ℤ) := by
    calc
      _ = ∑ _x ∈ shell 9, (1:ℤ) := Finset.sum_congr rfl (fun x hx => (shell_9_coords hx).2)
      _ = _ := sum_ones_card _
  rw [hleft,hright] at h
  exact (nonzero_int_card ⟨_,sample_9⟩) h.symm

/-- The compared Euclidean coordinate lattice and its exact first three shells. -/
theorem rank10_shell_counterexample :
    (∀ x : Point, (fun i => 2*x i) ∈ lat) ∧
    (∀ r, 0<r → r<9 → (shell r).Nonempty → r=4 ∨ r=8) ∧
    TwoDesign (shell 4) ∧ TwoDesign (shell 8) ∧
    (shell 9).Nonempty ∧ ¬ TwoDesign (shell 9) := by
  exact ⟨all_doubles, fun _ => small_shell_radii,
    twoDesign_small (by decide) ⟨_,sample_4⟩,
    twoDesign_small (by decide) ⟨_,sample_8⟩,
    ⟨_,sample_9⟩, not_twoDesign_nine⟩

#print axioms rank10_shell_counterexample


/-- Embed the coordinate lattice into the real coordinate space. -/
def castPoint : Point →ₗ[ℤ] (Coord → ℝ) where
  toFun := fun x i => (x i : ℝ)
  map_add' := by
    intro x y
    funext i
    simp
  map_smul' := by
    intro c x
    funext i
    simp [Pi.smul_apply, zsmul_eq_mul]

noncomputable def realLat : Submodule ℤ (Coord → ℝ) :=
  (AddSubgroup.toIntSubmodule lat).map castPoint

theorem realLat_discrete : DiscreteTopology realLat := by
  rw [discreteTopology_iff_isOpen_singleton_zero, isOpen_induced_iff]
  refine ⟨Metric.ball 0 1, Metric.isOpen_ball, ?_⟩
  ext x
  constructor
  · intro hx
    have hnx : ‖(x : Coord → ℝ)‖ < 1 := by
      change dist (x : Coord → ℝ) 0 < 1 at hx
      rwa [dist_zero_right] at hx
    obtain ⟨y, _, hy⟩ := Submodule.mem_map.mp x.property
    have hz : ∀ i : Coord, y i = 0 := by
      intro i
      have hi := (pi_norm_lt_iff (by norm_num : (0:ℝ)<1)).mp hnx i
      have he := congrFun hy i
      change (y i:ℝ) = (x : Coord → ℝ) i at he
      rw [←he, Real.norm_eq_abs, ←Int.cast_abs] at hi
      exact Int.abs_lt_one_iff.mp (by exact_mod_cast hi)
    apply Set.mem_singleton_iff.mpr
    apply Subtype.ext
    funext i
    have he := congrFun hy i
    change (y i:ℝ) = (x : Coord → ℝ) i at he
    rw [hz i] at he
    simpa only [Int.cast_zero, Submodule.coe_zero, Pi.zero_apply] using he.symm
  · intro hx
    obtain rfl := Set.mem_singleton_iff.mp hx
    change dist ((0 : realLat) : Coord → ℝ) 0 < 1
    rw [Submodule.coe_zero, dist_self]
    norm_num

theorem realLat_span : Submodule.span ℝ (realLat : Set (Coord → ℝ)) = ⊤ := by
  apply top_unique
  rw [← (Pi.basisFun ℝ Coord).span_eq]
  apply Submodule.span_le.mpr
  rintro _ ⟨i,rfl⟩
  let q : Point := fun j => if j=i then 1 else 0
  have hm : (2:ℝ) • (Pi.basisFun ℝ Coord) i ∈ realLat := by
    apply Submodule.mem_map.mpr
    refine ⟨fun j => 2*q j, all_doubles q, ?_⟩
    funext j
    by_cases h : j=i <;> simp [castPoint, q, Pi.basisFun_apply, h]
  have hs := Submodule.smul_mem (Submodule.span ℝ (realLat : Set (Coord → ℝ)))
    (1/2:ℝ) (Submodule.subset_span hm)
  simpa [smul_smul] using hs

private theorem castPoint_injective : Function.Injective castPoint := by
  intro x y h
  funext i
  have ht := congrFun h i
  change (x i:ℝ)=(y i:ℝ) at ht
  exact_mod_cast ht

noncomputable def realShell (r : ℕ) : Finset (Coord → ℝ) :=
  (shell r).map ⟨castPoint,castPoint_injective⟩

private theorem cast_norm (x : Point) :
    (∑ i : Coord, (castPoint x i)^2) = (normSq x : ℝ) := by
  unfold normSq
  push_cast
  rfl

theorem mem_realShell {r : ℕ} {x : Coord → ℝ} :
    x ∈ realShell r ↔ x ∈ realLat ∧ (∑ i : Coord, (x i)^2)=(r:ℝ) := by
  constructor
  · intro hx
    obtain ⟨y,hy,rfl⟩ := Finset.mem_map.mp hx
    have hh := mem_shell.mp hy
    refine ⟨Submodule.mem_map.mpr ⟨y,hh.1,rfl⟩, ?_⟩
    change (∑ i : Coord, (castPoint y i)^2)=(r:ℝ)
    exact (cast_norm y).trans (by exact_mod_cast hh.2)
  · rintro ⟨hx,hs⟩
    obtain ⟨y,hy,rfl⟩ := Submodule.mem_map.mp hx
    rw [cast_norm] at hs
    have h' : normSq y=(r:ℤ) := by exact_mod_cast hs
    exact Finset.mem_map.mpr ⟨y,mem_shell.mpr ⟨hy,h'⟩,rfl⟩

/-- Constant, linear and quadratic monomial sums of a real shell agree with
uniform-sphere moments. The specification uses unnormalized sums to avoid
dividing by the shell cardinality. -/
def RealTwoDesign (r : ℕ) (S : Finset (Coord → ℝ)) : Prop :=
  S.Nonempty ∧ (∀ i : Coord, (∑ x ∈ S, x i)=0) ∧
  (∀ i j : Coord, i≠j → (∑ x ∈ S, x i*x j)=0) ∧
  ∀ i : Coord, (∑ x ∈ S, (x i)^2)=(S.card:ℝ)*(r:ℝ)/10

private theorem sum_diag_trace (r : ℕ) (i : Coord) (h : TwoDesign (shell r)) :
    (10:ℤ) * (∑ x ∈ shell r, (x i)^2)=((shell r).card:ℤ)*(r:ℤ) := by
  calc
    _ = ∑ _j : Coord, ∑ x ∈ shell r, (x i)^2 := by simp [Finset.sum_const]
    _ = ∑ j : Coord, ∑ x ∈ shell r, (x j)^2 :=
      Finset.sum_congr rfl (fun j _ => h.2.2.2 i j)
    _ = ∑ x ∈ shell r, normSq x := by
      unfold normSq
      rw [Finset.sum_comm]
    _ = ∑ _x ∈ shell r, (r:ℤ) := Finset.sum_congr rfl (fun x hx => (mem_shell.mp hx).2)
    _ = _ := by simp [Finset.sum_const]

theorem lift_design {r : ℕ} (h : TwoDesign (shell r)) :
    RealTwoDesign r (realShell r) := by
  obtain ⟨x,hx⟩ := h.1
  refine ⟨⟨castPoint x,Finset.mem_map.mpr ⟨x,hx,rfl⟩⟩, ?_, ?_, ?_⟩
  · intro i
    have hi := congrArg (fun z : ℤ => (z:ℝ)) (h.2.1 i)
    simpa [realShell, Finset.sum_map, castPoint] using hi
  · intro i j hij
    have hi := congrArg (fun z : ℤ => (z:ℝ)) (h.2.2.1 i j hij)
    simpa [realShell, Finset.sum_map, castPoint] using hi
  · intro i
    have hi := congrArg (fun z : ℤ => (z:ℝ)) (sum_diag_trace r i h)
    have hj : (10:ℝ)*(∑ x ∈ realShell r, (x i)^2) = ((realShell r).card:ℝ)*(r:ℝ) := by
      simpa [realShell, Finset.sum_map, castPoint] using hi
    linarith

theorem reflect_design {r : ℕ} (h : RealTwoDesign r (realShell r)) :
    TwoDesign (shell r) := by
  obtain ⟨x,hx⟩ := h.1
  obtain ⟨a,ha,_⟩ := Finset.mem_map.mp hx
  refine ⟨⟨a,ha⟩, ?_, ?_, ?_⟩
  · intro i
    have hi : (∑ y ∈ shell r, (y i:ℝ)) = 0 := by
      simpa [realShell, Finset.sum_map, castPoint] using h.2.1 i
    exact_mod_cast hi
  · intro i j hij
    have hi : (∑ y ∈ shell r, (y i:ℝ)*(y j:ℝ)) = 0 := by
      simpa [realShell, Finset.sum_map, castPoint] using h.2.2.1 i j hij
    exact_mod_cast hi
  · intro i j
    have hi : (∑ y ∈ shell r, (y i:ℝ)^2) = ∑ y ∈ shell r, (y j:ℝ)^2 := by
      simpa [realShell, Finset.sum_map, castPoint] using (h.2.2.2 i).trans (h.2.2.2 j).symm
    exact_mod_cast hi

/-- A coordinate polynomial of total degree at most two, with arbitrary
constant, linear coefficients and quadratic coefficient matrix. -/
def quadratic (c : ℝ) (l : Coord → ℝ) (q : Coord → Coord → ℝ)
    (x : Coord → ℝ) : ℝ :=
  c + (∑ i : Coord, l i * x i) + ∑ i : Coord, ∑ j : Coord, q i j * (x i * x j)

/-- The moment predicate gives the uniform-sphere mean of every polynomial
of degree at most two, after multiplication by the shell cardinality. -/
theorem quadratic_tests {r : ℕ} {S : Finset (Coord → ℝ)} (h : RealTwoDesign r S)
    (c : ℝ) (l : Coord → ℝ) (q : Coord → Coord → ℝ) :
    (∑ x ∈ S, quadratic c l q x) =
      (S.card:ℝ)*(c+(r:ℝ)/10 * ∑ i : Coord, q i i) := by
  classical
  let D := (S.card:ℝ)*(r:ℝ)/10
  have hL : (∑ x ∈ S, ∑ i : Coord, l i * x i) = 0 := by
    rw [Finset.sum_comm]
    simp [← Finset.mul_sum, h.2.1]
  have hQ : (∑ x ∈ S, ∑ i : Coord, ∑ j : Coord, q i j*(x i*x j)) =
      D * ∑ i : Coord, q i i := by
    rw [Finset.sum_comm, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    rw [Finset.sum_comm]
    simp_rw [← Finset.mul_sum]
    rw [Finset.sum_eq_single i]
    · rw [show (∑ x ∈ S, x i*x i) = D by simpa [pow_two,D] using h.2.2.2 i]
      rw [mul_comm]
    · intro j _ hij
      rw [h.2.2.1 i j hij.symm, mul_zero]
    · intro hi
      exact (hi (Finset.mem_univ i)).elim
  unfold quadratic
  rw [Finset.sum_add_distrib, Finset.sum_add_distrib, hL, hQ, add_zero]
  simp [Finset.sum_const, D]
  ring

/-- Refutation with a full-rank discrete real lattice. The first two positive
squared radii are 4 and 8; no noninteger squared radii occur. At 9 the coordinate
quadratic moments differ. -/
theorem coulangeon_lazzarini_conj21_false :
    (∀ x ∈ realLat, ∃ r : ℕ, (∑ i : Coord, (x i)^2)=(r:ℝ)) ∧
    (∀ r, 0<r → r<9 → (realShell r).Nonempty → r=4 ∨ r=8) ∧
    RealTwoDesign 4 (realShell 4) ∧ RealTwoDesign 8 (realShell 8) ∧
    (realShell 9).Nonempty ∧ ¬ RealTwoDesign 9 (realShell 9) := by
  refine ⟨?_, ?_, lift_design (twoDesign_small (by decide) ⟨_,sample_4⟩),
    lift_design (twoDesign_small (by decide) ⟨_,sample_8⟩),
    ⟨castPoint (sample 9), Finset.mem_map.mpr ⟨_,sample_9,rfl⟩⟩,
    fun h => not_twoDesign_nine (reflect_design h)⟩
  · intro x hx
    obtain ⟨y,_,rfl⟩ := Submodule.mem_map.mp hx
    have hn : 0 ≤ normSq y := Finset.sum_nonneg (fun i _ => sq_nonneg (y i))
    refine ⟨(normSq y).toNat, ?_⟩
    rw [cast_norm]
    exact_mod_cast (Int.toNat_of_nonneg hn).symm
  · intro r h0 h9 h
    obtain ⟨x,hx⟩ := h
    obtain ⟨y,hy,_⟩ := Finset.mem_map.mp hx
    exact small_shell_radii h0 h9 ⟨y,hy⟩

abbrev Euclid := PiLp 2 (fun _ : Coord => ℝ)

noncomputable def euclidCoord : Euclid ≃L[ℝ] (Coord → ℝ) :=
  PiLp.continuousLinearEquiv 2 ℝ _

noncomputable def euclidLat : Submodule ℤ Euclid :=
  realLat.comap (euclidCoord.toLinearMap.restrictScalars ℤ)

/-- The Euclidean subgroup is discrete in the induced topology. -/
theorem euclidLat_discrete : DiscreteTopology euclidLat := by
  have := realLat_discrete
  let f : euclidLat → realLat := fun x => ⟨euclidCoord x.val, x.property⟩
  apply DiscreteTopology.of_continuous_injective (f := f)
  · exact (euclidCoord.continuous.comp continuous_subtype_val).subtype_mk _
  · intro x y h
    apply Subtype.ext
    exact euclidCoord.injective (congrArg (fun z : realLat => z.val) h)

/-- The subgroup spans the ambient space, so is a full-rank lattice. -/
theorem euclidLat_span : Submodule.span ℝ (euclidLat : Set Euclid) = ⊤ := by
  have h : (euclidLat : Set Euclid) = euclidCoord.symm '' (realLat : Set (Coord → ℝ)) := by
    ext x
    constructor
    · intro hx
      exact ⟨euclidCoord x,hx,euclidCoord.symm_apply_apply x⟩
    · rintro ⟨u,hu,rfl⟩
      change euclidCoord (euclidCoord.symm u) ∈ realLat
      rwa [euclidCoord.apply_symm_apply]
  rw [h]
  change Submodule.span ℝ
    (euclidCoord.symm.toLinearEquiv.toLinearMap '' (realLat : Set (Coord → ℝ))) = ⊤
  rw [← Submodule.map_span, realLat_span, Submodule.map_top]
  exact euclidCoord.symm.toLinearEquiv.range

noncomputable def euclidShell (r : ℕ) : Finset Euclid :=
  (realShell r).map euclidCoord.symm.toEquiv.toEmbedding

private theorem euclid_norm_sq (x : Euclid) :
    ‖x‖^2 = ∑ i : Coord, (euclidCoord x i)^2 := by
  rw [PiLp.norm_sq_eq_of_L2]
  apply Finset.sum_congr rfl
  intro i _
  change ‖x i‖^2 = (x i)^2
  rw [Real.norm_eq_abs, sq_abs]

theorem mem_euclidShell {r : ℕ} {x : Euclid} :
    x ∈ euclidShell r ↔ x ∈ euclidLat ∧ ‖x‖^2=(r:ℝ) := by
  have he : x ∈ euclidLat ↔ euclidCoord x ∈ realLat := Iff.rfl
  rw [he, euclid_norm_sq, ← mem_realShell]
  constructor
  · intro hx
    obtain ⟨y,hy,heq⟩ := Finset.mem_map.mp hx
    have h : euclidCoord.symm y = x := heq
    rw [← h, euclidCoord.apply_symm_apply]
    exact hy
  · intro hx
    exact Finset.mem_map.mpr ⟨euclidCoord x,hx,euclidCoord.symm_apply_apply x⟩

private theorem nonempty_shell_iff (r : ℕ) :
    (euclidShell r).Nonempty ↔ (realShell r).Nonempty := by
  constructor
  · rintro ⟨x,hx⟩
    obtain ⟨y,hy,_⟩ := Finset.mem_map.mp hx
    exact ⟨y,hy⟩
  · rintro ⟨x,hx⟩
    exact ⟨euclidCoord.symm x,Finset.mem_map.mpr ⟨x,hx,rfl⟩⟩

/-- Test a shell in the orthonormal coordinates of its Euclidean space. -/
noncomputable def EuclideanTwoDesign (r : ℕ) (S : Finset Euclid) : Prop :=
  RealTwoDesign r (S.map euclidCoord.toEquiv.toEmbedding)

private theorem map_euclidShell (r : ℕ) :
    (euclidShell r).map euclidCoord.toEquiv.toEmbedding = realShell r := by
  classical
  ext x
  constructor
  · intro hx
    obtain ⟨y,hy,heq⟩ := Finset.mem_map.mp hx
    have h : euclidCoord y = x := heq
    rw [←h]
    exact (mem_realShell.mpr ⟨(mem_euclidShell.mp hy).1,
      (euclid_norm_sq y).symm.trans (mem_euclidShell.mp hy).2⟩)
  · intro hx
    exact Finset.mem_map.mpr ⟨euclidCoord.symm x,Finset.mem_map.mpr ⟨x,hx,rfl⟩,
      euclidCoord.apply_symm_apply x⟩

private theorem euclid_design_iff (r : ℕ) :
    EuclideanTwoDesign r (euclidShell r) ↔ RealTwoDesign r (realShell r) := by
  unfold EuclideanTwoDesign
  rw [map_euclidShell]

/-- Exact counterexample for the Euclidean norm. The moment tests are expressed
in the ordinary coordinates of the Euclidean vector. -/
theorem euclidean_coulangeon_conj21_false :
    DiscreteTopology euclidLat ∧ (Submodule.span ℝ (euclidLat : Set Euclid) = ⊤) ∧
    (∀ x ∈ euclidLat, ∃ r : ℕ, ‖x‖^2=(r:ℝ)) ∧
    (∀ r, 0<r → r<9 → (euclidShell r).Nonempty → r=4 ∨ r=8) ∧
    (euclidShell 4).Nonempty ∧ (euclidShell 8).Nonempty ∧
    EuclideanTwoDesign 4 (euclidShell 4) ∧ EuclideanTwoDesign 8 (euclidShell 8) ∧
    (euclidShell 9).Nonempty ∧ ¬ EuclideanTwoDesign 9 (euclidShell 9) := by
  obtain ⟨hn,hsmall,h4,h8,h9,hnd⟩ := coulangeon_lazzarini_conj21_false
  refine ⟨euclidLat_discrete,euclidLat_span, ?_,
    fun r h0 h9 hr => hsmall r h0 h9 ((nonempty_shell_iff r).mp hr),
    (nonempty_shell_iff 4).mpr h4.1,(nonempty_shell_iff 8).mpr h8.1,
    (euclid_design_iff 4).mpr h4,(euclid_design_iff 8).mpr h8,(nonempty_shell_iff 9).mpr h9,
    fun h => hnd ((euclid_design_iff 9).mp h)⟩
  intro x hx
  rw [euclid_norm_sq]
  exact hn (euclidCoord x) hx

#print axioms coulangeon_lazzarini_conj21_false
#print axioms euclidean_coulangeon_conj21_false

end CoulangeonLazzarini
