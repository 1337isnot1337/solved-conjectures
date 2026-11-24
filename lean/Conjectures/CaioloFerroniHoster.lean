import Conjectures.CaioloFerroniHosterCertificate
import Conjectures.CaioloFerroniHosterFlags
import Conjectures.CaioloFerroniHosterGraphs
import Mathlib.FieldTheory.Finite.Extension
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Splits
import Mathlib.Tactic.ComputeDegree
import Mathlib.Algebra.IsPrimePow

/-!
# The Caiolo–Ferroni–Hoster counterexample family

Theorem 4.9 and the recurrences of Propositions 4.6–4.7 refer to the
characteristic-kernel invariants of the lattice of flats (arXiv:2605.28474v1).
The construction follows the hyperplane-coalescence method of Bérczi, Coron,
Eur, and Li (arXiv:2610.17135v1), applied to the dual invariants.
-/

namespace CaioloFerroniHoster

open Finset Submodule Polynomial
open scoped Classical BigOperators

noncomputable section

variable {F K : Type} [Field F] [Field K] [Fintype F] [Fintype K] [Algebra F K]

private def geometryBlocks (hK : Module.finrank F K = 4) :
    Blocks (F := F) (V := K × K) (X := K) (Fin 4 → K) where
  frame a := (graphSpace a, {a 3})
  rank_five a := by
    change Module.finrank F (graphSpace a : Submodule F (K × K)) + ({a 3} : Finset K).card = 5
    rw [graphSpace_finrank hK, card_singleton]
  inf_rank_le {a b} hab := by
    change Module.finrank F (graphSpace a ⊓ graphSpace b : Submodule F (K × K)) +
      (({a 3} : Finset K) ∩ {b 3}).card ≤ 3
    by_cases he : a 3 = b 3
    · have hr := graphSpace_inf_same_label (F := F) hab he
      rw [he, inter_self, card_singleton]
      omega
    · have hr := graphSpace_inf_finrank (F := F) hab 3 (fun i hi => by omega)
      have hi : ({a 3} : Finset K) ∩ {b 3} = ∅ := by simp [he]
      rwa [hi, card_empty, add_zero]

private theorem geometryBlocks_cover_four (hK : Module.finrank F K = 4) (a : Fin 4 → K) :
    Nonempty (FrameLayer ((geometryBlocks hK).frame a) 4) := by
  refine ⟨⟨(graphSpace a, ∅), ⟨le_rfl, empty_subset _⟩, ?_⟩⟩
  change Module.finrank F (graphSpace a : Submodule F (K × K)) + (∅ : Finset K).card = 4
  rw [graphSpace_finrank hK, card_empty, add_zero]

/-- The actual simple rank-five matroid, built from its independent sets. -/
def witness (hK : Module.finrank F K = 4) : Matroid (Point F (K × K) K) :=
  coalescedMatroid (geometryBlocks hK)

/-- Simplicity expressed via independence of every set of at most two points. -/
def IsSimple {P : Type*} (M : Matroid P) : Prop :=
  ∀ (I : Finset P), I.card ≤ 2 → M.Indep (I : Set P)

theorem witness_simple (hK : Module.finrank F K = 4) : IsSimple (witness hK) := by
  intro I hI
  apply indep_of_free_of_card_le_four (geometryBlocks hK) _ (hI.trans (by decide))
  induction I using Finset.induction_on with
  | empty => simp [freeIndependent, spanPoints]
  | @insert e I he ih =>
    rw [Finset.card_insert_of_notMem he] at hI
    have hfree := ih (by omega)
    refine (freeIndependent_insert hfree).2 (Or.inr ?_)
    intro hc
    have hr : frameRank (spanPoints I) ≤ 1 := (span_rank_le_card I).trans (by omega)
    have hle : pointFrame e ≤ spanPoints I := hc
    have hEq : pointFrame e = spanPoints I := by
      by_contra hn
      have h := frameRank_strictMono (lt_of_le_of_ne hle hn)
      rw [pointFrame_rank] at h
      omega
    obtain hzero | hone : I.card = 0 ∨ I.card = 1 := by omega
    · have hh := congrArg frameRank hEq
      rw [pointFrame_rank, hfree, hzero] at hh
      contradiction
    · obtain ⟨f, hf⟩ := Finset.card_eq_one.mp hone
      subst I
      rw [show spanPoints {f} = pointFrame f by simp [spanPoints]] at hEq
      have hpoint : Function.Injective (pointFrame (F := F) (V := K × K) (X := K)) := by
        intro x y hh
        cases x <;> cases y
        · exact congrArg Sum.inl (Subtype.ext (congrArg Prod.fst hh))
        · have hz := congrArg Prod.snd hh
          simp [pointFrame] at hz
        · have hz := congrArg Prod.snd hh
          simp [pointFrame] at hz
        · exact congrArg Sum.inr (Finset.singleton_injective (congrArg Prod.snd hh))
      exact he (hpoint hEq ▸ mem_singleton_self f)

