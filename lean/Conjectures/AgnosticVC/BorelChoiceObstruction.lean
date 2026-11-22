module

public import Conjectures.AgnosticVC.BorelCodes

/-! The Borel obstruction can hold even when finite trace feasibility is Borel.
The output names encode valuations of monotone Boolean codes applied to themselves. -/

@[expose] public section

open Set MeasureTheory ProbabilityTheory

namespace AgnosticVC.BorelCode

def selfAssignments : Set (Code × Assignment) := {p | Valid p.1 p.1 p.2}

abbrev Witness := selfAssignments × ℕ
abbrev Feature := Code ⊕ Witness
abbrev Hypothesis := Unit ⊕ Witness

instance : StandardBorelSpace selfAssignments := measurableSet_valid_self.standardBorel

def witnessCode (w : Witness) : Code := w.1.val.1

def witnessTruth (w : Witness) : Bool := w.1.val.2 []

theorem measurable_witnessCode : Measurable witnessCode :=
  measurable_fst.comp (measurable_subtype_coe.comp measurable_fst)

theorem measurable_witnessTruth : Measurable witnessTruth :=
  (measurable_pi_apply []).comp (measurable_snd.comp (measurable_subtype_coe.comp measurable_fst))

theorem witnessCode_surjective : Function.Surjective witnessCode := by
  intro c
  obtain ⟨v,hv⟩ := exists_valid c c
  exact ⟨(⟨(c,v),hv⟩,0),rfl⟩

theorem exists_witness_outside (c : Code) (F : Finset Witness) :
    ∃ w ∉ F, witnessCode w = c := by
  obtain ⟨v,hv⟩ := exists_valid c c
  refine ⟨(⟨(c,v),hv⟩, F.sup Prod.snd + 1), ?_, rfl⟩
  intro h
  have hl := Finset.le_sup (f := Prod.snd) h
  change F.sup Prod.snd + 1 ≤ F.sup Prod.snd at hl
  omega

noncomputable def predict : Hypothesis → Feature → Bool := borelPairPredict witnessCode

theorem measurable_predict : Measurable (fun p : Feature × Hypothesis => predict p.2 p.1) :=
  measurable_borelPairPredict _ measurable_witnessCode

def markerCandidate (x : Feature) : Hypothesis := x.elim (fun _ => .inl ()) Sum.inr

theorem measurable_markerCandidate : Measurable markerCandidate :=
  measurable_fun_sum measurable_const measurable_inr

noncomputable def firstCopyMatch (a x : Feature) : Bool := by
  classical
  exact match a, x with
  | .inl a, .inl x => decide (a = x)
  | _, _ => false

theorem measurable_firstCopyMatch : Measurable (fun p : Feature × Feature => firstCopyMatch p.1 p.2) := by
  classical
  apply (MeasurableEquiv.sumProdSum Code Witness Code Witness).symm.measurable_comp_iff.mp
  apply measurable_fun_sum <;> apply measurable_fun_sum
  · change Measurable (fun p : Code × Code => decide (p.1 = p.2))
    have h : Measurable (fun p : Code × Code => if p.1 = p.2 then true else false) :=
      Measurable.ite (measurableSet_eq_fun measurable_fst measurable_snd) measurable_const measurable_const
    convert h using 1
    funext p
    split <;> simp_all
  · exact measurable_const
  · exact measurable_const
  · exact measurable_const

