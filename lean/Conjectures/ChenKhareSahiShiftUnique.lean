import Conjectures.ChenKhareSahiSaturation

namespace ChenKhareSahi

theorem shifted_support (r : ℕ) (base p : Partition)
    (hbase : degree base = 6) (hp1 : p.2.1 ≤ p.1) (hp2 : p.2.2 ≤ p.2.1)
    (hb1 : base.2.1 ≤ base.1) (hb2 : base.2.2 ≤ base.2.1)
    (hdom : dominates (shiftPartition base r) p) :
    ∃ u ∈ partitions 6, dominates base u ∧ p = shiftPartition u r := by
  have hr : r ≤ p.2.2 := by
    rcases hdom with ⟨hs,h1,h2⟩
    simp only [degree, shiftPartition] at hs h2 hbase
    omega
  let u := unshiftPartition p r
  have hshift : shiftPartition u r = p := unshift_shift p r hr hp1 hp2
  have hu1 : u.2.1 ≤ u.1 := by dsimp [u,unshiftPartition]; omega
  have hu2 : u.2.2 ≤ u.2.1 := by dsimp [u,unshiftPartition]; omega
  have hdom' : dominates base u := by
    apply (dominates_translate base u r).mp
    simpa [hshift] using hdom
  have huDeg : degree u = 6 := by
    rcases hdom' with ⟨hs,_,_⟩
    omega
  refine ⟨u, partitions_complete 6 u.1 u.2.1 u.2.2 (by omega) hu1 hu2 huDeg, hdom', hshift.symm⟩

theorem shifted_support420 (r : ℕ) (p : Partition)
    (hp1 : p.2.1 ≤ p.1) (hp2 : p.2.2 ≤ p.2.1)
    (hdom : dominates (shiftPartition (4,2,0) r) p) :
    ∃ u ∈ [(4,2,0),(4,1,1),(3,3,0),(3,2,1),(2,2,2)], p = shiftPartition u r := by
  obtain ⟨u,hu,hd,he⟩ := shifted_support r (4,2,0) p (by decide) hp1 hp2 (by decide) (by decide) hdom
  have hu' : u ∈ (partitions 6).filter (fun u => decide (dominates (4,2,0) u)) := by simp [hu,hd]
  rw [dominance_support_420] at hu'
  exact ⟨u,hu',he⟩

theorem shifted_support411 (r : ℕ) (p : Partition)
    (hp1 : p.2.1 ≤ p.1) (hp2 : p.2.2 ≤ p.2.1)
    (hdom : dominates (shiftPartition (4,1,1) r) p) :
    ∃ u ∈ [(4,1,1),(3,2,1),(2,2,2)], p = shiftPartition u r := by
  obtain ⟨u,hu,hd,he⟩ := shifted_support r (4,1,1) p (by decide) hp1 hp2 (by decide) (by decide) hdom
  have hu' : u ∈ (partitions 6).filter (fun u => decide (dominates (4,1,1) u)) := by simp [hu,hd]
  rw [dominance_support_411] at hu'
  exact ⟨u,hu',he⟩


noncomputable def shiftedCandidate420 (r : ℕ) (a b c d : ℝ) : SymFun := fun x y z =>
  realMonomial (4+r) (2+r) r x y z + a*realMonomial (4+r) (1+r) (1+r) x y z +
    b*realMonomial (3+r) (3+r) r x y z + c*realMonomial (3+r) (2+r) (1+r) x y z +
      d*realMonomial (2+r) (2+r) (2+r) x y z

noncomputable def shiftedCandidate411 (r : ℕ) (a b : ℝ) : SymFun := fun x y z =>
  realMonomial (4+r) (1+r) (1+r) x y z + a*realMonomial (3+r) (2+r) (1+r) x y z +
    b*realMonomial (2+r) (2+r) (2+r) x y z