private theorem witness_rank (hK : Module.finrank F K = 4) (hk : 5 ≤ Fintype.card K) :
    (witness hK).eRank = 5 := by
  obtain ⟨A, hA⟩ := Finset.exists_subset_card_eq (s := (univ : Finset K)) (by simpa using hk)
  let J : Finset (Point F (K × K) K) := A.map ⟨Sum.inr, Sum.inr_injective⟩
  have hj : J.card = 5 := by simpa [J] using hA.2
  have hs : spanPoints J = (⊥, A) := by
    apply le_antisymm
    · rw [spanPoints_le]
      intro e he
      obtain ⟨x, hx, rfl⟩ := Finset.mem_map.mp he
      exact ⟨le_rfl, singleton_subset_iff.mpr hx⟩
    · refine ⟨bot_le, ?_⟩
      intro x hx
      have he : (Sum.inr x : Point F (K × K) K) ∈ J := Finset.mem_map.mpr ⟨x, hx, rfl⟩
      exact (spanPoints_le.mp (le_refl (spanPoints J)) he).2 (mem_singleton_self x)
  have hbase : (witness hK).Indep (J : Set _) := by
    refine (coalescedMatroid_indep (geometryBlocks hK)).2 ⟨?_, hj.le, ?_⟩
    · rw [freeIndependent, hs, hj]
      change Module.finrank F (⊥ : Submodule F (K × K)) + A.card = 5
      rw [finrank_bot, zero_add, hA.2]
    · intro b hb
      rw [hs] at hb
      have h := Finset.card_le_card hb.2
      change A.card ≤ ({b 3} : Finset K).card at h
      rw [hA.2, card_singleton] at h
      omega
  have hcl := hbase.isBasis_closure
  have hu : (witness hK).closure J = (witness hK).E := by
    refine le_antisymm ((witness hK).closure_subset_ground _) ?_
    intro e he
    by_contra hnot
    have heJ : e ∉ J := fun h => hnot ((witness hK).subset_closure _ hbase.subset_ground h)
    have hi := (hbase.notMem_closure_iff_of_notMem heJ he).mp hnot
    have hcard := ((coalescedMatroid_indep (geometryBlocks hK)).mp
      (Finset.coe_insert e J ▸ hi)).2.1
    rw [Finset.card_insert_of_notMem heJ, hj] at hcard
    omega
  rw [hu] at hcl
  rw [Matroid.eRank_def, ← hcl.encard_eq_eRk, Set.encard_coe_eq_coe_finsetCard, hj]
  rfl

private theorem gaussian_real (q : ℕ) (d i : ℕ) :
    ((gaussian q d i : ℕ) : ℝ) = gaussian (q : ℝ) d i := by
  induction d generalizing i with
  | zero => simp [gaussian]
  | succ d ih => cases i <;> simp [gaussian, ih]

private theorem productFlag_real (q d t : ℕ) (s : List ℕ) :
    ((productFlag q d t s : ℕ) : ℝ) = productFlag (q : ℝ) d t s := by
  induction s generalizing d t with
  | nil => simp [productFlag]
  | cons r s ih => simp [productFlag, Nat.cast_sum, gaussian_real, ih]

