module
public import Conjectures.CyrusianKaplanBaselineCount
public import Conjectures.CyrusianKaplanCorrectionSupport
public import Conjectures.CyrusianKaplanTupleLattice
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan
open Finset Set

theorem baselinePairs_mem_iff {g r : ℕ} (hr : 1≤r) (A B : Finset ℕ) :
    (A,B)∈baselinePairs g r ↔ A.card=r ∧ B.card=r ∧
      (∀ b∈B,g<b+b ∧ b≤g) ∧ (∀ a∈A,g<a ∧ ∀ b∈B,a≤g+b) := by
  constructor
  · intro h
    obtain ⟨⟨t,C,D⟩,hRow,he⟩ := Finset.mem_image.mp h
    have eA : C=A := congrArg Prod.fst he
    have eB : insert t D=B := congrArg Prod.snd he
    have ht : g/2<t ∧ t≤g := Finset.mem_Ioc.mp (Finset.mem_sigma.mp hRow).1
    obtain ⟨hc,hd⟩ := Finset.mem_product.mp (Finset.mem_sigma.mp hRow).2
    obtain ⟨hcS,hcCard⟩ := Finset.mem_powersetCard.mp hc
    obtain ⟨hdS,hdCard⟩ := Finset.mem_powersetCard.mp hd
    have hNt : t∉D := fun h => lt_irrefl _ (Finset.mem_Ioc.mp (hdS h)).1
    subst A
    subst B
    have hCard : (insert t D).card=r := by
      rw [Finset.card_insert_of_notMem hNt,hdCard]
      omega
    have hRange (b : ℕ) (hb : b∈insert t D) : t≤b ∧ b≤g := by
      rcases Finset.mem_insert.mp hb with h|h
      · subst b; exact ⟨le_rfl,ht.2⟩
      · have he := Finset.mem_Ioc.mp (hdS h)
        exact ⟨he.1.le,he.2⟩
    refine ⟨hcCard,hCard,?_,?_⟩
    · intro b hb
      have := hRange b hb
      omega
    · intro a ha
      have ha' := Finset.mem_Ioc.mp (hcS ha)
      exact ⟨ha'.1,fun b hb => ha'.2.trans (Nat.add_le_add_left (hRange b hb).1 g)⟩
  · rintro ⟨hA,hB,hLow,hHigh⟩
    have hbn : B.Nonempty := Finset.card_pos.mp (by omega)
    let t := B.min' hbn
    have ht : t∈B := Finset.min'_mem _ _
    have hb := hLow t ht
    let D := B.erase t
    have hd : D.card=r-1 := by rw [Finset.card_erase_of_mem ht,hB]
    have hD : D⊆Finset.Ioc t g := by
      intro b hb'
      have h := Finset.mem_erase.mp hb'
      exact Finset.mem_Ioc.mpr ⟨lt_of_le_of_ne (Finset.min'_le _ _ h.2) h.1.symm,
        (hLow b h.2).2⟩
    have hC : A⊆Finset.Ioc g (g+t) := by
      intro a ha
      exact Finset.mem_Ioc.mpr ⟨(hHigh a ha).1,(hHigh a ha).2 t ht⟩
    refine Finset.mem_image.mpr ⟨⟨t,A,D⟩,?_,?_⟩
    · have htCut : g/2<t := by omega
      apply Finset.mem_sigma.mpr
      exact ⟨Finset.mem_Ioc.mpr ⟨htCut,hb.2⟩,Finset.mem_product.mpr
        ⟨Finset.mem_powersetCard.mpr ⟨hC,hA⟩,Finset.mem_powersetCard.mpr ⟨hD,hd⟩⟩⟩
    · exact Prod.ext rfl (Finset.insert_erase ht)

/-- Check directly that the sorted natural coordinates enumerate
exactly the baseline row construction, including the upper boundary. -/
theorem natTupleCast_mem_baseline_iff {g r : ℕ} (hr : 1≤r) (a b : Fin r→ℕ) :
    natTupleCast r (a,b)∈baselineTupleRegion r (g:ℝ) ↔ StrictMono a ∧ StrictMono b ∧
      (indexedFinset a,indexedFinset b)∈baselinePairs g r := by
  rw [baselinePairs_mem_iff hr]
  change (StrictMono (fun i => (a i:ℝ)) ∧ StrictMono (fun i => (b i:ℝ)) ∧
      (∀ i,(g:ℝ)<(a i:ℝ) ∧ (a i:ℝ)≤2*(g:ℝ)) ∧ (∀ i,0<(b i:ℝ) ∧ (b i:ℝ)≤(g:ℝ)) ∧
      (∀ i,(g:ℝ)<(b i:ℝ)+(b i:ℝ)) ∧ ∀ i j,(a i:ℝ)-(b j:ℝ)≤(g:ℝ)) ↔ _
  constructor
  · rintro ⟨ha,hb,hA,hB,hLo,hHi⟩
    have ha' : StrictMono a := fun i j hij => Nat.cast_lt.mp (ha hij)
    have hb' : StrictMono b := fun i j hij => Nat.cast_lt.mp (hb hij)
    refine ⟨ha',hb',card_indexedFinset _ ha',card_indexedFinset _ hb',?_,?_⟩
    · rw [forall_indexedFinset_iff]
      intro i
      exact ⟨by exact_mod_cast hLo i,by exact_mod_cast (hB i).2⟩
    · rw [forall_indexedFinset_iff]
      intro i
      refine ⟨by exact_mod_cast (hA i).1,?_⟩
      rw [forall_indexedFinset_iff]
      intro j
      have he : (a i:ℝ)≤(g:ℝ)+(b j:ℝ) := by linarith [hHi i j]
      exact_mod_cast he
  · rintro ⟨ha,hb,_,_,hLow,hHigh⟩
    rw [forall_indexedFinset_iff] at hLow hHigh
    have hD (i j : Fin r) : (a i:ℝ)≤(g:ℝ)+(b j:ℝ) := by
      have h := (forall_indexedFinset_iff b _).mp (hHigh i).2 j
      exact_mod_cast h
    have hBg (j : Fin r) : (b j:ℝ)≤(g:ℝ) := by exact_mod_cast (hLow j).2
    let zero : Fin r := ⟨0,Nat.lt_of_lt_of_le Nat.zero_lt_one hr⟩
    refine ⟨(fun i j h => Nat.cast_lt.mpr (ha h)),(fun i j h => Nat.cast_lt.mpr (hb h)),?_,?_,?_,?_⟩
    · intro i
      exact ⟨by exact_mod_cast (hHigh i).1,by linarith [hD i zero,hBg zero]⟩
    · intro i
      exact ⟨by exact_mod_cast (show 0<b i by have := (hLow i).1; omega),hBg i⟩
    · intro i
      exact_mod_cast (hLow i).1
    · intro i j
      linarith [hD i j]

end CyrusianKaplan
