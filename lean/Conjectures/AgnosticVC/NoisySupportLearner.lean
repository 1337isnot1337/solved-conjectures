module

public import Conjectures.AgnosticVC.CompactScoreNoise
public import Conjectures.AgnosticVC.OriginalInformation
public import Conjectures.AgnosticVC.EmpiricalInfimum

/-! Argmax readout with one reference score and a common tie order. -/

@[expose] public section

namespace AgnosticVC

open Finset
open scoped ENNReal

variable {I : Type*} [Fintype I] [LinearOrder I]

theorem existsUnique_noisyScoreWinner (t : I → ℤ) (θ : ℤ) :
    ∃! w : Option I, match w with
      | none => ∀ i, t i ≤ θ
      | some i => θ < t i ∧ ∀ j, t j ≤ t i ∧ (t j = t i → i ≤ j) := by
  classical
  by_cases he : ∃ i, θ < t i
  · let S := univ.filter (fun i : I => θ < t i)
    have hS : S.Nonempty := by
      obtain ⟨i,hi⟩ := he
      exact ⟨i, mem_filter.mpr ⟨mem_univ _,hi⟩⟩
    obtain ⟨j,hj,hmax⟩ := exists_max_image S t hS
    let M := S.filter (fun i => t i = t j)
    have hM : M.Nonempty := ⟨j, mem_filter.mpr ⟨hj,rfl⟩⟩
    let i := M.min' hM
    have hi := mem_filter.mp (min'_mem M hM)
    have hθ := (mem_filter.mp hi.1).2
    have hiRule (a : I) : t a ≤ t i ∧ (t a = t i → i ≤ a) := by
      by_cases ha : θ < t a
      · have haS : a ∈ S := mem_filter.mpr ⟨mem_univ _,ha⟩
        refine ⟨(hmax a haS).trans_eq hi.2.symm, fun ht => ?_⟩
        exact min'_le M a (mem_filter.mpr ⟨haS,ht.trans hi.2⟩)
      · exact ⟨(le_of_not_gt ha).trans hθ.le, fun ht =>
          (ha (ht ▸ hθ)).elim⟩
    refine ⟨some i, ⟨hθ,hiRule⟩, ?_⟩
    intro w hw
    cases w with
    | none => exact (not_lt_of_ge (hw i) hθ).elim
    | some a =>
      have hia : t i = t a := le_antisymm (hw.2 i).1 (hiRule a).1
      exact congrArg some (le_antisymm ((hw.2 i).2 hia) ((hiRule a).2 hia.symm))
  · refine ⟨none, fun i => le_of_not_gt (fun hi => he ⟨i,hi⟩), ?_⟩
    rintro (_ | i) hw
    · rfl
    · exact (he ⟨i,hw.1⟩).elim

/-- Return the least maximizing candidate when its score strictly exceeds the
reference score. Use `none` for the reference hypothesis. -/
noncomputable def noisyScoreWinner (t : I → ℤ) (θ : ℤ) : Option I :=
  Classical.choose (existsUnique_noisyScoreWinner t θ).exists

theorem noisyScoreWinner_characterization (t : I → ℤ) (θ : ℤ) (w : Option I) :
    noisyScoreWinner t θ = w ↔ match w with
      | none => ∀ i, t i ≤ θ
      | some i => θ < t i ∧ ∀ j, t j ≤ t i ∧ (t j = t i → i ≤ j) := by
  let P (w : Option I) := match w with
    | none => ∀ i, t i ≤ θ
    | some i => θ < t i ∧ ∀ j, t j ≤ t i ∧ (t j = t i → i ≤ j)
  have hP : P (noisyScoreWinner t θ) := by
    unfold noisyScoreWinner
    exact Classical.choose_spec (existsUnique_noisyScoreWinner t θ).exists
  change noisyScoreWinner t θ = w ↔ P w
  exact ⟨fun h => h ▸ hP, fun h => (existsUnique_noisyScoreWinner t θ).unique hP h⟩

/-- Adding candidates whose scores are below the reference leaves the output
unchanged. An order embedding preserves all ties among retained candidates. -/
theorem noisyScoreWinner_of_embedding {J : Type*} [Fintype J] [LinearOrder J]
    (e : I ↪o J) (t : J → ℤ) (θ : ℤ) (hθ : ∀ j ∉ Set.range e, t j ≤ θ) :
    noisyScoreWinner t θ = (noisyScoreWinner (t ∘ e) θ).map e := by
  cases hw : noisyScoreWinner (t ∘ e) θ with
  | none =>
    refine (noisyScoreWinner_characterization t θ none).mpr ?_
    intro j
    by_cases hj : j ∈ Set.range e
    · obtain ⟨i,rfl⟩ := hj
      exact (noisyScoreWinner_characterization (t ∘ e) θ none).mp hw i
    · exact hθ j hj
  | some i =>
    have hi := (noisyScoreWinner_characterization (t ∘ e) θ (some i)).mp hw
    refine (noisyScoreWinner_characterization t θ (some (e i))).mpr ⟨hi.1,?_⟩
    intro j
    by_cases hj : j ∈ Set.range e
    · obtain ⟨j,rfl⟩ := hj
      exact ⟨(hi.2 j).1, fun ht => e.monotone ((hi.2 j).2 ht)⟩
    · have hlt := (hθ j hj).trans_lt hi.1
      exact ⟨hlt.le, fun ht => (hlt.ne ht).elim⟩

omit [LinearOrder I] in
/-- Independent score coordinates that the readout ignores on the support of
the input law can be integrated out exactly. -/
theorem marginal_product_eq_restrict {O : Type*}
    (p : I → Prop) [DecidablePred p] [DecidableEq I]
    {T : I → Type*} [∀ i, Fintype (T i)] (q : ∀ i, T i → ℝ)
    (hq : ∀ i, IsLaw (q i))
    (f : ((i : I) → T i) → O) (g : ((i : {i // p i}) → T i.val) → O)
    (hfg : ∀ x, (∀ i, q i (x i) ≠ 0) → f x = g (fun i => x i.val)) :
    marginal f (fun x => ∏ i, q i (x i)) =
      marginal g (fun u => ∏ i : {i // p i}, q i.val (u i)) := by
  classical
  funext o
  simp only [marginal, sum_filter]
  have he (x : (i : I) → T i) :
      (if f x = o then ∏ i, q i (x i) else 0) =
        if g (fun i => x i.val) = o then ∏ i, q i (x i) else 0 := by
    by_cases hx : ∀ i, q i (x i) ≠ 0
    · rw [hfg x hx]
    · push Not at hx
      obtain ⟨i,hi⟩ := hx
      rw [prod_eq_zero (mem_univ i) hi]
      simp
  simp_rw [he]
  let U := (i : {i // p i}) → T i.val
  let V := (i : {i // ¬ p i}) → T i.val
  let e : ((i : I) → T i) ≃ U × V := Equiv.piEquivPiSubtypeProd p T
  let uMass (u : U) := ∏ i : {i // p i}, q i.val (u i)
  let vMass (v : V) := ∏ i : {i // ¬ p i}, q i.val (v i)
  let ψ (uv : U × V) := if g uv.1 = o then uMass uv.1 * vMass uv.2 else 0
  have hψ (x : (i : I) → T i) :
      (if g (fun i => x i.val) = o then ∏ i, q i (x i) else 0) = ψ (e x) := by
    unfold ψ uMass vMass
    change (if g (fun i => x i.val) = o then ∏ i, q i (x i) else 0) =
      if g (fun i => x i.val) = o then
        (∏ i : {i // p i}, q i.val (x i.val)) * (∏ i : {i // ¬ p i}, q i.val (x i.val)) else 0
    rw [Fintype.prod_subtype_mul_prod_subtype p (fun i => q i (x i))]
  simp_rw [hψ]
  rw [Fintype.sum_equiv e (fun x => ψ (e x)) ψ (fun _ => rfl), Fintype.sum_prod_type]
  have hv : ∑ v : V, vMass v = 1 := by
    unfold vMass
    rw [← Fintype.prod_sum]
    simp only [(hq _).2, prod_const_one]
  apply sum_congr rfl
  intro u _
  by_cases hu : g u = o
  · simp only [ψ, hu, ite_true]
    rw [← mul_sum, hv, mul_one]
  · simp [ψ, hu]

omit [LinearOrder I] in
/-- The finite product restriction identity for an arbitrary embedding of
the retained score coordinates. -/
theorem marginal_product_eq_embedding {J T O : Type*} [Fintype J] [Fintype T]
    [DecidableEq I] [DecidableEq J] (e : I ↪ J) (q : J → T → ℝ)
    (hq : ∀ j, IsLaw (q j)) (f : (J → T) → O) (g : (I → T) → O)
    (hfg : ∀ x, (∀ j, q j (x j) ≠ 0) → f x = g (x ∘ e)) :
    marginal f (fun x => ∏ j, q j (x j)) = marginal g (fun x => ∏ i, q (e i) (x i)) := by
  classical
  let p (j : J) := j ∈ Set.range e
  let : Fintype {j // p j} := Subtype.fintype p
  let ep : I ≃ {j // p j} := Equiv.ofInjective e e.injective
  let E : (I → T) ≃ ({j // p j} → T) := ep.arrowCongr (Equiv.refl T)
  let G : ({j // p j} → T) → O := g ∘ E.symm
  have hG (x : J → T) : G (fun j => x j.val) = g (x ∘ e) := rfl
  rw [marginal_product_eq_restrict p q hq f G (fun x hx => (hfg x hx).trans (hG x).symm)]
  funext o
  simp only [marginal, sum_filter]
  symm
  apply Fintype.sum_equiv E
  intro x
  have hprod : (∏ i, q (e i) (x i)) = ∏ j : {j // p j}, q j.val (E x j) := by
    apply Fintype.prod_equiv ep
    intro i
    change q (e i) (x i) = q (e i) (x (ep.symm (ep i)))
    rw [ep.symm_apply_apply]
  have hg : G (E x) = g x := by simp [G]
  rw [hprod, hg]

/-- Finite named output law of independently perturbing the scores and then
returning the best candidate or the reference. -/
noncomputable def noisyArgmaxLaw [DecidableEq I] {k : ℕ} (hk : 0 < k) (offset : ℤ)
    (a : I → ℤ) (T : I → Finset ℤ) (hT : ∀ i, Icc (a i - 2 * k) (a i + 2 * k) ⊆ T i) :
    PMF (Option I) := by
  classical
  let q (i : I) (t : T i) := scoreNoiseMass k (a i) t
  have hq (i : I) : IsLaw (q i) := scoreNoiseMass_isLaw hk (a i) (T i) (hT i)
  let p (t : (i : I) → T i) := ∏ i, q i (t i)
  have hnon (t : (i : I) → T i) : 0 ≤ p t := prod_nonneg fun i _ => (hq i).1 (t i)
  have hsum : ∑ t, p t = 1 := by
    unfold p
    rw [← Fintype.prod_sum]
    simp only [(hq _).2, prod_const_one]
  have hnorm : ∑ t, ENNReal.ofReal (p t) = 1 := by
    rw [← ENNReal.ofReal_sum_of_nonneg (fun t _ => hnon t), hsum, ENNReal.ofReal_one]
  exact (PMF.ofFintype (fun t => ENNReal.ofReal (p t)) hnorm).map
    (fun t => noisyScoreWinner (fun i => (t i : ℤ)) (offset + 2 * k))

theorem noisyArgmaxLaw_named_mass [DecidableEq I] {O : Type*} {k : ℕ} (hk : 0 < k) (offset : ℤ)
    (a : I → ℤ) (T : I → Finset ℤ) (hT : ∀ i, Icc (a i - 2 * k) (a i + 2 * k) ⊆ T i)
    (name : Option I → O) (w : O) :
    ((noisyArgmaxLaw hk offset a T hT).map name w).toReal =
      marginal (fun t : (i : I) → T i => name (noisyScoreWinner (fun i => (t i : ℤ)) (offset + 2 * k)))
        (fun t => ∏ i, scoreNoiseMass k (a i) (t i)) w := by
  classical
  let f (t : (i : I) → T i) := name (noisyScoreWinner (fun i => (t i : ℤ)) (offset + 2 * k))
  let p (t : (i : I) → T i) := ∏ i, scoreNoiseMass k (a i) (t i)
  have hp (t : (i : I) → T i) : 0 ≤ p t :=
    prod_nonneg fun i _ => (scoreNoiseMass_isLaw hk (a i) (T i) (hT i)).1 (t i)
  unfold noisyArgmaxLaw
  rw [PMF.map_comp, PMF.map_apply, tsum_fintype]
  simp only [PMF.ofFintype_apply]
  calc
    _ = (∑ t ∈ univ.filter (fun t => f t = w), ENNReal.ofReal (p t)).toReal := by
      congr 1
      rw [sum_filter]
      apply sum_congr rfl
      intro t _
      by_cases h : f t = w <;> simp [← show w = f t ↔ f t = w from eq_comm, h, f, p]
    _ = _ := by rw [← ENNReal.ofReal_sum_of_nonneg (fun t _ => hp t),
                   ENNReal.toReal_ofReal (sum_nonneg fun t _ => hp t)]; rfl

theorem noisyArgmaxLaw_mass [DecidableEq I] {k : ℕ} (hk : 0 < k) (offset : ℤ)
    (a : I → ℤ) (T : I → Finset ℤ) (hT : ∀ i, Icc (a i - 2 * k) (a i + 2 * k) ⊆ T i)
    (w : Option I) :
    (noisyArgmaxLaw hk offset a T hT w).toReal =
      marginal (fun t : (i : I) → T i => noisyScoreWinner (fun i => (t i : ℤ)) (offset + 2 * k))
        (fun t => ∏ i, scoreNoiseMass k (a i) (t i)) w := by
  simpa only [PMF.map_id, id_eq] using noisyArgmaxLaw_named_mass hk offset a T hT id w

/-- Padding a finite candidate list with candidates of low original score
does not change the named output probability mass. -/
theorem noisyArgmaxLaw_map_eq_of_embedding [DecidableEq I] {J O : Type*} [Fintype J] [LinearOrder J]
    [DecidableEq J]
    {k : ℕ} (hk : 0 < k) (offset : ℤ) (e : I ↪o J) (a : J → ℤ) (T : Finset ℤ)
    (hT : ∀ j, Icc (a j - 2 * k) (a j + 2 * k) ⊆ T)
    (hscore : ∀ j ∉ Set.range e, a j ≤ offset)
    (name : Option J → O) :
    (noisyArgmaxLaw hk offset a (fun _ => T) hT).map name =
      (noisyArgmaxLaw hk offset (a ∘ e) (fun _ => T) (fun i => hT (e i))).map
        (name ∘ Option.map e) := by
  classical
  let θ := offset + 2 * k
  let p (j : J) (t : T) := scoreNoiseMass k (a j) t
  let f (t : J → T) := name (noisyScoreWinner (fun j => (t j : ℤ)) θ)
  let g (t : I → T) := name ((noisyScoreWinner (fun i => (t i : ℤ)) θ).map e)
  have hp (j : J) : IsLaw (p j) := scoreNoiseMass_isLaw hk (a j) T (hT j)
  have he : marginal f (fun t => ∏ j, p j (t j)) = marginal g (fun t => ∏ i, p (e i) (t i)) := by
    apply marginal_product_eq_embedding e.toEmbedding p hp f g
    intro t ht
    change name (noisyScoreWinner (fun j => (t j : ℤ)) θ) =
      name ((noisyScoreWinner (fun i => (t (e i) : ℤ)) θ).map e)
    apply congrArg name
    apply noisyScoreWinner_of_embedding e
    intro j hj
    have hb := (scoreNoiseMass_ne_zero_bounds (ht j)).2
    unfold θ
    linarith only [hb, hscore j hj]
  ext w
  change ((noisyArgmaxLaw hk offset a (fun _ => T) hT).map name) w = _
  have hw := noisyArgmaxLaw_named_mass hk offset a (fun _ => T) hT name w
  have hv := noisyArgmaxLaw_named_mass hk offset (a ∘ e) (fun _ => T) (fun i => hT (e i))
    (name ∘ Option.map e) w
  have hm := hw.trans ((congrFun he w).trans hv.symm)
  exact (ENNReal.ofReal_toReal (PMF.apply_ne_top _ _)).symm.trans
    ((congrArg ENNReal.ofReal hm).trans (ENNReal.ofReal_toReal (PMF.apply_ne_top _ _)))

section SignedCounts

variable {X H : Type*} {n k : ℕ}

/-- Signed improvement counts over the reference on an entire labeled sample. -/
def sampleSupportScore (predict : H → X → Bool) (z : Fin n → X × Bool) (h : H) : ℤ :=
  ∑ j, supportScore predict h (z j)

theorem sampleSupportScore_abs_le (predict : H → X → Bool) (z : Fin n → X × Bool) (h : H) :
    |sampleSupportScore predict z h| ≤ n := by
  unfold sampleSupportScore
  calc
    _ ≤ ∑ j, |supportScore predict h (z j)| := abs_sum_le_sum_abs _ _
    _ ≤ ∑ _j : Fin n, (1 : ℤ) := sum_le_sum fun j _ => by
      cases hx : predict h (z j).1 <;> cases hy : (z j).2 <;> norm_num [supportScore, hx, hy]
    _ = _ := by simp

/-- All shifted score supports for size `n` fit in one integer alphabet. -/
def noisyScoreAlphabet (n k : ℕ) : Finset ℤ := Icc (-(n : ℤ) - 2*k) ((n : ℤ) + 2*k)

theorem sampleSupportScore_interval_subset (predict : H → X → Bool)
    (z : Fin n → X × Bool) (h : H) :
    Icc (sampleSupportScore predict z h - 2*k) (sampleSupportScore predict z h + 2*k) ⊆
      noisyScoreAlphabet n k := by
  have ha := abs_le.mp (sampleSupportScore_abs_le predict z h)
  intro t ht
  unfold noisyScoreAlphabet
  simp only [mem_Icc] at ht ⊢
  omega

/-- Even in an infinite class, bounded pointwise overlap makes the set of
candidates hit by any finite sample finite. -/
noncomputable def hitCandidates {R : Type*} [Finite R] (predict : H → X → Bool)
    (hfin : ∀ x, {h | predict h x = true}.Finite) (x : R → X) : Finset H :=
  (Set.finite_iUnion (fun i => hfin (x i))).toFinset

@[simp] theorem mem_hitCandidates {R : Type*} [Finite R] (predict : H → X → Bool)
    (hfin : ∀ x, {h | predict h x = true}.Finite) (x : R → X) (h : H) :
    h ∈ hitCandidates predict hfin x ↔ ∃ i, predict h (x i) = true := by
  simp [hitCandidates]

/-- The proper noisy-score learner with a reference output and arbitrary
original hypothesis names. The law is defined before any pool is supplied. -/
noncomputable def noisySupportLearner [LinearOrder H] (hk : 0 < k) (offset : ℤ)
    (predict : H → X → Bool) (hfin : ∀ x, {h | predict h x = true}.Finite)
    (z : Fin n → X × Bool) : PMF (Option H) := by
  let C := hitCandidates predict hfin (Prod.fst ∘ z)
  exact (noisyArgmaxLaw hk offset (fun h : C => sampleSupportScore predict z h)
    (fun _ => noisyScoreAlphabet n k) (fun h => sampleSupportScore_interval_subset predict z h)).map
    (Option.map Subtype.val)

theorem noisySupportLearner_eq_on_superset [LinearOrder H] (hk : 0 < k) {offset : ℤ} (hoff : 0 ≤ offset)
    (predict : H → X → Bool) (hfin : ∀ x, {h | predict h x = true}.Finite)
    (z : Fin n → X × Bool) (C : Finset H) (hC : hitCandidates predict hfin (Prod.fst ∘ z) ⊆ C) :
    noisySupportLearner hk offset predict hfin z =
      (noisyArgmaxLaw hk offset (fun h : C => sampleSupportScore predict z h)
        (fun _ => noisyScoreAlphabet n k) (fun h => sampleSupportScore_interval_subset predict z h)).map
        (Option.map Subtype.val) := by
  let B := hitCandidates predict hfin (Prod.fst ∘ z)
  let e : B ↪o C := ⟨⟨fun h => ⟨h.val,hC h.property⟩,
    fun _ _ he => Subtype.ext (congrArg (fun h : C => h.val) he)⟩,
    fun {_ _} => Iff.rfl⟩
  have hscore (h : C) (hh : h ∉ Set.range e) : sampleSupportScore predict z h ≤ offset := by
    have hnot (j : Fin n) : predict h (z j).1 = false := by
      apply Bool.eq_false_of_not_eq_true
      intro hj
      have hb : h.val ∈ B := (mem_hitCandidates predict hfin (Prod.fst ∘ z) h.val).mpr ⟨j,hj⟩
      exact hh ⟨⟨h.val,hb⟩,Subtype.ext rfl⟩
    simpa [sampleSupportScore, supportScore, hnot] using hoff
  have he := noisyArgmaxLaw_map_eq_of_embedding hk offset e
    (fun h : C => sampleSupportScore predict z h) (noisyScoreAlphabet n k)
    (fun h => sampleSupportScore_interval_subset predict z h) hscore (Option.map Subtype.val)
  unfold noisySupportLearner
  have hm : (Option.map Subtype.val ∘ Option.map e : Option B → Option H) = Option.map Subtype.val := by
    funext w
    cases w <;> rfl
  rw [hm] at he
  exact he.symm

private theorem noisyLaw_map_embedding_apply {A B : Type*} (p : PMF A) (e : A ↪ B) (v : A) :
    p.map e (e v) = p v := by
  classical
  rw [PMF.map_apply, tsum_eq_single v]
  · simp
  · intro w hw
    have hne : e v ≠ e w := fun he => hw (e.injective he).symm
    simp [hne]

open SteinkeZakynthinou in
/-- Actual named-output information of the proper integer-noise learner on
each fixed paired pool, even for an infinite hypothesis set. -/
theorem noisySupportLearner_fixedPairing [LinearOrder H] (hk : 0 < k) (hnk : n ≤ k^2)
    {offset : ℤ} (hoff : 0 ≤ offset) {s : ℕ} (predict : H → X → Bool)
    (hfin : ∀ x, {h | predict h x = true}.Finite)
    (hinc : ∀ x, (hfin x).toFinset.card ≤ s) (pool : Pool n X) :
    originalPoolInformation (noisySupportLearner hk offset predict hfin) pool ≤ 20 * (s : ℝ) := by
  classical
  let C := hitCandidates predict hfin (Prod.fst ∘ pool)
  let A := noisySupportLearner (n := n) hk offset predict hfin
  let z (b : Selector n) (i : Fin n) := pool (i,b i)
  let a (b : Selector n) (h : C) := sampleSupportScore predict (z b) h.val
  let T := fun _ : C => noisyScoreAlphabet n k
  let f (t : (i : C) → T i) := noisyScoreWinner (fun i => (t i : ℤ)) (offset + 2 * k)
  let p (b : Selector n) := marginal f (fun t => ∏ i, scoreNoiseMass k (a b i) (t i))
  let e : Option C ↪ Option H := (⟨Subtype.val, Subtype.val_injective⟩ : C ↪ H).optionMap
  have hT (b : Selector n) (i : C) : Icc (a b i - 2*k) (a b i + 2*k) ⊆ T i :=
    sampleSupportScore_interval_subset predict (z b) i.val
  let P (b : Selector n) := noisyArgmaxLaw hk offset (a b) T (hT b)
  have hA (b : Selector n) : A (z b) = (P b).map e := by
    apply noisySupportLearner_eq_on_superset hk hoff predict hfin (z b) C
    intro h hh
    obtain ⟨i,hi⟩ := (mem_hitCandidates predict hfin (Prod.fst ∘ z b) h).mp hh
    exact (mem_hitCandidates predict hfin (Prod.fst ∘ pool) h).mpr ⟨(i,b i),hi⟩
  have hmass (b : Selector n) (w : Option C) : (A (z b) (e w)).toReal = p b w := by
    calc
      _ = ((P b).map e (e w)).toReal := congrArg (fun Q : PMF (Option H) => (Q (e w)).toReal) (hA b)
      _ = (P b w).toReal := congrArg ENNReal.toReal (noisyLaw_map_embedding_apply (P b) e w)
      _ = _ := noisyArgmaxLaw_mass hk offset (a b) T (hT b) w
  have hsupp (b : Selector n) (h : Option H) (hh : A (z b) h ≠ 0) : ∃ w, e w = h := by
    rw [hA b, ← PMF.mem_support_iff, PMF.mem_support_map_iff] at hh
    obtain ⟨w,_,he⟩ := hh
    exact ⟨w,he⟩
  have hp (b : Selector n) (w : Option C) : 0 ≤ p b w := by
    rw [← hmass b w]
    exact ENNReal.toReal_nonneg
  have hsub (x : X) : (univ.filter fun h : C => predict h.val x).card ≤ s := by
    let F := univ.filter fun h : C => predict h.val x
    have hle : (F.map (⟨Subtype.val, Subtype.val_injective⟩ : C ↪ H)) ⊆ (hfin x).toFinset := by
      intro h hh
      obtain ⟨i,hi,rfl⟩ := mem_map.mp hh
      rw [Set.Finite.mem_toFinset]
      change predict i.val x = true
      exact (mem_filter.mp hi).2
    rw [← card_map (⟨Subtype.val, Subtype.val_injective⟩ : C ↪ H)]
    exact (card_le_card hle).trans (hinc x)
  rw [originalPoolInformation_eq_channelInfo_of_embedding A pool e p hp hmass hsupp]
  exact scoreNoise_boundedOverlap_channelInfo_le hk hnk
    (fun (h : C) x => predict h.val x) hsub pool T a (fun _ _ => rfl) hT f

/-- Only hypotheses scoring above the offset must be included in the finite
candidate list. The choice of any extra candidates makes no difference. -/
theorem noisySupportLearner_eq_on_eligible [LinearOrder H] (hk : 0 < k) {offset : ℤ} (hoff : 0 ≤ offset)
    (predict : H → X → Bool) (hfin : ∀ x, {h | predict h x = true}.Finite)
    (z : Fin n → X × Bool) (C : Finset H) (hC : ∀ h, offset < sampleSupportScore predict z h → h ∈ C) :
    noisySupportLearner hk offset predict hfin z =
      (noisyArgmaxLaw hk offset (fun h : C => sampleSupportScore predict z h)
        (fun _ => noisyScoreAlphabet n k) (fun h => sampleSupportScore_interval_subset predict z h)).map
        (Option.map Subtype.val) := by
  let B := hitCandidates predict hfin (Prod.fst ∘ z) ∪ C
  have hBC : C ⊆ B := subset_union_right
  let e : C ↪o B := ⟨⟨fun h => ⟨h.val,hBC h.property⟩,
    fun _ _ he => Subtype.ext (congrArg (fun h : B => h.val) he)⟩, fun {_ _} => Iff.rfl⟩
  have hscore (h : B) (hh : h ∉ Set.range e) : sampleSupportScore predict z h ≤ offset := by
    apply le_of_not_gt
    intro hgt
    exact hh ⟨⟨h.val,hC h.val hgt⟩,Subtype.ext rfl⟩
  calc
    _ = (noisyArgmaxLaw hk offset (fun h : B => sampleSupportScore predict z h)
        (fun _ => noisyScoreAlphabet n k) (fun h => sampleSupportScore_interval_subset predict z h)).map
        (Option.map Subtype.val) :=
      noisySupportLearner_eq_on_superset hk hoff predict hfin z B subset_union_left
    _ = _ := by
      have he := noisyArgmaxLaw_map_eq_of_embedding hk offset e
        (fun h : B => sampleSupportScore predict z h) (noisyScoreAlphabet n k)
        (fun h => sampleSupportScore_interval_subset predict z h) hscore (Option.map Subtype.val)
      have hm : (Option.map Subtype.val ∘ Option.map e : Option C → Option H) = Option.map Subtype.val := by
        funext h
        cases h <;> rfl
      rw [hm] at he
      exact he

theorem noisySupportLearner_support_finite [LinearOrder H] (hk : 0 < k) (offset : ℤ)
    (predict : H → X → Bool) (hfin : ∀ x, {h | predict h x = true}.Finite) (z : Fin n → X × Bool) :
    (noisySupportLearner hk offset predict hfin z).support.Finite := by
  let C := hitCandidates predict hfin (Prod.fst ∘ z)
  apply (Set.finite_range (Option.map (Subtype.val : C → H))).subset
  intro h hh
  unfold noisySupportLearner at hh
  rw [PMF.mem_support_map_iff] at hh
  obtain ⟨j,_,hj⟩ := hh
  exact ⟨j,hj⟩

/-- The reference option predicts zero, and every other option is its
original classifier. -/
def supportPredict (predict : H → X → Bool) (h : Option H) (x : X) : Bool :=
  h.elim false (fun j => predict j x)

private theorem empiricalError_supportPredict_gap (hn : 0 < n) (predict : H → X → Bool)
    (z : Fin n → X × Bool) (h : Option H) :
    (n : ℝ) * (empiricalError (supportPredict predict) z none -
      empiricalError (supportPredict predict) z h) = (h.elim 0 (sampleSupportScore predict z) : ℤ) := by
  cases h with
  | none => simp
  | some j =>
    simp only [empiricalError_eq_zeroOne, supportPredict, Option.elim_some, Option.elim_none, ← sub_div]
    have hnR : (n : ℝ) ≠ 0 := (Nat.cast_pos.mpr hn : (0 : ℝ) < n).ne'
    rw [mul_div_cancel₀ _ hnR, ← sum_sub_distrib]
    unfold sampleSupportScore
    push_cast
    apply sum_congr rfl
    intro i _
    by_cases hx : predict j (z i).1 = true
    · by_cases hy : (z i).2 = true
      · simp [supportScore, hx, hy]
      · simp [supportScore, hx, Bool.eq_false_of_not_eq_true hy]
    · by_cases hy : (z i).2 = true
      · simp [supportScore, Bool.eq_false_of_not_eq_true hx, hy]
      · simp [supportScore, Bool.eq_false_of_not_eq_true hx, Bool.eq_false_of_not_eq_true hy]

/-- Every output in the support of the learner is within the score regret
bound on every fixed labeled sample. -/
theorem noisySupportLearner_empirical_on_support [LinearOrder H] (hn : 0 < n) (hk : 0 < k)
    {offset : ℤ} (hoff : 0 ≤ offset) (predict : H → X → Bool)
    (hfin : ∀ x, {h | predict h x = true}.Finite) (z : Fin n → X × Bool)
    {h : Option H} (hh : h ∈ (noisySupportLearner hk offset predict hfin z).support) (g : Option H) :
    empiricalError (supportPredict predict) z h ≤ empiricalError (supportPredict predict) z g +
      ((offset : ℝ) + 4 * (k : ℝ)) / n := by
  classical
  let C := hitCandidates predict hfin (Prod.fst ∘ z)
  let a (j : C) := sampleSupportScore predict z j.val
  let gain (w : Option H) := w.elim 0 (sampleSupportScore predict z)
  let opt : Option C → Option H := Option.map Subtype.val
  have hh' := hh
  unfold noisySupportLearner noisyArgmaxLaw at hh'
  rw [PMF.map_comp, PMF.mem_support_map_iff] at hh'
  obtain ⟨w,hw,he⟩ := hh'
  let v := noisyScoreWinner (fun j : C => (w j : ℤ)) (offset + 2*k)
  have he' : opt v = h := he
  have hmass (j : C) : scoreNoiseMass k (a j) (w j) ≠ 0 := by
    intro hj
    rw [PMF.mem_support_iff, PMF.ofFintype_apply] at hw
    apply hw
    change ENNReal.ofReal (∏ j : C, scoreNoiseMass k (a j) (w j)) = 0
    rw [prod_eq_zero (mem_univ j) hj, ENNReal.ofReal_zero]
  have hmax (j : Option C) : j.elim (offset + 2*k) (fun u => (w u : ℤ)) ≤
      v.elim (offset + 2*k) (fun u => (w u : ℤ)) := by
    cases hv : v with
    | none =>
      have hwin := (noisyScoreWinner_characterization (fun u : C => (w u : ℤ)) (offset + 2*k) none).mp hv
      cases j with
      | none => exact le_rfl
      | some i => exact hwin i
    | some x =>
      have hwin := (noisyScoreWinner_characterization (fun u : C => (w u : ℤ)) (offset + 2*k) (some x)).mp hv
      cases j with
      | none => exact hwin.1.le
      | some i => exact (hwin.2 i).1
  have hb := scoreNoise_argmax_bounds hmass hoff v hmax
  have hopt : gain (opt v) = v.elim 0 a := by cases v <;> rfl
  have hgain : 0 ≤ gain h := by
    rw [← he', hopt]
    cases hv : v with
    | none => exact le_rfl
    | some j => exact hoff.trans (hb.2 j hv).le
  have hoff' : 0 ≤ offset + 4 * (k : ℤ) := by positivity
  have hcount : gain g ≤ gain h + offset + 4*(k : ℤ) := by
    cases g with
    | none => change 0 ≤ _; omega
    | some j =>
      by_cases hj : j ∈ C
      · rw [← he', hopt]
        exact hb.1 ⟨j,hj⟩
      · have hnot (i : Fin n) : predict j (z i).1 = false := by
          apply Bool.eq_false_of_not_eq_true
          intro hi
          exact hj ((mem_hitCandidates predict hfin (Prod.fst ∘ z) j).mpr ⟨i,hi⟩)
        change sampleSupportScore predict z j ≤ _
        simp only [sampleSupportScore, supportScore, hnot, Bool.false_eq_true, ite_false, sum_const_zero]
        omega
  have hcountR : (gain g : ℝ) ≤ (gain h : ℝ) + offset + 4*(k : ℝ) := by exact_mod_cast hcount
  rw [← empiricalError_supportPredict_gap hn predict z g, ← empiricalError_supportPredict_gap hn predict z h]
    at hcountR
  have hnR : (0 : ℝ) < n := Nat.cast_pos.mpr hn
  have hq : empiricalError (supportPredict predict) z h - empiricalError (supportPredict predict) z g ≤
      ((offset : ℝ) + 4*(k : ℝ)) / n := (le_div_iff₀ hnR).mpr (by nlinarith only [hcountR])
  linarith only [hq]

/-- The expected empirical rate of the noisy learner on every fixed sample. -/
theorem noisySupportLearner_empirical_le [LinearOrder H] (hn : 0 < n) (hk : 0 < k)
    {offset : ℤ} (hoff : 0 ≤ offset) (predict : H → X → Bool)
    (hfin : ∀ x, {h | predict h x = true}.Finite) (z : Fin n → X × Bool) :
    let q := noisySupportLearner hk offset predict hfin z
    let err := empiricalError (supportPredict predict) z
    (∑' h, (q h).toReal * err h) ≤ (⨅ g, err g) + ((offset : ℝ) + 4*(k : ℝ))/n := by
  classical
  intro q err
  let S := (noisySupportLearner_support_finite hk offset predict hfin z).toFinset
  have hS (h : Option H) : h ∈ S ↔ h ∈ q.support := Set.Finite.mem_toFinset _
  have hz (h : Option H) (hh : h ∉ S) : q h = 0 := by
    by_contra hne
    exact hh ((hS h).mpr ((PMF.mem_support_iff _ _).mpr hne))
  have hm : (∑ h ∈ S, (q h).toReal) = 1 := by
    have hq : ∑ h ∈ S, q h = 1 := by
      have hsum : (∑' h : Option H, q h) = ∑ h ∈ S, q h :=
        tsum_eq_sum (s := S) hz
      exact hsum.symm.trans q.tsum_coe
    rw [← ENNReal.toReal_sum (fun h _ => PMF.apply_ne_top q h), hq, ENNReal.toReal_one]
  let b := ((offset : ℝ) + 4*(k : ℝ))/n
  have hgap (h : Option H) (hh : h ∈ S) : err h ≤ (⨅ g, err g) + b := by
    apply sub_le_iff_le_add.mp
    apply le_ciInf
    intro g
    exact sub_le_iff_le_add.mpr
      (noisySupportLearner_empirical_on_support hn hk hoff predict hfin z ((hS h).mp hh) g)
  rw [tsum_eq_sum (s := S) (fun h hnot => by simp [hz h hnot])]
  calc
    _ ≤ ∑ h ∈ S, (q h).toReal * ((⨅ g, err g)+b) :=
      sum_le_sum fun h hh => mul_le_mul_of_nonneg_left (hgap h hh) ENNReal.toReal_nonneg
    _ = _ := by rw [← sum_mul, hm, one_mul]

end SignedCounts

end AgnosticVC
