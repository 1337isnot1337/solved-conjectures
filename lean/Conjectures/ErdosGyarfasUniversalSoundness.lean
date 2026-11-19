import Conjectures.ErdosGyarfasUniversalChecker
import Lean.Elab.Tactic.Omega

/-!
# Soundness of the universal abelian-cover descent checker

An explicit row combination vanishes under every homomorphism that kills its
rows. A checked node therefore gives a closed lifted walk. If its prefix is
simple it gives a cycle of an allowed length; otherwise a checked collision
branch supplies an earlier node whose rows also vanish. Strong induction
terminates this descent. Finally the accepted gauge isomorphism restores the
original arbitrary seven-label assignment.
-/

namespace ErdosGyarfasUniversal

open ErdosGyarfasVoltage

section Combinations

variable {A : Type*} [AddCommGroup A]

def KillsRows (φ : Vector →+ A) (rows : List Vector) : Prop :=
  ∀ v ∈ rows, φ v = 0

theorem combination_killed (φ : Vector →+ A) (coeffs : List ℤ) (rows : List Vector)
    (hrows : KillsRows φ rows) : φ (combination coeffs rows) = 0 := by
  induction coeffs generalizing rows with
  | nil => simp [combination]
  | cons a coeffs ih =>
      cases rows with
      | nil => simp [combination]
      | cons v rows =>
          have hv : φ v = 0 := hrows v (by simp)
          have ht : KillsRows φ rows := by
            intro w hw
            exact hrows w (List.mem_cons.mpr (Or.inr hw))
          change φ (a • v + combination coeffs rows) = 0
          rw [map_add, map_zsmul, hv, zsmul_zero, zero_add]
          exact ih rows ht

theorem combinationsCheck_kills_rows (φ : Vector →+ A)
    (sources rows : List Vector) (coeffs : List (List ℤ))
    (hsources : KillsRows φ sources)
    (hcheck : combinationsCheck sources rows coeffs = true) : KillsRows φ rows := by
  induction rows generalizing coeffs with
  | nil =>
      intro v hv
      simp at hv
  | cons row rows ih =>
      cases coeffs with
      | nil => simp [combinationsCheck] at hcheck
      | cons c coeffs =>
          have hp : (c.length = sources.length ∧ row = combination c sources) ∧
              combinationsCheck sources rows coeffs = true := by
            simpa only [combinationsCheck, Bool.and_eq_true, decide_eq_true_eq] using hcheck
          have hv : φ row = 0 := by
            rw [hp.1.2]
            exact combination_killed φ c sources hsources
          have ht := ih coeffs hp.2
          intro v hmem
          rcases List.mem_cons.mp hmem with rfl | hmem
          · exact hv
          · exact ht v hmem

theorem branchCheck_kills_rows (φ : Vector →+ A) (lookup : ℕ → Node)
    (bound : ℕ) (rows : List Vector) (b : Branch)
    (hcheck : branchCheck lookup bound rows b = true)
    (hrows : KillsRows φ rows) (hdiff : φ (b.right.2 - b.left.2) = 0) :
    b.child < bound ∧ KillsRows φ (lookup b.child).rows := by
  have hp : b.child < bound ∧
      combinationsCheck ((b.right.2 - b.left.2) :: rows)
        (lookup b.child).rows b.combinations = true := by
    simpa only [branchCheck, Bool.and_eq_true, decide_eq_true_eq] using hcheck
  refine ⟨hp.1, combinationsCheck_kills_rows φ _ _ _ ?_ hp.2⟩
  intro v hmem
  rcases List.mem_cons.mp hmem with rfl | hmem
  · exact hdiff
  · exact hrows v hmem

end Combinations

theorem checkNode_sound (lookup : ℕ → Node) (index : ℕ)
    (hcheck : checkNode lookup index = true) :
    LocalValid (lookup index) ∧
      (lookup index).branches.all (branchCheck lookup index (lookup index).rows) = true ∧
      coverageCheck (lookup index).prefix (lookup index).branches = true := by
  simpa only [checkNode, Bool.and_eq_true, decide_eq_true_eq, and_assoc] using hcheck