theorem shiftedCandidate420_eq (r : ℕ) (a b c d : ℝ) :
    shiftedCandidate420 r a b c d = fun x y z => (x*y*z)^r * candidate420 a b c d x y z := by
  funext x y z
  have ha := realMonomial_translate 4 2 0 r x y z
  have hb := realMonomial_translate 3 3 0 r x y z
  simp only [Nat.zero_add] at ha hb
  simp only [shiftedCandidate420, candidate420, ha, hb, realMonomial_translate]
  ring

theorem shiftedCandidate411_eq (r : ℕ) (a b : ℝ) :
    shiftedCandidate411 r a b = fun x y z => (x*y*z)^r * candidate411 a b x y z := by
  funext x y z
  simp only [shiftedCandidate411, candidate411, realMonomial_translate]
  ring

theorem cancel_shift_eigen_at (f : SymFun) (η : ℝ) (r : ℕ) (x y z : ℝ)
    (hxyz : x*y*z ≠ 0)
    (h : realClearedOperator (fun x y z => (x*y*z)^r * f x y z) x y z =
      ((1/10 : ℝ)^r * η) * realDelta x y z * ((x*y*z)^r * f x y z)) :
    realClearedOperator f x y z = η * realDelta x y z * f x y z := by
  rw [eigenoperator_translate] at h
  have hn : (1/10 : ℝ)^r * (x*y*z)^r ≠ 0 :=
    mul_ne_zero (pow_ne_zero _ (by norm_num)) (pow_ne_zero _ hxyz)
  apply mul_left_cancel₀ hn
  calc
    ((1/10 : ℝ)^r * (x*y*z)^r) * realClearedOperator f x y z =
        ((1/10 : ℝ)^r * η) * realDelta x y z * ((x*y*z)^r * f x y z) := h
    _ = ((1/10 : ℝ)^r * (x*y*z)^r) * (η * realDelta x y z * f x y z) := by ring

theorem candidate420_unique_points (a b c d : ℝ)
    (h1 : realClearedOperator (candidate420 a b c d) 1 2 3 = (1009081/1000000)*realDelta 1 2 3 * candidate420 a b c d 1 2 3)
    (h2 : realClearedOperator (candidate420 a b c d) 1 2 4 = (1009081/1000000)*realDelta 1 2 4 * candidate420 a b c d 1 2 4)
    (h3 : realClearedOperator (candidate420 a b c d) 1 3 5 = (1009081/1000000)*realDelta 1 3 5 * candidate420 a b c d 1 3 5)
    (h4 : realClearedOperator (candidate420 a b c d) 2 3 5 = (1009081/1000000)*realDelta 2 3 5 * candidate420 a b c d 2 3 5) :
    a=11/91 ∧ b=11/91 ∧ c=1143098/9092629 ∧ d=27053496033/90189787051 := by
  norm_num [realClearedOperator, realDelta, candidate420, realMonomial, realM, orbit,
    Finset.sum_insert, Finset.sum_singleton] at h1 h2 h3 h4
  constructor
  · linarith
  constructor
  · linarith
  constructor <;> linarith

theorem candidate411_unique_points (a b : ℝ)
    (h1 : realClearedOperator (candidate411 a b) 1 2 3 = (190081/1000000)*realDelta 1 2 3 * candidate411 a b 1 2 3)
    (h2 : realClearedOperator (candidate411 a b) 1 2 4 = (190081/1000000)*realDelta 1 2 4 * candidate411 a b 1 2 4) :
    a=111/991 ∧ b=1221/90181 := by
  norm_num [realClearedOperator, realDelta, candidate411, realMonomial, realM, orbit,
    Finset.sum_insert, Finset.sum_singleton] at h1 h2
  constructor <;> linarith


def IsShiftedEigen420 (r : ℕ) (f : SymFun) : Prop :=
  (∃ a b c d, f = shiftedCandidate420 r a b c d) ∧
  ∀ x y z, realClearedOperator f x y z =
    ((1/10 : ℝ)^r * (1009081/1000000)) * realDelta x y z * f x y z