private theorem realizes_iff_candidates {n : ℕ} (v : Fin n → Bool) (x : Fin n → Feature) :
    (∃ h, ∀ j, predict h (x j) = v j) ↔
      (∀ j, v j = false) ∨
      (∃ i, ∀ j, predict (markerCandidate (x i)) (x j) = v j) ∨
      (∃ i, v i = true ∧ ∀ j, firstCopyMatch (x i) (x j) = v j) := by
  classical
  constructor
  · rintro ⟨h,hh⟩
    by_cases hzero : ∀ j, v j = false
    · exact Or.inl hzero
    · by_contra! hnot
      have hno (i : Fin n) : ¬ ∀ j, predict (markerCandidate (x i)) (x j) = v j :=
        not_forall.mpr (hnot.2.1 i)
      obtain ⟨i,hi⟩ := not_forall.mp hzero
      have hit : v i = true := Bool.eq_true_of_not_eq_false hi
      rcases h with _ | w
      · simpa [predict] using (hh i).trans hit
      · have hmarker (j : Fin n) (u : Witness) (hju : x j = .inr u) : v j = false := by
          by_contra! hbad
          have hy : predict (.inr w) (.inr u) = true := by
            rw [← hju, hh, Bool.eq_true_of_not_eq_false hbad]
          have he := (borelPairPredict_inr_true witnessCode (.inr w) u).mp hy
          apply hno j
          simpa only [hju, markerCandidate, Sum.elim_inr, ← he] using hh
        rcases hx : x i with a | u
        · have hp : predict (.inr w) (.inl a) = true := by rw [← hx, hh, hit]
          have ha : witnessCode w = a := (borelPairPredict_inl_true _ _ _).mp hp
          have hfit (j : Fin n) : firstCopyMatch (x i) (x j) = v j := by
            rcases hj : x j with b | u
            · have he := hh j
              rw [hj] at he
              simpa [hx, hj, firstCopyMatch, predict, borelPairPredict, ha] using he
            · simp [hx, firstCopyMatch, hmarker j u hj]
          exact not_forall.mpr (hnot.2.2 i hit) hfit
        · exact hi (hmarker i u hx)
  · rintro (hzero | ⟨i,hi⟩ | ⟨i,hpos,hi⟩)
    · exact ⟨.inl (), by simp [predict, hzero]⟩
    · exact ⟨markerCandidate (x i), hi⟩
    · rcases hai : x i with a | u
      · let markers : Finset Witness := Finset.univ.biUnion fun j =>
          (x j).elim (fun _ => ∅) fun q => {q}
        obtain ⟨w,hw,ha⟩ := exists_witness_outside a markers
        refine ⟨.inr w, fun j => ?_⟩
        rcases hj : x j with b | q
        · have he := hi j
          simpa [hai, hj, firstCopyMatch, predict, borelPairPredict, ha] using he
        · have hneq : w ≠ q := by
            intro h
            apply hw
            rw [h]
            exact Finset.mem_biUnion.mpr ⟨j, Finset.mem_univ _, by simp [hj]⟩
          have he := hi j
          simpa [hai, hj, firstCopyMatch, predict, borelPairPredict, hneq] using he
      · simpa [hai, firstCopyMatch, hpos] using hi i

/-- Feasibility of every fixed finite trace is Borel, despite the lack of a Borel
proper approximate empirical minimizer. -/
theorem measurableSet_realizes {n : ℕ} (v : Fin n → Bool) :
    MeasurableSet {x : Fin n → Feature | ∃ h, ∀ j, predict h (x j) = v j} := by
  have h := realizes_iff_candidates (n := n) v
  have he : {x : Fin n → Feature | ∃ h, ∀ j, predict h (x j) = v j} =
      {x | ∀ j, v j = false} ∪ (⋃ i : Fin n, ⋂ j : Fin n,
          {x | predict (markerCandidate (x i)) (x j) = v j}) ∪
        (⋃ i : Fin n, {x | v i = true} ∩ ⋂ j : Fin n,
          {x | firstCopyMatch (x i) (x j) = v j}) := by
    ext x
    simp only [h x, mem_union, mem_iUnion, mem_iInter, mem_inter_iff, mem_ofPred_eq]
    tauto
  rw [he]
  have hzero : MeasurableSet {x : Fin n → Feature | ∀ j, v j = false} := by
    by_cases h : ∀ j, v j = false <;> simp [h]
  have hpos (i : Fin n) : MeasurableSet {x : Fin n → Feature | v i = true} := by
    by_cases h : v i = true <;> simp [h]
  refine (hzero.union (MeasurableSet.iUnion fun i =>
    MeasurableSet.iInter fun j => ?_)).union (MeasurableSet.iUnion fun i =>
      (hpos i).inter (MeasurableSet.iInter fun j => ?_))
  · have hm : Measurable (fun x : Fin n → Feature => (x j, markerCandidate (x i))) :=
      (measurable_pi_apply j).prodMk (measurable_markerCandidate.comp (measurable_pi_apply i))
    exact measurableSet_eq_fun (measurable_predict.comp hm) measurable_const
  · have hm : Measurable (fun x : Fin n → Feature => (x i, x j)) :=
      (measurable_pi_apply i).prodMk (measurable_pi_apply j)
    exact measurableSet_eq_fun (measurable_firstCopyMatch.comp hm) measurable_const

def truth (h : Hypothesis) : Bool := h.elim (fun _ => true) witnessTruth

theorem measurable_truth : Measurable truth := measurable_fun_sum measurable_const measurable_witnessTruth

theorem matching_truth_of_represents {c : Code} {A : Set Code} (hA : Represents c A)
    {h : Hypothesis} (hh : predict h (.inl c) = true) : (truth h = true ↔ c ∈ A) := by
  rcases h with _ | w
  · simp [predict] at hh
  · have he : witnessCode w = c := (borelPairPredict_inl_true witnessCode _ _).mp hh
    have hw := w.1.property
    change Valid (witnessCode w) (witnessCode w) w.1.val.2 at hw
    rw [he] at hw
    exact hA c _ hw