theorem coverageCheck_sound (prefix : List Position) (branches : List Branch)
    (hcheck : coverageCheck prefix branches = true)
    (p q : Position) (hp : p ∈ prefix) (hq : q ∈ prefix)
    (hbase : p.1 = q.1) (hne : p ≠ q) :
    ∃ b ∈ branches,
      (b.left = p ∧ b.right = q) ∨ (b.left = q ∧ b.right = p) := by
  have hpq := List.all_eq_true.mp
    (List.all_eq_true.mp hcheck p hp) q hq
  have hany : branches.any (fun b => branchMatches b p q) = true := by
    simpa only [pairCovered, ite_eq_left ⟨hbase, hne⟩] using hpq
  obtain ⟨b, hb, hmatches⟩ := List.any_eq_true.mp hany
  exact ⟨b, hb, of_decide_eq_true hmatches⟩

section Lifting

variable {A : Type*} [AddCommGroup A]

def liftPosition (φ : Vector →+ A) (p : Position) : Fin 5 × A :=
  (p.1, φ p.2)

theorem step_lifts (labels : Fin 7 → A) {p q : Position} (hstep : Step p q) :
    (voltageCover (normalizedLabels labels)).Adj
      (liftPosition (chordHom labels) p) (liftPosition (chordHom labels) q) := by
  apply (normalized_adjacency_iff labels _ _).mpr
  refine ⟨hstep.1, ?_⟩
  change chordHom labels q.2 =
    chordHom labels p.2 + chordHom labels (chordStep p.1 q.1)
  rw [hstep.2, map_add]

/-- A mapped prefix with no collisions gives an actual cycle, not merely a
closed word or a nonzero circulation. -/
theorem cycle_of_nodup_lift (labels : Fin 7 → A) (n : Node)
    (hlocal : LocalValid n) (hrows : KillsRows (chordHom labels) n.rows)
    (hnodup : (n.prefix.map (liftPosition (chordHom labels))).Nodup) :
    ∃ (u : Fin 5 × A)
        (p : (voltageCover (normalizedLabels labels)).Walk u u),
      p.IsCycle ∧ p.length ∈ [4, 8, 16, 32] := by
  rcases hlocal with ⟨hallowed, _hprefix, hchain, _hclosingLength, hclosing⟩
  let φ : Vector →+ A := chordHom labels
  have hclose : φ n.total = 0 := by
    rw [← hclosing]
    exact combination_killed φ n.closing n.rows hrows
  let u : Fin 5 × A := (n.start, 0)
  let l : List (Fin 5 × A) := n.prefix.map (liftPosition φ) ++ [u]
  have hmap : n.support.map (liftPosition φ) = l := by
    simp [Node.support, l, u, liftPosition, hclose]
  have hchainMap :
      (n.support.map (liftPosition φ)).IsChain
        (voltageCover (normalizedLabels labels)).Adj :=
    List.isChain_map_of_isChain (liftPosition φ)
      (fun _ _ h => step_lifts labels h) hchain
  have hlchain : l.IsChain (voltageCover (normalizedLabels labels)).Adj := by
    rw [← hmap]
    exact hchainMap
  have hlne : l ≠ [] := by simp [l]
  have hhead : l.head hlne = u := by
    simp [l, Node.prefix, liftPosition, u]
  have hlast : l.getLast hlne = u := by simp [l]
  let p := SimpleGraph.Walk.ofSupport l hlne hlchain
  let w : (voltageCover (normalizedLabels labels)).Walk u u := p.copy hhead hlast
  have hsupport : w.support = l := by
    simp only [w, p, SimpleGraph.Walk.support_copy, SimpleGraph.Walk.support_ofSupport]
  have hlength : w.length = n.prefix.length := by
    simp [w, p, l]
  have hthree : 3 ≤ w.length := by
    rw [hlength]
    simp at hallowed
    omega
  have hwnil : ¬ w.Nil :=
    SimpleGraph.Walk.not_nil_iff_lt_length.mpr (by omega)
  have hpath : w.dropLast.IsPath := by
    apply SimpleGraph.Walk.IsPath.mk'
    rw [SimpleGraph.Walk.support_dropLast hwnil, hsupport]
    simpa only [l, List.dropLast_concat] using hnodup
  refine ⟨u, w,
    SimpleGraph.Walk.isCycle_iff_isPath_dropLast_and_le_length.mpr ⟨hpath, hthree⟩, ?_⟩
  simpa only [hlength] using hallowed

