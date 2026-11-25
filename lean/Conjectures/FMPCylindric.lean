module

public import Mathlib.Data.Fintype.BigOperators
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Data.Fintype.Pi
public import Mathlib.Data.Finset.BooleanAlgebra
public import Mathlib.Data.Fin.VecNotation
public import Mathlib.Data.Fin.Rev
public import Mathlib.Tactic.FinCases
public import Mathlib.Tactic.NormNum
public import Mathlib.Basic.Real.Basic
public import Mathlib.Algebra.Group.ForwardDiff
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Tactic.Abel
public import Mathlib.Tactic.Ring
public import Mathlib.Algebra.Polynomial.Eval.Degree

public section
namespace Conjectures.FMPCylindric

abbrev Cell := Fin 5 × ℕ
def outer : Fin 5 → ℕ := ![9,9,8,6,2]
def inner : Fin 5 → ℕ := ![7,7,6,1,0]
def rowShift : ℕ := 6

def cell (i : Fin 13) : Cell :=
  ![(3,2),(4,1),(3,3),(4,2),(3,4),(0,8),(3,5),(0,9),
     (1,8),(2,7),(3,6),(1,9),(2,8)] i

abbrev cellEdge (a b : Cell) : Prop :=
  (a.1 = b.1 ∧ a.2 + 1 = b.2) ∨
  (a.1.val + 1 = b.1.val ∧ a.2 = b.2) ∨
  (a.1 = 4 ∧ b.1 = 0 ∧ a.2 + rowShift = b.2)

def edges : List (Fin 13 × Fin 13) :=
  [(0,2),(0,3),(1,3),(2,4),(3,5),(4,6),(5,7),(5,8),
    (6,10),(7,11),(8,11),(8,12),(9,12)]

theorem edge_exact : ∀ i j : Fin 13, cellEdge (cell i) (cell j) ↔ (i,j) ∈ edges := by
  decide +kernel

theorem cell_injective : Function.Injective cell := by
  change ∀ i j : Fin 13, cell i = cell j → i = j
  decide +kernel

theorem cell_mem_rows : ∀ i : Fin 13, inner (cell i).1 < (cell i).2 ∧
    (cell i).2 ≤ outer (cell i).1 := by
  decide +kernel

theorem row_seam : outer 0 ≤ outer 4 + rowShift + 1 ∧
    inner 0 ≤ inner 4 + rowShift + 1 := by decide +kernel

def valid {t : ℕ} (x : Fin 13 → Fin t) : Prop :=
  ∀ uv ∈ edges, x uv.1 ≤ x uv.2

theorem valid_iff_geometric {t : ℕ} (x : Fin 13 → Fin t) :
    valid x ↔ ∀ i j, cellEdge (cell i) (cell j) → x i ≤ x j := by
  constructor
  · intro h i j hij
    exact h (i,j) ((edge_exact i j).mp hij)
  · intro h uv huv
    exact h uv.1 uv.2 ((edge_exact _ _).mpr huv)

theorem valid_iff_links {t : ℕ} (x : Fin 13 → Fin t) :
    valid x ↔ x 0 ≤ x 2 ∧ x 0 ≤ x 3 ∧ x 1 ≤ x 3 ∧ x 2 ≤ x 4 ∧
      x 3 ≤ x 5 ∧ x 4 ≤ x 6 ∧ x 5 ≤ x 7 ∧ x 5 ≤ x 8 ∧
      x 6 ≤ x 10 ∧ x 7 ≤ x 11 ∧ x 8 ≤ x 11 ∧ x 8 ≤ x 12 ∧
      x 9 ≤ x 12 := by
  simp [valid, edges, forall_eq_or_imp]

instance {t : ℕ} (x : Fin 13 → Fin t) : Decidable (valid x) := by
  rw [valid_iff_links]
  infer_instance

