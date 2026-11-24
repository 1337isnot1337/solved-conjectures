import Conjectures.MaTangCoreCoupling

/-!
# Ma–Tang's random subset-sum threshold conjecture

Finite probability transfer for the mixed binary/ternary group, with
independent sampling of its elements (repetitions allowed).
-/
namespace MaTangCoreLowerBound
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear
open MaTangCoreEncoding MaTangCoreFactor MaTangCoreMultiplicity MaTangCoreCoupling
open MaTangCoreDecay

theorem covered_sub (d k : Nat) (s : QuotientSample) (h : s ∈ coveredSamples d k) :
    s ∈ quotientSamples d k := ((coveredSamples_mem d k s).mp h).1

theorem singleton_sub (r k : Nat) (w : List Raw) (h : w ∈ singletonGenerators r k) :
    w ∈ generatorSamples r k := ((singletonGenerators_mem r k w).mp h).1

theorem leftIncidence_sub (d r k : Nat) (ss tt : List QuotientSample)
    (h : ∀ s ∈ ss, s ∈ tt) (p : QuotientSample × List Nat)
    (hp : p ∈ leftIncidence d r k ss) : p ∈ leftIncidence d r k tt := by
  obtain ⟨hs,he⟩ := (taggedFibers_mem _ _ p).mp hp
  exact (taggedFibers_mem _ _ p).mpr ⟨h _ hs,he⟩

theorem couple_covered (d r k : Nat) (p : QuotientSample × List Nat)
    (hp : p ∈ leftIncidence d r k (coveredSamples d k)) :
    couple p ∈ rightIncidence d r k (singletonGenerators r k) := by
  have hfull := leftIncidence_sub d r k _ _ (covered_sub d k) p hp
  have he := couple_mem d r k p hfull
  obtain ⟨hw,hA⟩ := (taggedFibers_mem _ _ _).mp he
  obtain ⟨hs,hls⟩ := (taggedFibers_mem _ _ p).mp hp
  obtain ⟨hss,hcov⟩ := (coveredSamples_mem _ _ _).mp hs
  have hc := ((quotientSamples_mem _ _ _).mp hss).2
  have hclen := ((coeffWords_mem _ _).mp hc).1
  have E := (encodings_mem _ _ _ _).mp hls
  rw [← hclen] at E
  obtain ⟨b,hne,hbound,hcount⟩ :=
    mixed_coverage_forces_singleton p.1.1 p.1.2 r p.2 E hcov
  apply (taggedFibers_mem _ _ _).mpr
  refine ⟨(singletonGenerators_mem _ _ _).mpr ⟨hw,?_⟩,hA⟩
  unfold singletonEvent
  apply List.any_eq_true.mpr
  refine ⟨b,nonzeroTypes_complete _ _ (by omega) hbound,?_⟩
  change (countType (pairLabels p.2 p.1.2) b == 1) = true
  simp [hcount]

/-- Covered quotient samples inject into singleton-generator
incidences. This yields the exact transfer inequality before cancelling
the uniform multiplicities. -/
theorem covered_incidence_le (d r k : Nat) (hk : k = d+r) :
    (coveredSamples d k).length*(invertibles r).length ≤
      (singletonGenerators r k).length*(invertibles d).length := by
  let L := leftIncidence d r k (coveredSamples d k)
  let R := rightIncidence d r k (singletonGenerators r k)
  have he : L.length ≤ R.length := by
    apply card_of_injection L R
      (leftIncidence_nodup _ _ _ _ (coveredSamples_nodup d k)) couple
    · exact couple_covered d r k
    · intro p hp q hq e
      exact couple_inj d r k p q
        (leftIncidence_sub d r k _ _ (covered_sub d k) p hp)
        (leftIncidence_sub d r k _ _ (covered_sub d k) q hq) e
  change (leftIncidence d r k (coveredSamples d k)).length ≤
    (rightIncidence d r k (singletonGenerators r k)).length at he
  rwa [leftIncidence_length d r k hk _ (covered_sub d k),
    rightIncidence_length d r k hk _ (singleton_sub r k)] at he

