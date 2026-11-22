module

public import Conjectures.AgnosticVC.BoundedReadoutRates
public import Mathlib.Combinatorics.Colex
public import Mathlib.Order.Prod.Lex.Basic

/-! Turning a countable family of proper local reconstructions into a
representative rule with a bounded deletion cost. -/

@[expose] public section

namespace AgnosticVC

variable {X H : Type*}

/-- The reconstruction index is compared first. Within one index the
witnesses are ordered by the colexicographic order on their row sets. -/
abbrev LocalWitness (n : ℕ) := ℕ ×ₗ Colex (Finset (Fin n))

def LocalWitness.rows {n : ℕ} (w : LocalWitness n) : Finset (Fin n) :=
  ofColex (ofLex w).2

def LocalWitness.output {n : ℕ} (w : LocalWitness n) (gen : ℕ → List X → H) (x : Fin n → X) : H :=
  gen (ofLex w).1 (w.rows.sort.map x)

theorem localWitness_wf (n : ℕ) : WellFounded ((· < ·) : LocalWitness n → LocalWitness n → Prop) := by
  let : Finite (Colex (Finset (Fin n))) := inferInstanceAs (Finite (Finset (Fin n)))
  exact WellFounded.prod_lex Nat.lt_wfRel.wf (Finite.wellFounded_of_trans_of_irrefl _)

private def LocalWitness.lift {n : ℕ} (i : Fin (n+1)) (w : LocalWitness n) : LocalWitness (n+1) :=
  toLex ((ofLex w).1, toColex (w.rows.map i.succAboveEmb))

private theorem LocalWitness.rows_lift {n : ℕ} (i : Fin (n+1)) (w : LocalWitness n) :
    (w.lift i).rows = w.rows.map i.succAboveEmb := rfl