private theorem auxChoose_real (q i : ℕ) (hi : i ≤ q ^ 4) :
    auxChoose (q : ℝ) i = (Nat.choose (q ^ 4) i : ℝ) := by
  have hn : (i.factorial : ℝ) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero i
  rw [auxChoose, div_eq_iff_mul_eq hn, ← Nat.cast_mul, Nat.mul_comm ((q ^ 4).choose i),
    ← Nat.descFactorial_eq_factorial_mul_choose,
    Nat.descFactorial_eq_prod_range, Nat.cast_prod]
  refine Finset.prod_congr rfl fun j hj => ?_
  rw [Nat.cast_sub (show j ≤ q ^ 4 by grind), Nat.cast_pow]

private theorem flag_count (hK : Module.finrank F K = 4)
    (hq : 4 ≤ (Fintype.card F) ^ 4) (s : List ℕ)
    (hs : ∀ r ∈ s, r ≤ 4) (ht : ∀ r ∈ s.tail, r ≤ 3) :
    (Nat.card (FlatFlag (witness hK) Set.univ s) : ℝ) =
      coalescedFlag (Fintype.card F : ℝ) s := by
  let q := Fintype.card F
  have hdim : Module.finrank F (K × K) = 8 := by rw [Module.finrank_prod, hK]
  have hsize : Fintype.card K = q ^ 4 := by
    rw [Module.card_eq_pow_finrank (K := F), hK]
  have hcfg : Fintype.card (Fin 4 → K) = q ^ 16 := by
    rw [Fintype.card_fun, Fintype.card_fin, hsize, ← pow_mul]
  let g := geometryBlocks hK
  let A : Frame F (K × K) K := topFrame
  have hdimA : Module.finrank F A.1 = 8 := (finrank_top _ _).trans hdim
  have hcardA : A.2.card = q ^ 4 := (Finset.card_univ).trans hsize
  cases s with
  | nil => simp [FlatFlag, coalescedFlag]
  | cons r s =>
    have hr := hs r (by simp)
    by_cases h4 : r = 4
    · subst r
      have h := hyperplane_replacement_count g (geometryBlocks_cover_four hK) s ht
      have hsum (t : List ℕ) : Nat.card (Σ b : Fin 4 → K, FrameFlag (g.frame b) t) =
          q ^ 16 * productFlag q 4 1 t := by
        rw [Nat.card_sigma]
        simp only [card_frameFlag, show ∀ b, Module.finrank F (g.frame b).1 = 4 from
          graphSpace_finrank hK, show ∀ b, (g.frame b).2.card = 1 from fun _ => card_singleton _,
          Finset.sum_const, Finset.card_univ, nsmul_eq_mul, hcfg, Nat.cast_id]
        rfl
      rw [hsum, hsum, card_frameFlag, hdimA, hcardA, carrier_topFrame] at h
      have hre := congrArg (fun n : ℕ => (n : ℝ)) h
      push_cast [productFlag_real] at hre
      rw [coalescedFlag, witness]
      have hstep (d t : ℕ) : productFlag (q : ℝ) d t (4 :: s) =
          ∑ i ∈ range (4 + 1), gaussian (q : ℝ) d i * (Nat.choose t (4 - i) : ℝ) *
            productFlag (q : ℝ) i (4 - i) s := rfl
      rw [hstep 4 1, hstep 8 (q ^ 4)] at hre
      simp only [Finset.sum_range_succ, sum_range_zero, zero_add, Nat.reduceAdd, Nat.reduceSub] at hre ⊢
      have ha (i : ℕ) (hi : i ≤ 4) := auxChoose_real q i (hi.trans hq)
      rw [ha 4 (by decide), ha 3 (by decide), ha 2 (by decide)]
      have hgg : gaussian (q : ℝ) 4 4 = 1 := by norm_num [gaussian]
      have hc0 : Nat.choose 1 4 = 0 := by decide
      have hc1 : Nat.choose 1 3 = 0 := by decide
      have hc2 : Nat.choose 1 2 = 0 := by decide
      simp only [hc0, hc1, hc2, Nat.cast_zero, Nat.choose_zero_right, Nat.choose_one_right,
        Nat.cast_one, Nat.cast_pow, mul_zero, zero_mul, mul_one, one_mul, zero_add, hgg] at hre
      split_ifs
      all_goals first | contradiction | linear_combination hre
    · have hu : ∀ i ∈ r :: s, i ≤ 3 := by
        intro i hi
        rcases List.mem_cons.mp hi with rfl | hi
        · omega
        · exact ht i hi
      rw [← carrier_topFrame (F := F) (V := K × K) (X := K), witness,
        card_lowFlatFlag g A _ hu, hdimA, hcardA, productFlag_real, productFlag, coalescedFlag]
      simp only [h4, ite_false]
      refine Finset.sum_congr rfl fun i hi => ?_
      rw [auxChoose_real q (r - i) (Nat.sub_le .. |>.trans (hr.trans hq))]

