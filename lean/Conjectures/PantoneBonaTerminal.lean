import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Data.Finset.Max
import Mathlib.Data.Finset.Sort
import Mathlib.Data.Finset.Powerset
import Mathlib.Order.Fin.Basic
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Tactic

/-! The literal avoidance condition and canonical single-gap decomposition. -/

namespace PantoneBonaTerminal

variable {n d l : ℕ} {α : Type*} [LinearOrder α]

/-- A choice of increasing positions with increasing values. -/
def Chain (p : Fin n → α) (i : Fin l → Fin n) : Prop :=
  StrictMono i ∧ StrictMono (p ∘ i)

/-- The entry at `y` ends an increasing subsequence of length `j+1`. -/
def Reaches (p : Fin n → α) (j : ℕ) (y : Fin n) : Prop :=
  ∃ i : Fin (j + 1) → Fin n, Chain p i ∧ i (Fin.last j) = y

/-- The family of patterns of length `d+3` with increasing prefix, permitting
only a second-largest terminal value. -/
def Avoids (p : Fin n → α) (d : ℕ) : Prop :=
  ∀ i : Fin (d + 2) → Fin n, Chain p i →
    ∀ t, i (Fin.last (d + 1)) < t →
      p (i (Fin.last d).castSucc) < p t ∧ p t < p (i (Fin.last (d + 1)))

private theorem strictMono_snoc {β : Type*} [Preorder β] {i : Fin (l + 1) → β} {x : β}
    (hi : StrictMono i) (hx : i (Fin.last l) < x) : StrictMono (Fin.snoc i x) := by
  intro a b hab
  revert hab
  refine Fin.lastCases ?_ (fun b => ?_) b
  · refine Fin.lastCases ?_ (fun a hab => ?_) a
    · simp
    · rw [Fin.snoc_castSucc, Fin.snoc_last]
      exact (hi.monotone (Fin.le_last _)).trans_lt hx
  · refine Fin.lastCases ?_ (fun a hab => ?_) a
    · exact fun hab => (not_lt_of_ge (Fin.le_last _) hab).elim
    · rw [Fin.snoc_castSucc, Fin.snoc_castSucc]
      exact hi (Fin.castSucc_lt_castSucc_iff.mp hab)

private theorem Chain.snoc {p : Fin n → α} {i : Fin (l + 1) → Fin n} {x : Fin n}
    (hi : Chain p i) (hp : i (Fin.last l) < x) (hv : p (i (Fin.last l)) < p x) :
    Chain p (Fin.snoc i x) := by
  refine ⟨strictMono_snoc hi.1 hp, ?_⟩
  have hcomp : p ∘ Fin.snoc i x = Fin.snoc (p ∘ i) (p x) := by
    funext j
    refine Fin.lastCases ?_ (fun k => ?_) j <;> simp [Function.comp_apply]
  rw [hcomp]
  exact strictMono_snoc hi.2 hv

private theorem Chain.init {p : Fin n → α} {i : Fin (l + 1) → Fin n} (h : Chain p i) :
    Chain p (i ∘ Fin.castSucc) := by
  have hm : StrictMono (Fin.castSucc : Fin l → Fin (l + 1)) :=
    fun _ _ hlt => Fin.castSucc_lt_castSucc_iff.mpr hlt
  exact ⟨h.1.comp hm, h.2.comp hm⟩

/-- A witness can be extended exactly by adding a later, larger entry. -/
theorem reaches_succ {p : Fin n → α} {x : Fin n} :
    Reaches p (d + 1) x ↔ ∃ y < x, Reaches p d y ∧ p y < p x := by
  constructor
  · rintro ⟨i, hi, rfl⟩
    exact ⟨i (Fin.last d).castSucc, hi.1 (Fin.castSucc_lt_last _),
      ⟨i ∘ Fin.castSucc, hi.init, rfl⟩, hi.2 (Fin.castSucc_lt_last _)⟩
  · rintro ⟨y, hy, ⟨i, hi, rfl⟩, hv⟩
    exact ⟨Fin.snoc i x, hi.snoc hy hv, by simp⟩

/-- The front contains no increasing subsequence of length `d+2`. -/
def Front (p : Fin n → α) (d : ℕ) (cut : Fin n) : Prop :=
  ∀ y < cut, ¬ Reaches p (d + 1) y

/-- The suffix beginning at the cut is decreasing. -/
def DecreasingTail (p : Fin n → α) (cut : Fin n) : Prop :=
  ∀ ⦃a b⦄, cut ≤ a → a < b → p b < p a