/-- No globally Borel proper Markov kernel can achieve empirical excess below one on
every training sample for this VC-one class with a surjective first-coordinate map. -/
theorem no_accurateKernel {n : ℕ} (hn : 0 < n)
    (K : Kernel (Fin n → Feature × Bool) Hypothesis) [IsMarkovKernel K]
    {ε : ℝ} (hε : ε < 1) :
    ¬ ∀ z, (∫ h, empiricalError predict z h ∂K z) ≤ (⨅ h, empiricalError predict z h) + ε := by
  intro hacc
  let z (c : Code) := repeatedPositiveSample n (Sum.inl c : Feature)
  have hz : Measurable z := Measurable.of_eval fun _ => measurable_inl.prodMk measurable_const
  let L := K.comap z hz
  have hL : IsMarkovKernel L := inferInstance
  let f (p : Code × Hypothesis) : ℝ := if predict p.2 (.inl p.1) = true ∧ truth p.2 = false then 1 else 0
  have hpred : Measurable (fun p : Code × Hypothesis => predict p.2 (.inl p.1)) :=
    measurable_predict.comp ((measurable_inl.comp measurable_fst).prodMk measurable_snd)
  have hf : Measurable f := Measurable.ite ((measurableSet_eq_fun hpred measurable_const).inter
    (measurableSet_eq_fun (measurable_truth.comp measurable_snd) measurable_const))
      measurable_const measurable_const
  let mass (c : Code) := ∫ h, f (c,h) ∂L c
  have hmass : Measurable mass := (hf.stronglyMeasurable.integral_kernel_prod_right' (κ := L)).measurable
  let A : Set Code := {c | 0 < mass c}
  have hA : MeasurableSet A := measurableSet_lt measurable_const hmass
  obtain ⟨c,hc⟩ := exists_represents_measurableSet hA
  by_cases hm : c ∈ A
  · have he : ∀ h, f (c,h) = 0 := by
      intro h
      dsimp [f]
      split
      · rename_i hh
        have ht := (matching_truth_of_represents hc hh.1).mpr hm
        simp [ht] at hh
      · rfl
    have hmore : 0 < mass c := hm
    have hzero : mass c = 0 := by simp [mass, he]
    linarith
  · have he : ∀ h, f (c,h) = 1 - empiricalError predict (z c) h := by
      intro h
      rw [empiricalError_repeatedPositiveSample hn]
      by_cases hp : predict h (.inl c) = true
      · have ht : truth h = false := by
          cases htruth : truth h
          · rfl
          · exact (hm ((matching_truth_of_represents hc hp).mp htruth)).elim
        simp [f, hp, ht]
      · simp [f, hp]
    have hident : mass c = 1 - ∫ h, empiricalError predict (z c) h ∂K (z c) := by
      simp_rw [mass, he]
      rw [integral_sub (integrable_const _) (empiricalError_integrable_of_joint_measurable
        predict measurable_predict _ _)]
      simp [L, Kernel.comap_apply]
    obtain ⟨w,hw⟩ := witnessCode_surjective c
    have hwfit : empiricalError predict (z c) (.inr w) = 0 := by
      rw [empiricalError_repeatedPositiveSample hn]
      simp [predict, hw]
    have hbelow : BddBelow (range (empiricalError predict (z c))) := by
      refine ⟨0, ?_⟩
      rintro _ ⟨h,rfl⟩
      rw [empiricalError_repeatedPositiveSample hn]
      split <;> norm_num
    have hmin := ciInf_le hbelow (.inr w)
    rw [hwfit] at hmin
    have h := hacc (z c)
    have hnpos : ¬ 0 < mass c := hm
    linarith [le_of_not_gt hnpos]

/-- The standard Borel counterexample has distinct classifiers, jointly Borel
evaluation and Borel finite-trace feasibility, while ruling out all proper
Borel Markov kernels at the prescribed accuracy. -/
theorem standardBorel_trace_obstruction :
    StandardBorelSpace Feature ∧ StandardBorelSpace Hypothesis ∧
    Function.Injective predict ∧ Measurable (fun p : Feature × Hypothesis => predict p.2 p.1) ∧
    HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
    (∀ (n : ℕ) (v : Fin n → Bool), MeasurableSet {x : Fin n → Feature | ∃ h, ∀ j, predict h (x j) = v j}) ∧
    (∀ {n : ℕ}, 0 < n → ∀ (K : Kernel (Fin n → Feature × Bool) Hypothesis)
      [IsMarkovKernel K] {ε : ℝ}, ε < 1 →
      ¬ ∀ z, (∫ h, empiricalError predict z h ∂K z) ≤ (⨅ h, empiricalError predict z h) + ε) := by
  let : Nonempty Witness := ⟨(witnessCode_surjective (fun _ => (0, false))).choose⟩
  refine ⟨standardBorelSpace_sum, standardBorelSpace_sum, injective_borelPairPredict witnessCode,
    measurable_predict, hasVCDimensionAtMost_borelPairPredict witnessCode,
    not_hasVCDimensionAtMost_zero_borelPairPredict witnessCode, fun _ v => measurableSet_realizes v, ?_⟩
  intro n hn K _ ε
  exact no_accurateKernel hn K

end AgnosticVC.BorelCode
