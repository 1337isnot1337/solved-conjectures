module

public import Conjectures.FranklFC
public import Conjectures.FranklShareFlow

@[expose] public section

/-! Finite encodings of the subset domain preserve extension-share
certificates. The checker may use an efficient code type and integer share
function; all decoding, closure, and share identities are explicit premises.
-/

namespace Frankl.FC

open scoped BigOperators

variable {κ α : Type*} [DecidableEq α]

def pullDomainFamily (D : Finset κ) (decode : κ → Finset α)
    (family : Finset (Finset α)) : Finset κ :=
  D.filter (fun a => decode a ∈ family)

theorem mem_pullDomainFamily {D : Finset κ} {decode : κ → Finset α}
    {family : Finset (Finset α)} {a : κ} :
    a ∈ pullDomainFamily D decode family ↔ a ∈ D ∧ decode a ∈ family :=
  Finset.mem_filter

theorem pullDomainFamily_subset (D : Finset κ) (decode : κ → Finset α)
    (family : Finset (Finset α)) : pullDomainFamily D decode family ⊆ D :=
  Finset.filter_subset _ _

theorem image_pullDomainFamily {D : Finset κ} {decode : κ → Finset α}
    {family : Finset (Finset α)} (hf : family ⊆ D.image decode) :
    (pullDomainFamily D decode family).image decode = family := by
  ext S
  constructor
  · intro hS
    obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp hS
    exact (mem_pullDomainFamily.mp ha).2
  · intro hS
    obtain ⟨a, ha, hdecode⟩ := Finset.mem_image.mp (hf hS)
    apply Finset.mem_image.mpr
    exact ⟨a, mem_pullDomainFamily.mpr ⟨ha, hdecode.symm ▸ hS⟩, hdecode⟩

theorem pullDomainFamily_closedFor {D codedBase : Finset κ}
    {decode : κ → Finset α} {join : κ → κ → κ}
    {base family : Finset (Finset α)}
    (hjoin : ∀ a ∈ D, ∀ b ∈ D, join a b ∈ D)
    (hdecode : ∀ a ∈ D, ∀ b ∈ D, decode (join a b) = decode a ∪ decode b)
    (hbaseD : codedBase ⊆ D) (hbase : codedBase.image decode = base)
    (hc : ShareSearch.ClosedFor (fun A B => A ∪ B) base family) :
    ShareSearch.ClosedFor join codedBase (pullDomainFamily D decode family) := by
  constructor
  · intro a ha b hb
    obtain ⟨haD, haf⟩ := mem_pullDomainFamily.mp ha
    obtain ⟨hbD, hbf⟩ := mem_pullDomainFamily.mp hb
    apply mem_pullDomainFamily.mpr
    refine ⟨hjoin a haD b hbD, ?_⟩
    rw [hdecode a haD b hbD]
    exact hc.1 (decode a) haf (decode b) hbf
  · intro a ha b hb
    obtain ⟨haD, haf⟩ := mem_pullDomainFamily.mp ha
    have hbD := hbaseD hb
    have hbb : decode b ∈ base := by
      rw [← hbase]
      exact Finset.mem_image_of_mem decode hb
    apply mem_pullDomainFamily.mpr
    refine ⟨hjoin a haD b hbD, ?_⟩
    rw [hdecode a haD b hbD]
    exact hc.2 (decode a) haf (decode b) hbb

theorem sum_pullDomainFamily {D : Finset κ} {decode : κ → Finset α}
    {family : Finset (Finset α)} {codedShare : κ → ℤ}
    {patternShare : Finset α → ℤ}
    (hinj : Set.InjOn decode D) (hf : family ⊆ D.image decode)
    (hshare : ∀ a ∈ D, codedShare a = patternShare (decode a)) :
    (∑ a ∈ pullDomainFamily D decode family, codedShare a) =
      ∑ S ∈ family, patternShare S := by
  calc
    (∑ a ∈ pullDomainFamily D decode family, codedShare a) =
        ∑ a ∈ pullDomainFamily D decode family, patternShare (decode a) := by
      apply Finset.sum_congr rfl
      intro a ha
      exact hshare a (pullDomainFamily_subset D decode family ha)
    _ = ∑ S ∈ (pullDomainFamily D decode family).image decode, patternShare S := by
      symm
      apply Finset.sum_image
      intro a ha b hb hab
      exact hinj (pullDomainFamily_subset D decode family ha)
        (pullDomainFamily_subset D decode family hb) hab
    _ = ∑ S ∈ family, patternShare S := by rw [image_pullDomainFamily hf]

/-- Transfer a nonnegative-share statement on a finite code domain to
the actual subsets of the finite ground. -/
theorem extension_shares_of_finite_domain {D codedBase : Finset κ}
    {decode : κ → Finset α} {join : κ → κ → κ}
    {W : Finset α} {base : Finset (Finset α)} {w : α → ℕ}
    {codedShare : κ → ℤ}
    (hinj : Set.InjOn decode D) (himage : D.image decode = W.powerset)
    (hjoin : ∀ a ∈ D, ∀ b ∈ D, join a b ∈ D)
    (hdecode : ∀ a ∈ D, ∀ b ∈ D, decode (join a b) = decode a ∪ decode b)
    (hbaseD : codedBase ⊆ D) (hbase : codedBase.image decode = base)
    (hshare : ∀ a ∈ D, codedShare a = share W w (decode a))
    (htest : ∀ C : Finset κ, C ⊆ D → ShareSearch.ClosedFor join codedBase C →
      0 ≤ ∑ a ∈ C, codedShare a)
    (family : Finset (Finset α)) (hf : family ⊆ W.powerset)
    (hc : ShareSearch.ClosedFor (fun A B => A ∪ B) base family) :
    0 ≤ ∑ S ∈ family, share W w S := by
  have hf' : family ⊆ D.image decode := by simpa only [himage] using hf
  have hp := pullDomainFamily_closedFor hjoin hdecode hbaseD hbase hc
  have h := htest (pullDomainFamily D decode family)
    (pullDomainFamily_subset D decode family) hp
  rwa [sum_pullDomainFamily hinj hf' hshare] at h

variable [DecidableEq κ]

/-- A checked share-flow certificate over finite codes proves the required
extension-share inequality for families of actual subsets. -/
theorem extension_shares_of_finite_domain_certificate {D codedBase : Finset κ}
    {decode : κ → Finset α} {join : κ → κ → κ}
    {W : Finset α} {base : Finset (Finset α)} {w : α → ℕ}
    {codedShare : κ → ℤ}
    (hinj : Set.InjOn decode D) (himage : D.image decode = W.powerset)
    (hjoin : ∀ a ∈ D, ∀ b ∈ D, join a b ∈ D)
    (hdecode : ∀ a ∈ D, ∀ b ∈ D, decode (join a b) = decode a ∪ decode b)
    (hbaseD : codedBase ⊆ D) (hbase : codedBase.image decode = base)
    (hshare : ∀ a ∈ D, codedShare a = share W w (decode a))
    (certificate : ShareFlow.Certificate κ)
    (hchecked : ShareFlow.check join codedBase D codedShare ∅ ∅ certificate = true)
    (family : Finset (Finset α)) (hf : family ⊆ W.powerset)
    (hc : ShareSearch.ClosedFor (fun A B => A ∪ B) base family) :
    0 ≤ ∑ S ∈ family, share W w S := by
  exact extension_shares_of_finite_domain hinj himage hjoin hdecode hbaseD hbase hshare
    (fun C hC hclosed => ShareFlow.certificate_nonnegative certificate hchecked hclosed hC)
    family hf hc

end Frankl.FC