private theorem LocalWitness.lift_mono {n : ℕ} (i : Fin (n+1)) :
    StrictMono (LocalWitness.lift i) := by
  intro u v h
  rw [Prod.Lex.lt_iff] at h ⊢
  rcases h with h | ⟨hj, hrows⟩
  · exact Or.inl h
  · refine Or.inr ⟨hj, ?_⟩
    obtain ⟨a,ha,has,hh⟩ := Finset.Colex.lt_iff_exists_forall_lt.mp hrows
    apply Finset.Colex.lt_iff_exists_forall_lt.mpr
    change ∃ z ∈ (v.lift i).rows, z ∉ (u.lift i).rows ∧
      ∀ b ∈ (u.lift i).rows, b ∉ (v.lift i).rows → b < z
    refine ⟨i.succAboveEmb a, Finset.mem_map_of_mem _ ha, ?_, ?_⟩
    · exact fun hmem => has ((Finset.mem_map' i.succAboveEmb).mp hmem)
    · intro b hb hv
      obtain ⟨c,hc,rfl⟩ := Finset.mem_map.mp hb
      exact Fin.strictMono_succAbove i (hh c hc (fun hm => hv (Finset.mem_map_of_mem _ hm)))

private theorem LocalWitness.exists_lift {n : ℕ} (i : Fin (n+1)) (w : LocalWitness (n+1))
    (hi : i ∉ w.rows) : ∃ v : LocalWitness n, v.lift i = w := by
  obtain ⟨s,hs⟩ := exists_map_succAbove i w.rows hi
  exact ⟨toLex ((ofLex w).1, toColex s), by
    change toLex ((ofLex w).1, toColex (s.map i.succAboveEmb)) = w
    rw [hs]
    rfl⟩

private theorem LocalWitness.output_lift {n : ℕ} (i : Fin (n+1)) (w : LocalWitness n)
    (gen : ℕ → List X → H) (x : Fin (n+1) → X) :
    (w.lift i).output gen x = w.output gen (x ∘ i.succAbove) := by
  change gen (ofLex w).1 ((w.rows.map i.succAboveEmb).sort.map x) =
    gen (ofLex w).1 (w.rows.sort.map (x ∘ i.succAbove))
  have h := StrictMonoOn.map_finsetSort i.succAboveEmb w.rows
    ((Fin.strictMono_succAbove i).strictMonoOn (w.rows : Set (Fin n)))
  change w.rows.sort.map i.succAboveEmb = (w.rows.map i.succAboveEmb).sort at h
  rw [← h, List.map_map]
  rfl

/-- Every feasible finite trace is realized by one proper reconstruction from
an increasing subtuple of at most k rows. -/
structure LocalReconstruction (predict : H → X → Bool) (k : ℕ) where
  generate : ℕ → List X → H
  covers : ∀ {n : ℕ} (x : Fin n → X) (v : TraceSpace predict x),
    ∃ w : LocalWitness n, w.rows.card ≤ k ∧ traceIndex predict x (w.output generate x) = v

variable {predict : H → X → Bool} {k : ℕ}

def LocalReconstruction.eligible (c : LocalReconstruction predict k)
    {n : ℕ} (x : Fin n → X) (v : TraceSpace predict x) : Set (LocalWitness n) :=
  {w | w.rows.card ≤ k ∧ traceIndex predict x (w.output c.generate x) = v}

noncomputable def LocalReconstruction.first (c : LocalReconstruction predict k)
    {n : ℕ} (x : Fin n → X) (v : TraceSpace predict x) : LocalWitness n :=
  (localWitness_wf n).min (c.eligible x v) (c.covers x v)

theorem LocalReconstruction.first_eligible (c : LocalReconstruction predict k)
    {n : ℕ} (x : Fin n → X) (v : TraceSpace predict x) :
    c.first x v ∈ c.eligible x v :=
  (localWitness_wf n).min_mem _ (c.covers x v)

theorem LocalReconstruction.first_le (c : LocalReconstruction predict k)
    {n : ℕ} (x : Fin n → X) (v : TraceSpace predict x) {w : LocalWitness n}
    (hw : w ∈ c.eligible x v) : c.first x v ≤ w :=
  le_of_not_gt ((localWitness_wf n).not_lt_min (c.eligible x v) hw)

/-- The first reconstruction witness gives a representative rule whose
exceptional deletions are confined to the witness rows. -/
noncomputable def LocalReconstruction.readout (c : LocalReconstruction predict k) :
    BoundedTraceReadout predict k where
  represent x v := (c.first x v).output c.generate x
  realizes x v := (c.first_eligible x v).2
  rows x v := (c.first x v).rows
  card_rows_le x v := (c.first_eligible x v).1
  agrees_after_deletion := by
    intro n x i v
    let u := x ∘ i.succAbove
    let a := c.first u v
    let h := a.output c.generate u
    let long := traceIndex predict x h
    let b := c.first x long
    change i ∉ b.rows → b.output c.generate x = h
    intro hi
    have hle : b ≤ a.lift i := by
      apply c.first_le x long
      refine ⟨?_, ?_⟩
      · rw [LocalWitness.rows_lift, Finset.card_map]
        exact (c.first_eligible u v).1
      · rw [LocalWitness.output_lift]
    obtain ⟨a',ha'⟩ := b.exists_lift i hi
    have hshort : a' ∈ c.eligible u v := by
      have hfull := c.first_eligible x long
      refine ⟨?_, ?_⟩
      · have hcard := hfull.1
        change b.rows.card ≤ k at hcard
        rw [← ha', LocalWitness.rows_lift, Finset.card_map] at hcard
        exact hcard
      · have hfit := hfull.2
        change traceIndex predict x (b.output c.generate x) = traceIndex predict x h at hfit
        rw [← ha', LocalWitness.output_lift] at hfit
        have he := congrArg (forgetTrace (sampleFamily predict x) i) hfit
        have hindex (g : H) : forgetTrace (sampleFamily predict x) i (traceIndex predict x g) =
            deletedTraceEquiv predict x i (traceIndex predict u g) :=
          Subtype.ext (sampleTrace_map_succAbove predict x i g).symm
        simp only [hindex, Equiv.apply_eq_iff_eq] at he
        exact he.trans (c.first_eligible u v).2
    have ha : a ≤ a' := c.first_le u v hshort
    have hb : a.lift i ≤ b := ha' ▸ (LocalWitness.lift_mono i).monotone ha
    rw [le_antisymm hle hb, LocalWitness.output_lift]

end AgnosticVC
