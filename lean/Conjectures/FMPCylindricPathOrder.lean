import Mathlib.Algebra.Order.Group.Int
import Mathlib.Tactic.ByContra
import Lean.Elab.Tactic.Omega

namespace FMPCylindricPathOrder

/-- Column normal form for an east/north unit-step path. At each column the
path visits every integer height from its entry to its exit. The unique east
edge between adjacent columns joins the exit height to the next entry. -/
structure ColumnPath where
  first : ℤ
  last : ℤ
  first_le_last : first ≤ last
  entry : ℤ → ℤ
  upper : ℤ → ℤ
  interval : ∀ x, first ≤ x → x ≤ last → entry x ≤ upper x
  horizontal : ∀ x, first ≤ x → x < last → upper x = entry (x+1)

def ColumnPath.Visits (P : ColumnPath) (x y : ℤ) : Prop :=
  P.first ≤ x ∧ x ≤ P.last ∧ P.entry x ≤ y ∧ y ≤ P.upper x

def Disjoint (P Q : ColumnPath) : Prop := ∀ x y, P.Visits x y → ¬ Q.Visits x y

private theorem int_interval_induction {a b : ℤ} (h : a ≤ b) {F : ℤ → Prop}
    (h0 : F a) (hs : ∀ x, a ≤ x → x < b → F x → F (x+1)) : F b := by
  let n := (b-a).toNat
  have hn : (n:ℤ) = b-a := by
    dsimp [n]
    exact Int.toNat_of_nonneg (by omega)
  have all : ∀ k : ℕ, k ≤ n → F (a + (k:ℤ)) := by
    intro k
    induction k with
    | zero => intro _; simpa using h0
    | succ k ih =>
      intro hk
      have hx : a + (k:ℤ) < b := by omega
      have hm : a ≤ a+(k:ℤ) := by omega
      simpa only [Int.natCast_succ, add_assoc] using hs _ hm hx (ih (by omega))
  have he : a + (n:ℤ) = b := by omega
  simpa only [he] using all n le_rfl

theorem entry_mono (P : ColumnPath) {a b : ℤ}
    (ha : P.first ≤ a) (hab : a ≤ b) (hb : b ≤ P.last) : P.entry a ≤ P.entry b := by
  apply int_interval_induction (F := fun x => P.entry a ≤ P.entry x) hab le_rfl
  intro x hx hx' ih
  have hxa : P.first ≤ x := ha.trans hx
  have hxb : x < P.last := lt_of_lt_of_le hx' hb
  have hv := (P.interval x hxa hxb.le)
  rw [P.horizontal x hxa hxb] at hv
  exact ih.trans hv

theorem exit_mono (P : ColumnPath) {a b : ℤ}
    (ha : P.first ≤ a) (hab : a ≤ b) (hb : b ≤ P.last) : P.upper a ≤ P.upper b := by
  apply int_interval_induction (F := fun x => P.upper a ≤ P.upper x) hab le_rfl
  intro x hx hx' ih
  have hxa : P.first ≤ x := ha.trans hx
  have hxb : x < P.last := lt_of_lt_of_le hx' hb
  have hv := P.interval (x+1) (by omega) (by omega)
  rw [← P.horizontal x hxa hxb] at hv
  exact ih.trans hv

theorem column_order (P Q : ColumnPath) (hdis : Disjoint P Q) {x : ℤ}
    (hP0 : P.first ≤ x) (hP1 : x ≤ P.last) (hQ0 : Q.first ≤ x) (hQ1 : x ≤ Q.last) :
    P.upper x < Q.entry x ∨ Q.upper x < P.entry x := by
  by_contra! h
  let y := max (P.entry x) (Q.entry x)
  have hP := P.interval x hP0 hP1
  have hQ := Q.interval x hQ0 hQ1
  have hvP : P.Visits x y := ⟨hP0,hP1,le_max_left _ _,max_le hP h.1⟩
  have hvQ : Q.Visits x y := ⟨hQ0,hQ1,le_max_right _ _,max_le h.2 hQ⟩
  exact hdis x y hvP hvQ

theorem order_persists (P Q : ColumnPath) (hdis : Disjoint P Q) {a b : ℤ}
    (hP0 : P.first ≤ a) (hP1 : b ≤ P.last) (hQ0 : Q.first ≤ a) (hQ1 : b ≤ Q.last)
    (hab : a ≤ b) (hi : Q.upper a < P.entry a) :
    Q.upper b < P.entry b := by
  apply int_interval_induction hab hi
  intro x ha hb ih
  have hp0 := hP0.trans ha
  have hq0 := hQ0.trans ha
  have hp1 := lt_of_lt_of_le hb hP1
  have hq1 := lt_of_lt_of_le hb hQ1
  rcases column_order P Q hdis (x := x+1) (by omega) (by omega) (by omega) (by omega) with h | h
  · have heP := P.horizontal x hp0 hp1
    have heQ := Q.horizontal x hq0 hq1
    have hP := P.interval x hp0 hp1.le
    have hP' := P.interval (x+1) (by omega) (by omega)
    omega
  · exact h

/-- Inverted endpoint order with one column interval inside the other forces
a shared lattice vertex. The proof includes containment in a single column. -/
theorem inverted_paths_intersect (P Q : ColumnPath)
    (hstartX : P.first ≤ Q.first) (hendX : Q.last ≤ P.last)
    (hstartY : Q.entry Q.first < P.entry P.first)
    (hendY : P.upper P.last < Q.upper Q.last) :
    ∃ x y, P.Visits x y ∧ Q.Visits x y := by
  classical
  by_contra! hn
  have hdis : Disjoint P Q := hn
  have hleft := entry_mono P (a := P.first) (b := Q.first) le_rfl hstartX
    (Q.first_le_last.trans hendX)
  have hright := exit_mono P (a := Q.last) (b := P.last)
    (hstartX.trans Q.first_le_last) hendX le_rfl
  have hpfirst := P.interval Q.first hstartX (Q.first_le_last.trans hendX)
  have hqfirst := Q.interval Q.first le_rfl Q.first_le_last
  have hinit : Q.upper Q.first < P.entry Q.first := by
    rcases column_order P Q hdis hstartX (Q.first_le_last.trans hendX) le_rfl Q.first_le_last with h | h
    · omega
    · exact h
  have hends := order_persists P Q hdis hstartX hendX le_rfl le_rfl Q.first_le_last hinit
  have hplast := P.interval Q.last (hstartX.trans Q.first_le_last) hendX
  omega

end FMPCylindricPathOrder
