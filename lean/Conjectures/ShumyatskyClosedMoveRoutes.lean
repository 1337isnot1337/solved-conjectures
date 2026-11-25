module

public import Conjectures.ShumyatskyDirectedTreeMoves
public import Conjectures.ShumyatskyWalkLabels

/-! Convert tree paths into words in the actual directed moves.
A closed route with a distinguished nontree move traverses it once,
and the rest of its steps use the chosen tree representatives. -/

@[expose] public section

namespace Shumyatsky

variable {ι : Type*}

def moveTail : ι ⊕ ι → ι
  | .inl i => i
  | .inr i => i

def moveHead (σ τ : Equiv.Perm ι) : ι ⊕ ι → ι
  | .inl i => σ i
  | .inr i => τ i

theorem moveEndpoints_tail_head (σ τ : Equiv.Perm ι) (e : ι ⊕ ι) :
    moveEndpoints σ τ e = s(moveTail e, moveHead σ τ e) := by
  cases e <;> rfl

/-- A move together with its traversal direction. -/
structure MoveTraversal (ι : Type*) where
  move : ι ⊕ ι
  reversed : Bool

def MoveTraversal.start (σ τ : Equiv.Perm ι) (s : MoveTraversal ι) : ι :=
  if s.reversed then moveHead σ τ s.move else moveTail s.move

def MoveTraversal.finish (σ τ : Equiv.Perm ι) (s : MoveTraversal ι) : ι :=
  if s.reversed then moveTail s.move else moveHead σ τ s.move

/-- Each directed traversal begins at the position left by its predecessor. -/
def IsMoveRoute (σ τ : Equiv.Perm ι) : List (MoveTraversal ι) → ι → ι → Prop
  | [], u, v => u = v
  | s :: rest, u, v => s.start σ τ = u ∧ IsMoveRoute σ τ rest (s.finish σ τ) v

theorem IsMoveRoute.append (σ τ : Equiv.Perm ι) (first second : List (MoveTraversal ι))
    {u v w : ι} (hFirst : IsMoveRoute σ τ first u v)
    (hSecond : IsMoveRoute σ τ second v w) :
    IsMoveRoute σ τ (first ++ second) u w := by
  induction first generalizing u with
  | nil =>
    change u = v at hFirst
    exact hFirst.symm ▸ hSecond
  | cons s rest ih =>
    exact ⟨hFirst.1, ih hFirst.2⟩

theorem exists_tree_route (σ τ : Equiv.Perm ι) (T : SimpleGraph ι)
    (pick : T.edgeSet → ι ⊕ ι) (hPick : ∀ e, moveEndpoints σ τ (pick e) = e.val)
    {u v : ι} (hReach : T.Reachable u v) :
    ∃ route : List (MoveTraversal ι), IsMoveRoute σ τ route u v ∧
      ∀ s ∈ route, ∃ e, s.move = pick e := by
  obtain ⟨walk⟩ := hReach
  induction walk with
  | nil =>
    exact ⟨[], rfl, by simp⟩
  | @cons u v w hAdj rest ih =>
    obtain ⟨route, hRoute, hLabels⟩ := ih
    let e : T.edgeSet := ⟨s(u, v), hAdj⟩
    let m := pick e
    have hEnds : s(moveTail m, moveHead σ τ m) = s(u, v) := by
      rw [← moveEndpoints_tail_head]
      exact hPick e
    have hStep : ∃ step : MoveTraversal ι,
        step.move = m ∧ step.start σ τ = u ∧ step.finish σ τ = v := by
      rcases Sym2.eq_iff.mp hEnds with ⟨hU, hV⟩ | ⟨hV, hU⟩
      · exact ⟨⟨m, false⟩, rfl, hU, hV⟩
      · exact ⟨⟨m, true⟩, rfl, hU, hV⟩
    obtain ⟨s, hs, hu, hv⟩ := hStep
    refine ⟨s :: route, ⟨hu, hv.symm ▸ hRoute⟩, ?_⟩
    intro t ht
    rcases List.mem_cons.mp ht with rfl | ht
    · exact ⟨e, hs⟩
    · exact hLabels t ht

/-- Use a tree route to its tail, the move itself once, and a tree
    route back from its head. -/
theorem exists_closed_route_through_move (σ τ : Equiv.Perm ι) (T : SimpleGraph ι)
    (hTree : T.IsTree) (pick : T.edgeSet → ι ⊕ ι)
    (hPick : ∀ e, moveEndpoints σ τ (pick e) = e.val)
    (root : ι) (m : ι ⊕ ι) :
    ∃ first second : List (MoveTraversal ι),
      IsMoveRoute σ τ (first ++ ⟨m, false⟩ :: second) root root ∧
      (∀ s ∈ first ++ second, ∃ e, s.move = pick e) := by
  obtain ⟨first, hf, hfm⟩ :=
    exists_tree_route σ τ T pick hPick (hTree.connected.preconnected root (moveTail m))
  obtain ⟨second, hs, hsm⟩ :=
    exists_tree_route σ τ T pick hPick (hTree.connected.preconnected (moveHead σ τ m) root)
  have hm : IsMoveRoute σ τ (⟨m, false⟩ :: second) (moveTail m) root := ⟨rfl, hs⟩
  refine ⟨first, second, IsMoveRoute.append σ τ first _ hf hm, ?_⟩
  intro step h
  rcases List.mem_append.mp h with h | h
  · exact hfm step h
  · exact hsm step h


