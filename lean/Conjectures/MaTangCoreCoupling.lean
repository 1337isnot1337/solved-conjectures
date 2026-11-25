import Conjectures.MaTangCoreMultiplicity

/-!
# Ma–Tang's random subset-sum threshold conjecture

Finite double counting for uniform binary kernels, with independently
sampled ternary coefficients. All sample spaces are duplicate-free lists.
-/
namespace MaTangCoreCoupling
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear
open MaTangCoreEncoding MaTangCoreFactor MaTangCoreMultiplicity

def taggedFibers {α β : Type} (xs : List α) (F : α → List β) : List (α × β) :=
  xs.flatMap fun x => (F x).map fun y => (x,y)

theorem taggedFibers_mem {α β : Type} (xs : List α) (F : α → List β)
    (p : α × β) : p ∈ taggedFibers xs F ↔ p.1 ∈ xs ∧ p.2 ∈ F p.1 := by
  rcases p with ⟨a,b⟩
  simp [taggedFibers,List.mem_flatMap]

theorem taggedFibers_nodup {α β : Type} (xs : List α) (F : α → List β)
    (hx : xs.Nodup) (hF : ∀ x ∈ xs, (F x).Nodup) :
    (taggedFibers xs F).Nodup := by
  unfold taggedFibers
  apply flatMap_nodup_of_disjoint _ _ hx
  · intro x hx
    apply nodup_map_of_injective_on _ _ (hF x hx)
    intro a _ b _ e
    exact congrArg Prod.snd e
  · intro x hx y hy hxy p hp q hq e
    have hpx : p.1 = x := by
      obtain ⟨a,_,ha⟩ := List.mem_map.mp hp
      rw [← ha]
    have hqy : q.1 = y := by
      obtain ⟨b,_,hb⟩ := List.mem_map.mp hq
      rw [← hb]
    exact hxy (hpx.symm.trans ((congrArg Prod.fst e).trans hqy))

theorem taggedFibers_length {α β : Type} (xs : List α) (F : α → List β)
    (g : Nat) (hF : ∀ x ∈ xs, (F x).length = g) :
    (taggedFibers xs F).length = xs.length*g := by
  unfold taggedFibers
  apply flatMap_const_length _ _ g
  intro x hx
  rw [List.length_map,hF x hx]

theorem card_of_injection {α β : Type} [BEq β] [LawfulBEq β]
    (xs : List α) (ys : List β) (hx : xs.Nodup) (f : α → β)
    (hmem : ∀ a ∈ xs, f a ∈ ys)
    (hinj : ∀ a ∈ xs, ∀ b ∈ xs, f a = f b → a = b) :
    xs.length ≤ ys.length := by
  have hnd := nodup_map_of_injective_on f xs hx hinj
  have hle : (xs.map f).length ≤ ys.length :=
    nodup_subset_length _ _ hnd (by
      intro b hb
      obtain ⟨a,ha,e⟩ := List.mem_map.mp hb
      rw [← e]
      exact hmem a ha)
  simpa using hle

abbrev Mat := List (List Bool)
abbrev QuotientSample := Mat × List Int

def coeffWords (k : Nat) : List (List Int) := words [0,1,2] k

theorem coeffWords_mem (k : Nat) (cs : List Int) :
    cs ∈ coeffWords k ↔ cs.length = k ∧ ∀ c ∈ cs, 0 ≤ c ∧ c < 3 := by
  rw [coeffWords,mem_words]
  constructor
  · intro h
    refine ⟨h.1,?_⟩
    intro c hc
    have he := h.2 c hc
    simp at he
    omega
  · intro h
    refine ⟨h.1,?_⟩
    intro c hc
    have he := h.2 c hc
    simp
    omega

theorem coeffWords_nodup (k : Nat) : (coeffWords k).Nodup :=
  nodup_words _ _ (by decide)

theorem coeffWords_length (k : Nat) : (coeffWords k).length = 3^k := by
  simp [coeffWords,words_length]

noncomputable def quotientSamples (d k : Nat) : List QuotientSample :=
  taggedFibers (quotients d k) (fun _ => coeffWords k)

theorem quotientSamples_mem (d k : Nat) (s : QuotientSample) :
    s ∈ quotientSamples d k ↔ s.1 ∈ quotients d k ∧ s.2 ∈ coeffWords k :=
  taggedFibers_mem _ _ _