private theorem collision_of_not_nodup {B : Type*} (f : Position → B)
    (prefix : List Position) (hp : prefix.Nodup) (hf : ¬ (prefix.map f).Nodup) :
    ∃ p ∈ prefix, ∃ q ∈ prefix, f p = f q ∧ p ≠ q := by
  classical
  by_contra hnone
  apply hf
  apply hp.map_on
  intro p hp q hq heq
  by_contra hne
  exact hnone ⟨p, hp, q, hq, heq, hne⟩

/-- Every checked node whose row relations hold under the actual chord
homomorphism yields an allowed cycle after a finite descent. -/
theorem checked_table_sound (labels : Fin 7 → A) (lookup : ℕ → Node) (count : ℕ)
    (hchecks : ∀ i, i < count → checkNode lookup i = true) :
    ∀ i, i < count → KillsRows (chordHom labels) (lookup i).rows →
      ∃ (u : Fin 5 × A)
          (p : (voltageCover (normalizedLabels labels)).Walk u u),
        p.IsCycle ∧ p.length ∈ [4, 8, 16, 32] := by
  classical
  intro i
  induction i using Nat.strong_induction_on with
  | h i ih =>
      intro hib hrows
      obtain ⟨hlocal, hbranches, hcoverage⟩ :=
        checkNode_sound lookup i (hchecks i hib)
      by_cases hnodup :
          ((lookup i).prefix.map (liftPosition (chordHom labels))).Nodup
      · exact cycle_of_nodup_lift labels (lookup i) hlocal hrows hnodup
      · obtain ⟨p, hp, q, hq, heq, hne⟩ :=
          collision_of_not_nodup (liftPosition (chordHom labels))
            (lookup i).prefix hlocal.2.1 hnodup
        have hbase : p.1 = q.1 := congrArg Prod.fst heq
        have hphase : chordHom labels p.2 = chordHom labels q.2 :=
          congrArg Prod.snd heq
        obtain ⟨b, hb, hmatch⟩ :=
          coverageCheck_sound (lookup i).prefix (lookup i).branches
            hcoverage p q hp hq hbase hne
        have hbcheck := List.all_eq_true.mp hbranches b hb
        have hdiff : chordHom labels (b.right.2 - b.left.2) = 0 := by
          rcases hmatch with ⟨hl, hr⟩ | ⟨hl, hr⟩ <;>
            simp [map_sub, hl, hr, hphase]
        obtain ⟨hchild, hchildRows⟩ :=
          branchCheck_kills_rows (chordHom labels) lookup i (lookup i).rows
            b hbcheck hrows hdiff
        exact ih b.child hchild (lt_trans hchild hib) hchildRows

/-- A completely checked finite table with an empty-row root proves the
universal statement for the original arbitrary seven-label assignment. -/
theorem cycle_of_checked_table (labels : Fin 7 → A) (lookup : ℕ → Node)
    (count root : ℕ) (hchecks : ∀ i, i < count → checkNode lookup i = true)
    (hroot : root < count) (hempty : (lookup root).rows = []) :
    ∃ (u : Fin 5 × A) (p : (voltageCover labels).Walk u u),
      p.IsCycle ∧ p.length ∈ [4, 8, 16, 32] := by
  have hrows : KillsRows (chordHom labels) (lookup root).rows := by
    rw [hempty]
    intro v hv
    simp at hv
  obtain ⟨u, p, hp, hlength⟩ :=
    checked_table_sound labels lookup count hchecks root hroot hrows
  let e := (gaugeNormalizeIso labels).symm
  refine ⟨e u, p.map e.toHom, hp.map e.injective, ?_⟩
  simpa only [SimpleGraph.Walk.length_map] using hlength

end Lifting

end ErdosGyarfasUniversal