section Polynomial

variable {F₀ V X : Type} [Field F₀] [AddCommGroup V] [Module F₀ V]

/-- Number of flags with the given internal ranks in the lattice of flats. -/
def matroidFlag (M : Matroid (Point F₀ V X)) (s : List ℕ) : ℝ :=
  Nat.card (FlatFlag M M.E s)

/-- The dual Chow polynomial of the characteristic kernel in rank five.
The defining chain factors are the expanded CFH Propositions 4.6–4.7. -/
def matroidDualChow (M : Matroid (Point F₀ V X)) : ℝ[X] :=
  dualChow (fun s => C (matroidFlag M s)) Polynomial.X

/-- The dual right augmented Chow polynomial of the characteristic kernel in rank five. -/
def matroidDualAugmented (M : Matroid (Point F₀ V X)) : ℝ[X] :=
  dualRightAugmented (fun s => C (matroidFlag M s)) Polynomial.X

private def gammaQuartic (a b c : ℝ) : ℝ[X] :=
  C a * (1 + Polynomial.X) ^ 4 + C b * Polynomial.X * (1 + Polynomial.X) ^ 2 +
    C c * Polynomial.X ^ 2

private theorem gammaQuartic_degree {a b c : ℝ} (ha : a ≠ 0) :
    (gammaQuartic a b c).natDegree = 4 := by
  unfold gammaQuartic
  apply natDegree_eq_of_le_of_coeff_ne_zero
  · compute_degree
  · have h₁ : (C b * Polynomial.X * (1 + Polynomial.X) ^ 2).natDegree ≤ 3 := by compute_degree
    have h₂ : (C c * Polynomial.X ^ 2).natDegree ≤ 2 := by compute_degree
    rw [coeff_add_eq_left_of_lt (show _ < 4 from h₂.trans_lt (by decide)),
      coeff_add_eq_left_of_lt (show _ < 4 from h₁.trans_lt (by decide)), coeff_C_mul]
    have hm : Monic ((1 + Polynomial.X : ℝ[X]) ^ 4) := by
      rw [add_comm 1 Polynomial.X, ← C_1]
      exact (monic_X_add_C (1 : ℝ)).pow _
    have hdeg : ((1 + Polynomial.X : ℝ[X]) ^ 4).natDegree = 4 := by
      rw [add_comm 1 Polynomial.X, ← C_1, (monic_X_add_C (1 : ℝ)).natDegree_pow, natDegree_X_add_C]
    have hc := hm.coeff_natDegree
    conv at hc => enter [1, 2]; rw [hdeg]
    rw [hc, mul_one]
    exact ha

private theorem beta_C (f : List ℕ → ℝ) (s : List ℕ) :
    beta (fun t => C (f t)) s = C (beta f s) := by
  simp [beta, map_list_sum, List.map_map, Function.comp_def]

private theorem chow_eq_gamma (M : Matroid (Point F₀ V X)) :
    matroidDualChow M =
      gammaQuartic (gammaZero (matroidFlag M)) (gammaOne (matroidFlag M))
        (gammaTwo (matroidFlag M)) := by
  rw [matroidDualChow, dualChow_gamma]
  simp [gammaQuartic, gammaZero, gammaOne, gammaTwo, beta_C]

private theorem augmented_eq_gamma (M : Matroid (Point F₀ V X)) :
    matroidDualAugmented M = (1 + Polynomial.X) *
      gammaQuartic (gammaZero (matroidFlag M)) (gammaOneAug (matroidFlag M))
        (gammaTwoAug (matroidFlag M)) := by
  rw [matroidDualAugmented, dualRightAugmented_gamma]
  simp [gammaQuartic, gammaZero, gammaOne, gammaTwo, gammaOneAug, gammaTwoAug, beta_C]

