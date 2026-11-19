import Conjectures.LonelinessModularCoverSearch
import Conjectures.LonelinessFourSpeedCertificate
import Conjectures.LonelinessModularStrictWitness

/-! Initial prime coverage for the closed ten-speed threshold. Numerical
support-search certificates remain explicit inputs. The endpoint normalizes
arbitrary lists, permits repeated folded residues, and retains the full
minimum-pair range. It does not replace the prime-avoidance hypothesis. -/

namespace Loneliness.Modular.TenSpeed.Initial

open FourSpeed

def times (m : ℕ) : Finset ℕ := Finset.Icc 1 (m/2)

def badTimes (m a : ℕ) : Finset ℕ :=
  (times m).filter (fun t => 11*folded m (t*a)<m)

def pairCompatible (m : ℕ) (inv : ℕ → ℕ) (b x y : ℕ) : Bool :=
  decide (b≤folded m (inv x*y) ∧ b≤folded m (inv y*x))

def selected (b : ℕ) : Finset ℕ := {1,b}

def available (m : ℕ) (inv : ℕ → ℕ) (b : ℕ) : Finset ℕ :=
  (Finset.Icc (b+1) (m/2)).filter (fun a =>
    pairCompatible m inv b 1 a=true ∧ pairCompatible m inv b b a=true)

def uncovered (m b : ℕ) : Finset ℕ :=
  times m \ (selected b).biUnion (badTimes m)

private theorem singleton_grid_witness (m : ℕ) (hm : 2≤m) :
    HasRationalWitness 1 11 m [1] := by
  refine ⟨m/2,?_⟩
  intro d hd
  have hd1 : d=1 := by simpa only [List.mem_singleton] using hd
  subst d
  change 1*m≤11*folded m (m/2*1)
  rw [Nat.one_mul,Nat.mul_one,folded_eq_self (by omega : 2*(m/2)≤m)]
  omega

private theorem covers_times_of_no_witness (m : ℕ) (s : Finset ℕ)
    (hnow : ¬HasRationalWitness 1 11 m (s.sort (·≤·))) :
    times m⊆s.biUnion (badTimes m) := by
  intro t ht
  by_contra hcov
  apply hnow
  refine ⟨t,?_⟩
  intro a ha
  have has : a∈s := (Finset.mem_sort (·≤·)).mp ha
  have hle : m≤11*folded m (t*a) := by
    by_contra h
    apply hcov
    exact Finset.mem_biUnion.mpr ⟨a,has,Finset.mem_filter.mpr ⟨ht,by omega⟩⟩
  simpa only [Nat.one_mul] using hle

/-- A low-value list with no zero residue has a minimum-pair-normalized
support covering every allowed time. Singleton supports are excluded by a
checked modular witness, rather than by an assumption about distinctness. -/
theorem closed_support_normalization (m : ℕ) (hm : 2≤m)
    (hgrid : ¬11∣m) (inv : ℕ → ℕ)
    (hinv : ∀ a, 0<a → 2*a≤m → (a*inv a)%m=1%m)
    (ds : List ℕ) (hne : ds≠[]) (hmod : ∀ d∈ds, d%m≠0)
    (hlow : value ds≤(1/11:ℝ)) :
    ∃ u v : ℕ, (u*v)%m=1%m ∧
      let s := foldedSupport m u (residueSupport m ds)
      FoldedSupport m s ∧ 2≤s.card ∧ s.card≤ds.length ∧ 1∈s ∧
        PairNormalized m inv s ∧ times m⊆s.biUnion (badTimes m) := by
  have hmpos : 0<m := by omega
  let original := residueSupport m ds
  have horiginal : FoldedSupport m original := residueSupport_valid hmpos ds hmod
  have hpos : 0<original.card := residueSupport_card_pos (m:=m) hne
  obtain ⟨u,v,hunit,hmem⟩ := coveredSupports_complete hm hpos inv hinv
    original horiginal rfl
  let s := foldedSupport m u original
  have hs : FoldedSupport m s := foldedSupport_valid hmpos hunit horiginal
  have hcard : s.card=original.card := foldedSupport_card hmpos hunit horiginal
  have hstructure : 1∈s ∧ (original.card=1 ∨ PairNormalized m inv s) := by
    by_cases hsingle : original.card=1
    · have hb : s∈boundedSupports m original.card := by
        simpa only [coveredSupports,hsingle,ite_true] using hmem
      exact ⟨(mem_boundedSupports_iff.mp hb).2.2,Or.inl hsingle⟩
    · have hb : s∈normalizedSupports m original.card inv := by
        simpa only [coveredSupports,if_neg hsingle] using hmem
      have hh := mem_normalizedSupports_iff.mp hb
      exact ⟨hh.2.2.1,Or.inr hh.2.2.2⟩
  have hnow : ¬HasRationalWitness 1 11 m (s.sort (·≤·)) := by
    intro hw
    have hwds := transformed_support_witness hmpos hunit ds hw
    have hv := hasRationalWitness_value_strict_of_nondvd
      (by decide : 0<11) (by decide : 2*1<11) hmpos
      (by simpa only [Nat.one_mul] using hgrid : ¬11∣1*m) hwds
    have hv' : (1/11:ℝ)<value ds := by simpa using hv
    exact (not_lt_of_ge hlow) hv'
  have hcardtwo : 2≤s.card := by
    by_contra h
    have hcardone : s.card=1 := by omega
    obtain ⟨a,ha⟩ := Finset.card_eq_one.mp hcardone
    have ha1 : a=1 := by
      have hh := hstructure.1
      rw [ha,Finset.mem_singleton] at hh
      exact hh.symm
    have heq : s={1} := by simpa only [ha1] using ha
    apply hnow
    simpa [heq] using singleton_grid_witness m hm
  have hpair : PairNormalized m inv s := hstructure.2.resolve_left (by omega)
  refine ⟨u,v,hunit,hs,hcardtwo,?_,hstructure.1,hpair,?_⟩
  · rw [hcard]
    exact residueSupport_card_le m ds
  · exact covers_times_of_no_witness m s hnow