theorem quotientSamples_nodup (d k : Nat) : (quotientSamples d k).Nodup :=
  taggedFibers_nodup _ _ (quotients_nodup d k) (fun _ _ => coeffWords_nodup k)

noncomputable def coveredSamples (d k : Nat) : List QuotientSample := by
  classical
  exact (quotientSamples d k).filter fun s => decide (CoversMixed s.1 s.2)

theorem coveredSamples_mem (d k : Nat) (s : QuotientSample) :
    s ∈ coveredSamples d k ↔ s ∈ quotientSamples d k ∧ CoversMixed s.1 s.2 := by
  classical
  simp [coveredSamples]

theorem coveredSamples_nodup (d k : Nat) : (coveredSamples d k).Nodup := by
  classical
  unfold coveredSamples
  exact List.filter_sublist.nodup (quotientSamples_nodup d k)

def generatorSamples (r k : Nat) : List (List Raw) :=
  (words (alphabet (2^r)) k).filter fun w => !badGenerator r w

theorem generatorSamples_mem (r k : Nat) (w : List Raw) :
    w ∈ generatorSamples r k ↔
      w ∈ words (alphabet (2^r)) k ∧ InjectiveParams w r := by
  rw [generatorSamples,List.mem_filter]
  simp [goodGenerator_iff_injective]

theorem generatorSamples_nodup (r k : Nat) : (generatorSamples r k).Nodup :=
  List.filter_sublist.nodup (nodup_words _ _ (alphabet_nodup _))

def singletonEvent (r : Nat) (w : List Raw) : Bool :=
  (nonzeroTypes (2^r)).any (fun d => countType w d == 1)

def singletonGenerators (r k : Nat) : List (List Raw) :=
  (generatorSamples r k).filter (singletonEvent r)

theorem singletonGenerators_mem (r k : Nat) (w : List Raw) :
    w ∈ singletonGenerators r k ↔
      w ∈ generatorSamples r k ∧ singletonEvent r w = true := by
  simp [singletonGenerators]

theorem pairLabels_reconstruct (w : List Raw) :
    pairLabels (w.map Prod.fst) (w.map Prod.snd) = w := by
  induction w with
  | nil => rfl
  | cons a as ih =>
    rcases a with ⟨b,c⟩
    simp [pairLabels,ih]

theorem pairLabels_mem (r k : Nat) (ls : List Nat) (cs : List Int)
    (hl : ls ∈ labelWords r k) (hc : cs ∈ coeffWords k) :
    pairLabels ls cs ∈ words (alphabet (2^r)) k := by
  obtain ⟨hlen,hb⟩ := (labelWords_mem r k ls).mp hl
  obtain ⟨hclen,hr⟩ := (coeffWords_mem k cs).mp hc
  have he : ls.length = cs.length := hlen.trans hclen.symm
  apply (mem_words _ _ _).mpr
  refine ⟨(pairLabels_length ls cs he).trans hclen,?_⟩
  intro x hx
  apply (alphabet_mem_iff _ x).mpr
  have h1 : x.1 ∈ ls := by
    rw [← pairLabels_fst ls cs he]
    exact List.mem_map.mpr ⟨x,hx,rfl⟩
  have h2 : x.2 ∈ cs := by
    rw [← pairLabels_snd ls cs he]
    exact List.mem_map.mpr ⟨x,hx,rfl⟩
  exact ⟨hb _ h1,hr _ h2⟩

theorem raw_fst_mem (r k : Nat) (w : List Raw)
    (hw : w ∈ words (alphabet (2^r)) k) :
    w.map Prod.fst ∈ labelWords r k := by
  have h := (mem_words _ _ _).mp hw
  apply (labelWords_mem r k _).mpr
  refine ⟨by simpa using h.1,?_⟩
  intro b hb
  obtain ⟨x,hx,e⟩ := List.mem_map.mp hb
  rw [← e]
  exact ((alphabet_mem_iff _ _).mp (h.2 x hx)).1

theorem raw_snd_mem (r k : Nat) (w : List Raw)
    (hw : w ∈ words (alphabet (2^r)) k) :
    w.map Prod.snd ∈ coeffWords k := by
  have h := (mem_words _ _ _).mp hw
  apply (coeffWords_mem k _).mpr
  refine ⟨by simpa using h.1,?_⟩
  intro c hc
  obtain ⟨x,hx,e⟩ := List.mem_map.mp hc
  rw [← e]
  exact ((alphabet_mem_iff _ _).mp (h.2 x hx)).2

