module

public import Conjectures.FranklLocalMaximalCover
public import Conjectures.FranklSmallCyclicMasks

/-! Exact local weight certificates evaluated on natural-number masks.

The inside and exterior domains are explicit lists. Their decoded images
must be the two actual powersets, and inside codes must be distinct. Thus
the checker visits only the supplied patterns, while its soundness theorem
counts the actual distinct compatible sets. Generator masks may already
encode a quotient ground, so no injective unwrapping is assumed.
-/
@[expose] public section

namespace FranklLocal.Mask

open Frankl.FC.BitCode FranklSmallCyclic
open scoped BigOperators

@[simp] theorem decode_zero (n : ℕ) : decode n 0 = ∅ := by
  simp [decode]

theorem decode_and (n a b : ℕ) :
    decode n (a &&& b) = decode n a ∩ decode n b := by
  ext i
  simp only [mem_decode, Finset.mem_inter, Nat.testBit_and, Bool.and_eq_true_iff]
  tauto

theorem mask_subset_iff {n a : ℕ} (ha : a < 2 ^ n) (b : ℕ) :
    a &&& b = a ↔ decode n a ⊆ decode n b := by
  constructor
  · intro h
    have heq := congrArg (decode n) h
    rw [decode_and] at heq
    simpa only [heq] using
      (Finset.inter_subset_right : decode n a ∩ decode n b ⊆ decode n b)
  · intro h
    apply decode_injOn n
      (Finset.mem_range.mpr (Nat.and_le_left.trans_lt ha)) (Finset.mem_range.mpr ha)
    rw [decode_and, Finset.inter_eq_left.mpr h]

theorem mask_disjoint_iff {n a : ℕ} (ha : a < 2 ^ n) (b : ℕ) :
    a &&& b = 0 ↔ Disjoint (decode n a) (decode n b) := by
  constructor
  · intro h
    apply Finset.disjoint_iff_inter_eq_empty.mpr
    rw [← decode_and, h, decode_zero]
  · intro h
    apply decode_injOn n
      (Finset.mem_range.mpr (Nat.and_le_left.trans_lt ha))
      (Finset.mem_range.mpr (by positivity))
    rw [decode_and, Finset.disjoint_iff_inter_eq_empty.mp h, decode_zero]

theorem decoded_filter (n : ℕ) (gs : List ℕ) (p : ℕ → Bool)
    (P : Finset ℕ → Prop) [DecidablePred P]
    (hp : ∀ g ∈ gs, p g = true ↔ P (decode n g)) :
    decodedGenerators n (gs.filter p) = (decodedGenerators n gs).filter P := by
  ext U
  simp only [decodedGenerators, Finset.mem_image, Finset.mem_filter,
    List.mem_toFinset, List.mem_filter]
  constructor
  · rintro ⟨g, ⟨hg, hpg⟩, rfl⟩
    exact ⟨⟨g, hg, rfl⟩, (hp g hg).mp hpg⟩
  · rintro ⟨⟨g, hg, rfl⟩, hPg⟩
    exact ⟨g, ⟨hg, (hp g hg).mpr hPg⟩, rfl⟩

def localCodes (gs : List ℕ) (core : ℕ) : List ℕ :=
  gs.filter (fun g => decide (g &&& core ≠ 0))

def coverCode (gs : List ℕ) (core allowed : ℕ) : ℕ :=
  maskUnion (coveringMasks (localCodes gs core) allowed)

theorem decoded_localCodes (n : ℕ) (gs : List ℕ) (core : ℕ)
    (hgs : ∀ g ∈ gs, g < 2 ^ n) :
    decodedGenerators n (localCodes gs core) =
      localGenerators (decodedGenerators n gs) (decode n core) := by
  unfold localCodes localGenerators
  apply decoded_filter
  intro g hg
  simp only [decide_eq_true_eq]
  exact not_congr (mask_disjoint_iff (hgs g hg) core)

theorem decoded_coveringMasks (n : ℕ) (gs : List ℕ) (allowed : ℕ)
    (hgs : ∀ g ∈ gs, g < 2 ^ n) :
    decodedGenerators n (coveringMasks gs allowed) =
      (decodedGenerators n gs).filter (fun g => g ⊆ decode n allowed) := by
  unfold coveringMasks
  apply decoded_filter
  intro g hg
  simp only [decide_eq_true_eq, mask_subset_iff (hgs g hg) allowed]

