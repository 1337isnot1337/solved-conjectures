module

public import Conjectures.FranklLocalMaskCertificate

/-! Generic exact domains for the local mask checker.

Construction filters the 2^n bounded masks once. The resulting list has
exactly 2^|W| entries for the decoded support W, and the checker subsequently
visits only those entries. Coverage and distinctness are proved for every n.
-/
@[expose] public section

namespace FranklLocal.Mask

open Frankl.FC.BitCode FranklSmallCyclic

/-- All bounded submasks, listed once each in increasing order. -/
def submasks (n a : ℕ) : List ℕ :=
  (List.range (2 ^ n)).filter (fun b => decide (b &&& a = b))

@[simp] theorem mem_submasks {n a b : ℕ} :
    b ∈ submasks n a ↔ b < 2 ^ n ∧ b &&& a = b := by
  simp [submasks]

theorem submasks_bounded {n a b : ℕ} (hb : b ∈ submasks n a) : b < 2 ^ n :=
  (mem_submasks.mp hb).1

theorem submasks_nodup (n a : ℕ) : (submasks n a).Nodup := by
  exact List.Nodup.filter _ List.nodup_range

theorem submasks_decode (n a : ℕ) :
    (submasks n a).toFinset.image (decode n) = (decode n a).powerset := by
  ext S
  constructor
  · intro hS
    obtain ⟨b, hb, rfl⟩ := Finset.mem_image.mp hS
    obtain ⟨hbound, hsub⟩ := mem_submasks.mp (List.mem_toFinset.mp hb)
    exact Finset.mem_powerset.mpr ((mask_subset_iff hbound a).mp hsub)
  · intro hS
    have hsub := Finset.mem_powerset.mp hS
    have hSr : S ⊆ Finset.range n := hsub.trans (decode_subset n a)
    have hSi : S ∈ (domain n).image (decode n) := by
      rw [image_domain]
      exact Finset.mem_powerset.mpr hSr
    obtain ⟨b, hb, hdecode⟩ := Finset.mem_image.mp hSi
    refine Finset.mem_image.mpr ⟨b, List.mem_toFinset.mpr ?_, hdecode⟩
    apply mem_submasks.mpr
    refine ⟨Finset.mem_range.mp hb, (mask_subset_iff (Finset.mem_range.mp hb) a).mpr ?_⟩
    simpa only [hdecode] using hsub

/-- A bounded finite set has a mask whose submask list decodes to its powerset. -/
theorem exists_submasks_decode {n : ℕ} {W : Finset ℕ}
    (hW : W ⊆ Finset.range n) :
    ∃ a < 2 ^ n, decode n a = W ∧
      (submasks n a).toFinset.image (decode n) = W.powerset := by
  have hWi : W ∈ (domain n).image (decode n) := by
    rw [image_domain]
    exact Finset.mem_powerset.mpr hW
  obtain ⟨a, ha, hdecode⟩ := Finset.mem_image.mp hWi
  refine ⟨a, Finset.mem_range.mp ha, hdecode, ?_⟩
  rw [submasks_decode, hdecode]

theorem submasks_decode_injOn (n a : ℕ) :
    Set.InjOn (decode n) ((submasks n a).toFinset : Set ℕ) := by
  intro b hb c hc hbc
  exact decode_injOn n
    (Finset.mem_range.mpr (submasks_bounded (List.mem_toFinset.mp hb)))
    (Finset.mem_range.mpr (submasks_bounded (List.mem_toFinset.mp hc))) hbc

theorem submasks_length (n a : ℕ) :
    (submasks n a).length = 2 ^ (decode n a).card := by
  calc
    (submasks n a).length = (submasks n a).toFinset.card :=
      (List.toFinset_card_of_nodup (submasks_nodup n a)).symm
    _ = ((submasks n a).toFinset.image (decode n)).card :=
      (Finset.card_image_of_injOn (submasks_decode_injOn n a)).symm
    _ = 2 ^ (decode n a).card := by rw [submasks_decode, Finset.card_powerset]

theorem decode_xor_and (n a b : ℕ) :
    decode n (a ^^^ (a &&& b)) = decode n a \ decode n b := by
  ext i
  simp only [mem_decode, Finset.mem_sdiff, Nat.testBit_xor, Nat.testBit_and]
  cases a.testBit i <;> cases b.testBit i <;> simp

/-- The actual local boundary, computed without decoding the generator family. -/
def boundaryCode (gs : List ℕ) (core : ℕ) : ℕ :=
  let t := maskUnion (localCodes gs core)
  t ^^^ (t &&& core)

theorem decode_boundaryCode (n : ℕ) (gs : List ℕ) (core : ℕ)
    (hgs : ∀ g ∈ gs, g < 2 ^ n) :
    decode n (boundaryCode gs core) =
      boundary (decodedGenerators n gs) (decode n core) := by
  unfold boundaryCode
  rw [decode_xor_and, decode_maskUnion, decoded_localCodes n gs core hgs]
  rfl

/-- Generic domain validation requires only the point-code bounds. It does not
recompute either finite powerset or its decoded image for each certificate. -/
theorem validDomains_submasks {n core : ℕ} {gs : List ℕ}
    (hcore : core < 2 ^ n) (hgs : ∀ g ∈ gs, g < 2 ^ n) :
    ValidDomains n gs core (submasks n core) (submasks n (boundaryCode gs core)) := by
  refine ⟨hcore, hgs, submasks_nodup n core, ?_, ?_, submasks_decode n core, ?_⟩
  · exact fun _ hb => submasks_bounded hb
  · exact fun _ hb => submasks_bounded hb
  · rw [submasks_decode, decode_boundaryCode n gs core hgs]

/-- Literal domain lists can use the generic proof after two list identities. -/
theorem validDomains_of_submasks {n core : ℕ} {gs inside outside : List ℕ}
    (hcore : core < 2 ^ n) (hgs : ∀ g ∈ gs, g < 2 ^ n)
    (hinside : inside = submasks n core)
    (houtside : outside = submasks n (boundaryCode gs core)) :
    ValidDomains n gs core inside outside := by
  rw [hinside, houtside]
  exact validDomains_submasks hcore hgs

theorem outside_submasks_length (n : ℕ) (gs : List ℕ) (core : ℕ)
    (hgs : ∀ g ∈ gs, g < 2 ^ n) :
    (submasks n (boundaryCode gs core)).length =
      2 ^ (boundary (decodedGenerators n gs) (decode n core)).card := by
  rw [submasks_length, decode_boundaryCode n gs core hgs]

end FranklLocal.Mask