variable {S : Type*} [Group S]

/-- One letter of the word, with the factor automorphism label at
    every possible initial vertex for that letter. -/
def traversalWord (σ τ : Equiv.Perm ι) (labels : ι ⊕ ι → MulAut S)
    (s : MoveTraversal ι) : Equiv.Perm ι × (ι → MulAut S) :=
  match s.move, s.reversed with
  | .inl _, false => (σ, fun i => labels (.inl i))
  | .inl _, true => (σ⁻¹, fun i => (labels (.inl (σ.symm i)))⁻¹)
  | .inr _, false => (τ, fun i => labels (.inr i))
  | .inr _, true => (τ⁻¹, fun i => (labels (.inr (τ.symm i)))⁻¹)

def traversalLabel (labels : ι ⊕ ι → MulAut S) (s : MoveTraversal ι) : MulAut S :=
  if s.reversed then (labels s.move)⁻¹ else labels s.move

theorem traversalWord_eval (σ τ : Equiv.Perm ι) (labels : ι ⊕ ι → MulAut S)
    (s : MoveTraversal ι) :
    (traversalWord σ τ labels s).1 (s.start σ τ) = s.finish σ τ ∧
      (traversalWord σ τ labels s).2 (s.start σ τ) = traversalLabel labels s := by
  rcases s with ⟨m, rev⟩
  cases m <;> cases rev <;>
    simp [traversalWord, MoveTraversal.start, MoveTraversal.finish, traversalLabel,
      moveTail, moveHead, Equiv.Perm.inv_def]

/-- Interpreting a route as a word gives its endpoints and the actual
    ordered product of the labels of the traversed edges. -/
theorem IsMoveRoute.word_eval (σ τ : Equiv.Perm ι) (labels : ι ⊕ ι → MulAut S)
    (steps : List (MoveTraversal ι)) {u v : ι} (hRoute : IsMoveRoute σ τ steps u v) :
    trailPermutation (steps.map (traversalWord σ τ labels)) u = v ∧
      trailLabel (steps.map (traversalWord σ τ labels)) u =
        pathLabel (steps.map (traversalLabel labels)) := by
  induction steps generalizing u with
  | nil =>
    exact ⟨hRoute, rfl⟩
  | cons s rest ih =>
    obtain ⟨hStart, hRest⟩ := hRoute
    subst u
    have hStep := traversalWord_eval σ τ labels s
    have hRestEval := ih hRest
    constructor
    · change (trailPermutation (rest.map (traversalWord σ τ labels)) *
        (traversalWord σ τ labels s).1) (s.start σ τ) = v
      rw [Equiv.Perm.mul_apply, hStep.1, hRestEval.1]
    · change trailLabel (rest.map (traversalWord σ τ labels))
          ((traversalWord σ τ labels s).1 (s.start σ τ)) *
        (traversalWord σ τ labels s).2 (s.start σ τ) =
        pathLabel (rest.map (traversalLabel labels)) * traversalLabel labels s
      rw [hStep.1, hStep.2, hRestEval.2]

theorem traversalWord_is_generator_or_inverse (σ τ : Equiv.Perm ι)
    (labels : ι ⊕ ι → MulAut S) (s : MoveTraversal ι) :
    let x := factorAction σ (fun i => labels (.inl i))
    let y := factorAction τ (fun i => labels (.inr i))
    let e := factorAction (traversalWord σ τ labels s).1 (traversalWord σ τ labels s).2
    e = x ∨ e = x⁻¹ ∨ e = y ∨ e = y⁻¹ := by
  rcases s with ⟨m, rev⟩
  cases m <;> cases rev <;> simp [traversalWord, factorAction_inv]

theorem pathLabel_append (first second : List (MulAut S)) :
    pathLabel (first ++ second) = pathLabel second * pathLabel first := by
  induction first with
  | nil => change pathLabel second = pathLabel second * 1; rw [mul_one]
  | cons a rest ih =>
    change pathLabel (rest ++ second) * a = pathLabel second * (pathLabel rest * a)
    rw [ih, mul_assoc]

theorem route_product_through_move (labels : ι ⊕ ι → MulAut S)
    (first second : List (MoveTraversal ι)) (m : ι ⊕ ι) :
    pathLabel ((first ++ ⟨m, false⟩ :: second).map (traversalLabel labels)) =
      pathLabel (second.map (traversalLabel labels)) * labels m *
        pathLabel (first.map (traversalLabel labels)) := by
  rw [List.map_append, pathLabel_append]
  rfl