theorem decode_coverCode (n : ℕ) (gs : List ℕ) (core allowed : ℕ)
    (hgs : ∀ g ∈ gs, g < 2 ^ n) :
    decode n (coverCode gs core allowed) =
      localPart (decodedGenerators n gs) (decode n core) (decode n allowed) := by
  have hlocal : ∀ g ∈ localCodes gs core, g < 2 ^ n := by
    intro g hg
    exact hgs g (List.mem_filter.mp hg).1
  unfold coverCode
  rw [decode_maskUnion, decoded_coveringMasks n _ _ hlocal,
    decoded_localCodes n gs core hgs]
  rfl

def compatibleCodes (gs : List ℕ) (core : ℕ) (inside : List ℕ) (e m : ℕ) :
    Finset ℕ :=
  inside.toFinset.filter (fun s =>
    coverCode gs core (s ||| e) &&& core = s ∧
      m &&& coverCode gs core (s ||| e) = m)

theorem compatible_test_iff {n core s e m : ℕ} {gs : List ℕ}
    (hgs : ∀ g ∈ gs, g < 2 ^ n) (hcore : core < 2 ^ n)
    (hs : s < 2 ^ n) (hm : m < 2 ^ n)
    (hE : Disjoint (decode n e) (decode n core))
    (hS : decode n s ⊆ decode n core) (hM : decode n m ⊆ decode n e) :
    (coverCode gs core (s ||| e) &&& core = s ∧
      m &&& coverCode gs core (s ||| e) = m) ↔
      decode n s ∈ compatible (decodedGenerators n gs) (decode n core)
        (decode n e) (decode n m) := by
  let c := coverCode gs core (s ||| e)
  have hcover : decode n c =
      localPart (decodedGenerators n gs) (decode n core) (decode n s ∪ decode n e) := by
    simpa only [c, decode_or] using decode_coverCode n gs core (s ||| e) hgs
  have hinside : c &&& core = s ↔
      interior (decode n core)
        (localPart (decodedGenerators n gs) (decode n core) (decode n s ∪ decode n e)) =
          decode n s := by
    constructor
    · intro h
      have hd := congrArg (decode n) h
      simpa only [decode_and, hcover, interior] using hd
    · intro h
      apply decode_injOn n
        (Finset.mem_range.mpr (Nat.and_le_right.trans_lt hcore)) (Finset.mem_range.mpr hs)
      simpa only [decode_and, hcover, interior] using h
  have houtside : m &&& c = m ↔
      decode n m ⊆ exterior (decode n core)
        (localPart (decodedGenerators n gs) (decode n core) (decode n s ∪ decode n e)) := by
    rw [mask_subset_iff hm, hcover]
    constructor
    · intro h x hx
      exact Finset.mem_sdiff.mpr ⟨h hx, fun hxW =>
        Finset.disjoint_left.mp hE (hM hx) hxW⟩
    · intro h x hx
      exact (Finset.mem_sdiff.mp (h hx)).1
  rw [mem_compatible_iff_maximalCover hE]
  exact ⟨fun h => ⟨hS, hinside.mp h.1, houtside.mp h.2⟩,
    fun h => ⟨hinside.mpr h.2.1, houtside.mpr h.2.2⟩⟩

theorem compatibleCodes_decode {n core e m : ℕ} {gs inside : List ℕ}
    (hgs : ∀ g ∈ gs, g < 2 ^ n) (hcore : core < 2 ^ n)
    (hinside : ∀ s ∈ inside, s < 2 ^ n) (hm : m < 2 ^ n)
    (hcover : inside.toFinset.image (decode n) = (decode n core).powerset)
    (hE : Disjoint (decode n e) (decode n core))
    (hM : decode n m ⊆ decode n e) :
    (compatibleCodes gs core inside e m).image (decode n) =
      compatible (decodedGenerators n gs) (decode n core) (decode n e) (decode n m) := by
  ext S
  constructor
  · intro hS
    obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp hS
    obtain ⟨hsi, htest⟩ := Finset.mem_filter.mp hs
    have hsub : decode n s ⊆ decode n core := by
      apply Finset.mem_powerset.mp
      rw [← hcover]
      exact Finset.mem_image_of_mem (decode n) hsi
    exact (compatible_test_iff hgs hcore (hinside s (List.mem_toFinset.mp hsi))
      hm hE hsub hM).mp htest
  · intro hS
    have hsub := ((mem_compatible_iff_maximalCover hE).mp hS).1
    have himage : S ∈ inside.toFinset.image (decode n) := by
      rw [hcover]
      exact Finset.mem_powerset.mpr hsub
    obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp himage
    apply Finset.mem_image.mpr
    refine ⟨s, Finset.mem_filter.mpr ⟨hs, ?_⟩, rfl⟩
    exact (compatible_test_iff hgs hcore (hinside s (List.mem_toFinset.mp hs))
      hm hE hsub hM).mpr hS