theorem generator_has_quotient (d r k : Nat) (hk : k = d+r)
    (w : List Raw) (hw : w ∈ generatorSamples r k) :
    ∃ A, A ∈ quotientsFor (w.map Prod.fst) r d k := by
  obtain ⟨hm,hi⟩ := (generatorSamples_mem r k w).mp hw
  have hlen := ((mem_words _ _ _).mp hm).1
  have hb : ∀ x ∈ w, x.1 < 2^r := by
    intro x hx
    exact ((alphabet_mem_iff _ _).mp (((mem_words _ _ _).mp hm).2 x hx)).1
  obtain ⟨A,hsize,hs,hd,E⟩ := quotient_of_good_generator w r hb hi
  have hd' : A.length = d := by omega
  rw [hlen] at hsize hs E
  exact ⟨A,(quotientsFor_mem _ _ _ _ _).mpr
    ⟨(quotients_mem _ _ _).mpr ⟨hd',hsize,hs⟩,E⟩⟩

noncomputable def leftIncidence (_d r k : Nat) (ss : List QuotientSample) :
    List (QuotientSample × List Nat) :=
  taggedFibers ss fun s => encodings s.1 k r

noncomputable def rightIncidence (d r k : Nat) (ws : List (List Raw)) :
    List (List Raw × Mat) :=
  taggedFibers ws fun w => quotientsFor (w.map Prod.fst) r d k

def couple (p : QuotientSample × List Nat) : List Raw × Mat :=
  (pairLabels p.2 p.1.2,p.1.1)

def uncouple (p : List Raw × Mat) : QuotientSample × List Nat :=
  ((p.2,p.1.map Prod.snd),p.1.map Prod.fst)

theorem couple_left_inv (k : Nat) (p : QuotientSample × List Nat)
    (hcs : p.1.2.length = k) (hls : p.2.length = k) :
    uncouple (couple p) = p := by
  rcases p with ⟨⟨A,cs⟩,ls⟩
  simp only [couple,uncouple]
  rw [pairLabels_fst ls cs (hls.trans hcs.symm),
      pairLabels_snd ls cs (hls.trans hcs.symm)]

theorem couple_right_inv (p : List Raw × Mat) : couple (uncouple p) = p := by
  rcases p with ⟨w,A⟩
  simp [couple,uncouple,pairLabels_reconstruct]

theorem couple_mem (d r k : Nat) (p : QuotientSample × List Nat)
    (hp : p ∈ leftIncidence d r k (quotientSamples d k)) :
    couple p ∈ rightIncidence d r k (generatorSamples r k) := by
  obtain ⟨hs,he⟩ := (taggedFibers_mem _ _ p).mp hp
  obtain ⟨hA,hc⟩ := (quotientSamples_mem _ _ _).mp hs
  have E := (encodings_mem _ _ _ _).mp he
  have hcs := ((coeffWords_mem _ _).mp hc).1
  have hlen : p.2.length = p.1.2.length := E.length_eq.trans hcs.symm
  let w := pairLabels p.2 p.1.2
  have hw : w ∈ words (alphabet (2^r)) k :=
    pairLabels_mem r k _ _ ((labelWords_mem _ _ _).mpr ⟨E.length_eq,E.bound⟩) hc
  have hi : InjectiveParams w r := by
    intro t u ht hu ee
    apply E.inj t u ht hu
    rw [← kernelVector_pairLabels p.2 p.1.2 t hlen,
      ← kernelVector_pairLabels p.2 p.1.2 u hlen]
    exact ee
  apply (taggedFibers_mem _ _ _).mpr
  refine ⟨(generatorSamples_mem r k w).mpr ⟨hw,hi⟩,?_⟩
  apply (quotientsFor_mem _ _ _ _ _).mpr
  refine ⟨hA,?_⟩
  change Encoding (kernelSpace p.1.1 k) r (w.map Prod.fst)
  rw [pairLabels_fst _ _ hlen]
  exact E