/-- Soundness of a single minimum-pair support-search certificate. The
remaining eight slots include every smaller support as well as size ten. -/
theorem checked_normalized_support (m : ℕ) (inv : ℕ → ℕ) (b : ℕ)
    (terminal : Finset ℕ → ℕ → Bool) (conclusion : Finset ℕ → Prop)
    (hterminal : ∀ s index, terminal s index=true → conclusion s)
    (tree : SupportSearch.Tree)
    (hcheck : SupportSearch.check (badTimes m) (pairCompatible m inv b) terminal tree
      (selected b) (available m inv b) (uncovered m b) 8=true)
    (s : Finset ℕ) (hs : FoldedSupport m s) (hcard : s.card≤10)
    (hone : 1∈s) (hb : b∈s) (hb2 : 2≤b)
    (hmin : ∀ a∈s, a≠1 → b≤a)
    (hpair : ∀ a∈s, ∀ c∈s, a≠c → b≤folded m (inv a*c))
    (hcover : times m⊆s.biUnion (badTimes m)) : conclusion s := by
  have hselected : selected b⊆s := by
    intro a ha
    rcases Finset.mem_insert.mp ha with rfl | ha
    · exact hone
    · have ha' : a=b := Finset.mem_singleton.mp ha
      simpa only [ha'] using hb
  have hcompatible : SupportSearch.Compatible (pairCompatible m inv b) s := by
    intro a ha c hc hne
    apply decide_eq_true
    exact ⟨hpair a ha c hc hne,hpair c hc a ha (Ne.symm hne)⟩
  have hsub : s \ selected b ⊆ available m inv b := by
    intro a ha
    obtain ⟨has,han⟩ := Finset.mem_sdiff.mp ha
    have ha1 : a≠1 := by intro h; subst a; exact han (by simp [selected])
    have hab : a≠b := by intro h; subst a; exact han (by simp [selected])
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_Icc.mpr ⟨?_,?_⟩,?_,?_⟩
    · have hh := hmin a has ha1
      omega
    · have hh := (hs a has).2
      omega
    · exact hcompatible 1 hone a has (Ne.symm ha1)
    · exact hcompatible b hb a has (Ne.symm hab)
  have hselectedcard : (selected b).card=2 := by
    simp [selected,show (1:ℕ)≠b by omega]
  have hremainingcard : (s \ selected b).card≤8 := by
    rw [Finset.card_sdiff_of_subset hselected,hselectedcard]
    omega
  have hremainingcover : uncovered m b ⊆ (s \ selected b).biUnion (badTimes m) := by
    intro t ht
    obtain ⟨htt,hts⟩ := Finset.mem_sdiff.mp ht
    obtain ⟨a,ha,hat⟩ := Finset.mem_biUnion.mp (hcover htt)
    have han : a∉selected b := by
      intro h
      exact hts (Finset.mem_biUnion.mpr ⟨a,h,hat⟩)
    exact Finset.mem_biUnion.mpr ⟨a,Finset.mem_sdiff.mpr ⟨ha,han⟩,hat⟩
  exact SupportSearch.checked_target (badTimes m) (pairCompatible m inv b)
    terminal conclusion hterminal tree (selected b) (available m inv b)
    (uncovered m b) s 8 hcheck hselected hsub hremainingcard hremainingcover hcompatible

/-- The finite table obligation ranges over every possible minimum pair.
No numerical upper bound on `b` other than the folded interval is assumed. -/
theorem checked_initial_cover (m : ℕ) (hm : 2≤m) (hgrid : ¬11∣m)
    (inv : ℕ → ℕ) (hinv : ∀ a, 0<a → 2*a≤m → (a*inv a)%m=1%m)
    (terminal : Finset ℕ → ℕ → Bool) (conclusion : Finset ℕ → Prop)
    (hterminal : ∀ s index, terminal s index=true → conclusion s)
    (trees : ℕ → SupportSearch.Tree)
    (hcheck : ∀ b, 2≤b → 2*b≤m →
      SupportSearch.check (badTimes m) (pairCompatible m inv b) terminal (trees b)
        (selected b) (available m inv b) (uncovered m b) 8=true)
    (ds : List ℕ) (hlen : ds.length=10) (hmod : ∀ d∈ds, d%m≠0)
    (hlow : value ds≤(1/11:ℝ)) :
    ∃ u v : ℕ, (u*v)%m=1%m ∧ conclusion (foldedSupport m u (residueSupport m ds)) := by
  have hne : ds≠[] := by
    intro h
    have hh := congrArg List.length h
    simp only [List.length_nil] at hh
    omega
  obtain ⟨u,v,hunit,hs,_hcardtwo,hcard,h1,hpair,hcover⟩ :=
    closed_support_normalization m hm hgrid inv hinv ds hne hmod hlow
  obtain ⟨b,hb,hb2,hmin,hpair⟩ := hpair
  refine ⟨u,v,hunit,?_⟩
  exact checked_normalized_support m inv b terminal conclusion hterminal (trees b)
    (hcheck b hb2 (hs b hb).2) _ hs (by omega) h1 hb hb2 hmin hpair hcover

end Loneliness.Modular.TenSpeed.Initial