abbrev Filling (t : ℕ) := {x : Fin 13 → Fin t // valid x}
abbrev Up {t : ℕ} (a : Fin t) := {x : Fin t // a ≤ x}
abbrev Down {t : ℕ} (a : Fin t) := {x : Fin t // x ≤ a}
abbrev Between {t : ℕ} (a b : Fin t) := {x : Fin t // a ≤ x ∧ x ≤ b}

abbrev Lower {t : ℕ} (c : Fin t) :=
  Σ a : Down c, Σ x2 : Up a.val, Σ x4 : Up x2.val, Σ x6 : Up x4.val, Up x6.val

abbrev Upper {t : ℕ} (c : Fin t) :=
  Σ a : Up c, Σ u : Up a.val, (Σ v : Up u.val, Between a.val v.val) ×
    (Σ w : Up u.val, Down w.val)

abbrev Packed (t : ℕ) := Σ c : Fin t, Down c × Lower c × Upper c

def pack {t : ℕ} (a : Filling t) : Packed t := by
  obtain ⟨h02,h03,h13,h24,h35,h46,h57,h58,h6a,h7b,h8b,h8c,h9c⟩ :=
    (valid_iff_links a.val).mp a.property
  exact ⟨a.val 3, ⟨a.val 1,h13⟩,
    ⟨⟨a.val 0,h03⟩,⟨a.val 2,h02⟩,⟨a.val 4,h24⟩,⟨a.val 6,h46⟩,⟨a.val 10,h6a⟩⟩,
    ⟨⟨a.val 5,h35⟩,⟨a.val 8,h58⟩,
      ⟨⟨a.val 11,h8b⟩,⟨a.val 7,h57,h7b⟩⟩,⟨⟨a.val 12,h8c⟩,⟨a.val 9,h9c⟩⟩⟩⟩

def unpack {t : ℕ} (a : Packed t) : Filling t := by
  rcases a with ⟨c,b,lo,hi⟩
  rcases lo with ⟨a,x2,x4,x6,x10⟩
  rcases hi with ⟨s,u,⟨v,x7⟩,⟨w,x9⟩⟩
  let x : Fin 13 → Fin t := ![a.val,b.val,x2.val,c,x4.val,s.val,x6.val,
    x7.val,u.val,x9.val,x10.val,v.val,w.val]
  refine ⟨x,(valid_iff_links x).mpr ?_⟩
  exact ⟨x2.property,a.property,b.property,x4.property,s.property,x6.property,
    x7.property.1,u.property,x10.property,x7.property.2,v.property,w.property,x9.property⟩

def packingEquiv (t : ℕ) : Filling t ≃ Packed t where
  toFun := pack
  invFun := unpack
  left_inv := by
    intro a
    apply Subtype.ext
    funext i
    fin_cases i <;> rfl
  right_inv := by
    rintro ⟨c,b,⟨a,x2,x4,x6,x10⟩,⟨s,u,⟨v,x7⟩,⟨w,x9⟩⟩⟩
    rfl

noncomputable def cpp (t : ℕ) : ℕ := Fintype.card (Filling t)

theorem cpp_packed (t : ℕ) : cpp t = Fintype.card (Packed t) :=
  Fintype.card_congr (packingEquiv t)


theorem outer_partition : ∀ i j : Fin 5, i ≤ j → outer j ≤ outer i := by decide +kernel
theorem inner_partition : ∀ i j : Fin 5, i ≤ j → inner j ≤ inner i := by decide +kernel
theorem inner_le_outer : ∀ i : Fin 5, inner i ≤ outer i := by decide +kernel

theorem cell_surj : ∀ (r : Fin 5) (c : ℕ), inner r < c → c ≤ outer r →
    ∃ i : Fin 13, cell i = (r,c) := by
  have hm : ∀ r : Fin 5, outer r ≤ 9 := by decide +kernel
  have hfin : ∀ (r : Fin 5) (c : Fin 10), inner r < c.val → c.val ≤ outer r →
      ∃ i : Fin 13, cell i = (r,c.val) := by decide +kernel
  intro r c hi ho
  exact hfin r ⟨c, (ho.trans (hm r)).trans_lt (by decide)⟩ hi ho

open scoped BigOperators

def runSum : ℕ → (ℕ → ℕ) → ℕ
  | 0, _ => 0
  | n+1, f => runSum n f + f n

theorem sum_fin_eq_runSum (t : ℕ) (f : ℕ → ℕ) :
    ∑ i : Fin t, f i.val = runSum t f := by
  induction t with
  | zero => simp [runSum]
  | succ t ih =>
    rw [Fin.sum_univ_castSucc]
    change (∑ i : Fin t, f i.val) + f t = runSum t f + f t
    rw [ih]

def sumIf (t : ℕ) (p : ℕ → Prop) [DecidablePred p] (f : ℕ → ℕ) : ℕ :=
  runSum t (fun j => if p j then f j else 0)

theorem sum_sub_fin_eq_sumIf (t : ℕ) (p : ℕ → Prop) [DecidablePred p] (f : ℕ → ℕ) :
    ∑ i : {i : Fin t // p i.val}, f i.val.val = sumIf t p f := by
  unfold sumIf
  rw [← sum_fin_eq_runSum]
  rw [← Finset.subtype_univ (fun i : Fin t => p i.val)]
  calc
    _ = ∑ i ∈ (Finset.univ : Finset (Fin t)).filter (fun i => p i.val), f i.val :=
      Finset.sum_subtype_eq_sum_filter (s := Finset.univ) (p := fun i : Fin t => p i.val)
        (fun i : Fin t => f i.val)
    _ = _ := Finset.sum_filter (s := Finset.univ)
      (fun i : Fin t => p i.val) (fun i : Fin t => f i.val)

private theorem sum_up {t : ℕ} (a : Fin t) (f : ℕ → ℕ) :
    ∑ i : Up a, f i.val.val = sumIf t (fun j => a.val ≤ j) f :=
  sum_sub_fin_eq_sumIf t (fun j => a.val ≤ j) f

private theorem sum_down {t : ℕ} (a : Fin t) (f : ℕ → ℕ) :
    ∑ i : Down a, f i.val.val = sumIf t (fun j => j ≤ a.val) f :=
  sum_sub_fin_eq_sumIf t (fun j => j ≤ a.val) f

private theorem card_sub_fin (t : ℕ) (p : ℕ → Prop) [DecidablePred p] :
    Fintype.card {i : Fin t // p i.val} = sumIf t p (fun _ => 1) := by
  rw [Fintype.card_eq_sum_ones, ← sum_sub_fin_eq_sumIf]

def chainCount (t : ℕ) : ℕ → ℕ → ℕ
  | 0, _ => 1
  | n+1, a => sumIf t (fun i => a ≤ i) (chainCount t n)

def lowerCount (t c : ℕ) := sumIf t (fun a => a ≤ c) (chainCount t 4)

def firstUpper (t s u : ℕ) := sumIf t (fun v => u ≤ v)
  (fun v => sumIf t (fun x => s ≤ x ∧ x ≤ v) fun _ => 1)

def secondUpper (t u : ℕ) := sumIf t (fun w => u ≤ w)
  (fun w => sumIf t (fun x => x ≤ w) fun _ => 1)

def upperCount (t c : ℕ) := sumIf t (fun s => c ≤ s) (fun s =>
  sumIf t (fun u => s ≤ u) (fun u => firstUpper t s u * secondUpper t u))

def evalCpp (t : ℕ) : ℕ := runSum t fun c =>
  (sumIf t (fun i => i ≤ c) fun _ => 1) * (lowerCount t c * upperCount t c)

private theorem card_up {t : ℕ} (a : Fin t) :
    Fintype.card (Up a) = chainCount t 1 a.val :=
  card_sub_fin t (fun i => a.val ≤ i)

private theorem card_down {t : ℕ} (a : Fin t) :
    Fintype.card (Down a) = sumIf t (fun i => i ≤ a.val) (fun _ => 1) :=
  card_sub_fin t (fun i => i ≤ a.val)

private theorem card_between {t : ℕ} (a b : Fin t) :
    Fintype.card (Between a b) = sumIf t (fun i => a.val ≤ i ∧ i ≤ b.val) (fun _ => 1) :=
  card_sub_fin t (fun i => a.val ≤ i ∧ i ≤ b.val)

private theorem card_chain_step {t : ℕ} (m : ℕ) (a : Fin t)
    (Y : Fin t → Type) [∀ i, Fintype (Y i)]
    (hY : ∀ i, Fintype.card (Y i) = chainCount t m i.val) :
    Fintype.card (Σ i : Up a, Y i.val) = chainCount t (m+1) a.val := by
  rw [Fintype.card_sigma]
  simp_rw [hY]
  exact sum_up a (chainCount t m)

private theorem card_chain2 {t : ℕ} (a : Fin t) :
    Fintype.card (Σ i : Up a, Up i.val) = chainCount t 2 a.val :=
  card_chain_step 1 a Up card_up

private theorem card_chain3 {t : ℕ} (a : Fin t) :
    Fintype.card (Σ i : Up a, Σ j : Up i.val, Up j.val) = chainCount t 3 a.val :=
  card_chain_step 2 a (fun i => Σ j : Up i, Up j.val) card_chain2

private theorem card_chain4 {t : ℕ} (a : Fin t) :
    Fintype.card (Σ i : Up a, Σ j : Up i.val, Σ k : Up j.val, Up k.val) =
      chainCount t 4 a.val :=
  card_chain_step 3 a (fun i => Σ j : Up i, Σ k : Up j.val, Up k.val) card_chain3

private theorem card_lower {t : ℕ} (c : Fin t) :
    Fintype.card (Lower c) = lowerCount t c.val := by
  unfold Lower lowerCount
  rw [Fintype.card_sigma]
  simp_rw [card_chain4]
  exact sum_down c (chainCount t 4)

private theorem card_upper1 {t : ℕ} (a u : Fin t) :
    Fintype.card (Σ v : Up u, Between a v.val) = firstUpper t a.val u.val := by
  rw [Fintype.card_sigma]
  simp_rw [card_between]
  exact sum_up u (fun v => sumIf t (fun x => a.val ≤ x ∧ x ≤ v) fun _ => 1)

private theorem card_upper2 {t : ℕ} (u : Fin t) :
    Fintype.card (Σ w : Up u, Down w.val) = secondUpper t u.val := by
  rw [Fintype.card_sigma]
  simp_rw [card_down]
  exact sum_up u (fun w => sumIf t (fun x => x ≤ w) fun _ => 1)

private theorem card_upper_for_a {t : ℕ} (a : Fin t) :
    Fintype.card (Σ u : Up a, (Σ v : Up u.val, Between a v.val) ×
      (Σ w : Up u.val, Down w.val)) =
        sumIf t (fun u => a.val ≤ u) (fun u => firstUpper t a.val u * secondUpper t u) := by
  rw [Fintype.card_sigma]
  simp_rw [Fintype.card_prod, card_upper1, card_upper2]
  exact sum_up a (fun u => firstUpper t a.val u * secondUpper t u)

private theorem card_upper {t : ℕ} (c : Fin t) :
    Fintype.card (Upper c) = upperCount t c.val := by
  unfold Upper upperCount
  rw [Fintype.card_sigma]
  simp_rw [card_upper_for_a]
  exact sum_up c (fun a =>
    sumIf t (fun u => a ≤ u) (fun u => firstUpper t a u * secondUpper t u))

theorem cpp_eq_evalCpp (t : ℕ) : cpp t = evalCpp t := by
  unfold evalCpp
  rw [cpp_packed]
  change Fintype.card (Σ c : Fin t, Down c × Lower c × Upper c) = _
  rw [Fintype.card_sigma]
  calc
    _ = ∑ c : Fin t, (sumIf t (fun i => i ≤ c.val) fun _ => 1) *
        (lowerCount t c.val * upperCount t c.val) := by
      apply Finset.sum_congr rfl
      intro c _
      rw [Fintype.card_prod, Fintype.card_prod, card_down, card_lower, card_upper]
    _ = _ := sum_fin_eq_runSum t
      (fun c => (sumIf t (fun i => i ≤ c) fun _ => 1) * (lowerCount t c * upperCount t c))

/-- A literal decreasing, unpinned filling in the convention of Morales's
Conjecture 4: the last row is shifted right and placed above the first. -/
abbrev sourceValid {t : ℕ} (x : Fin 13 → Fin t) : Prop := valid (fun i => (x i).rev)

theorem sourceValid_iff {t : ℕ} (x : Fin 13 → Fin t) :
    sourceValid x ↔ ∀ i j, cellEdge (cell i) (cell j) → x j ≤ x i := by
  change valid (fun i => (x i).rev) ↔ _
  rw [valid_iff_geometric]
  simp only [Fin.rev_le_rev]

abbrev SourceFilling (t : ℕ) := {x : Fin 13 → Fin t // sourceValid x}

def sourceEquiv (t : ℕ) : SourceFilling t ≃ Filling t where
  toFun x := ⟨fun i => (x.val i).rev, x.property⟩
  invFun x := ⟨fun i => (x.val i).rev, by
    change valid (fun i => (x.val i).rev.rev)
    simpa only [Fin.rev_rev] using x.property⟩
  left_inv := by intro x; apply Subtype.ext; funext i; simp only [Fin.rev_rev]
  right_inv := by intro x; apply Subtype.ext; funext i; simp only [Fin.rev_rev]

noncomputable def sourceCpp (t : ℕ) := Fintype.card (SourceFilling t)

theorem sourceCpp_eq_cpp (t : ℕ) : sourceCpp t = cpp t := Fintype.card_congr (sourceEquiv t)


def delta {R : Type*} [Sub R] (f : ℕ → R) (n : ℕ) := f (n+1) - f n
def diff {R : Type*} [Sub R] : ℕ → (ℕ → R) → ℕ → R
  | 0, f => f
  | m+1, f => diff m (delta f)

def shift {R : Type*} (f : ℕ → R) (n : ℕ) := f (n+1)

private theorem delta_add {R : Type*} [AddCommGroup R] (f g : ℕ → R) :
    delta (fun n => f n + g n) = fun n => delta f n + delta g n := by
  exact fwdDiff_add (1 : ℕ) f g

private theorem delta_smul {R : Type*} [Ring R] (c : R) (f : ℕ → R) :
    delta (fun n => c * f n) = fun n => c * delta f n := by
  funext n
  simp [delta, mul_sub]

private theorem diff_add {R : Type*} [AddCommGroup R] (m : ℕ) (f g : ℕ → R) :
    diff m (fun n => f n + g n) = fun n => diff m f n + diff m g n := by
  induction m generalizing f g with
  | zero => rfl
  | succ m ih => simp only [diff, delta_add, ih]

private theorem diff_smul {R : Type*} [Ring R] (m : ℕ) (c : R) (f : ℕ → R) :
    diff m (fun n => c * f n) = fun n => c * diff m f n := by
  induction m generalizing f with
  | zero => rfl
  | succ m ih => simp only [diff, delta_smul, ih]

private theorem diff_zero {R : Type*} [AddGroup R] (m : ℕ) :
    diff m (fun _ => (0 : R)) = fun _ => 0 := by
  induction m with
  | zero => rfl
  | succ m ih =>
    have hz : delta (fun _ => (0 : R)) = fun _ => 0 := funext (fun _ => sub_zero 0)
    simp only [diff, hz, ih]

private theorem diff_shift {R : Type*} [Sub R] (m : ℕ) (f : ℕ → R) :
    diff m (shift f) = shift (diff m f) := by
  induction m generalizing f with
  | zero => rfl
  | succ m ih =>
    change diff m (shift (delta f)) = shift (diff m (delta f))
    exact ih (delta f)

def AbsMono (f : ℕ → ℝ) : Prop := ∀ m n, 0 ≤ diff m f n

private theorem const_absMono {c : ℝ} (hc : 0 ≤ c) : AbsMono (fun _ => c) := by
  intro m n
  cases m with
  | zero => exact hc
  | succ m =>
    have hz : delta (fun _ => c) = fun _ => 0 := funext (fun _ => sub_self c)
    simp only [diff, hz, diff_zero, le_refl]

private theorem natCast_absMono : AbsMono (fun n => (n : ℝ)) := by
  intro m n
  cases m with
  | zero => exact Nat.cast_nonneg n
  | succ m =>
    have h : delta (fun n => (n : ℝ)) = fun _ => 1 := by
      funext k
      simp [delta]
    change 0 ≤ diff m (delta (fun n => (n : ℝ))) n
    rw [h]
    exact const_absMono zero_le_one m n

private theorem mul_absMono {f g : ℕ → ℝ} (hf : AbsMono f) (hg : AbsMono g) :
    AbsMono (fun n => f n * g n) := by
  intro m
  induction m generalizing f g with
  | zero =>
    intro n
    exact mul_nonneg (hf 0 n) (hg 0 n)
  | succ m ih =>
    intro n
    have hdelta : delta (fun n => f n * g n) =
        fun n => delta f n * shift g n + f n * delta g n := by
      funext n
      unfold delta shift
      ring
    rw [diff, hdelta, diff_add]
    apply add_nonneg
    · exact ih (fun k j => hf (k+1) j) (fun k j => by rw [diff_shift]; exact hg k (j+1)) n
    · exact ih hf (fun k j => hg (k+1) j) n

private theorem power_absMono (k : ℕ) : AbsMono (fun n => (n : ℝ) ^ k) := by
  induction k with
  | zero => simpa using const_absMono (c := 1) zero_le_one
  | succ k hk =>
    simpa only [pow_succ] using mul_absMono hk natCast_absMono

def probe {R : Type*} [DivisionRing R] [CharZero R] (f : ℕ → R) (n : ℕ) : R :=
  if n = 0 then 0 else f n / n

def weight {R : Type*} [DivisionRing R] [CharZero R] (f : ℕ → R) : R :=
  diff 13 (probe f) 0

private theorem probe_add {R : Type*} [DivisionRing R] [CharZero R] (f g : ℕ → R) :
    probe (fun n => f n + g n) = fun n => probe f n + probe g n := by
  funext n
  by_cases hn : n = 0
  · simp [probe, hn]
  · simp only [probe, hn, ite_false, add_div]

private theorem probe_smul {R : Type*} [DivisionRing R] [CharZero R] (c : R) (f : ℕ → R) :
    probe (fun n => c * f n) = fun n => c * probe f n := by
  funext n
  by_cases hn : n = 0
  · simp [probe, hn]
  · simp only [probe, hn, ite_false, mul_div_assoc]

theorem weight_add {R : Type*} [DivisionRing R] [CharZero R] (f g : ℕ → R) :
    weight (fun n => f n + g n) = weight f + weight g := by
  simp only [weight, probe_add, diff_add]

theorem weight_smul {R : Type*} [DivisionRing R] [CharZero R] (c : R) (f : ℕ → R) :
    weight (fun n => c * f n) = c * weight f := by
  simp only [weight, probe_smul, diff_smul]

private def impulse (n : ℕ) : ℝ := if n = 0 then 1 else 0

private theorem diff_impulse (m : ℕ) :
    diff m impulse = fun n => (-1 : ℝ) ^ m * impulse n := by
  induction m with
  | zero => simp [diff]
  | succ m ih =>
    have hd : delta impulse = fun n => (-1 : ℝ) * impulse n := by
      funext n
      by_cases hn : n = 0 <;> simp [delta, impulse, hn]
    rw [diff, hd, diff_smul, ih]
    funext n
    rw [pow_succ]
    ring

private theorem diff_eq_iter {R : Type*} [AddCommGroup R] (n : ℕ) (f : ℕ → R) :
    diff n f = (fwdDiff (1 : ℕ))^[n] f := by
  induction n generalizing f with
  | zero => rfl
  | succ n ih =>
    rw [diff, ih, Function.iterate_succ_apply]
    rfl

open scoped BigOperators in
theorem weight_formula {R : Type*} [DivisionRing R] [CharZero R] (f : ℕ → R) :
    weight f = ∑ j ∈ Finset.range 14,
      ((-1 : R) ^ (13-j) * (Nat.choose 13 j : R)) * probe f j := by
  rw [weight, diff_eq_iter, fwdDiff_iter_eq_sum_shift]
  simp [zsmul_eq_mul]

private theorem weight_power_nonneg (k : ℕ) :
    0 ≤ weight (fun n => (n : ℝ) ^ k) := by
  cases k with
  | zero =>
    rw [weight_formula]
    norm_num [probe, Finset.sum_range_succ, Nat.choose]
  | succ k =>
    cases k with
    | zero =>
      have h : delta (probe (fun n => (n : ℝ)^1)) = impulse := by
        funext n
        have hp (m : ℕ) (hm : m ≠ 0) : probe (fun n => (n : ℝ)^1) m = 1 := by
          simp [probe, hm, Nat.cast_ne_zero.mpr hm]
        by_cases hn : n = 0
        · subst n
          unfold delta
          rw [hp 1 (by decide)]
          simp [probe, impulse]
        · unfold delta
          rw [hp (n+1) (by omega), hp n hn]
          simp [impulse, hn]
      rw [weight, show 13 = 12+1 by decide, diff, h, diff_impulse]
      norm_num [impulse]
    | succ k =>
      have h : probe (fun n => (n : ℝ)^(k+2)) = fun n : ℕ => (n : ℝ)^(k+1) := by
        funext n
        by_cases hn : n = 0
        · simp [probe, hn]
        · simp [probe, hn, pow_succ ((n : ℝ)) (k+1), Nat.cast_ne_zero.mpr hn]
      rw [weight, h]
      exact power_absMono (k+1) 13 0

open scoped BigOperators in
theorem weight_finite_nonneg_power_sum (d : ℕ) (a : ℕ → ℝ) (ha : ∀ k, 0 ≤ a k) :
    0 ≤ weight (fun n => ∑ k ∈ Finset.range d, a k * (n : ℝ)^k) := by
  induction d with
  | zero =>
    have hz : probe (fun _ => (0 : ℝ)) = fun _ => 0 := by
      funext n
      simp [probe]
    simp [weight, hz, diff_zero]
  | succ d ih =>
    simp only [Finset.sum_range_succ, weight_add, weight_smul]
    exact add_nonneg ih (mul_nonneg (ha d) (weight_power_nonneg d))


/-- Literal sample count table, with zero outside the 14 certified nodes. -/
def sampleValue : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | 2 => 99
  | 3 => 2559
  | 4 => 33041
  | 5 => 275160
  | 6 => 1687503
  | 7 => 8248254
  | 8 => 33826449
  | 9 => 120595278
  | 10 => 383436376
  | 11 => 1108248906
  | 12 => 2954764590
  | 13 => 7350892820
  | _ => 0

set_option maxRecDepth 50000 in
set_option maxHeartbeats 0 in
theorem exact_samples : ∀ n : Fin 14, evalCpp n.val = sampleValue n.val := by
  decide +kernel

theorem cpp_exact_samples (n : ℕ) (hn : n < 14) : cpp n = sampleValue n := by
  rw [cpp_eq_evalCpp]
  exact exact_samples ⟨n,hn⟩

theorem pp_negative_probe : weight (fun n => (cpp n : ℝ)) = -(1/17160 : ℝ) := by
  rw [weight_formula]
  calc
    _ = ∑ j ∈ Finset.range 14, ((-1 : ℝ)^(13-j) * (Nat.choose 13 j : ℝ)) *
        probe (fun n => (sampleValue n : ℝ)) j := by
      apply Finset.sum_congr rfl
      intro j hj
      have he : (cpp j : ℝ) = (sampleValue j : ℝ) := by
        exact_mod_cast (cpp_exact_samples j (Finset.mem_range.mp hj))
      simp [probe, he]
    _ = _ := by
      norm_num [Finset.sum_range_succ, probe, sampleValue, Nat.choose]

/-- No polynomial with nonnegative real coefficients has the values of the
cylindric filling count on the positive integers. -/
theorem ferroni_morales_panova_unpinned_counterexample :
    ¬ ∃ (d : ℕ) (a : ℕ → ℝ), (∀ k, 0 ≤ a k) ∧
      ∀ n : ℕ, 0 < n → (cpp n : ℝ) = ∑ k ∈ Finset.range d, a k * (n : ℝ)^k := by
  rintro ⟨d,a,ha,h⟩
  have hw : weight (fun n => (cpp n : ℝ)) =
      weight (fun n => ∑ k ∈ Finset.range d, a k * (n : ℝ)^k) := by
    rw [weight, weight]
    apply congrArg (fun f => diff 13 f 0)
    funext n
    by_cases hn : n = 0
    · simp [probe, hn]
    · simp [probe, hn, h n (Nat.pos_of_ne_zero hn)]
  have hp := weight_finite_nonneg_power_sum d a ha
  rw [← hw, pp_negative_probe] at hp
  norm_num at hp

#print axioms ferroni_morales_panova_unpinned_counterexample

theorem no_nonnegative_order_polynomial :
    ¬ ∃ p : Polynomial ℝ, (∀ k, 0 ≤ p.coeff k) ∧
        ∀ n : ℕ, 0 < n → p.eval (n : ℝ) = (cpp n : ℝ) := by
  rintro ⟨p,hp,he⟩
  apply ferroni_morales_panova_unpinned_counterexample
  refine ⟨p.natDegree+1, p.coeff, hp, ?_⟩
  intro n hn
  rw [← he n hn, Polynomial.eval_eq_sum_range]

#print axioms no_nonnegative_order_polynomial

/-- The exact literal witness's decreasing filling count is not given by
any real polynomial with all coefficients nonnegative. -/
theorem no_nonnegative_source_count_polynomial :
    ¬ ∃ p : Polynomial ℝ, (∀ k, 0 ≤ p.coeff k) ∧
        ∀ n : ℕ, 0 < n → p.eval (n : ℝ) = (sourceCpp n : ℝ) := by
  simp only [sourceCpp_eq_cpp]
  exact no_nonnegative_order_polynomial

#print axioms no_nonnegative_source_count_polynomial


/-! ## Alternate unpinned convention: comparison across column holes -/

abbrev geomFullEdge (a b : Cell) : Prop :=
  (a.1 = b.1 ∧ a.2 + 1 = b.2) ∨
  (a.1 < b.1 ∧ a.2 = b.2) ∨
  (a.1 = 4 ∧ b.1 ≠ 4 ∧ a.2 + rowShift = b.2)

def edgesFull : List (Fin 13 × Fin 13) :=
  edges ++ [(1,9),(3,8),(3,12),(5,12)]

theorem edge_full_exact : ∀ i j : Fin 13, geomFullEdge (cell i) (cell j) ↔
    (i,j) ∈ edgesFull := by decide +kernel

def validMore {t : ℕ} (x : Fin 13 → Fin t) : Prop := valid x ∧ x 1 ≤ x 9

instance {t : ℕ} (x : Fin 13 → Fin t) : Decidable (validMore x) :=
  inferInstanceAs (Decidable (valid x ∧ x 1 ≤ x 9))

theorem validMore_iff {t : ℕ} (x : Fin 13 → Fin t) : validMore x ↔
    ∀ i j, geomFullEdge (cell i) (cell j) → x i ≤ x j := by
  have h19 : (1,9) ∈ edgesFull := by decide +kernel
  constructor
  · rintro ⟨hx,h19x⟩ i j hij
    have hm := (edge_full_exact i j).mp hij
    simp only [edgesFull,List.mem_append,List.mem_cons,List.not_mem_nil,or_false] at hm
    rcases hm with hm | hm | hm | hm | hm
    · exact hx (i,j) hm
    · simpa only [Prod.mk.injEq] using congrArg (fun ij : Fin 13 × Fin 13 =>
        x ij.1 ≤ x ij.2) hm ▸ h19x
    · have h := (hx (3,5) (by decide)).trans (hx (5,8) (by decide))
      exact congrArg (fun ij : Fin 13 × Fin 13 => x ij.1 ≤ x ij.2) hm ▸ h
    · have h := (hx (3,5) (by decide)).trans ((hx (5,8) (by decide)).trans
        (hx (8,12) (by decide)))
      exact congrArg (fun ij : Fin 13 × Fin 13 => x ij.1 ≤ x ij.2) hm ▸ h
    · have h := (hx (5,8) (by decide)).trans (hx (8,12) (by decide))
      exact congrArg (fun ij : Fin 13 × Fin 13 => x ij.1 ≤ x ij.2) hm ▸ h
  · intro h
    refine ⟨?_, h 1 9 ((edge_full_exact 1 9).mpr h19)⟩
    intro uv huv
    exact h uv.1 uv.2 ((edge_full_exact _ _).mpr (List.mem_append_left _ huv))

abbrev FillingMore (t : ℕ) := {x : Fin 13 → Fin t // validMore x}

abbrev UpperMore {t : ℕ} (c b : Fin t) :=
  Σ a : Up c, Σ u : Up a.val, (Σ v : Up u.val, Between a.val v.val) ×
    (Σ w : Up u.val, Between b w.val)

abbrev PackedMore (t : ℕ) := Σ c : Fin t, Σ b : Down c, Lower c × UpperMore c b.val

def packMore {t : ℕ} (a : FillingMore t) : PackedMore t := by
  obtain ⟨h02,h03,h13,h24,h35,h46,h57,h58,h6a,h7b,h8b,h8c,h9c⟩ :=
    (valid_iff_links a.val).mp a.property.1
  exact ⟨a.val 3, ⟨a.val 1,h13⟩,
    ⟨⟨a.val 0,h03⟩,⟨a.val 2,h02⟩,⟨a.val 4,h24⟩,⟨a.val 6,h46⟩,⟨a.val 10,h6a⟩⟩,
    ⟨⟨a.val 5,h35⟩,⟨a.val 8,h58⟩,
      ⟨⟨a.val 11,h8b⟩,⟨a.val 7,h57,h7b⟩⟩,
      ⟨⟨a.val 12,h8c⟩,⟨a.val 9,a.property.2,h9c⟩⟩⟩⟩

def unpackMore {t : ℕ} (a : PackedMore t) : FillingMore t := by
  rcases a with ⟨c,b,lo,hi⟩
  rcases lo with ⟨a,x2,x4,x6,x10⟩
  rcases hi with ⟨s,u,⟨v,x7⟩,⟨w,x9⟩⟩
  let x : Fin 13 → Fin t := ![a.val,b.val,x2.val,c,x4.val,s.val,x6.val,
    x7.val,u.val,x9.val,x10.val,v.val,w.val]
  refine ⟨x, (valid_iff_links x).mpr ?_,x9.property.1⟩
  exact ⟨x2.property,a.property,b.property,x4.property,s.property,x6.property,
    x7.property.1,u.property,x10.property,x7.property.2,v.property,w.property,x9.property.2⟩

def packingMoreEquiv (t : ℕ) : FillingMore t ≃ PackedMore t where
  toFun := packMore
  invFun := unpackMore
  left_inv := by
    intro a
    apply Subtype.ext
    funext i
    fin_cases i <;> rfl
  right_inv := by
    rintro ⟨c,b,⟨a,x2,x4,x6,x10⟩,⟨s,u,⟨v,x7⟩,⟨w,x9⟩⟩⟩
    rfl

abbrev sourceMoreValid {t : ℕ} (x : Fin 13 → Fin t) : Prop :=
  validMore (fun i => (x i).rev)

theorem sourceMoreValid_iff {t : ℕ} (x : Fin 13 → Fin t) :
    sourceMoreValid x ↔ ∀ i j, geomFullEdge (cell i) (cell j) → x j ≤ x i := by
  change validMore (fun i => (x i).rev) ↔ _
  rw [validMore_iff]
  simp only [Fin.rev_le_rev]

abbrev SourceMoreFilling (t : ℕ) := {x : Fin 13 → Fin t // sourceMoreValid x}

def sourceMoreEquiv (t : ℕ) : SourceMoreFilling t ≃ FillingMore t where
  toFun x := ⟨fun i => (x.val i).rev, x.property⟩
  invFun x := ⟨fun i => (x.val i).rev, by
    change validMore (fun i => (x.val i).rev.rev)
    simpa only [Fin.rev_rev] using x.property⟩
  left_inv := by intro x; apply Subtype.ext; funext i; simp only [Fin.rev_rev]
  right_inv := by intro x; apply Subtype.ext; funext i; simp only [Fin.rev_rev]

noncomputable def sourceCppMore (t : ℕ) := Fintype.card (SourceMoreFilling t)

def secondUpperMore (t b u : ℕ) := sumIf t (fun w => u ≤ w)
  (fun w => sumIf t (fun x => b ≤ x ∧ x ≤ w) fun _ => 1)

def upperCountMore (t c b : ℕ) := sumIf t (fun s => c ≤ s) (fun s =>
  sumIf t (fun u => s ≤ u) (fun u => firstUpper t s u * secondUpperMore t b u))

def evalCppMore (t : ℕ) : ℕ := runSum t fun c =>
  sumIf t (fun b => b ≤ c) (fun b => lowerCount t c * upperCountMore t c b)

private theorem card_upperMore2 {t : ℕ} (b u : Fin t) :
    Fintype.card (Σ w : Up u, Between b w.val) = secondUpperMore t b.val u.val := by
  rw [Fintype.card_sigma]
  simp_rw [card_between]
  exact sum_up u (fun w => sumIf t (fun x => b.val ≤ x ∧ x ≤ w) fun _ => 1)

private theorem card_upperMore_for_a {t : ℕ} (b a : Fin t) :
    Fintype.card (Σ u : Up a, (Σ v : Up u.val, Between a v.val) ×
      (Σ w : Up u.val, Between b w.val)) =
        sumIf t (fun u => a.val ≤ u) (fun u => firstUpper t a.val u *
          secondUpperMore t b.val u) := by
  rw [Fintype.card_sigma]
  simp_rw [Fintype.card_prod, card_upper1]
  exact sum_up a (fun u => firstUpper t a.val u * secondUpperMore t b.val u)

private theorem card_upperMore {t : ℕ} (c b : Fin t) :
    Fintype.card (UpperMore c b) = upperCountMore t c.val b.val := by
  unfold UpperMore upperCountMore
  rw [Fintype.card_sigma]
  simp_rw [card_upperMore_for_a]
  exact sum_up c (fun a => sumIf t (fun u => a ≤ u)
    (fun u => firstUpper t a u * secondUpperMore t b.val u))

theorem sourceCppMore_eq_evalCppMore (t : ℕ) : sourceCppMore t = evalCppMore t := by
  unfold sourceCppMore evalCppMore
  rw [Fintype.card_congr ((sourceMoreEquiv t).trans (packingMoreEquiv t))]
  change Fintype.card (Σ c : Fin t, Σ b : Down c, Lower c × UpperMore c b.val) = _
  rw [Fintype.card_sigma]
  calc
    _ = ∑ c : Fin t, sumIf t (fun b => b ≤ c.val)
        (fun b => lowerCount t c.val * upperCountMore t c.val b) := by
      apply Finset.sum_congr rfl
      intro c _
      rw [Fintype.card_sigma]
      simp_rw [Fintype.card_prod, card_lower, card_upperMore]
      exact sum_down c (fun b => lowerCount t c.val * upperCountMore t c.val b)
    _ = _ := sum_fin_eq_runSum t (fun c =>
      sumIf t (fun b => b ≤ c) (fun b => lowerCount t c * upperCountMore t c b))

def sampleValueMore : ℕ → ℕ
  | 0 => 0
  | 1 => 1
  | 2 => 93
  | 3 => 2316
  | 4 => 29220
  | 5 => 239625
  | 6 => 1453728
  | 7 => 7049001
  | 8 => 28731996
  | 9 => 101940888
  | 10 => 322868257
  | 11 => 930214191
  | 12 => 2473486584
  | 13 => 6139657950
  | _ => 0

set_option maxRecDepth 50000 in
set_option maxHeartbeats 0 in
theorem exact_samplesMore : ∀ n : Fin 14, evalCppMore n.val = sampleValueMore n.val := by
  decide +kernel

theorem cppMore_exact_samples (n : ℕ) (hn : n < 14) : sourceCppMore n = sampleValueMore n := by
  rw [sourceCppMore_eq_evalCppMore]
  exact exact_samplesMore ⟨n,hn⟩

theorem pp_negative_probeMore : weight (fun n => (sourceCppMore n : ℝ)) = -(1/30030 : ℝ) := by
  rw [weight_formula]
  calc
    _ = ∑ j ∈ Finset.range 14, ((-1 : ℝ)^(13-j) * (Nat.choose 13 j : ℝ)) *
        probe (fun n => (sampleValueMore n : ℝ)) j := by
      apply Finset.sum_congr rfl
      intro j hj
      have he : (sourceCppMore j : ℝ) = (sampleValueMore j : ℝ) := by
        exact_mod_cast (cppMore_exact_samples j (Finset.mem_range.mp hj))
      simp [probe, he]
    _ = _ := by
      norm_num [Finset.sum_range_succ, probe, sampleValueMore, Nat.choose]

/-- The literal witness remains a counterexample when all vertically aligned
occupied cells, even across column holes, must be weakly decreasing. -/
theorem no_nonnegative_full_column_count_polynomial :
    ¬ ∃ p : Polynomial ℝ, (∀ k, 0 ≤ p.coeff k) ∧
        ∀ n : ℕ, 0 < n → p.eval (n : ℝ) = (sourceCppMore n : ℝ) := by
  rintro ⟨p,hp,he⟩
  have hw : weight (fun n => (sourceCppMore n : ℝ)) =
      weight (fun n => ∑ k ∈ Finset.range (p.natDegree+1), p.coeff k * (n : ℝ)^k) := by
    rw [weight, weight]
    apply congrArg (fun f => diff 13 f 0)
    funext n
    by_cases hn : n = 0
    · simp [probe, hn]
    · simp [probe, hn, ← he n (Nat.pos_of_ne_zero hn), Polynomial.eval_eq_sum_range]
  have h := weight_finite_nonneg_power_sum (p.natDegree+1) p.coeff hp
  rw [← hw, pp_negative_probeMore] at h
  norm_num at h

#print axioms no_nonnegative_full_column_count_polynomial

end Conjectures.FMPCylindric