theorem covered_transfer (d r k : Nat) (hk : k = d+r) :
    (coveredSamples d k).length*(generatorSamples r k).length ≤
      (singletonGenerators r k).length*(quotientSamples d k).length := by
  let c := (coveredSamples d k).length
  let g := (generatorSamples r k).length
  let b := (singletonGenerators r k).length
  let a := (quotientSamples d k).length
  let x := (invertibles r).length
  let y := (invertibles d).length
  have e : a*x = g*y := incidence_double_count d r k hk
  have h : c*x ≤ b*y := covered_incidence_le d r k hk
  have hp : 0 < y := invertibles_pos d
  have hh : (c*g)*y ≤ (b*a)*y := by
    calc
      (c*g)*y = c*(g*y) := by ac_rfl
      _ = c*(a*x) := by rw [e]
      _ = (c*x)*a := by ac_rfl
      _ ≤ (b*y)*a := Nat.mul_le_mul_right a h
      _ = (b*a)*y := by ac_rfl
  exact Nat.le_of_mul_le_mul_right hh hp

noncomputable def allSamples (d k : Nat) : List QuotientSample :=
  taggedFibers (matrices d k) (fun _ => coeffWords k)

theorem allSamples_mem (d k : Nat) (s : QuotientSample) :
    s ∈ allSamples d k ↔ s.1 ∈ matrices d k ∧ s.2 ∈ coeffWords k :=
  taggedFibers_mem _ _ _

theorem allSamples_nodup (d k : Nat) : (allSamples d k).Nodup :=
  taggedFibers_nodup _ _ (matrices_nodup d k) (fun _ _ => coeffWords_nodup k)

theorem allSamples_length (d k : Nat) : (allSamples d k).length = (2^k)^d*3^k := by
  rw [allSamples,taggedFibers_length _ _ (3^k) (fun _ _ => coeffWords_length k),
    matrices_length]

theorem quotientSamples_subset (d k : Nat) (s : QuotientSample)
    (hs : s ∈ quotientSamples d k) : s ∈ allSamples d k := by
  obtain ⟨hA,hc⟩ := (quotientSamples_mem _ _ _).mp hs
  have h := (quotients_mem _ _ _).mp hA
  exact (allSamples_mem _ _ _).mpr ⟨(matrices_mem _ _ _).mpr ⟨h.1,h.2.1⟩,hc⟩

theorem all_covered_iff (d k : Nat) (s : QuotientSample) :
    s ∈ coveredSamples d k ↔ s ∈ allSamples d k ∧ CoversMixed s.1 s.2 := by
  constructor
  · intro h
    exact ⟨quotientSamples_subset _ _ _ (covered_sub _ _ _ h),
      ((coveredSamples_mem _ _ _).mp h).2⟩
  · rintro ⟨hs,hc⟩
    obtain ⟨hA,hsnd⟩ := (allSamples_mem _ _ _).mp hs
    have h := (matrices_mem _ _ _).mp hA
    have hclen := ((coeffWords_mem _ _).mp hsnd).1
    have hcover := coversMixed_binary _ _ hc
    rw [hclen] at hcover
    exact (coveredSamples_mem _ _ _).mpr
      ⟨(quotientSamples_mem _ _ _).mpr
        ⟨(quotients_mem _ _ _).mpr ⟨h.1,h.2,hcover⟩,hsnd⟩,hc⟩

