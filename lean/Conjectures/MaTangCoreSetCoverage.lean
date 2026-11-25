import Conjectures.MaTangCoreDistinct

/-!
# Ma–Tang's random subset-sum threshold conjecture

Identify coverage of the matrix sample with coverage by genuine subset
sums in the mixed group, and prove invariance under reordering.
-/
namespace MaTangCoreSetCoverage
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear
open MaTangCoreEncoding MaTangCoreFactor MaTangCoreMultiplicity MaTangCoreCoupling
open MaTangCoreDecay MaTangCoreLowerBound MaTangCoreBirthday MaTangCoreTranspose MaTangCoreDistinct

theorem xorVec_assoc (a b c : List Bool) :
    xorVec (xorVec a b) c = xorVec a (xorVec b c) := by
  induction a generalizing b c with
  | nil => cases b <;> cases c <;> rfl
  | cons x xs ih =>
    cases b with
    | nil => cases c <;> rfl
    | cons y ys =>
      cases c with
      | nil => rfl
      | cons z zs =>
        cases x <;> cases y <;> cases z <;> simp [xorVec,ih]

def selected {α : Type} : List α → List Bool → List α
  | a::as,b::bs => if b then a::selected as bs else selected as bs
  | _,_ => []

theorem selected_sublist {α : Type} (w : List α) (u : List Bool) :
    (selected w u).Sublist w := by
  induction w generalizing u with
  | nil => cases u <;> exact List.Sublist.refl []
  | cons a as ih =>
    cases u with
    | nil => exact List.nil_sublist _
    | cons b bs =>
      cases b
      · exact (ih bs).cons a
      · exact (ih bs).cons_cons a

theorem sublist_selected {α : Type} (s w : List α) (h : s.Sublist w) :
    ∃ u, u.length = w.length ∧ selected w u = s := by
  induction h with
  | slnil => exact ⟨[],rfl,rfl⟩
  | cons a h ih =>
    obtain ⟨u,hu,e⟩ := ih
    exact ⟨false::u,by simp [hu],e⟩
  | cons_cons a h ih =>
    obtain ⟨u,hu,e⟩ := ih
    exact ⟨true::u,by simp [hu],by simp [selected,e]⟩

def mixedBinarySum (d : Nat) : List Raw → List Bool
  | [] => List.replicate d false
  | x::xs => xorVec (decodeRow d x.1) (mixedBinarySum d xs)

def mixedTernarySum : List Raw → Int
  | [] => 0
  | x::xs => x.2 + mixedTernarySum xs

theorem mixedBinarySum_length (d : Nat) (s : List Raw) :
    (mixedBinarySum d s).length = d := by
  induction s with
  | nil => simp [mixedBinarySum]
  | cons x xs ih =>
    change (xorVec (decodeRow d x.1) (mixedBinarySum d xs)).length = d
    exact (xorVec_length _ _ ((decodeRow_length d x.1).trans ih.symm)).trans
      (decodeRow_length d x.1)

theorem mixedBinarySum_perm (d : Nat) (s t : List Raw) (h : s.Perm t) :
    mixedBinarySum d s = mixedBinarySum d t := by
  induction h with
  | nil => rfl
  | cons a h ih => simp [mixedBinarySum,ih]
  | swap a b xs =>
    simp only [mixedBinarySum,← xorVec_assoc]
    rw [xorVec_comm (decodeRow d b.1) (decodeRow d a.1)]
  | trans h1 h2 ih1 ih2 => exact ih1.trans ih2

theorem mixedTernarySum_perm (s t : List Raw) (h : s.Perm t) :
    mixedTernarySum s = mixedTernarySum t := by
  induction h with
  | nil => rfl
  | cons a h ih => simp [mixedTernarySum,ih]
  | swap a b xs => simp only [mixedTernarySum]; omega
  | trans h1 h2 ih1 ih2 => exact ih1.trans ih2

theorem sampleOfWord_apply (d : Nat) (w : List Raw) (u : List Bool)
    (h : u.length = w.length) :
    applyMatrix (sampleOfWord d w).1 u = mixedBinarySum d (selected w u) := by
  induction w generalizing u with
  | nil =>
    have he : u = [] := List.length_eq_zero_iff.mp h
    subst u
    change applyMatrix (List.replicate d ([] : List Bool)) [] = List.replicate d false
    have hh := applyMatrix_zero_right (List.replicate d ([] : List Bool)) 0
    simpa using hh
  | cons a as ih =>
    cases u with
    | nil => simp at h
    | cons b bs =>
      have hbs : bs.length = as.length := by simpa using h
      let rows := (sampleOfWord d as).1
      have hlen : rows.length = d := transposeCols_length d _ (generatorRows_size d _)
      change applyMatrix (prependColumn (decodeRow d a.1) rows) (b::bs) =
        mixedBinarySum d (selected (a::as) (b::bs))
      rw [prependColumn_apply _ _ _ _ ((decodeRow_length d a.1).trans hlen.symm)]
      have he := ih bs hbs
      change applyMatrix rows bs = _ at he
      rw [he]
      cases b <;> rfl

theorem sampleOfWord_coeffs (w : List Raw) (u : List Bool) (h : u.length = w.length) :
    sumCoeffs (w.map Prod.snd) u = mixedTernarySum (selected w u) := by
  induction w generalizing u with
  | nil => rfl
  | cons a as ih =>
    cases u with
    | nil => simp at h
    | cons b bs =>
      have hbs : bs.length = as.length := by simpa using h
      cases b <;> simp [selected,mixedTernarySum,sumCoeffs,ih bs hbs]

