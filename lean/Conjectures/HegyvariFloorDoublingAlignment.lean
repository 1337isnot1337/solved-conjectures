import Conjectures.HegyvariFloorDoublingTransport

/-!
# Hegyvári's conjecture

Combinatorial zero-run alignment and assembly of the two transport cases
in Sections 2--3 of the existing proof. The analytic tower criteria and
indexed completeness remain explicit hypotheses, not axioms or conclusions
of this module.
-/
namespace HegyvariFloorDoubling

def ZeroRun (v : Nat → Bool) (a L : Nat) : Prop :=
  ∀ j, a ≤ j → j < a + L → v j = false

def LateZeroRuns (v : Nat → Bool) : Prop :=
  ∀ N L : Nat, ∃ a, N ≤ a ∧ ZeroRun v a L

def AlignedZeroRuns (u v : Nat → Bool) (s : Nat) : Prop :=
  ∀ N L : Nat, ∃ n, N ≤ n ∧ u (n+s) = true ∧ ZeroRun v n L

/-- If the zero gaps are not uniformly bounded, one finds arbitrarily
long zero runs after every prescribed cutoff, including the zero-tail case. -/
theorem lateZeroRuns_of_not_boundedGaps {v : Nat → Bool}
    (hv : ¬ BoundedGaps v) : LateZeroRuns v := by
  intro N L
  let H := N + L + 1
  have hex : ∃ a, ZeroRun v a H := by
    apply Classical.byContradiction
    intro h
    apply hv
    refine ⟨H, by omega, ?_⟩
    intro a
    apply Classical.byContradiction
    intro hn
    apply h
    refine ⟨a, ?_⟩
    intro j hj hj'
    cases heq : v j with
    | false => rfl
    | true => exact False.elim (hn ⟨j, hj, hj', heq⟩)
  rcases hex with ⟨a, ha⟩
  refine ⟨a+N, by omega, ?_⟩
  intro j hj hj'
  exact ha j (by omega) (by omega)

/-- A bounded-gap source can align one of its marks at a fixed offset
inside an arbitrarily late long zero run of the other sequence. -/
theorem alignedZeroRuns_of_boundedGaps {u v : Nat → Bool}
    (hu : BoundedGaps u) (hv : ¬ BoundedGaps v) (s : Nat) :
    AlignedZeroRuns u v s := by
  rcases hu with ⟨H, hH, hmark⟩
  intro N L
  rcases lateZeroRuns_of_not_boundedGaps hv N (L+H) with ⟨a,ha,hzero⟩
  rcases hmark (a+s) with ⟨m,hm,hm',hmu⟩
  let n := m-s
  have hns : n+s = m := by dsimp [n]; omega
  have han : a ≤ n := by dsimp [n]; omega
  have hnH : n < a+H := by dsimp [n]; omega
  refine ⟨n, by omega, ?_, ?_⟩
  · rwa [hns]
  · intro j hj hj'
    exact hzero j (by omega) (by omega)

/-- Explicit sequence of Case II aligned long zero blocks, with both
the index and the guaranteed length tending to infinity. -/
theorem alignedZeroRuns_sequence {u v : Nat → Bool} {s : Nat}
    (h : AlignedZeroRuns u v s) :
    ∃ ns : Nat → Nat, ∀ r, r ≤ ns r ∧
      u (ns r+s) = true ∧ ∀ k, k < r → v (ns r+k) = false := by
  classical
  let ns : Nat → Nat := fun r => Classical.choose (h r r)
  refine ⟨ns, ?_⟩
  intro r
  have hr := Classical.choose_spec (h r r)
  refine ⟨hr.1, hr.2.1, ?_⟩
  intro k hk
  exact hr.2.2 (ns r+k) (by dsimp [ns]; omega) (by dsimp [ns]; omega)

def ForwardZeroRuns (u v : Nat → Bool) (s : Nat) : Prop :=
  ∀ N L : Nat, ∃ a, N ≤ a ∧ u a = true ∧ ZeroRun v (a+s) L

/-- Negation of forward transport gives arbitrarily late source marks
followed at any fixed positive delay by arbitrarily long target zero runs.
This is the combinatorial quantifier step of the non-dyadic transport proof. -/
theorem forwardZeroRuns_of_not_transport {u v : Nat → Bool}
    (h : ¬ ForwardTransport u v) {s : Nat} (hs : 0 < s) :
    ForwardZeroRuns u v s := by
  intro N L
  apply Classical.byContradiction
  intro hn
  apply h
  refine ⟨s, L+1, N, hs, by omega, ?_⟩
  intro a ha hua
  apply Classical.byContradiction
  intro hb
  apply hn
  refine ⟨a,ha,hua,?_⟩
  intro j hj hj'
  cases heq : v j with
  | false => rfl
  | true => exact False.elim (hb ⟨j,hj,by omega,heq⟩)

/-- Absence of such aligned forward zero runs implies the positive bounded
forward transport used in the written proof. -/
theorem forwardTransport_of_no_forwardZeroRuns {u v : Nat → Bool}
    {s : Nat} (hs : 0 < s) (hno : ¬ ForwardZeroRuns u v s) :
    ForwardTransport u v := by
  apply Classical.byContradiction
  intro h
  exact hno (forwardZeroRuns_of_not_transport h hs)

/-- The final Case I transport contradiction. The source-specific tower
criteria giving the transports and the disjointness conclusion from
bounded gaps are kept as hypotheses. -/
theorem disjoint_of_two_transport_criteria {u v : Nat → Bool}
    {D : Prop} (hmarks : UnboundedMarks u ∨ UnboundedMarks v)
    (huv : ¬ D → ForwardTransport u v)
    (hvu : ¬ D → ForwardTransport v u)
    (hDu : BoundedGaps u → D) (hDv : BoundedGaps v → D) : D := by
  classical
  apply Classical.byContradiction
  intro hn
  rcases hmarks with hu | hv
  · exact hn (hDu (boundedGaps_of_two_transports hu (huv hn) (hvu hn)))
  · exact hn (hDv (boundedGaps_of_two_transports hv (hvu hn) (huv hn)))

/-- The final Case II contradiction, including the second bounded-gap
argument. The actual tower/common-mark criterion is the premise
`hAligned`; `hTransport` and `hBounded` retain the non-dyadic criteria. -/
theorem disjoint_of_oddMultiplier_criteria
    {f g : Nat → Nat} {u v : Nat → Bool} {l : Nat} {D : Prop}
    (hl : l % 2 = 1) (hf : BinaryStep f u) (hg : BinaryStep g v)
    (bounds : ∀ n, l * f n ≤ g n ∧ g n < l*f n+l)
    (hu : UnboundedMarks u) (s : Nat)
    (hTransport : ¬ D → ForwardTransport v u)
    (hAligned : AlignedZeroRuns u v s → D)
    (hBounded : BoundedGaps v → D) : D := by
  classical
  apply Classical.byContradiction
  intro hn
  have huGap := boundedGaps_of_oddMultiplier hl hf hg bounds hu (hTransport hn)
  have hvGap : BoundedGaps v := by
    apply Classical.byContradiction
    intro hv
    exact hn (hAligned (alignedZeroRuns_of_boundedGaps huGap hv s))
  exact hn (hBounded hvGap)

end HegyvariFloorDoubling