def maskImbalance (n core : ℕ) (w : ℕ → ℕ) (s : ℕ) : ℤ :=
  ∑ i ∈ Finset.range n, if core.testBit i = true then
    (if s.testBit i = true then (w i : ℤ) else -(w i : ℤ)) else 0

theorem maskImbalance_eq (n core : ℕ) (w : ℕ → ℕ) (s : ℕ) :
    maskImbalance n core w s = integerImbalance (decode n core) w (decode n s) := by
  unfold maskImbalance integerImbalance
  change _ = ∑ i ∈ (Finset.range n).filter (fun i => core.testBit i = true),
    if i ∈ decode n s then (w i : ℤ) else -(w i : ℤ)
  rw [Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro i hi
  simp only [mem_decode, Finset.mem_range.mp hi, true_and]

/-- One maximal cover and one weight are cached for each pair (E,S). -/
def cachedRow (n core : ℕ) (gs inside : List ℕ) (w : ℕ → ℕ) (e : ℕ) :
    List (ℕ × ℕ × ℤ) :=
  inside.map (fun s => (s, coverCode gs core (s ||| e), maskImbalance n core w s))

def rowShare (core : ℕ) (row : List (ℕ × ℕ × ℤ)) (m : ℕ) : ℤ :=
  (row.map (fun a =>
    if a.2.1 &&& core = a.1 ∧ m &&& a.2.1 = m then a.2.2 else 0)).sum

theorem rowShare_eq (n core : ℕ) (gs inside : List ℕ) (w : ℕ → ℕ) (e m : ℕ)
    (hinside : inside.Nodup) :
    rowShare core (cachedRow n core gs inside w e) m =
      ∑ s ∈ compatibleCodes gs core inside e m, maskImbalance n core w s := by
  unfold rowShare cachedRow compatibleCodes
  simp only [List.map_map, Function.comp_def]
  rw [← List.sum_toFinset _ hinside, Finset.sum_filter]

theorem rowShare_compatible {n core e m : ℕ} {gs inside : List ℕ} (w : ℕ → ℕ)
    (hgs : ∀ g ∈ gs, g < 2 ^ n) (hcore : core < 2 ^ n)
    (hnodup : inside.Nodup) (hinside : ∀ s ∈ inside, s < 2 ^ n) (hm : m < 2 ^ n)
    (hcover : inside.toFinset.image (decode n) = (decode n core).powerset)
    (hE : Disjoint (decode n e) (decode n core))
    (hM : decode n m ⊆ decode n e) :
    rowShare core (cachedRow n core gs inside w e) m =
      ∑ S ∈ compatible (decodedGenerators n gs) (decode n core) (decode n e) (decode n m),
        integerImbalance (decode n core) w S := by
  rw [rowShare_eq n core gs inside w e m hnodup,
    ← compatibleCodes_decode hgs hcore hinside hm hcover hE hM]
  rw [Finset.sum_image]
  · apply Finset.sum_congr rfl
    intro s _
    exact maskImbalance_eq n core w s
  · intro a ha b hb hab
    exact decode_injOn n
      (Finset.mem_range.mpr (hinside a (List.mem_toFinset.mp (Finset.mem_filter.mp ha).1)))
      (Finset.mem_range.mpr (hinside b (List.mem_toFinset.mp (Finset.mem_filter.mp hb).1))) hab

/-- Coverage is checked on the actual inside and boundary sets. -/
abbrev ValidDomains (n : ℕ) (gs : List ℕ) (core : ℕ) (inside outside : List ℕ) : Prop :=
  core < 2 ^ n ∧
    (∀ g ∈ gs, g < 2 ^ n) ∧ inside.Nodup ∧
    (∀ s ∈ inside, s < 2 ^ n) ∧ (∀ e ∈ outside, e < 2 ^ n) ∧
    inside.toFinset.image (decode n) = (decode n core).powerset ∧
    outside.toFinset.image (decode n) =
      (boundary (decodedGenerators n gs) (decode n core)).powerset

def check (n : ℕ) (gs : List ℕ) (core : ℕ) (inside outside : List ℕ)
    (w : ℕ → ℕ) : Bool :=
  decide (∃ x ∈ decode n core, 0 < w x) &&
    outside.all (fun e =>
      let row := cachedRow n core gs inside w e
      outside.all (fun m =>
        if m &&& e = m then decide (0 ≤ rowShare core row m) else true))

def fullCheck (n : ℕ) (gs : List ℕ) (core : ℕ) (inside outside : List ℕ)
    (w : ℕ → ℕ) : Bool :=
  decide (ValidDomains n gs core inside outside) && check n gs core inside outside w

theorem check_certificateCheck {n core : ℕ} {gs inside outside : List ℕ} {w : ℕ → ℕ}
    (hd : ValidDomains n gs core inside outside)
    (hc : check n gs core inside outside w = true) :
    certificateCheck (decodedGenerators n gs) (decode n core) w = true := by
  obtain ⟨hcore, hgs, hnodup, hinside, houtside, hinsideCover, houtsideCover⟩ := hd
  obtain ⟨hpositive, hrows⟩ := Bool.and_eq_true_iff.mp hc
  apply Bool.and_eq_true_iff.mpr
  refine ⟨hpositive, decide_eq_true ?_⟩
  intro E hE M hM
  have hEB := Finset.mem_powerset.mp hE
  have hME := Finset.mem_powerset.mp hM
  have hMB := Finset.Subset.trans hME hEB
  have hEi : E ∈ outside.toFinset.image (decode n) := by
    rw [houtsideCover]
    exact hE
  have hMi : M ∈ outside.toFinset.image (decode n) := by
    rw [houtsideCover]
    exact Finset.mem_powerset.mpr hMB
  obtain ⟨e, he, rfl⟩ := Finset.mem_image.mp hEi
  obtain ⟨m, hm, rfl⟩ := Finset.mem_image.mp hMi
  have he' := List.mem_toFinset.mp he
  have hm' := List.mem_toFinset.mp hm
  have hraw : m &&& e = m := (mask_subset_iff (houtside m hm') e).mpr hME
  have hrow := List.all_eq_true.mp (List.all_eq_true.mp hrows e he') m hm'
  change (if m &&& e = m then
    decide (0 ≤ rowShare core (cachedRow n core gs inside w e) m) else true) = true at hrow
  rw [ite_eq_left hraw] at hrow
  have hnonnegative := of_decide_eq_true hrow
  have hdis : Disjoint (decode n e) (decode n core) :=
    (boundary_disjoint_window (decodedGenerators n gs) (decode n core)).mono_left hEB
  rw [rowShare_compatible w hgs hcore hnodup hinside (houtside m hm')
    hinsideCover hdis hME] at hnonnegative
  exact hnonnegative

theorem check_weightCertificate {n core : ℕ} {gs inside outside : List ℕ} {w : ℕ → ℕ}
    (hd : ValidDomains n gs core inside outside)
    (hc : check n gs core inside outside w = true) :
    WeightCertificate (decodedGenerators n gs) (decode n core) (fun x => (w x : ℝ)) :=
  certificateCheck_weightCertificate (check_certificateCheck hd hc)

theorem check_abundance {n core : ℕ} {gs inside outside : List ℕ} {w : ℕ → ℕ}
    (hd : ValidDomains n gs core inside outside)
    (hc : check n gs core inside outside w = true) :
    ∃ x ∈ decode n core, Abundant (family (decodedGenerators n gs)) x :=
  certificateCheck_abundance (check_certificateCheck hd hc)

theorem fullCheck_weightCertificate {n core : ℕ} {gs inside outside : List ℕ} {w : ℕ → ℕ}
    (hc : fullCheck n gs core inside outside w = true) :
    WeightCertificate (decodedGenerators n gs) (decode n core) (fun x => (w x : ℝ)) :=
  check_weightCertificate (of_decide_eq_true (Bool.and_eq_true_iff.mp hc).1)
    (Bool.and_eq_true_iff.mp hc).2

theorem fullCheck_abundance {n core : ℕ} {gs inside outside : List ℕ} {w : ℕ → ℕ}
    (hc : fullCheck n gs core inside outside w = true) :
    ∃ x ∈ decode n core, Abundant (family (decodedGenerators n gs)) x :=
  check_abundance (of_decide_eq_true (Bool.and_eq_true_iff.mp hc).1)
    (Bool.and_eq_true_iff.mp hc).2

end FranklLocal.Mask