def SublistCovers (d : Nat) (w : List Raw) : Prop :=
  ∀ b : List Bool, b.length = d → ∀ z : Int, 0 ≤ z → z < 3 →
    ∃ s, s.Sublist w ∧ mixedBinarySum d s = b ∧ mixedTernarySum s % 3 = z

theorem wordCovers_iff_sublist (d : Nat) (w : List Raw) :
    WordCovers d w ↔ SublistCovers d w := by
  have hlen : (sampleOfWord d w).1.length = d :=
    transposeCols_length d _ (generatorRows_size d _)
  have hcs : (sampleOfWord d w).2.length = w.length := by simp [sampleOfWord]
  constructor
  · intro hc b hb z hz hzz
    obtain ⟨u,hu,hb',hz'⟩ := hc b (hb.trans hlen.symm) z hz hzz
    rw [hcs] at hu
    refine ⟨selected w u,selected_sublist w u,?_,?_⟩
    · exact (sampleOfWord_apply d w u hu).symm.trans hb'
    · have he := sampleOfWord_coeffs w u hu
      change sumCoeffs (w.map Prod.snd) u % 3 = z at hz'
      rwa [← he]
  · intro hc b hb z hz hzz
    obtain ⟨s,hs,hb',hz'⟩ := hc b (hb.trans hlen) z hz hzz
    obtain ⟨u,hu,e⟩ := sublist_selected s w hs
    refine ⟨u,hu.trans hcs.symm,?_,?_⟩
    · rw [sampleOfWord_apply d w u hu,e,hb']
    · change sumCoeffs (w.map Prod.snd) u % 3 = z
      rw [sampleOfWord_coeffs w u hu,e,hz']

/-- Two duplicate-free lists with the same members are permutations. -/
theorem perm_of_nodup_members {α : Type} [BEq α] [LawfulBEq α]
    (s t : List α) (hs : s.Nodup) (ht : t.Nodup)
    (h : ∀ a, a ∈ s ↔ a ∈ t) : s.Perm t := by
  induction s generalizing t with
  | nil =>
    cases t with
    | nil => exact List.Perm.nil
    | cons a as =>
      have he := (h a).mpr (by simp)
      simp at he
  | cons a as ih =>
    have ha : a ∈ t := (h a).mp (by simp)
    obtain ⟨hne,hnd⟩ := List.nodup_cons.mp hs
    have he : ∀ b, b ∈ as ↔ b ∈ t.erase a := by
      intro b
      by_cases hb : b = a
      · subst b
        exact ⟨fun e => False.elim (hne e),fun e => False.elim (ht.not_mem_erase e)⟩
      · rw [List.mem_erase_of_ne hb,← h b]
        simp [hb]
    have hp := ih (t.erase a) hnd (ht.erase a) he
    exact (hp.cons a).trans (List.perm_cons_erase ha).symm

def canonicalIn {α : Type} [BEq α] (A w : List α) : List α :=
  A.filter fun a => containsB a w

theorem canonicalIn_mem {α : Type} [BEq α] [LawfulBEq α]
    (A w : List α) (a : α) :
    a ∈ canonicalIn A w ↔ a ∈ A ∧ a ∈ w := by
  simp [canonicalIn,containsB_true]

theorem canonicalIn_nodup {α : Type} [BEq α] (A w : List α) (h : A.Nodup) :
    (canonicalIn A w).Nodup := List.filter_sublist.nodup h

theorem canonicalIn_perm {α : Type} [BEq α] [LawfulBEq α]
    (A w : List α) (hA : A.Nodup) (hw : w.Nodup)
    (h : ∀ a ∈ w, a ∈ A) : w.Perm (canonicalIn A w) := by
  apply perm_of_nodup_members _ _ hw (canonicalIn_nodup _ _ hA)
  intro a
  exact ⟨fun ha => (canonicalIn_mem A w a).mpr ⟨h a ha,ha⟩,
    fun ha => ((canonicalIn_mem A w a).mp ha).2⟩

/-- Coverage depends only on the underlying set when the samples are
distinct. This is the needed symmetry for uniform unordered subsets. -/
theorem wordCovers_same_members (d : Nat) (w v : List Raw)
    (hw : w.Nodup) (hv : v.Nodup) (h : ∀ a, a ∈ w ↔ a ∈ v) :
    WordCovers d w ↔ WordCovers d v := by
  rw [wordCovers_iff_sublist,wordCovers_iff_sublist]
  have transfer (x y : List Raw) (hx : x.Nodup) (hy : y.Nodup)
      (he : ∀ a ∈ x, a ∈ y) (hc : SublistCovers d x) : SublistCovers d y := by
    intro b hb z hz hzz
    obtain ⟨s,hs,eb,ez⟩ := hc b hb z hz hzz
    let t := canonicalIn y s
    have ht : t.Sublist y := List.filter_sublist
    have hp : s.Perm t := canonicalIn_perm y s hy (hs.nodup hx)
      (fun a ha => he a (hs.subset ha))
    exact ⟨t,ht,(mixedBinarySum_perm d s t hp).symm.trans eb,
      by rw [← mixedTernarySum_perm s t hp,ez]⟩
  exact ⟨transfer w v hw hv (fun a ha => (h a).mp ha),
    transfer v w hv hw (fun a ha => (h a).mpr ha)⟩

end MaTangCoreSetCoverage