end Polynomial

private theorem matchingFlags (hK : Module.finrank F K = 4)
    (hq : 4 ≤ Fintype.card F ^ 4) (s : List ℕ) (hs : s ∈ ranks) :
    matroidFlag (witness hK) s = coalescedFlag (Fintype.card F : ℝ) s := by
  change Nat.cast (Nat.card (FlatFlag (witness hK) (witness hK).E s)) = _
  rw [witness, coalescedMatroid_ground]
  apply flag_count hK hq s
  all_goals
    simp [ranks, signedSublists] at hs
    rcases hs with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
      rfl | rfl <;> decide

private theorem matchingGammas (hK : Module.finrank F K = 4)
    (hq : 4 ≤ Fintype.card F ^ 4) :
    let f := matroidFlag (witness hK)
    let g := coalescedFlag (Fintype.card F : ℝ)
    gammaZero f = gammaZero g ∧ gammaOne f = gammaOne g ∧ gammaTwo f = gammaTwo g ∧
      gammaOneAug f = gammaOneAug g ∧ gammaTwoAug f = gammaTwoAug g := by
  dsimp only
  refine ⟨?_, ?_, ?_, ?_, ?_⟩ <;>
    simp (disch := decide) [gammaZero, gammaOne, gammaTwo, gammaOneAug, gammaTwoAug,
      beta, signedSublists, matchingFlags hK hq]