def IsShiftedEigen411 (r : ℕ) (f : SymFun) : Prop :=
  (∃ a b, f = shiftedCandidate411 r a b) ∧
  ∀ x y z, realClearedOperator f x y z =
    ((1/10 : ℝ)^r * (190081/1000000)) * realDelta x y z * f x y z

theorem shiftedCandidate420_const (r : ℕ) :
    shiftedCandidate420 r (11/91) (11/91) (1143098/9092629) (27053496033/90189787051) = shiftedP420 r := by
  funext x y z
  simp [shiftedCandidate420, shiftedP420]
  ring

theorem shiftedCandidate411_const (r : ℕ) :
    shiftedCandidate411 r (111/991) (1221/90181) = shiftedP411 r := by
  funext x y z
  simp [shiftedCandidate411, shiftedP411]

theorem shiftedEigen420_unique (r : ℕ) : ∃! f : SymFun, IsShiftedEigen420 r f := by
  refine ⟨shiftedP420 r, ?_, ?_⟩
  · exact ⟨⟨11/91,11/91,1143098/9092629,27053496033/90189787051, (shiftedCandidate420_const r).symm⟩,
      shiftedP420_eigen r⟩
  · intro f ⟨⟨a,b,c,d,hf⟩, heigen⟩
    rw [hf, shiftedCandidate420_eq] at heigen
    have h1 := cancel_shift_eigen_at (candidate420 a b c d) (1009081/1000000) r 1 2 3 (by norm_num) (heigen 1 2 3)
    have h2 := cancel_shift_eigen_at (candidate420 a b c d) (1009081/1000000) r 1 2 4 (by norm_num) (heigen 1 2 4)
    have h3 := cancel_shift_eigen_at (candidate420 a b c d) (1009081/1000000) r 1 3 5 (by norm_num) (heigen 1 3 5)
    have h4 := cancel_shift_eigen_at (candidate420 a b c d) (1009081/1000000) r 2 3 5 (by norm_num) (heigen 2 3 5)
    obtain ⟨ha,hb,hc,hd⟩ := candidate420_unique_points a b c d h1 h2 h3 h4
    rw [hf, ha,hb,hc,hd]
    exact shiftedCandidate420_const r

theorem shiftedEigen411_unique (r : ℕ) : ∃! f : SymFun, IsShiftedEigen411 r f := by
  refine ⟨shiftedP411 r, ?_, ?_⟩
  · exact ⟨⟨111/991,1221/90181,(shiftedCandidate411_const r).symm⟩, shiftedP411_eigen r⟩
  · intro f ⟨⟨a,b,hf⟩, heigen⟩
    rw [hf, shiftedCandidate411_eq] at heigen
    have h1 := cancel_shift_eigen_at (candidate411 a b) (190081/1000000) r 1 2 3 (by norm_num) (heigen 1 2 3)
    have h2 := cancel_shift_eigen_at (candidate411 a b) (190081/1000000) r 1 2 4 (by norm_num) (heigen 1 2 4)
    obtain ⟨ha,hb⟩ := candidate411_unique_points a b h1 h2
    rw [hf, ha,hb]
    exact shiftedCandidate411_const r

theorem shifted_source_counterexamples (r : ℕ) :
    ∀ p q : SymFun, IsShiftedEigen420 r p → IsShiftedEigen411 r q →
      ¬ FullSemiring (fun x y z => p x y z / p 1 1 1 - q x y z / q 1 1 1) := by
  intro p q hp hq
  have hp0 : IsShiftedEigen420 r (shiftedP420 r) :=
    ⟨⟨11/91,11/91,1143098/9092629,27053496033/90189787051,(shiftedCandidate420_const r).symm⟩, shiftedP420_eigen r⟩
  have hq0 : IsShiftedEigen411 r (shiftedP411 r) :=
    ⟨⟨111/991,1221/90181,(shiftedCandidate411_const r).symm⟩, shiftedP411_eigen r⟩
  have hp' := (shiftedEigen420_unique r).unique hp hp0
  have hq' := (shiftedEigen411_unique r).unique hq hq0
  rw [hp',hq']
  exact shifted_counterexamples r

end ChenKhareSahi
