import Conjectures.MaTangCoreSetCoverage

/-!
# Ma–Tang's random subset-sum threshold conjecture

Count every unordered k-subset once in alphabet order, and prove that
uniform ordered distinct sampling gives the same coverage fraction.
-/
namespace MaTangCoreUniformSubset
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear
open MaTangCoreEncoding MaTangCoreFactor MaTangCoreMultiplicity MaTangCoreCoupling
open MaTangCoreDecay MaTangCoreLowerBound MaTangCoreBirthday MaTangCoreTranspose
open MaTangCoreDistinct MaTangCoreSetCoverage

def falling (n : Nat) : Nat → Nat
  | 0 => 1
  | k+1 => n*falling (n-1) k

theorem falling_pos (n k : Nat) (h : k ≤ n) : 0 < falling n k := by
  induction k generalizing n with
  | zero => exact Nat.zero_lt_one
  | succ k ih =>
    exact Nat.mul_pos (by omega) (ih (n-1) (by omega))

theorem distinctWords_nodup {α : Type} [BEq α] (A : List α) (k : Nat)
    (hA : A.Nodup) : (distinctWords A k).Nodup :=
  List.filter_sublist.nodup (nodup_words A k hA)

theorem erase_mem_iff_ne {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (a b : α) :
    b ∈ A.erase a ↔ b ∈ A ∧ b ≠ a := by
  by_cases h : b = a
  · subst b
    simp [hA.not_mem_erase]
  · simp [List.mem_erase_of_ne h,h]

theorem distinctWord_cons_iff {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (k : Nat) (a : α) (w : List α) :
    a::w ∈ distinctWords A (k+1) ↔
      a ∈ A ∧ w ∈ distinctWords (A.erase a) k := by
  rw [distinctWords_mem,distinctWords_mem,mem_words,mem_words,List.nodup_cons]
  constructor
  · intro h
    have ha := h.1.2 a (by simp)
    refine ⟨ha,⟨by simpa using h.1.1,?_⟩,h.2.2⟩
    intro b hb
    apply (erase_mem_iff_ne A hA a b).mpr
    refine ⟨h.1.2 b (by simp [hb]),?_⟩
    intro e
    subst b
    exact h.2.1 hb
  · rintro ⟨ha,⟨hl,hm⟩,hn⟩
    refine ⟨⟨by simp [hl],?_⟩,?_ ,hn⟩
    · intro b hb
      simp only [List.mem_cons] at hb
      rcases hb with e | he
      · rwa [e]
      · exact ((erase_mem_iff_ne A hA a b).mp (hm b he)).1
    · intro h
      exact ((erase_mem_iff_ne A hA a a).mp (hm a h)).2 rfl

theorem distinctWords_length {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (k : Nat) :
    (distinctWords A k).length = falling A.length k := by
  induction k generalizing A with
  | zero => simp [distinctWords,words,duplicateB,falling]
  | succ k ih =>
    let F := fun a : α => distinctWords (A.erase a) k
    let L := taggedFibers A F
    have hL : L.length = A.length*falling (A.length-1) k := by
      apply taggedFibers_length
      intro a ha
      change (distinctWords (A.erase a) k).length = _
      rw [ih _ (hA.erase a),List.length_erase_of_mem ha]
    have he : L.length = (distinctWords A (k+1)).length := by
      apply card_of_bijection L _ (taggedFibers_nodup _ _ hA
        (fun a _ => distinctWords_nodup _ _ (hA.erase a)))
        (distinctWords_nodup _ _ hA) (fun p => p.1::p.2)
      · intro p hp
        exact (distinctWord_cons_iff A hA k p.1 p.2).mpr
          ((taggedFibers_mem A F p).mp hp)
      · intro p hp q hq e
        rcases p with ⟨a,w⟩
        rcases q with ⟨b,v⟩
        exact Prod.ext (List.cons.inj e).1 (List.cons.inj e).2
      · intro w hw
        have hlen := ((mem_words _ _ _).mp ((distinctWords_mem _ _ _).mp hw).1).1
        cases w with
        | nil => simp at hlen
        | cons a as =>
          exact ⟨(a,as),(taggedFibers_mem A F _).mpr
            ((distinctWord_cons_iff A hA k a as).mp hw),rfl⟩
    rw [← he,hL,falling]

def subsets {α : Type} : List α → List (List α)
  | [] => [[]]
  | a::as => subsets as ++ (subsets as).map fun s => a::s

theorem subsets_mem {α : Type} (A s : List α) :
    s ∈ subsets A ↔ s.Sublist A := by
  induction A generalizing s with
  | nil =>
    constructor
    · intro h
      have e : s = [] := by simpa [subsets] using h
      subst s
      exact List.Sublist.refl []
    · intro h
      have e : s = [] := List.sublist_nil.mp h
      simp [e,subsets]
  | cons a as ih =>
    constructor
    · intro h
      simp only [subsets,List.mem_append,List.mem_map] at h
      rcases h with h | ⟨t,ht,e⟩
      · exact ((ih s).mp h).cons a
      · subst s
        exact ((ih t).mp ht).cons_cons a
    · intro h
      cases h with
      | cons b h =>
        exact List.mem_append_left _ ((ih _).mpr h)
      | cons_cons b h =>
        exact List.mem_append_right _ (List.mem_map.mpr ⟨_,(ih _).mpr h,rfl⟩)

theorem subsets_nodup {α : Type} (A : List α) (hA : A.Nodup) :
    (subsets A).Nodup := by
  induction A with
  | nil => simp [subsets]
  | cons a as ih =>
    obtain ⟨ha,hs⟩ := List.nodup_cons.mp hA
    have hnd := ih hs
    rw [subsets,List.nodup_append]
    refine ⟨hnd,nodup_map_of_injective_on _ _ hnd
      (fun x _ y _ e => (List.cons.inj e).2),?_⟩
    intro s hs' t ht e
    obtain ⟨u,hu,eu⟩ := List.mem_map.mp ht
    have hm : a ∈ s := by rw [e,← eu]; simp
    exact ha (((subsets_mem as s).mp hs').subset hm)

def kSubsets {α : Type} (A : List α) (k : Nat) : List (List α) :=
  (subsets A).filter fun s => s.length == k

theorem kSubsets_mem {α : Type} (A : List α) (k : Nat) (s : List α) :
    s ∈ kSubsets A k ↔ s.Sublist A ∧ s.length = k := by
  simp [kSubsets,subsets_mem]

theorem kSubsets_nodup {α : Type} (A : List α) (k : Nat) (hA : A.Nodup) :
    (kSubsets A k).Nodup := List.filter_sublist.nodup (subsets_nodup A hA)

theorem canonicalIn_of_sublist {α : Type} [BEq α] [LawfulBEq α]
    (A s : List α) (hA : A.Nodup) (h : s.Sublist A) : canonicalIn A s = s := by
  induction h with
  | slnil => rfl
  | @cons s A a h ih =>
    obtain ⟨ha,hnd⟩ := List.nodup_cons.mp hA
    have he : a ∉ s := fun ha' => ha (h.subset ha')
    change (a::A).filter (fun b => containsB b s) = s
    rw [List.filter_cons]
    simp only [(containsB_false a s).mpr he,Bool.false_eq_true,ite_false]
    exact ih hnd
  | @cons_cons s A a h ih =>
    obtain ⟨ha,hnd⟩ := List.nodup_cons.mp hA
    have ee : canonicalIn A (a::s) = canonicalIn A s := by
      unfold canonicalIn
      apply List.filter_congr
      intro b hb
      have hne : b ≠ a := fun e => ha (e ▸ hb)
      simp [containsB,Ne.symm hne]
    change List.filter (fun b => containsB b (a::s)) (a::A) = a::s
    rw [List.filter_cons]
    have hh : containsB a (a::s) = true := (containsB_true a _).mpr (by simp)
    rw [hh,ite_eq_left rfl]
    exact congrArg (List.cons a) (ee.trans (ih hnd))

theorem canonicalIn_congr {α : Type} [BEq α] [LawfulBEq α]
    (A w v : List α) (h : ∀ a, a ∈ w ↔ a ∈ v) :
    canonicalIn A w = canonicalIn A v := by
  unfold canonicalIn
  apply List.filter_congr
  intro a ha
  cases hw : containsB a w
  · exact ((containsB_false a v).mpr (fun e => ((containsB_false a w).mp hw) ((h a).mpr e))).symm
  · exact ((containsB_true a v).mpr ((h a).mp ((containsB_true a w).mp hw))).symm

theorem permutation_fiber_members {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (k : Nat) (hA : A.Nodup) (s w : List α)
    (hs : s ∈ kSubsets A k) (hw : w ∈ distinctWords s k) :
    w ∈ distinctWords A k ∧ (∀ a, a ∈ s ↔ a ∈ w) := by
  obtain ⟨hsub,hlen⟩ := (kSubsets_mem A k s).mp hs
  obtain ⟨hm,hnd⟩ := (distinctWords_mem s k w).mp hw
  obtain ⟨hwl,hwmem⟩ := (mem_words _ _ _).mp hm
  have hsubset : ∀ a ∈ w, a ∈ s := hwmem
  have hre : ∀ a ∈ s, a ∈ w := by
    intro a ha
    by_cases haw : a ∈ w
    · exact haw
    · have hsub' : ∀ b ∈ w, b ∈ s.erase a := by
        intro b hb
        have hne : b ≠ a := fun e => haw (e ▸ hb)
        exact (erase_mem_iff_ne s (hsub.nodup hA) a b).mpr ⟨hsubset b hb,hne⟩
      have he := nodup_subset_length w (s.erase a) hnd hsub'
      rw [List.length_erase_of_mem ha,hwl,hlen] at he
      have hp : 0 < s.length := by
        cases s with
        | nil => simp at ha
        | cons b bs => simp
      omega
  refine ⟨(distinctWords_mem A k w).mpr ⟨(mem_words _ _ _).mpr
    ⟨hwl,fun a ha => hsub.subset (hwmem a ha)⟩,hnd⟩,
    fun a => ⟨hre a,hsubset a⟩⟩

theorem canonicalIn_sample {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (k : Nat) (hA : A.Nodup) (w : List α)
    (hw : w ∈ distinctWords A k) :
    canonicalIn A w ∈ kSubsets A k ∧ w ∈ distinctWords (canonicalIn A w) k := by
  obtain ⟨hm,hn⟩ := (distinctWords_mem A k w).mp hw
  obtain ⟨hl,hsub⟩ := (mem_words _ _ _).mp hm
  have hp := canonicalIn_perm A w hA hn hsub
  refine ⟨(kSubsets_mem A k _).mpr ⟨List.filter_sublist,hp.length_eq.symm.trans hl⟩,
    (distinctWords_mem _ _ _).mpr ⟨(mem_words _ _ _).mpr
      ⟨hl,fun a ha => (canonicalIn_mem _ _ _).mpr ⟨hsub a ha,ha⟩⟩,hn⟩⟩

/-- Every k-subset has exactly falling(k,k) orderings. -/
theorem ordered_subset_count {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (k : Nat) (hA : A.Nodup) :
    (distinctWords A k).length = (kSubsets A k).length*falling k k := by
  let F := fun s : List α => distinctWords s k
  let L := taggedFibers (kSubsets A k) F
  have hL : L.length = (kSubsets A k).length*falling k k := by
    apply taggedFibers_length
    intro s hs
    obtain ⟨hsub,hlen⟩ := (kSubsets_mem A k s).mp hs
    change (distinctWords s k).length = _
    rw [distinctWords_length s (hsub.nodup hA) k,hlen]
  have he : L.length = (distinctWords A k).length := by
    apply card_of_bijection L _
      (taggedFibers_nodup _ _ (kSubsets_nodup A k hA) (fun s hs =>
        distinctWords_nodup s k (((kSubsets_mem A k s).mp hs).1.nodup hA)))
      (distinctWords_nodup A k hA) Prod.snd
    · intro p hp
      obtain ⟨hs,hw⟩ := (taggedFibers_mem _ _ p).mp hp
      exact (permutation_fiber_members A k hA p.1 p.2 hs hw).1
    · intro p hp q hq e
      obtain ⟨hps,hpw⟩ := (taggedFibers_mem _ _ p).mp hp
      obtain ⟨hqs,hqw⟩ := (taggedFibers_mem _ _ q).mp hq
      have hp' := (permutation_fiber_members A k hA p.1 p.2 hps hpw).2
      have hq' := (permutation_fiber_members A k hA q.1 q.2 hqs hqw).2
      have hs : ∀ a, a ∈ p.1 ↔ a ∈ q.1 := by
        intro a
        rw [hp' a,hq' a,e]
      have ee := canonicalIn_congr A p.1 q.1 hs
      rw [canonicalIn_of_sublist A p.1 hA ((kSubsets_mem A k p.1).mp hps).1,
        canonicalIn_of_sublist A q.1 hA ((kSubsets_mem A k q.1).mp hqs).1] at ee
      exact Prod.ext ee e
    · intro w hw
      have h := canonicalIn_sample A k hA w hw
      exact ⟨(canonicalIn A w,w),(taggedFibers_mem _ _ _).mpr h,rfl⟩
  exact he.symm.trans hL

noncomputable def coveredSubsets (d k : Nat) : List (List Raw) := by
  classical
  exact (kSubsets (alphabet (2^d)) k).filter fun s => decide (WordCovers d s)

theorem coveredSubsets_mem (d k : Nat) (s : List Raw) :
    s ∈ coveredSubsets d k ↔ s ∈ kSubsets (alphabet (2^d)) k ∧ WordCovers d s := by
  classical
  simp [coveredSubsets]

theorem coveredSubsets_nodup (d k : Nat) : (coveredSubsets d k).Nodup := by
  classical
  unfold coveredSubsets
  exact List.filter_sublist.nodup (kSubsets_nodup _ _ (alphabet_nodup _))

theorem coveredDistinctWords_nodup (d k : Nat) : (coveredDistinctWords d k).Nodup := by
  classical
  unfold coveredDistinctWords
  exact List.filter_sublist.nodup (distinctWords_nodup _ _ (alphabet_nodup _))

/-- The numerator of the coverage fraction also gains precisely the
constant number of orderings, not merely the denominator. -/
theorem ordered_covered_subset_count (d k : Nat) :
    (coveredDistinctWords d k).length = (coveredSubsets d k).length*falling k k := by
  let A := alphabet (2^d)
  have hA : A.Nodup := alphabet_nodup _
  let F := fun s : List Raw => distinctWords s k
  let L := taggedFibers (coveredSubsets d k) F
  have hL : L.length = (coveredSubsets d k).length*falling k k := by
    apply taggedFibers_length
    intro s hs
    have h := (coveredSubsets_mem d k s).mp hs
    obtain ⟨hsub,hlen⟩ := (kSubsets_mem A k s).mp h.1
    change (distinctWords s k).length = _
    rw [distinctWords_length s (hsub.nodup hA) k,hlen]
  have he : L.length = (coveredDistinctWords d k).length := by
    apply card_of_bijection L _
      (taggedFibers_nodup _ _ (coveredSubsets_nodup d k) (fun s hs =>
        distinctWords_nodup s k (((kSubsets_mem A k s).mp
          ((coveredSubsets_mem d k s).mp hs).1).1.nodup hA)))
      (coveredDistinctWords_nodup d k) Prod.snd
    · intro p hp
      obtain ⟨hs,hw⟩ := (taggedFibers_mem _ _ p).mp hp
      obtain ⟨hks,hcov⟩ := (coveredSubsets_mem d k p.1).mp hs
      have he := permutation_fiber_members A k hA p.1 p.2 hks hw
      have hsn := ((kSubsets_mem A k p.1).mp hks).1.nodup hA
      have hwn := ((distinctWords_mem _ _ _).mp hw).2
      exact (coveredDistinctWords_mem d k p.2).mpr
        ⟨he.1,(wordCovers_same_members d p.1 p.2 hsn hwn he.2).mp hcov⟩
    · intro p hp q hq e
      obtain ⟨hps,hpw⟩ := (taggedFibers_mem _ _ p).mp hp
      obtain ⟨hqs,hqw⟩ := (taggedFibers_mem _ _ q).mp hq
      have hps' := ((coveredSubsets_mem d k p.1).mp hps).1
      have hqs' := ((coveredSubsets_mem d k q.1).mp hqs).1
      have hp' := (permutation_fiber_members A k hA p.1 p.2 hps' hpw).2
      have hq' := (permutation_fiber_members A k hA q.1 q.2 hqs' hqw).2
      have hs : ∀ a, a ∈ p.1 ↔ a ∈ q.1 := by
        intro a
        rw [hp' a,hq' a,e]
      have ee := canonicalIn_congr A p.1 q.1 hs
      rw [canonicalIn_of_sublist A p.1 hA ((kSubsets_mem A k p.1).mp hps').1,
        canonicalIn_of_sublist A q.1 hA ((kSubsets_mem A k q.1).mp hqs').1] at ee
      exact Prod.ext ee e
    · intro w hw
      obtain ⟨hd,hcov⟩ := (coveredDistinctWords_mem d k w).mp hw
      have h := canonicalIn_sample A k hA w hd
      have hm := (permutation_fiber_members A k hA _ w h.1 h.2).2
      have hsn := canonicalIn_nodup A w hA
      have hwn := ((distinctWords_mem A k w).mp hd).2
      have hc := (wordCovers_same_members d _ w hsn hwn hm).mpr hcov
      exact ⟨(canonicalIn A w,w),(taggedFibers_mem _ _ _).mpr
        ⟨(coveredSubsets_mem d k _).mpr ⟨h.1,hc⟩,h.2⟩,rfl⟩
  exact he.symm.trans hL

/-- Actual uniform k-subsets of F2^d × F3 have covering fraction at
most 1/(4*2^r) along the explicit dimension sequence. -/
theorem uniform_subset_coverage_scaled (r : Nat) (hr : 4 ≤ r) :
    4*2^r*(coveredSubsets (targetDimension r) (sampleCount r)).length ≤
      (kSubsets (alphabet (2^(targetDimension r))) (sampleCount r)).length := by
  let d := targetDimension r
  let k := sampleCount r
  have h := distinct_coverage_scaled r hr
  rw [ordered_covered_subset_count,ordered_subset_count _ _ (alphabet_nodup _)] at h
  have he : (4*2^r*(coveredSubsets d k).length)*falling k k ≤
      (kSubsets (alphabet (2^d)) k).length*falling k k := by
    rw [Nat.mul_assoc]
    exact h
  exact Nat.le_of_mul_le_mul_right he (falling_pos k k (Nat.le_refl k))

theorem mixed_uniform_subset_nonempty (r : Nat) (hr : 4 ≤ r) :
    0 < (kSubsets (alphabet (2^(targetDimension r))) (sampleCount r)).length := by
  let A := alphabet (2^(targetDimension r))
  let k := sampleCount r
  have hA : 0 < A.length := by
    dsimp [A]
    rw [alphabet_length]
    exact Nat.mul_pos (by decide) (Nat.two_pow_pos _)
  have hhalf := distinctWords_half A (alphabet_nodup _) k hA (mixed_birthday_condition r hr)
  have hp : 0 < (words A k).length := by
    rw [words_length]
    exact Nat.pow_pos hA
  have hd : 0 < (distinctWords A k).length := by omega
  rw [ordered_subset_count A k (alphabet_nodup _)] at hd
  exact Nat.pos_of_mul_pos_right hd

/-- Strict failure of the one-half success threshold for actual
uniform subsets on every sufficiently large member of the sequence. -/
theorem uniform_subset_below_half (r : Nat) (hr : 4 ≤ r) :
    2*(coveredSubsets (targetDimension r) (sampleCount r)).length <
      (kSubsets (alphabet (2^(targetDimension r))) (sampleCount r)).length := by
  have he := uniform_subset_coverage_scaled r hr
  have hp := mixed_uniform_subset_nonempty r hr
  let C := (coveredSubsets (targetDimension r) (sampleCount r)).length
  let T := (kSubsets (alphabet (2^(targetDimension r))) (sampleCount r)).length
  have hh : 4*C ≤ T := by
    have h1 : 4 ≤ 4*2^r := by
      have h := Nat.two_pow_pos r
      omega
    exact Nat.le_trans (Nat.mul_le_mul_right C h1) he
  omega

end MaTangCoreUniformSubset