theorem generatorSamples_half (d r k : Nat) (hd : 0 < d) (hr : 0 < r)
    (hk : k = d+r) :
    (words (alphabet (2^r)) k).length ≤ 2*(generatorSamples r k).length := by
  obtain ⟨s,hs⟩ : ∃ s : Nat, r = s+1 := ⟨r-1,by omega⟩
  have hk' : k = d+s+1 := by omega
  have h := badGenerator_scaled_bound d s
  rw [← hs,← hk'] at h
  have hd2 : 2 ≤ 2^d := by
    cases d with
    | zero => omega
    | succ d =>
      rw [Nat.pow_succ]
      have hh := Nat.two_pow_pos d
      omega
  have h2 := Nat.mul_le_mul_right
    (tally (badGenerator r) (words (alphabet (2^r)) k)) hd2
  have h3 := Nat.le_trans h2 h
  have ht := tally_compl (badGenerator r) (words (alphabet (2^r)) k)
  rw [tally_filter_length] at ht
  change (generatorSamples r k).length +
    tally (badGenerator r) (words (alphabet (2^r)) k) =
    (words (alphabet (2^r)) k).length at ht
  omega

theorem singletonGenerators_le (r k : Nat) :
    (singletonGenerators r k).length ≤
      tally (singletonEvent r) (words (alphabet (2^r)) k) := by
  rw [tally_filter_length]
  apply nodup_subset_length _ _
    (List.filter_sublist.nodup (generatorSamples_nodup r k))
  intro w hw
  obtain ⟨hg,hs⟩ := (singletonGenerators_mem r k w).mp hw
  exact List.mem_filter.mpr ⟨((generatorSamples_mem _ _ _).mp hg).1,hs⟩

/-- Exact finite iid coverage bound along the explicit dimension
sequence. Its probability is at most 1/(8*2^r); all divisions are
avoided in this theorem. -/
theorem iid_coverage_scaled (r : Nat) (hr : 0 < r) :
    8*2^r*(coveredSamples (targetDimension r) (sampleCount r)).length ≤
      (allSamples (targetDimension r) (sampleCount r)).length := by
  let k := sampleCount r
  let d := targetDimension r
  have hk : k = d+r := by
    unfold k d targetDimension
    have h := targetDimension_lower r
    unfold targetDimension at h
    have hn : 0 < 2^r := Nat.two_pow_pos r
    have hm : 0 < labelCount r := Nat.two_pow_pos r
    omega
  have hd : 0 < d := by
    have h := targetDimension_lower r
    have hp : 0 < labelCount r := Nat.two_pow_pos r
    omega
  let g := (generatorSamples r k).length
  let b := (singletonGenerators r k).length
  let t := (words (alphabet (2^r)) k).length
  let c := (coveredSamples d k).length
  let a := (quotientSamples d k).length
  have hh : t ≤ 2*g := generatorSamples_half d r k hd hr hk
  have hs : 16*2^r*b ≤ t := by
    have he := occupancy_scaled_decay r
    change 16*2^r*tally (singletonEvent r) (words (alphabet (2^r)) k) ≤ t at he
    exact Nat.le_trans (Nat.mul_le_mul_left _ (singletonGenerators_le r k)) he
  have hb : 8*2^r*b ≤ g := by
    have e : 16*2^r*b ≤ 2*g := Nat.le_trans hs hh
    have ee : 2*(8*2^r*b) ≤ 2*g := by
      calc
        2*(8*2^r*b) = 16*2^r*b := by
          change 2*(8*2^r*b) = (2*8)*2^r*b
          ac_rfl
        _ ≤ 2*g := e
    omega
  have hg : 0 < g := by
    have ht : 0 < t := by
      dsimp [t]
      rw [total_word_count]
      exact Nat.pow_pos (Nat.mul_pos (by decide) (Nat.two_pow_pos r))
    omega
  have htrans : c*g ≤ b*a := covered_transfer d r k hk
  have he : (8*2^r*c)*g ≤ a*g := by
    calc
      (8*2^r*c)*g = (8*2^r)*(c*g) := by ac_rfl
      _ ≤ (8*2^r)*(b*a) := Nat.mul_le_mul_left _ htrans
      _ = (8*2^r*b)*a := by ac_rfl
      _ ≤ g*a := Nat.mul_le_mul_right _ hb
      _ = a*g := by ac_rfl
  have hca : 8*2^r*c ≤ a := Nat.le_of_mul_le_mul_right he hg
  exact Nat.le_trans hca
    (nodup_subset_length _ _ (quotientSamples_nodup d k) (quotientSamples_subset d k))

end MaTangCoreLowerBound