theorem route_labels_eq_on_tree {T : SimpleGraph ι} (pick : T.edgeSet → ι ⊕ ι)
    (old new : ι ⊕ ι → MulAut S) (steps : List (MoveTraversal ι))
    (hSteps : ∀ m ∈ steps, ∃ e, m.move = pick e)
    (hTree : ∀ e, new (pick e) = old (pick e)) :
    steps.map (traversalLabel new) = steps.map (traversalLabel old) := by
  apply List.map_congr_left
  intro step hm
  obtain ⟨e, he⟩ := hSteps step hm
  simp [traversalLabel, he, hTree e]

theorem exists_edge_label_through_move {T : SimpleGraph ι}
    (pick : T.edgeSet → ι ⊕ ι) (old : ι ⊕ ι → MulAut S)
    (first second : List (MoveTraversal ι)) (m : ι ⊕ ι)
    (hTree : ∀ s ∈ first ++ second, ∃ e, s.move = pick e)
    (target : MulAut S)
    (hClass : outerProjection target =
      outerProjection (pathLabel ((first ++ ⟨m, false⟩ :: second).map (traversalLabel old)))) :
    ∃ a : MulAut S, outerProjection a = outerProjection (old m) ∧
      ∀ new : ι ⊕ ι → MulAut S, (∀ e, new (pick e) = old (pick e)) → new m = a →
        pathLabel ((first ++ ⟨m, false⟩ :: second).map (traversalLabel new)) = target := by
  rw [route_product_through_move] at hClass
  obtain ⟨a, ⟨ha, hTarget⟩, _⟩ := existsUnique_edge_label_for_word _ _ _ target hClass
  refine ⟨a, ha, ?_⟩
  intro new hFix ha'
  have hf := route_labels_eq_on_tree pick old new first
    (fun step hm => hTree step (List.mem_append_left second hm)) hFix
  have hs := route_labels_eq_on_tree pick old new second
    (fun step hm => hTree step (List.mem_append_right first hm)) hFix
  rw [route_product_through_move, hf, hs, ha']
  exact hTarget

/-- Any prescribed pair of outer-compatible loop labels can be realized
    by changing just two distinct nontree moves. The two choices remain
    valid after arbitrary changes to all other nontree moves. -/
theorem exists_independent_edge_labels_for_closed_routes
    (σ τ : Equiv.Perm ι) (T : SimpleGraph ι) (hTree : T.IsTree)
    (pick : T.edgeSet → ι ⊕ ι) (hPick : ∀ e, moveEndpoints σ τ (pick e) = e.val)
    (root : ι) (a b : ι ⊕ ι) (hab : a ≠ b)
    (ha : ∀ e, pick e ≠ a) (hb : ∀ e, pick e ≠ b)
    (old : ι ⊕ ι → MulAut S) :
    ∃ p q : List (MoveTraversal ι),
      IsMoveRoute σ τ p root root ∧ IsMoveRoute σ τ q root root ∧
      ∀ targetA targetB : MulAut S,
        outerProjection targetA = outerProjection (pathLabel (p.map (traversalLabel old))) →
        outerProjection targetB = outerProjection (pathLabel (q.map (traversalLabel old))) →
        ∃ new : ι ⊕ ι → MulAut S,
          (∀ e, outerProjection (new e) = outerProjection (old e)) ∧
          (∀ e, e ≠ a → e ≠ b → new e = old e) ∧
          (∀ e, new (pick e) = old (pick e)) ∧
          ∀ complete : ι ⊕ ι → MulAut S,
            (∀ e, complete (pick e) = old (pick e)) →
            complete a = new a → complete b = new b →
            pathLabel (p.map (traversalLabel complete)) = targetA ∧
              pathLabel (q.map (traversalLabel complete)) = targetB := by
  classical
  obtain ⟨pf, ps, hp, hpt⟩ := exists_closed_route_through_move σ τ T hTree pick hPick root a
  obtain ⟨qf, qs, hq, hqt⟩ := exists_closed_route_through_move σ τ T hTree pick hPick root b
  refine ⟨pf ++ ⟨a, false⟩ :: ps, qf ++ ⟨b, false⟩ :: qs, hp, hq, ?_⟩
  intro targetA targetB hA hB
  obtain ⟨x, hx, hxForce⟩ := exists_edge_label_through_move pick old pf ps a hpt targetA hA
  obtain ⟨y, hy, hyForce⟩ := exists_edge_label_through_move pick old qf qs b hqt targetB hB
  let new := Function.update (Function.update old a x) b y
  have hNewA : new a = x := by simp [new, hab]
  have hNewB : new b = y := by simp [new]
  have hOther (e : ι ⊕ ι) (hea : e ≠ a) (heb : e ≠ b) : new e = old e := by
    simp [new, hea, heb]
  refine ⟨new, ?_, hOther, fun e => hOther (pick e) (ha e) (hb e), ?_⟩
  · intro e
    by_cases hea : e = a
    · subst e
      rw [hNewA]
      exact hx
    by_cases heb : e = b
    · subst e
      rw [hNewB]
      exact hy
    rw [hOther e hea heb]
  · intro complete hFix hca hcb
    exact ⟨hxForce complete hFix (hca.trans hNewA), hyForce complete hFix (hcb.trans hNewB)⟩

end Shumyatsky