/-- A front marker below the first (largest) tail value exists, and every
such marker lies below every tail value. This includes the terminal gap. -/
def SingleGap (p : Fin n → α) (d : ℕ) (cut : Fin n) : Prop :=
  (∃ y < cut, Reaches p d y ∧ p y < p cut) ∧
    ∀ ⦃y⦄, y < cut → Reaches p d y → p y < p cut → ∀ t, cut ≤ t → p y < p t

/-- The tail lies in the open value interval after marker `y` and before
every larger front marker. The upper condition is vacuous at the last marker. -/
def InMarkerGap (p : Fin n → α) (d : ℕ) (cut y : Fin n) : Prop :=
  y < cut ∧ Reaches p d y ∧ ∀ t, cut ≤ t → p y < p t ∧
    ∀ z < cut, Reaches p d z → p y < p z → p t < p z

/-- The rank criterion for a single gap identifies a unique eligible marker
and includes a possible terminal gap. -/
theorem singleGap_iff_unique_marker {p : Fin n → α} (hp : Function.Injective p)
    {cut : Fin n} (ht : DecreasingTail p cut) :
    SingleGap p d cut ↔ ∃! y, InMarkerGap p d cut y := by
  classical
  constructor
  · intro h
    let below := (Finset.univ.filter (fun y => y < cut ∧ Reaches p d y ∧ p y < p cut)).image p
    have hnonempty : below.Nonempty := by
      obtain ⟨y, hy, hr, hv⟩ := h.1
      exact ⟨p y, Finset.mem_image.mpr ⟨y, by simp [hy, hr, hv], rfl⟩⟩
    obtain ⟨y, hy, hval⟩ := Finset.mem_image.mp (below.max'_mem hnonempty)
    obtain ⟨hycut, hyr, hyv⟩ := (Finset.mem_filter.mp hy).2
    have hygap : InMarkerGap p d cut y := by
      refine ⟨hycut, hyr, fun t htcut => ⟨h.2 hycut hyr hyv t htcut, ?_⟩⟩
      intro z hz hzr hyz
      have hnot : ¬ p z < p cut := by
        intro hzv
        have hmem : p z ∈ below := Finset.mem_image.mpr ⟨z, by simp [hz, hzr, hzv], rfl⟩
        exact hyz.not_ge (hval ▸ below.le_max' (p z) hmem)
      have hlt : p cut < p z := (le_of_not_gt hnot).lt_of_ne (fun he => hz.ne (hp he).symm)
      have htt : p t ≤ p cut := by
        rcases htcut.eq_or_lt with he | he
        · rw [he]
        · exact (ht le_rfl he).le
      exact htt.trans_lt hlt
    refine ⟨y, hygap, fun z hzgap => ?_⟩
    rcases lt_trichotomy (p y) (p z) with hlt | he | hgt
    · exact ((hygap.2.2 cut le_rfl).2 z hzgap.1 hzgap.2.1 hlt).not_gt
        (hzgap.2.2 cut le_rfl).1 |>.elim
    · exact (hp he).symm
    · exact ((hzgap.2.2 cut le_rfl).2 y hygap.1 hygap.2.1 hgt).not_gt
        (hygap.2.2 cut le_rfl).1 |>.elim
  · rintro ⟨y, hy, _⟩
    refine ⟨⟨y, hy.1, hy.2.1, (hy.2.2 cut le_rfl).1⟩, ?_⟩
    intro z hz hzr hzcut t htc
    have hzy : p z ≤ p y := le_of_not_gt fun hyz =>
      ((hy.2.2 cut le_rfl).2 z hz hzr hyz).not_gt hzcut
    exact hzy.trans_lt (hy.2.2 t htc).1

private theorem reaches_tail {p : Fin n → α} {cut : Fin n}
    (h : Avoids p d) (hc : Reaches p (d + 1) cut) {b : Fin n} (hb : cut ≤ b) :
    Reaches p (d + 1) b := by
  rcases hb.eq_or_lt with rfl | hlt
  · exact hc
  obtain ⟨i, hi, rfl⟩ := hc
  exact reaches_succ.mpr ⟨i (Fin.last d).castSucc,
    (hi.1 (Fin.castSucc_lt_last _)).trans hlt, ⟨i ∘ Fin.castSucc, hi.init, rfl⟩,
    (h i hi b hlt).1⟩

private theorem split_of_first {p : Fin n → α} {cut : Fin n}
    (h : Avoids p d) (hc : Reaches p (d + 1) cut) :
    DecreasingTail p cut ∧ SingleGap p d cut := by
  constructor
  · intro a b ha hab
    obtain ⟨i, hi, rfl⟩ := reaches_tail h hc ha
    exact (h i hi b hab).2
  · refine ⟨reaches_succ.mp hc, ?_⟩
    intro y hy hreach hv t ht
    obtain ⟨i, hi, he⟩ := hreach
    subst y
    rcases ht.eq_or_lt with rfl | hlt
    · exact hv
    have hchain := hi.snoc hy hv
    have hpos : (Fin.snoc i cut : Fin (d + 2) → Fin n) (Fin.last (d + 1)) < t := by
      simpa using hlt
    simpa using (h _ hchain t hpos).1

private theorem avoids_of_split {p : Fin n → α} {cut : Fin n}
    (hf : Front p d cut) (ht : DecreasingTail p cut) (hg : SingleGap p d cut) :
    Avoids p d := by
  intro i hi t hlate
  let a := i (Fin.last d).castSucc
  let b := i (Fin.last (d + 1))
  have hab : a < b := hi.1 (Fin.castSucc_lt_last _)
  have habv : p a < p b := hi.2 (Fin.castSucc_lt_last _)
  have hb : cut ≤ b := le_of_not_gt (fun h => hf b h ⟨i, hi, rfl⟩)
  have ha : a < cut := lt_of_not_ge (fun h => (ht h hab).not_gt habv)
  have hbv : p b ≤ p cut := by
    rcases hb.eq_or_lt with he | he
    · rw [he]
    · exact (ht le_rfl he).le
  exact ⟨hg.2 ha ⟨i ∘ Fin.castSucc, hi.init, rfl⟩ (habv.trans_le hbv) t
    (hb.trans hlate.le), ht hb hlate⟩

/-- Every avoider either has no entry of rank `d+2`, or splits at the first
such entry into a front and a decreasing tail in one marker gap. -/
theorem avoids_iff_canonical_split {p : Fin n → α} :
    Avoids p d ↔ (∀ y, ¬ Reaches p (d + 1) y) ∨
      ∃ cut, Front p d cut ∧ DecreasingTail p cut ∧ SingleGap p d cut := by
  classical
  constructor
  · intro h
    by_cases he : ∃ y, Reaches p (d + 1) y
    · let indices := Finset.univ.filter (Reaches p (d + 1))
      have hnonempty : indices.Nonempty := by
        obtain ⟨y, hy⟩ := he
        exact ⟨y, by simp [indices, hy]⟩
      let cut := indices.min' hnonempty
      have hc : Reaches p (d + 1) cut :=
        (Finset.mem_filter.mp (indices.min'_mem hnonempty)).2
      have hf : Front p d cut := by
        intro y hy hy'
        exact hy.not_ge (indices.min'_le y (by simp [indices, hy']))
      exact Or.inr ⟨cut, hf, split_of_first h hc⟩
    · exact Or.inl (not_exists.mp he)
  · rintro (h | ⟨cut, hf, ht, hg⟩)
    · exact fun i hi => (h _ ⟨i, hi, rfl⟩).elim
    · exact avoids_of_split hf ht hg

/-- The cut is determined by the occurrence of a witness at the cut and
the absence of any witness in its front. -/
theorem canonical_cut_unique {p : Fin n → α} {a b : Fin n}
    (ha : Front p d a) (hb : Front p d b)
    (hga : SingleGap p d a) (hgb : SingleGap p d b) : a = b :=
  le_antisymm (le_of_not_gt (fun h => ha b h (reaches_succ.mpr hgb.1)))
    (le_of_not_gt (fun h => hb a h (reaches_succ.mpr hga.1)))

/-- The positions of the entries in ascending value order in the four
forbidden patterns `12345`, `12453`, `13452`, and `23451`. -/
def forbiddenOrders : Finset (Fin 5 → Fin 5) :=
  {![0, 1, 2, 3, 4], ![0, 1, 4, 2, 3], ![0, 4, 1, 2, 3], ![4, 0, 1, 2, 3]}

/-- Literal avoidance of the four patterns in Conjecture 6.3. -/
def AvoidsA54 (p : Equiv.Perm (Fin n)) : Prop :=
  ∀ i : Fin 5 → Fin n, StrictMono i →
    ∀ w ∈ forbiddenOrders, ¬ StrictMono (p ∘ i ∘ w)

private theorem mono_four (v : Fin 4 → α) :
    StrictMono v ↔ v 0 < v 1 ∧ v 1 < v 2 ∧ v 2 < v 3 := by
  rw [Fin.strictMono_iff_lt_succ]
  refine ⟨fun h => ⟨h 0, h 1, h 2⟩, fun h j => ?_⟩
  fin_cases j
  · exact h.1
  · exact h.2.1
  · exact h.2.2

private theorem mono_five (v : Fin 5 → α) :
    StrictMono v ↔ v 0 < v 1 ∧ v 1 < v 2 ∧ v 2 < v 3 ∧ v 3 < v 4 := by
  rw [Fin.strictMono_iff_lt_succ]
  refine ⟨fun h => ⟨h 0, h 1, h 2, h 3⟩, fun h j => ?_⟩
  fin_cases j
  · exact h.1
  · exact h.2.1
  · exact h.2.2.1
  · exact h.2.2.2

private theorem forbidden_iff (v : Fin 5 → α) (hv : Function.Injective v) :
    (∃ w ∈ forbiddenOrders, StrictMono (v ∘ w)) ↔
      (v 0 < v 1 ∧ v 1 < v 2 ∧ v 2 < v 3) ∧ ¬ (v 2 < v 4 ∧ v 4 < v 3) := by
  simp only [forbiddenOrders, Finset.mem_insert, Finset.mem_singleton, exists_eq_or_imp,
    exists_eq_left, mono_five, Function.comp_apply, Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
    Matrix.head_cons, Matrix.tail_cons]
  have hn₀ : v 4 ≠ v 0 := fun h => (by decide : (4 : Fin 5) ≠ 0) (hv h)
  have hn₁ : v 4 ≠ v 1 := fun h => (by decide : (4 : Fin 5) ≠ 1) (hv h)
  have hn₂ : v 4 ≠ v 2 := fun h => (by decide : (4 : Fin 5) ≠ 2) (hv h)
  have hn₃ : v 4 ≠ v 3 := fun h => (by decide : (4 : Fin 5) ≠ 3) (hv h)
  grind

/-- The literal four-pattern class is the member `d = 2` of the family. -/
theorem avoidsA54_iff {p : Equiv.Perm (Fin n)} : AvoidsA54 p ↔ Avoids p 2 := by
  constructor
  · intro h i hi t ht
    let j : Fin 5 → Fin n := Fin.snoc i t
    have hj : StrictMono j := strictMono_snoc hi.1 ht
    have hforbid : ¬ ∃ w ∈ forbiddenOrders, StrictMono ((p ∘ j) ∘ w) := by
      rintro ⟨w, hw, hmono⟩
      exact h j hj w hw hmono
    have hmono : StrictMono (p ∘ i) := hi.2
    rw [mono_four] at hmono
    have hjcast (a : Fin 4) : j a.castSucc = i a := by simp [j]
    have hj₀ : j 0 = i 0 := hjcast 0
    have hj₁ : j 1 = i 1 := hjcast 1
    have hj₂ : j 2 = i 2 := hjcast 2
    have hj₃ : j 3 = i 3 := hjcast 3
    have hj₄ : j 4 = t := by
      change (Fin.snoc i t : Fin 5 → Fin n) (Fin.last 4) = t
      rw [Fin.snoc_last]
    have hnot := (forbidden_iff _ (p.injective.comp hj.injective)).not.mp hforbid
    by_contra hfail
    apply hnot
    refine ⟨?_, ?_⟩
    · simpa only [Function.comp_apply, hj₀, hj₁, hj₂, hj₃] using hmono
    · change ¬ (p (i 2) < p t ∧ p t < p (i 3)) at hfail
      simpa only [Function.comp_apply, hj₂, hj₃, hj₄] using hfail
  · intro h j hj w hw hmono
    let i := j ∘ Fin.castSucc
    have hbad := (forbidden_iff _ (p.injective.comp hj.injective)).mp ⟨w, hw, hmono⟩
    have hi : Chain p i := by
      refine ⟨hj.comp Fin.strictMono_castSucc, (mono_four _).mpr ?_⟩
      exact hbad.1
    exact hbad.2 (h i hi (j (Fin.last 4)) (hj (Fin.castSucc_lt_last _)))

/-- A valid arrangement with a specified nonempty tail. -/
def SplitAt (p : Fin n → α) (d : ℕ) (cut : Fin n) : Prop :=
  Front p d cut ∧ DecreasingTail p cut ∧ SingleGap p d cut

/-- The class of fronts, viewed as permutations with no tail. -/
def IsFront (p : Fin n → α) (d : ℕ) : Prop := ∀ y, ¬ Reaches p (d + 1) y

private def joinCanonical (n d : ℕ) :
    ({p : Equiv.Perm (Fin n) // IsFront p d} ⊕
      (Σ cut : Fin n, {p : Equiv.Perm (Fin n) // SplitAt p d cut})) →
    {p : Equiv.Perm (Fin n) // Avoids p d}
  | .inl p => ⟨p, avoids_iff_canonical_split.mpr (Or.inl p.2)⟩
  | .inr ⟨cut, p⟩ => ⟨p, avoids_iff_canonical_split.mpr (Or.inr ⟨cut, p.2⟩)⟩

/-- Tail-free fronts and the disjoint classes indexed by their canonical cut
give exactly the permutations in the literal avoidance family. -/
noncomputable def canonicalEquiv (n d : ℕ) :
    ({p : Equiv.Perm (Fin n) // IsFront p d} ⊕
      (Σ cut : Fin n, {p : Equiv.Perm (Fin n) // SplitAt p d cut})) ≃
    {p : Equiv.Perm (Fin n) // Avoids p d} := by
  apply Equiv.ofBijective (joinCanonical n d)
  constructor
  · intro u v h
    cases u with
    | inl p =>
      cases v with
      | inl q =>
        have he : p.1 = q.1 := congrArg (fun a : {p : Equiv.Perm (Fin n) // Avoids p d} => a.1) h
        have hpq : p = q := Subtype.ext he
        exact congrArg Sum.inl hpq
      | inr q =>
        obtain ⟨cut, q⟩ := q
        have he : p.1 = q.1 := congrArg Subtype.val h
        exact (p.2 cut (he.symm ▸ reaches_succ.mpr q.2.2.2.1)).elim
    | inr p =>
      obtain ⟨cut, p⟩ := p
      cases v with
      | inl q =>
        have he : p.1 = q.1 := congrArg Subtype.val h
        exact (q.2 cut (he ▸ reaches_succ.mpr p.2.2.2.1)).elim
      | inr q =>
        obtain ⟨cut', q⟩ := q
        have he : p.1 = q.1 := congrArg Subtype.val h
        have hq : SplitAt p.1 d cut' := he.symm ▸ q.2
        have hc := canonical_cut_unique p.2.1 hq.1 p.2.2.2 hq.2.2
        subst cut'
        have hpq : p = q := Subtype.ext he
        subst q
        rfl
  · rintro ⟨p, hp⟩
    rcases avoids_iff_canonical_split.mp hp with hf | ⟨cut, ht⟩
    · exact ⟨Sum.inl ⟨p, hf⟩, rfl⟩
    · exact ⟨Sum.inr ⟨cut, p, ht⟩, rfl⟩

/-- Cardinality of the literal four-pattern avoidance class. -/
noncomputable def countA54 (n : ℕ) : ℕ := Nat.card {p : Equiv.Perm (Fin n) // AvoidsA54 p}

/-- Exact partition of the literal four-pattern count by the first tail
position, including the contribution of the front-only class. -/
theorem countA54_eq_sum_cuts (n : ℕ) :
    countA54 n = Nat.card {p : Equiv.Perm (Fin n) // IsFront p 2} +
      ∑ cut : Fin n, Nat.card {p : Equiv.Perm (Fin n) // SplitAt p 2 cut} := by
  have e : {p : Equiv.Perm (Fin n) // AvoidsA54 p} ≃ {p : Equiv.Perm (Fin n) // Avoids p 2} :=
    Equiv.subtypeEquivRight fun _ => avoidsA54_iff
  rw [countA54, Nat.card_congr e, ← Nat.card_congr (canonicalEquiv n 2), Nat.card_sum, Nat.card_sigma]

/-- In a gap with `g` front values, the `r` tail slots are an increasing
selection of `r` positions out of the `g+r` interleaving slots. -/
theorem card_gap_interleavings (g r : ℕ) :
    Nat.card (Fin r ↪o Fin (g + r)) = (g + r).choose r := by
  classical
  let choices := (Finset.univ : Finset (Fin (g + r))).powersetCard r
  let e : (Fin r ↪o Fin (g + r)) ≃ ↥choices :=
    { toFun := fun f => ⟨Finset.univ.image f, Finset.mem_powersetCard.mpr
        ⟨Finset.subset_univ _, by rw [Finset.card_image_of_injective _ f.injective,
          Finset.card_univ, Fintype.card_fin]⟩⟩
      invFun := fun s => s.1.orderEmbOfFin (Finset.mem_powersetCard.mp s.2).2
      left_inv := fun f => (Finset.orderEmbOfFin_unique' _
        (fun i => Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩)).symm
      right_inv := fun s => Subtype.ext (Finset.image_orderEmbOfFin_univ _ _) }
  rw [Nat.card_congr e, Nat.card_eq_fintype_card, Fintype.card_coe, Finset.card_powersetCard,
    Finset.card_univ, Fintype.card_fin]

end PantoneBonaTerminal