theorem witness_root_properties (hK : Module.finrank F K = 4)
    (hq : 17 ≤ Fintype.card F) :
    let H := matroidDualChow (witness hK)
    let A := matroidDualAugmented (witness hK)
    H.natDegree = 4 ∧ (∀ x : ℝ, 0 < H.eval x) ∧
      A.natDegree = 5 ∧ (∀ x : ℝ, A.eval x = 0 ↔ x = -1) ∧
      A.derivative.eval (-1) ≠ 0 ∧ ¬ H.Splits ∧ ¬ A.Splits := by
  have hq' : 4 ≤ Fintype.card F ^ 4 :=
    (by decide : 4 ≤ (17 : ℕ) ^ 4).trans (Nat.pow_le_pow_left hq _)
  obtain ⟨h0, h1, h2, ha1, ha2⟩ := matchingGammas hK hq'
  let q : ℝ := Fintype.card F
  have hreal : 17 ≤ q := by dsimp [q]; exact_mod_cast hq
  let f := coalescedFlag q
  have hsign := gamma_signs q hreal
  have hpos0 : 0 < gammaZero f := by
    by_contra! hn
    have hm := mul_nonpos_of_nonpos_of_nonneg hn hsign.1.le
    nlinarith [hsign.2.2.1, sq_nonneg (gammaOne f)]
  dsimp only
  rw [chow_eq_gamma, augmented_eq_gamma, h0, h1, h2, ha1, ha2]
  have hhdeg := gammaQuartic_degree (b := gammaOne f) (c := gammaTwo f) hpos0.ne'
  have hadeg := gammaQuartic_degree (b := gammaOneAug f) (c := gammaTwoAug f) hpos0.ne'
  have hhpos (x : ℝ) : 0 < (gammaQuartic (gammaZero f) (gammaOne f) (gammaTwo f)).eval x := by
    have h := coalescedChow_pos q hreal x
    rw [dualChow_gamma] at h
    simpa [gammaQuartic, f] using h
  have hapos (x : ℝ) :
      0 < (gammaQuartic (gammaZero f) (gammaOneAug f) (gammaTwoAug f)).eval x := by
    simp only [gammaQuartic, eval_add, eval_mul, eval_C, eval_pow, eval_one, eval_X]
    exact positive_gamma_quartic hsign.2.1 hsign.2.2.2 x
  let Q := gammaQuartic (gammaZero f) (gammaOneAug f) (gammaTwoAug f)
  change _ ∧ _ ∧ ((1 + Polynomial.X) * Q).natDegree = 5 ∧
    (∀ x : ℝ, ((1 + Polynomial.X) * Q).eval x = 0 ↔ x = -1) ∧
      ((1 + Polynomial.X) * Q).derivative.eval (-1) ≠ 0 ∧
        ¬ (gammaQuartic (gammaZero f) (gammaOne f) (gammaTwo f)).Splits ∧
        ¬ ((1 + Polynomial.X) * Q).Splits
  have hQ : Q ≠ 0 := by
    intro he
    change Q.natDegree = 4 at hadeg
    simp [he] at hadeg
  have hlin : (1 + Polynomial.X : ℝ[X]) ≠ 0 := by
    rw [add_comm, ← C_1]
    exact (monic_X_add_C (1 : ℝ)).ne_zero
  refine ⟨hhdeg, hhpos, ?_, ?_, ?_, ?_, ?_⟩
  · rw [natDegree_mul hlin hQ, add_comm 1 Polynomial.X, ← C_1, natDegree_X_add_C]
    rw [hadeg]
  · intro x
    rw [eval_mul, mul_eq_zero, or_iff_left (hapos x).ne']
    simp only [eval_add, eval_one, eval_X]
    constructor <;> intro h <;> linarith
  · simpa [derivative_mul] using (hapos (-1)).ne'
  · intro hsplit
    obtain ⟨x, hx⟩ := hsplit.exists_eval_eq_zero
      (degree_ne_of_natDegree_ne (by rw [hhdeg]; decide))
    exact (hhpos x).ne' hx
  · intro hsplit
    have hl : (1 + Polynomial.X : ℝ[X]).Splits := by
      rw [add_comm, ← C_1]
      exact Polynomial.Splits.X_add_C _
    have hs := (splits_mul_iff_right hlin hl).mp hsplit
    obtain ⟨x, hx⟩ := hs.exists_eval_eq_zero
      (degree_ne_of_natDegree_ne (by rw [hadeg]; decide))
    exact (hapos x).ne' hx

/-- For every prime power at least 17, the coalesced projective geometry
refutes both assertions accompanying CFH Conjecture 7.3. -/
theorem counterexample_family (q : ℕ) (hprime : IsPrimePow q) (hq : 17 ≤ q) :
    ∃ (F K : Type) (_ : Field F) (_ : Field K) (_ : Fintype F) (_ : Fintype K)
      (_ : Algebra F K), Fintype.card F = q ∧ Module.finrank F K = 4 ∧
      ∃ M : Matroid (Point F (K × K) K),
        M.E = Set.univ ∧ IsSimple M ∧ M.eRank = 5 ∧
        (matroidDualChow M).natDegree = 4 ∧
        (∀ x : ℝ, 0 < (matroidDualChow M).eval x) ∧
        (matroidDualAugmented M).natDegree = 5 ∧
        (∀ x : ℝ, (matroidDualAugmented M).eval x = 0 ↔ x = -1) ∧
        (matroidDualAugmented M).derivative.eval (-1) ≠ 0 ∧
        ¬ (matroidDualChow M).Splits ∧ ¬ (matroidDualAugmented M).Splits := by
  obtain ⟨p, n, hp, hn, hpn⟩ := hprime
  let : Fact p.Prime := ⟨Nat.prime_iff.mpr hp⟩
  let F := GaloisField p n
  let K := FiniteField.Extension F p 4
  let : Fintype F := Fintype.ofFinite F
  let : Fintype K := Fintype.ofFinite K
  have hF : Fintype.card F = q := by
    rw [← Nat.card_eq_fintype_card, GaloisField.card p n hn.ne', hpn]
  have hK : Module.finrank F K = 4 := FiniteField.finrank_extension F p 4
  have hcardK : 5 ≤ Fintype.card K := by
    rw [Module.card_eq_pow_finrank (K := F), hK, hF]
    exact (by decide : 5 ≤ (17 : ℕ) ^ 4).trans (Nat.pow_le_pow_left hq _)
  refine ⟨F, K, inferInstance, inferInstance, ‹Fintype F›, ‹Fintype K›, inferInstance,
    hF, hK, witness hK, coalescedMatroid_ground _, witness_simple hK,
    witness_rank hK hcardK, witness_root_properties hK (hF ▸ hq)⟩

end
end CaioloFerroniHoster