theorem uncouple_mem (d r k : Nat) (p : List Raw × Mat)
    (hp : p ∈ rightIncidence d r k (generatorSamples r k)) :
    uncouple p ∈ leftIncidence d r k (quotientSamples d k) := by
  obtain ⟨hw,hq⟩ := (taggedFibers_mem _ _ p).mp hp
  obtain ⟨hA,E⟩ := (quotientsFor_mem _ _ _ _ _).mp hq
  have hm := ((generatorSamples_mem _ _ _).mp hw).1
  have hc := raw_snd_mem r k p.1 hm
  exact (taggedFibers_mem _ _ _).mpr
    ⟨(quotientSamples_mem _ _ _).mpr ⟨hA,hc⟩,(encodings_mem _ _ _ _).mpr E⟩

theorem leftIncidence_nodup (d r k : Nat) (ss : List QuotientSample) (hs : ss.Nodup) :
    (leftIncidence d r k ss).Nodup :=
  taggedFibers_nodup _ _ hs (fun s _ => encodings_nodup s.1 k r)

theorem rightIncidence_nodup (d r k : Nat) (ws : List (List Raw)) (hs : ws.Nodup) :
    (rightIncidence d r k ws).Nodup :=
  taggedFibers_nodup _ _ hs (fun w _ => quotientsFor_nodup (w.map Prod.fst) r d k)

theorem leftIncidence_length (d r k : Nat) (hk : k = d+r)
    (ss : List QuotientSample) (hs : ∀ s ∈ ss, s ∈ quotientSamples d k) :
    (leftIncidence d r k ss).length = ss.length*(invertibles r).length := by
  apply taggedFibers_length _ _ _
  intro s h
  exact encoding_multiplicity _ _ _ _ hk ((quotientSamples_mem _ _ _).mp (hs s h)).1

theorem rightIncidence_length (d r k : Nat) (hk : k = d+r)
    (ws : List (List Raw)) (hs : ∀ w ∈ ws, w ∈ generatorSamples r k) :
    (rightIncidence d r k ws).length = ws.length*(invertibles d).length := by
  apply taggedFibers_length _ _ _
  intro w h
  exact quotient_multiplicity _ _ _ _ (generator_has_quotient d r k hk w (hs w h))

theorem couple_inj (d r k : Nat) (p q : QuotientSample × List Nat)
    (hp : p ∈ leftIncidence d r k (quotientSamples d k))
    (hq : q ∈ leftIncidence d r k (quotientSamples d k))
    (e : couple p = couple q) : p = q := by
  have hplen := (taggedFibers_mem _ _ p).mp hp
  have hqlen := (taggedFibers_mem _ _ q).mp hq
  have hpi := couple_left_inv k p
    ((coeffWords_mem _ _).mp ((quotientSamples_mem _ _ _).mp hplen.1).2).1
    ((encodings_mem _ _ _ _).mp hplen.2).length_eq
  have hqi := couple_left_inv k q
    ((coeffWords_mem _ _).mp ((quotientSamples_mem _ _ _).mp hqlen.1).2).1
    ((encodings_mem _ _ _ _).mp hqlen.2).length_eq
  rw [← hpi,← hqi,e]

/-- The uniform-kernel multiplicities are equal on both sides of the
finite incidence space, with no probabilistic assumption. -/
theorem incidence_double_count (d r k : Nat) (hk : k = d+r) :
    (quotientSamples d k).length*(invertibles r).length =
      (generatorSamples r k).length*(invertibles d).length := by
  let L := leftIncidence d r k (quotientSamples d k)
  let R := rightIncidence d r k (generatorSamples r k)
  have he : L.length = R.length := by
    apply card_of_bijection L R
      (leftIncidence_nodup _ _ _ _ (quotientSamples_nodup d k))
      (rightIncidence_nodup _ _ _ _ (generatorSamples_nodup r k)) couple
    · exact couple_mem d r k
    · intro p hp q hq e
      exact couple_inj d r k p q hp hq e
    · intro p hp
      exact ⟨uncouple p,uncouple_mem d r k p hp,couple_right_inv p⟩
  change (leftIncidence d r k (quotientSamples d k)).length =
    (rightIncidence d r k (generatorSamples r k)).length at he
  rwa [leftIncidence_length d r k hk _ (fun _ h => h),
    rightIncidence_length d r k hk _ (fun _ h => h)] at he

end MaTangCoreCoupling
