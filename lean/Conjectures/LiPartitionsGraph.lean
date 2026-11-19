import Conjectures.LiPartitionsFinalCore

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open SimpleGraph

namespace LiFinal

/-- The bit belonging to a vertex. -/
def bitOf (v : Fin 31) : Nat := 1 <<< v.val

theorem rootedEdges_length : rootedEdges.length = 30 := rfl

/-- The edge with index `i`. -/
def edgeAt (i : Fin 30) : Fin 31 × Fin 31 :=
  rootedEdges[i.val]'(by rw [rootedEdges_length]; exact i.isLt)

theorem edgeAt_ne (i : Fin 30) : (edgeAt i).1 ≠ (edgeAt i).2 := by
  unfold edgeAt
  have := List.getElem_mem (l := rootedEdges) (n := i.val)
    (by rw [rootedEdges_length]; exact i.isLt)
  revert this
  generalize rootedEdges[i.val]'(by rw [rootedEdges_length]; exact i.isLt) = e
  intro he
  revert e
  decide

/-- The graph of the kept edges with index `< k`. -/
def prefixGraph (k : Nat) (hk : k ≤ 30) (mask : Nat) : SimpleGraph (Fin 31) where
  Adj u v :=
    ∃ i : Fin k,
      ¬ mask.testBit i.val ∧
        (((edgeAt (Fin.castLE hk i)).1 = u ∧ (edgeAt (Fin.castLE hk i)).2 = v) ∨
         ((edgeAt (Fin.castLE hk i)).1 = v ∧ (edgeAt (Fin.castLE hk i)).2 = u))
  symm := ⟨by
    intro u v h
    rcases h with ⟨i, hi, h | h⟩
    · exact ⟨i, hi, Or.inr h⟩
    · exact ⟨i, hi, Or.inl h⟩⟩
  loopless := ⟨by
    intro u h
    rcases h with ⟨i, hi, h | h⟩
    · exact edgeAt_ne (Fin.castLE hk i) (h.1.trans h.2.symm)
    · exact edgeAt_ne (Fin.castLE hk i) (h.1.trans h.2.symm)⟩

instance prefixGraphDecidable (k : Nat) (hk : k ≤ 30) (mask : Nat) :
    DecidableRel (prefixGraph k hk mask).Adj := by
  intro u v
  unfold prefixGraph
  infer_instance

/-- The cut graph of all 30 edges. -/
def cutGraph (mask : Nat) : SimpleGraph (Fin 31) :=
  prefixGraph 30 le_rfl mask

instance cutGraphDecidable (mask : Nat) : DecidableRel (cutGraph mask).Adj := by
  intro u v
  unfold cutGraph
  infer_instance

theorem cutGraph_adj_iff (mask : Nat) (u v : Fin 31) :
    (cutGraph mask).Adj u v ↔
      ∃ i : Fin 30,
        ¬ mask.testBit i.val ∧
          (((edgeAt i).1 = u ∧ (edgeAt i).2 = v) ∨
           ((edgeAt i).1 = v ∧ (edgeAt i).2 = u)) := by
  unfold cutGraph prefixGraph
  rfl

theorem edgeAt_rooted (i : Fin 30) : edgeAt i ∈ rootedEdges := by
  unfold edgeAt
  exact List.getElem_mem (by rw [rootedEdges_length]; exact i.isLt)

theorem cutGraph_adj_T (mask : Nat) (u v : Fin 31) (h : (cutGraph mask).Adj u v) :
    Li.T.Adj u v := by
  rw [cutGraph_adj_iff] at h
  rcases h with ⟨i, hi, h | h⟩
  · rw [← h.1, ← h.2]
    exact rooted_adj (edgeAt i) (edgeAt_rooted i)
  · rw [← h.1, ← h.2]
    exact (rooted_adj (edgeAt i) (edgeAt_rooted i)).symm

theorem prefixGraph_zero (mask : Nat) :
    prefixGraph 0 (by decide) mask = ⊥ := by
  ext u v
  simp [prefixGraph]

/-- `InMask m v` says that bit `v` is set in the mask `m`. -/
def InMask (m : Nat) (v : Fin 31) : Prop :=
  m.testBit v.val = true

instance (m : Nat) (v : Fin 31) : Decidable (InMask m v) := by
  unfold InMask
  infer_instance

/-- The set of vertices whose bit is set in the mask `m`. -/
def maskSet (m : Nat) : Finset (Fin 31) :=
  Finset.univ.filter (fun v => InMask m v)

theorem inMask_bitOf (v w : Fin 31) : InMask (bitOf v) w ↔ v = w := by
  unfold InMask bitOf
  rw [Nat.shiftLeft_eq, one_mul, Nat.testBit_two_pow]
  constructor
  · intro h
    exact Fin.ext (of_decide_eq_true h)
  · intro h
    subst h
    simp

theorem maskSet_bitOf (v : Fin 31) : maskSet (bitOf v) = {v} := by
  ext w
  simp [maskSet, inMask_bitOf, eq_comm]

theorem inMask_or (a b : Nat) (v : Fin 31) :
    InMask (a ||| b) v ↔ InMask a v ∨ InMask b v := by
  unfold InMask
  rw [Nat.testBit_or]
  cases a.testBit v.val <;> cases b.testBit v.val <;> simp

theorem maskSet_or (a b : Nat) :
    maskSet (a ||| b) = maskSet a ∪ maskSet b := by
  ext v
  simp [maskSet, inMask_or]

theorem maskSet_ne_zero {m : Nat} (h : maskSet m = ∅) (v : Fin 31) : InMask m v = false := by
  have : v ∉ maskSet m := by simp [h]
  simpa [maskSet] using this


/-! ## The union-find representation invariant -/

/-- Every vertex belongs to a unique component mask. -/
def Covered (comps : List (Nat × Nat)) : Prop :=
  ∀ v : Fin 31, ∃! c : Nat × Nat, c ∈ comps ∧ v ∈ maskSet c.1

/-- Every component mask is nonempty. -/
def MasksNonempty (comps : List (Nat × Nat)) : Prop :=
  ∀ c ∈ comps, (maskSet c.1).Nonempty

/-- The stored size is the cardinality of the component mask. -/
def SizeCorrect (comps : List (Nat × Nat)) : Prop :=
  ∀ c ∈ comps, c.2 = (maskSet c.1).card

/-- Two vertices are in the same stored component. -/
def UF (comps : List (Nat × Nat)) (u v : Fin 31) : Prop :=
  ∃ c ∈ comps, u ∈ maskSet c.1 ∧ v ∈ maskSet c.1

/-- The union-find state comps represents the graph H. -/
def Represents (comps : List (Nat × Nat)) (H : SimpleGraph (Fin 31)) : Prop :=
  comps.Nodup ∧ Covered comps ∧ MasksNonempty comps ∧ SizeCorrect comps ∧
    (∀ u v : Fin 31, UF comps u v ↔ H.Reachable u v)

theorem mem_compList (n : Nat) (hn : n ≤ 31) (i : Fin 31) (hi : i.val < n) :
    (bitOf i, 1) ∈ compList n := by
  induction n with
  | zero => omega
  | succ n ih =>
    by_cases h : i.val = n
    · have hi' : i = ⟨n, by omega⟩ := Fin.ext h
      rw [hi']
      simp [compList, bitOf]
    · have hlt : i.val < n := by omega
      have hmem := ih (by omega) hlt
      exact List.mem_cons_of_mem _ hmem

theorem mem_compList_eq {n : Nat} (hn : n ≤ 31) {c : Nat × Nat} (hc : c ∈ compList n) :
    ∃ i : Fin 31, i.val < n ∧ c = (bitOf i, 1) := by
  induction n with
  | zero => simp [compList] at hc
  | succ n ih =>
    simp only [compList, List.mem_cons] at hc
    rcases hc with rfl | hc
    · refine ⟨⟨n, by omega⟩, Nat.lt_succ_self n, ?_⟩
      rfl
    · rcases ih (by omega) hc with ⟨i, hi, rfl⟩
      exact ⟨i, by omega, rfl⟩

theorem compList_covered : Covered (compList 31) := by
  intro v
  refine ⟨(bitOf v, 1), ⟨?_, ?_⟩, ?_⟩
  · exact mem_compList 31 (by omega) v v.isLt
  · simp [maskSet_bitOf]
  · intro c hc
    rcases hc with ⟨hcmem, hv⟩
    rcases mem_compList_eq (n := 31) (by omega) hcmem with ⟨i, hi, rfl⟩
    have hiv : i = v := by
      have : v = i := by simpa [maskSet_bitOf] using hv
      exact this.symm
    subst hiv
    rfl

theorem compList_nonempty : MasksNonempty (compList 31) := by
  intro c hc
  rcases mem_compList_eq (n := 31) (by omega) hc with ⟨i, hi, rfl⟩
  exact ⟨i, by simp [maskSet_bitOf]⟩

theorem compList_sizeCorrect : SizeCorrect (compList 31) := by
  intro c hc
  rcases mem_compList_eq (n := 31) (by omega) hc with ⟨i, hi, rfl⟩
  simp [maskSet_bitOf]

theorem compList_uf (u v : Fin 31) : UF (compList 31) u v ↔ u = v := by
  constructor
  · rintro ⟨c, hc, hu, hv⟩
    rcases mem_compList_eq (n := 31) (by omega) hc with ⟨i, hi, rfl⟩
    have hiu : u = i := by simpa [maskSet_bitOf] using hu
    have hiv : v = i := by simpa [maskSet_bitOf] using hv
    exact hiu.trans hiv.symm
  · intro huv
    subst huv
    exact ⟨(bitOf u, 1), mem_compList 31 (by omega) u u.isLt,
      by simp [maskSet_bitOf], by simp [maskSet_bitOf]⟩

theorem compList_represents : Represents (compList 31) (prefixGraph 0 (by decide) 0) := by
  refine ⟨(by decide : (compList 31).Nodup), compList_covered, compList_nonempty, compList_sizeCorrect, ?_⟩
  intro u v
  rw [compList_uf, prefixGraph_zero, SimpleGraph.reachable_bot]


theorem bitOf_eq (v : Fin 31) : bitOf v = 2 ^ v.val := by
  simp [bitOf, Nat.shiftLeft_eq]

theorem land_eq_iff (m b : Nat) :
    (m &&& b) = b ↔ ∀ i, b.testBit i = true → m.testBit i = true := by
  constructor
  · intro h i hi
    have h' : (m &&& b).testBit i = b.testBit i := congrArg (fun x => x.testBit i) h
    rw [Nat.testBit_and] at h'
    rw [hi] at h'
    simpa using h'
  · intro h
    apply Nat.eq_of_testBit_eq
    intro i
    rw [Nat.testBit_and]
    by_cases hi : b.testBit i = true
    · rw [hi, h i hi]; simp
    · have hif : b.testBit i = false := by simpa using hi
      rw [hif]; simp

theorem land_bitOf_iff (m : Nat) (v : Fin 31) :
    (m &&& bitOf v) = bitOf v ↔ InMask m v := by
  rw [land_eq_iff, bitOf_eq]
  constructor
  · intro h
    exact h v.val (by rw [Nat.testBit_two_pow]; simp)
  · intro h i hi
    rw [Nat.testBit_two_pow] at hi
    have hiv : v.val = i := of_decide_eq_true hi
    rw [← hiv]
    simpa [InMask] using h

theorem bitOf_ne_zero (v : Fin 31) : bitOf v ≠ 0 := by
  rw [bitOf_eq]
  exact pow_ne_zero v (by decide : (2 : Nat) ≠ 0)

theorem extract_mem {b : Nat} {comps : List (Nat × Nat)}
    (h : (extract b comps).1 ≠ (0, 0)) : (extract b comps).1 ∈ comps := by
  induction comps with
  | nil => simp [extract] at h
  | cons hd tl ih =>
    obtain ⟨m, s⟩ := hd
    by_cases hc : (m &&& b) = b
    · simp [extract, hc]
    · simp only [extract, hc, reduceIte] at h ⊢
      exact List.mem_cons_of_mem _ (ih h)

theorem extract_contains {b : Nat} {comps : List (Nat × Nat)}
    (h : (extract b comps).1 ≠ (0, 0)) :
    ((extract b comps).1).1 &&& b = b := by
  induction comps with
  | nil => simp [extract] at h
  | cons hd tl ih =>
    obtain ⟨m, s⟩ := hd
    by_cases hc : (m &&& b) = b
    · simp only [extract, hc, reduceIte]
    · simp only [extract, hc, reduceIte] at h ⊢
      exact ih h

theorem extract_rest_subset {b : Nat} {comps : List (Nat × Nat)} :
    ∀ c ∈ (extract b comps).2, c ∈ comps := by
  induction comps with
  | nil => simp [extract]
  | cons hd tl ih =>
    obtain ⟨m, s⟩ := hd
    intro c hc
    by_cases hcond : (m &&& b) = b
    · simp only [extract, hcond, reduceIte] at hc ⊢
      exact List.mem_cons_of_mem _ hc
    · simp only [extract, hcond, reduceIte] at hc ⊢
      rcases List.mem_cons.mp hc with rfl | hc
      · exact List.mem_cons_self
      · exact List.mem_cons_of_mem _ (ih c hc)

theorem extract_rest_of_ne {b : Nat} {comps : List (Nat × Nat)}
    (hnd : comps.Nodup) {c : Nat × Nat} (hc : c ∈ comps)
    (hne : c ≠ (extract b comps).1) : c ∈ (extract b comps).2 := by
  induction comps with
  | nil => simp at hc
  | cons hd tl ih =>
    obtain ⟨m, s⟩ := hd
    by_cases hcond : (m &&& b) = b
    · simp only [extract, hcond, reduceIte] at hne ⊢
      simp only [List.mem_cons] at hc
      rcases hc with rfl | hc
      · exact absurd rfl hne
      · exact hc
    · simp only [extract, hcond, reduceIte] at hne ⊢
      simp only [List.mem_cons] at hc
      rcases hc with rfl | hc
      · exact List.mem_cons_self
      · exact List.mem_cons_of_mem _ (ih (List.nodup_cons.mp hnd).2 hc hne)


theorem covered_eq_of_common {comps : List (Nat × Nat)} (hcov : Covered comps)
    {c d : Nat × Nat} (hc : c ∈ comps) (hd : d ∈ comps) {v : Fin 31}
    (hvc : v ∈ maskSet c.1) (hvd : v ∈ maskSet d.1) : c = d := by
  obtain ⟨e, he, huniq⟩ := hcov v
  exact (huniq c ⟨hc, hvc⟩).trans (huniq d ⟨hd, hvd⟩).symm

theorem covered_disjoint {comps : List (Nat × Nat)} (hcov : Covered comps)
    {c d : Nat × Nat} (hc : c ∈ comps) (hd : d ∈ comps) (hne : c ≠ d) :
    Disjoint (maskSet c.1) (maskSet d.1) := by
  rw [Finset.disjoint_left]
  intro v hvc hvd
  exact hne (covered_eq_of_common hcov hc hd hvc hvd)


theorem extract_eq_zero_of_forall {b : Nat} {comps : List (Nat × Nat)}
    (h : ∀ c ∈ comps, ¬ ((c.1 &&& b) = b)) :
    extract b comps = ((0, 0), comps) := by
  induction comps with
  | nil => rfl
  | cons hd tl ih =>
    obtain ⟨m, s⟩ := hd
    have hh : ¬((m &&& b) = b) := h (m, s) (by simp)
    simp only [extract, hh, reduceIte]
    have ih' := ih (fun c hc => h c (List.mem_cons_of_mem _ hc))
    rw [ih']

theorem extract_ne_zero_of_mem {b : Nat} (hb : b ≠ 0) {comps : List (Nat × Nat)}
    {c : Nat × Nat} (hc : c ∈ comps) (hbit : (c.1 &&& b) = b) :
    (extract b comps).1 ≠ (0, 0) := by
  induction comps with
  | nil => simp at hc
  | cons hd tl ih =>
    obtain ⟨m, s⟩ := hd
    simp only [List.mem_cons] at hc
    by_cases hcond : (m &&& b) = b
    · simp only [extract, hcond, reduceIte]
      intro hzero
      have hmzero : m = 0 := by simpa using congrArg Prod.fst hzero
      subst hmzero
      simp at hcond
      exact hb hcond.symm
    · simp only [extract, hcond, reduceIte]
      rcases hc with rfl | hc
      · exact absurd hbit hcond
      · exact ih hc


theorem extract_perm {b : Nat} {comps : List (Nat × Nat)} (hnd : comps.Nodup)
    (hfound : (extract b comps).1 ≠ (0, 0)) :
    comps.Perm ((extract b comps).1 :: (extract b comps).2) := by
  induction comps with
  | nil => simp [extract] at hfound
  | cons hd tl ih =>
    obtain ⟨m, s⟩ := hd
    by_cases hc : (m &&& b) = b
    · simp [extract, hc]
    · simp only [extract, hc, reduceIte] at hfound ⊢
      have htl := ih (List.nodup_cons.mp hnd).2 hfound
      exact (List.Perm.cons (m, s) htl).trans (List.Perm.swap (extract b tl).1 (m, s) (extract b tl).2)

theorem covered_of_perm {comps comps' : List (Nat × Nat)} (h : comps.Perm comps') :
    Covered comps → Covered comps' := by
  intro hcov v
  obtain ⟨c, hc, huniq⟩ := hcov v
  refine ⟨c, ⟨(h.mem_iff).mp hc.1, hc.2⟩, ?_⟩
  intro d hd
  exact huniq d ⟨(h.mem_iff).mpr hd.1, hd.2⟩

theorem masksNonempty_of_perm {comps comps' : List (Nat × Nat)} (h : comps.Perm comps') :
    MasksNonempty comps → MasksNonempty comps' := by
  intro hne c hc
  exact hne c ((h.mem_iff).mpr hc)

theorem sizeCorrect_of_perm {comps comps' : List (Nat × Nat)} (h : comps.Perm comps') :
    SizeCorrect comps → SizeCorrect comps' := by
  intro hs c hc
  exact hs c ((h.mem_iff).mpr hc)

theorem uf_of_perm {comps comps' : List (Nat × Nat)} (h : comps.Perm comps') (u v : Fin 31) :
    UF comps u v ↔ UF comps' u v := by
  constructor
  · rintro ⟨c, hc, hu, hv⟩
    exact ⟨c, (h.mem_iff).mp hc, hu, hv⟩
  · rintro ⟨c, hc, hu, hv⟩
    exact ⟨c, (h.mem_iff).mpr hc, hu, hv⟩


theorem mem_maskSet_or (a b : Nat) (v : Fin 31) :
    v ∈ maskSet (a ||| b) ↔ v ∈ maskSet a ∨ v ∈ maskSet b := by
  rw [maskSet_or]
  exact Finset.mem_union

theorem card_maskSet_or (a b : Nat) (h : Disjoint (maskSet a) (maskSet b)) :
    (maskSet (a ||| b)).card = (maskSet a).card + (maskSet b).card := by
  rw [maskSet_or, Finset.card_union_of_disjoint h]


theorem merge_state {comps rest' : List (Nat × Nat)} {cu cv : Nat × Nat}
    (hperm : comps.Perm (cu :: cv :: rest'))
    (hnd : comps.Nodup)
    (hcov : Covered comps)
    (hne : MasksNonempty comps)
    (hsize : SizeCorrect comps)
    (hcu_ne : cu ≠ cv) :
    ((cu.1 ||| cv.1, cu.2 + cv.2) :: rest').Nodup ∧
      Covered ((cu.1 ||| cv.1, cu.2 + cv.2) :: rest') ∧
      MasksNonempty ((cu.1 ||| cv.1, cu.2 + cv.2) :: rest') ∧
      SizeCorrect ((cu.1 ||| cv.1, cu.2 + cv.2) :: rest') := by
  have hnd' : (cu :: cv :: rest').Nodup := (hperm.nodup_iff).mp hnd
  have hcu_mem : cu ∈ comps := (hperm.mem_iff).mpr (by simp)
  have hcv_mem : cv ∈ comps := (hperm.mem_iff).mpr (by simp)
  have hcu_not_rest : cu ∉ rest' := by
    intro h
    exact (List.nodup_cons.mp hnd').1 (by simp [h])
  have hcv_not_rest : cv ∉ rest' := by
    intro h
    exact (List.nodup_cons.mp (List.nodup_cons.mp hnd').2).1 (by simp [h])
  constructor
  · rw [List.nodup_cons]
    constructor
    · intro hmem
      have hmem_old : (cu.1 ||| cv.1, cu.2 + cv.2) ∈ comps :=
        (hperm.mem_iff).mpr (by simp [hmem])
      obtain ⟨u, hu⟩ := hne cu hcu_mem
      have hu_merged : u ∈ maskSet (cu.1 ||| cv.1) := by
        rw [mem_maskSet_or]
        exact Or.inl hu
      have heq : cu = (cu.1 ||| cv.1, cu.2 + cv.2) :=
        covered_eq_of_common hcov hcu_mem hmem_old hu hu_merged
      have : cu ∈ rest' := by
        rw [heq]
        exact hmem
      exact hcu_not_rest this
    · exact (List.nodup_cons.mp (List.nodup_cons.mp hnd').2).2
  constructor
  · intro v
    obtain ⟨c, hc, huniq⟩ := hcov v
    by_cases hccu : c = cu
    · refine ⟨(cu.1 ||| cv.1, cu.2 + cv.2), ⟨by simp, ?_⟩, ?_⟩
      · rw [mem_maskSet_or]
        exact Or.inl (by simpa [hccu] using hc.2)
      · intro d hd
        rcases List.mem_cons.mp hd.1 with rfl | hdrest
        · rfl
        · have hd_old : d ∈ comps := (hperm.mem_iff).mpr (by simp [hdrest])
          have hd_ne_cu : d ≠ cu := by
            intro h
            exact hcu_not_rest (h ▸ hdrest)
          have : d = c := huniq d ⟨hd_old, hd.2⟩
          exact absurd (this.trans hccu) hd_ne_cu
    · by_cases hccv : c = cv
      · refine ⟨(cu.1 ||| cv.1, cu.2 + cv.2), ⟨by simp, ?_⟩, ?_⟩
        · rw [mem_maskSet_or]
          exact Or.inr (by simpa [hccv] using hc.2)
        · intro d hd
          rcases List.mem_cons.mp hd.1 with rfl | hdrest
          · rfl
          · have hd_old : d ∈ comps := (hperm.mem_iff).mpr (by simp [hdrest])
            have hd_ne_cv : d ≠ cv := by
              intro h
              exact hcv_not_rest (h ▸ hdrest)
            have : d = c := huniq d ⟨hd_old, hd.2⟩
            exact absurd (this.trans hccv) hd_ne_cv
      · have hc_rest : c ∈ rest' := by
          have hc_perm : c ∈ cu :: cv :: rest' := (hperm.mem_iff).mp hc.1
          rcases List.mem_cons.mp hc_perm with rfl | hc_perm
          · exact absurd rfl hccu
          · rcases List.mem_cons.mp hc_perm with rfl | hc_perm
            · exact absurd rfl hccv
            · exact hc_perm
        refine ⟨c, ⟨by simp [hc_rest], hc.2⟩, ?_⟩
        intro d hd
        rcases List.mem_cons.mp hd.1 with rfl | hdrest
        · rw [mem_maskSet_or] at hd
          rcases hd.2 with hvcu | hvcv
          · have hcu_old : cu ∈ comps := hcu_mem
            have hthis : cu = c := huniq cu ⟨hcu_old, hvcu⟩
            exact absurd hthis.symm hccu
          · have hthis : cv = c := huniq cv ⟨hcv_mem, hvcv⟩
            exact absurd hthis.symm hccv
        · have hd_old : d ∈ comps := (hperm.mem_iff).mpr (by simp [hdrest])
          have : d = c := huniq d ⟨hd_old, hd.2⟩
          exact this
  constructor
  · intro d hd
    rcases List.mem_cons.mp hd with rfl | hd
    · obtain ⟨u, hu⟩ := hne cu hcu_mem
      exact ⟨u, by rw [mem_maskSet_or]; exact Or.inl hu⟩
    · exact hne d ((hperm.mem_iff).mpr (by simp [hd]))
  · intro d hd
    rcases List.mem_cons.mp hd with rfl | hd
    · have hdisj : Disjoint (maskSet cu.1) (maskSet cv.1) :=
        covered_disjoint hcov hcu_mem hcv_mem hcu_ne
      rw [card_maskSet_or cu.1 cv.1 hdisj]
      have h1 := hsize cu hcu_mem
      have h2 := hsize cv hcv_mem
      simp only
      omega
    · exact hsize d ((hperm.mem_iff).mpr (by simp [hd]))


theorem uf_merge_state {comps rest' : List (Nat × Nat)} {cu cv : Nat × Nat}
    (hperm : comps.Perm (cu :: cv :: rest'))
    (hcov : Covered comps) {u v : Fin 31}
    (hu : u ∈ maskSet cu.1) (hv : v ∈ maskSet cv.1) (hcu_ne : cu ≠ cv)
    (a b : Fin 31) :
    UF ((cu.1 ||| cv.1, cu.2 + cv.2) :: rest') a b ↔
      UF comps a b ∨ (UF comps a u ∧ UF comps v b) ∨
        (UF comps a v ∧ UF comps u b) := by
  have hcu_mem : cu ∈ comps := (hperm.mem_iff).mpr (by simp)
  have hcv_mem : cv ∈ comps := (hperm.mem_iff).mpr (by simp)
  constructor
  · rintro ⟨c, hc, ha, hb⟩
    rcases List.mem_cons.mp hc with rfl | hcrest
    · rw [mem_maskSet_or] at ha hb
      rcases ha with ha | ha <;> rcases hb with hb | hb
      · exact Or.inl ⟨cu, hcu_mem, ha, hb⟩
      · exact Or.inr (Or.inl ⟨⟨cu, hcu_mem, ha, hu⟩, ⟨cv, hcv_mem, hv, hb⟩⟩)
      · exact Or.inr (Or.inr ⟨⟨cv, hcv_mem, ha, hv⟩, ⟨cu, hcu_mem, hu, hb⟩⟩)
      · exact Or.inl ⟨cv, hcv_mem, ha, hb⟩
    · have hc_old : c ∈ comps := (hperm.mem_iff).mpr (by simp [hcrest])
      exact Or.inl ⟨c, hc_old, ha, hb⟩
  · rintro (hab | ⟨hau, hvb⟩ | ⟨hav, hub⟩)
    · obtain ⟨c, hc, ha, hb⟩ := hab
      have hc_perm : c ∈ cu :: cv :: rest' := (hperm.mem_iff).mp hc
      rcases List.mem_cons.mp hc_perm with hceq | hc_perm
      · subst c
        exact ⟨(cu.1 ||| cv.1, cu.2 + cv.2), by simp,
          (mem_maskSet_or _ _ _).mpr (Or.inl ha), (mem_maskSet_or _ _ _).mpr (Or.inl hb)⟩
      · rcases List.mem_cons.mp hc_perm with hceq | hc_perm
        · subst c
          exact ⟨(cu.1 ||| cv.1, cu.2 + cv.2), by simp,
            (mem_maskSet_or _ _ _).mpr (Or.inr ha), (mem_maskSet_or _ _ _).mpr (Or.inr hb)⟩
        · exact ⟨c, by simp [hc_perm], ha, hb⟩
    · obtain ⟨c1, hc1, ha, hu'⟩ := hau
      obtain ⟨c2, hc2, hv', hb⟩ := hvb
      have hc1_eq : c1 = cu := covered_eq_of_common hcov hc1 hcu_mem hu' hu
      have hc2_eq : c2 = cv := covered_eq_of_common hcov hc2 hcv_mem hv' hv
      subst c1
      subst c2
      exact ⟨(cu.1 ||| cv.1, cu.2 + cv.2), by simp,
        (mem_maskSet_or _ _ _).mpr (Or.inl ha), (mem_maskSet_or _ _ _).mpr (Or.inr hb)⟩
    · obtain ⟨c1, hc1, ha, hv'⟩ := hav
      obtain ⟨c2, hc2, hu', hb⟩ := hub
      have hc1_eq : c1 = cv := covered_eq_of_common hcov hc1 hcv_mem hv' hv
      have hc2_eq : c2 = cu := covered_eq_of_common hcov hc2 hcu_mem hu' hu
      subst c1
      subst c2
      exact ⟨(cu.1 ||| cv.1, cu.2 + cv.2), by simp,
        (mem_maskSet_or _ _ _).mpr (Or.inr ha), (mem_maskSet_or _ _ _).mpr (Or.inl hb)⟩


/-- The adjacency relation of ddEdgeGraph. -/
def addEdgeRel (H : SimpleGraph (Fin 31)) (u v : Fin 31) (x y : Fin 31) : Prop :=
  H.Adj x y ∨ (x = u ∧ y = v) ∨ (x = v ∧ y = u)

/-- Add one undirected edge {u, v} (u ≠ v) to a graph. -/
def addEdgeGraph (H : SimpleGraph (Fin 31)) (u v : Fin 31) (huv : u ≠ v) :
    SimpleGraph (Fin 31) where
  Adj x y := H.Adj x y ∨ (x = u ∧ y = v) ∨ (x = v ∧ y = u)
  symm := ⟨by
    intro x y h
    rcases h with h | h | h
    · exact Or.inl (H.symm.symm x y h)
    · exact Or.inr (Or.inr ⟨h.2, h.1⟩)
    · exact Or.inr (Or.inl ⟨h.2, h.1⟩)⟩
  loopless := ⟨by
    intro x h
    rcases h with h | h | h
    · exact H.loopless.irrefl x h
    · exact huv (h.1.symm.trans h.2)
    · exact huv (h.2.symm.trans h.1)⟩

theorem rtg_mono_addEdge (H : SimpleGraph (Fin 31)) (u v a b : Fin 31)
    (h : Relation.ReflTransGen H.Adj a b) :
    Relation.ReflTransGen (addEdgeRel H u v) a b := by
  induction h with
  | refl => exact Relation.ReflTransGen.refl
  | tail hbc hcd ih => exact ih.tail (Or.inl hcd)


theorem addEdgeGraph_adj (H : SimpleGraph (Fin 31)) (u v : Fin 31) (huv : u ≠ v)
    (x y : Fin 31) : (addEdgeGraph H u v huv).Adj x y ↔ addEdgeRel H u v x y := Iff.rfl

theorem reflTransGen_addEdgeRel (H : SimpleGraph (Fin 31)) (u v a b : Fin 31) :
    Relation.ReflTransGen (addEdgeRel H u v) a b ↔
      Relation.ReflTransGen H.Adj a b ∨
        (Relation.ReflTransGen H.Adj a u ∧ Relation.ReflTransGen H.Adj v b) ∨
        (Relation.ReflTransGen H.Adj a v ∧ Relation.ReflTransGen H.Adj u b) := by
  constructor
  · intro h
    induction h with
    | refl => exact Or.inl Relation.ReflTransGen.refl
    | @tail b c hab hbc ih =>
      rcases ih with hbase | ⟨hau, hvb⟩ | ⟨hav, hub⟩
      · rcases hbc with hstep | hstep | hstep
        · exact Or.inl (hbase.trans (Relation.ReflTransGen.single hstep))
        · rcases hstep with ⟨rfl, rfl⟩
          exact Or.inr (Or.inl ⟨hbase, Relation.ReflTransGen.refl⟩)
        · rcases hstep with ⟨rfl, rfl⟩
          exact Or.inr (Or.inr ⟨hbase, Relation.ReflTransGen.refl⟩)
      · rcases hbc with hstep | hstep | hstep
        · exact Or.inr (Or.inl ⟨hau, hvb.trans (Relation.ReflTransGen.single hstep)⟩)
        · rcases hstep with ⟨rfl, rfl⟩
          exact Or.inr (Or.inl ⟨hau, Relation.ReflTransGen.refl⟩)
        · rcases hstep with ⟨rfl, rfl⟩
          exact Or.inl hau
      · rcases hbc with hstep | hstep | hstep
        · exact Or.inr (Or.inr ⟨hav, hub.trans (Relation.ReflTransGen.single hstep)⟩)
        · rcases hstep with ⟨rfl, rfl⟩
          exact Or.inl hav
        · rcases hstep with ⟨rfl, rfl⟩
          exact Or.inr (Or.inr ⟨hav, Relation.ReflTransGen.refl⟩)
  · rintro (hab | ⟨hau, hvb⟩ | ⟨hav, hub⟩)
    · exact rtg_mono_addEdge H u v a b hab
    · have h1 : Relation.ReflTransGen (addEdgeRel H u v) a u := rtg_mono_addEdge H u v a u hau
      have h2 : Relation.ReflTransGen (addEdgeRel H u v) v b := rtg_mono_addEdge H u v v b hvb
      exact h1.trans ((Relation.ReflTransGen.single (r := addEdgeRel H u v)
        (Or.inr (Or.inl ⟨rfl, rfl⟩))).trans h2)
    · have h1 : Relation.ReflTransGen (addEdgeRel H u v) a v := rtg_mono_addEdge H u v a v hav
      have h2 : Relation.ReflTransGen (addEdgeRel H u v) u b := rtg_mono_addEdge H u v u b hub
      exact h1.trans ((Relation.ReflTransGen.single (r := addEdgeRel H u v)
        (Or.inr (Or.inr ⟨rfl, rfl⟩))).trans h2)

theorem reachable_addEdgeGraph (H : SimpleGraph (Fin 31)) (u v : Fin 31) (huv : u ≠ v)
    (a b : Fin 31) :
    (addEdgeGraph H u v huv).Reachable a b ↔
      H.Reachable a b ∨ (H.Reachable a u ∧ H.Reachable v b) ∨
        (H.Reachable a v ∧ H.Reachable u b) := by
  simp only [SimpleGraph.reachable_iff_reflTransGen]
  change Relation.ReflTransGen (addEdgeGraph H u v huv).Adj a b ↔ _
  rw [show (addEdgeGraph H u v huv).Adj = addEdgeRel H u v from rfl]
  rw [reflTransGen_addEdgeRel]


theorem edgeAt_castLE_last (i : Nat) (hi : i < 30) (hk : i + 1 ≤ 30) :
    edgeAt (Fin.castLE hk (Fin.last i)) = edgeAt ⟨i, hi⟩ := rfl

theorem edgeAt_castLE_castSucc {i : Nat} (hi : i < 30) (hk : i + 1 ≤ 30)
    (j : Fin i) :
    edgeAt (Fin.castLE hk (Fin.castSucc j)) = edgeAt (Fin.castLE (by omega) j) := rfl

theorem prefixGraph_succ_adj {i : Nat} (hi : i < 30) (hk : i + 1 ≤ 30) (mask : Nat)
    (a b : Fin 31) :
    (prefixGraph (i + 1) hk mask).Adj a b ↔
      (prefixGraph i (by omega) mask).Adj a b ∨
        (¬ mask.testBit i ∧
          (((edgeAt ⟨i, hi⟩).1 = a ∧ (edgeAt ⟨i, hi⟩).2 = b) ∨
           ((edgeAt ⟨i, hi⟩).1 = b ∧ (edgeAt ⟨i, hi⟩).2 = a))) := by
  constructor
  · rintro ⟨j, hbit, hend⟩
    rcases Fin.eq_castSucc_or_eq_last j with ⟨j', rfl⟩ | rfl
    · left
      refine ⟨j', ?_, ?_⟩
      · simpa using hbit
      · simpa using hend
    · right
      refine ⟨by simpa using hbit, ?_⟩
      simpa [edgeAt_castLE_last i hi hk] using hend
  · rintro (h | ⟨hbit, hend⟩)
    · rcases h with ⟨j', hbit, hend⟩
      refine ⟨Fin.castSucc j', ?_, ?_⟩
      · simpa using hbit
      · simpa using hend
    · refine ⟨Fin.last i, ?_, ?_⟩
      · simpa using hbit
      · simpa [edgeAt_castLE_last i hi hk] using hend


theorem represents_of_perm {comps comps' : List (Nat × Nat)} {H : SimpleGraph (Fin 31)}
    (h : comps.Perm comps') (hrep : Represents comps H) : Represents comps' H := by
  rcases hrep with ⟨hnd, hcov, hne, hsize, huf⟩
  refine ⟨(h.nodup_iff).mp hnd, covered_of_perm h hcov,
    masksNonempty_of_perm h hne, sizeCorrect_of_perm h hsize, ?_⟩
  intro u v
  rw [← uf_of_perm h u v]
  exact huf u v

theorem addEdge_same {comps : List (Nat × Nat)} {u v : Fin 31} {cu : Nat × Nat}
    {rest : List (Nat × Nat)}
    (hcu : extract (bitOf u) comps = (cu, rest))
    (hzero : extract (bitOf v) rest = ((0, 0), rest)) :
    addEdge comps u.val v.val = cu :: rest := by
  unfold addEdge
  rw [show extract (1 <<< u.val) comps = (cu, rest) from by simpa [bitOf] using hcu]
  dsimp only
  rw [show extract (1 <<< v.val) rest = ((0, 0), rest) from by simpa [bitOf] using hzero]
  simp

theorem addEdge_diff {comps : List (Nat × Nat)} {u v : Fin 31}
    {cu cv : Nat × Nat} {restList restList' : List (Nat × Nat)}
    (hcu : extract (bitOf u) comps = (cu, restList))
    (hcv : extract (bitOf v) restList = (cv, restList')) :
    addEdge comps u.val v.val = (cu.1 ||| cv.1, cu.2 + cv.2) :: restList' := by
  unfold addEdge
  rw [show extract (1 <<< u.val) comps = (cu, restList) from by simpa [bitOf] using hcu]
  dsimp only
  rw [show extract (1 <<< v.val) restList = (cv, restList') from by simpa [bitOf] using hcv]


theorem represents_congr {comps : List (Nat × Nat)} {H H' : SimpleGraph (Fin 31)}
    (h : ∀ a b, H.Reachable a b ↔ H'.Reachable a b) (hrep : Represents comps H) :
    Represents comps H' := by
  rcases hrep with ⟨hnd, hcov, hne, hsize, huf⟩
  exact ⟨hnd, hcov, hne, hsize, fun a b => (huf a b).trans (h a b)⟩

theorem mem_maskSet_iff (m : Nat) (v : Fin 31) : v ∈ maskSet m ↔ InMask m v := by
  simp [maskSet]

theorem addEdge_represents {comps : List (Nat × Nat)} {H : SimpleGraph (Fin 31)}
    {u v : Fin 31} (huv : u ≠ v) (hrep : Represents comps H) :
    Represents (addEdge comps u.val v.val) (addEdgeGraph H u v huv) := by
  rcases hrep with ⟨hnd, hcov, hne, hsize, huf⟩
  obtain ⟨c, ⟨hc_mem, hc_u⟩, hc_uniq⟩ := hcov u
  have hc_bit : (c.1 &&& bitOf u) = bitOf u :=
    (land_bitOf_iff c.1 u).mpr ((mem_maskSet_iff c.1 u).mp hc_u)
  have hcu_ne0 : (extract (bitOf u) comps).1 ≠ (0, 0) :=
    extract_ne_zero_of_mem (bitOf_ne_zero u) hc_mem hc_bit
  generalize hcu_eq : extract (bitOf u) comps = r
  obtain ⟨cu, rest⟩ := r
  have hcu_mem : cu ∈ comps := by
    simpa [hcu_eq] using extract_mem hcu_ne0
  have hcu_bit : (cu.1 &&& bitOf u) = bitOf u := by
    simpa [hcu_eq] using extract_contains hcu_ne0
  have hu : u ∈ maskSet cu.1 := (mem_maskSet_iff cu.1 u).mpr ((land_bitOf_iff cu.1 u).mp hcu_bit)
  have hperm1 : comps.Perm (cu :: rest) := by
    simpa [hcu_eq] using extract_perm hnd hcu_ne0
  have hrest_nodup : rest.Nodup := (List.nodup_cons.mp ((hperm1.nodup_iff).mp hnd)).2
  by_cases hvcu : v ∈ maskSet cu.1
  · have hnot : ∀ d ∈ rest, ¬ ((d.1 &&& bitOf v) = bitOf v) := by
      intro d hd hbit
      have hd_in : d ∈ (extract (bitOf u) comps).2 := by simpa [hcu_eq] using hd
      have hd_mem : d ∈ comps := extract_rest_subset d hd_in
      have hdv : v ∈ maskSet d.1 :=
        (mem_maskSet_iff d.1 v).mpr ((land_bitOf_iff d.1 v).mp hbit)
      have hd_ne : d ≠ cu := by
        intro h
        have hcu_not_rest : cu ∉ rest := (List.nodup_cons.mp ((hperm1.nodup_iff).mp hnd)).1
        exact hcu_not_rest (h ▸ hd)
      exact hd_ne (covered_eq_of_common hcov hd_mem hcu_mem hdv hvcu)
    have hzero : extract (bitOf v) rest = ((0, 0), rest) := extract_eq_zero_of_forall hnot
    have hadd : addEdge comps u.val v.val = cu :: rest := addEdge_same hcu_eq hzero
    have hrep' : Represents (cu :: rest) H :=
      represents_of_perm hperm1 ⟨hnd, hcov, hne, hsize, huf⟩
    have huv_reach : H.Reachable u v := (huf u v).mp ⟨cu, hcu_mem, hu, hvcu⟩
    have hgraph : Represents (cu :: rest) (addEdgeGraph H u v huv) := by
      refine represents_congr (fun a b => ?_) hrep'
      rw [reachable_addEdgeGraph]
      constructor
      · intro h
        exact Or.inl h
      · rintro (h | ⟨hau, hvb⟩ | ⟨hav, hub⟩)
        · exact h
        · exact hau.trans (huv_reach.trans hvb)
        · exact hav.trans (huv_reach.symm.trans hub)
    rw [hadd]
    exact hgraph
  · obtain ⟨d, ⟨hd_mem, hd_v⟩, hd_uniq⟩ := hcov v
    have hd_bit : (d.1 &&& bitOf v) = bitOf v :=
      (land_bitOf_iff d.1 v).mpr ((mem_maskSet_iff d.1 v).mp hd_v)
    have hd_ne_cu : d ≠ cu := by
      intro h
      exact hvcu (h ▸ hd_v)
    have hd_rest : d ∈ rest := by
      have h := extract_rest_of_ne hnd hd_mem (by rw [hcu_eq]; exact hd_ne_cu)
      simpa [hcu_eq] using h
    have hcv_ne0 : (extract (bitOf v) rest).1 ≠ (0, 0) :=
      extract_ne_zero_of_mem (bitOf_ne_zero v) hd_rest hd_bit
    generalize hcv_eq : extract (bitOf v) rest = r2
    obtain ⟨cv, rest'⟩ := r2
    have hcv_mem_rest : cv ∈ rest := by
      simpa [hcv_eq] using extract_mem hcv_ne0
    have hcv_bit : (cv.1 &&& bitOf v) = bitOf v := by
      simpa [hcv_eq] using extract_contains hcv_ne0
    have hv : v ∈ maskSet cv.1 := (mem_maskSet_iff cv.1 v).mpr ((land_bitOf_iff cv.1 v).mp hcv_bit)
    have hperm2 : rest.Perm (cv :: rest') := by
      simpa [hcv_eq] using extract_perm hrest_nodup hcv_ne0
    have hperm : comps.Perm (cu :: cv :: rest') := hperm1.trans (List.Perm.cons cu hperm2)
    have hnd' : (cu :: cv :: rest').Nodup := (hperm.nodup_iff).mp hnd
    have hcu_ne : cu ≠ cv := by
      intro h
      have hnot : cu ∉ cv :: rest' := (List.nodup_cons.mp hnd').1
      exact hnot (by simp [h])
    have hadd : addEdge comps u.val v.val = (cu.1 ||| cv.1, cu.2 + cv.2) :: rest' :=
      addEdge_diff hcu_eq hcv_eq
    rcases merge_state hperm hnd hcov hne hsize hcu_ne with ⟨hmnodup, hmcov, hmne, hmsize⟩
    have hufm := fun a b => uf_merge_state hperm hcov hu hv hcu_ne a b
    rw [hadd]
    refine ⟨hmnodup, hmcov, hmne, hmsize, fun a b => ?_⟩
    rw [hufm a b, reachable_addEdgeGraph]
    constructor
    · rintro (h | ⟨hau, hvb⟩ | ⟨hav, hub⟩)
      · exact Or.inl ((huf a b).mp h)
      · exact Or.inr (Or.inl ⟨(huf a u).mp hau, (huf v b).mp hvb⟩)
      · exact Or.inr (Or.inr ⟨(huf a v).mp hav, (huf u b).mp hub⟩)
    · rintro (h | ⟨hau, hvb⟩ | ⟨hav, hub⟩)
      · exact Or.inl ((huf a b).mpr h)
      · exact Or.inr (Or.inl ⟨(huf a u).mpr hau, (huf v b).mpr hvb⟩)
      · exact Or.inr (Or.inr ⟨(huf a v).mpr hav, (huf u b).mpr hub⟩)

theorem edgeTable_getD_eq (i : Fin 30) :
    edgeTable.getD i.val (0, 0) = ((edgeAt i).1.val, (edgeAt i).2.val) := by
  revert i
  decide

theorem prefixGraph_succ_of_cut {i : Nat} (hi : i < 30) (hk : i + 1 ≤ 30)
    {mask : Nat} (hcut : mask.testBit i = true) :
    prefixGraph (i + 1) hk mask = prefixGraph i (by omega) mask := by
  ext a b
  rw [prefixGraph_succ_adj hi hk]
  simp [hcut]

theorem prefixGraph_succ_of_kept {i : Nat} (hi : i < 30) (hk : i + 1 ≤ 30)
    {mask : Nat} (hcut : mask.testBit i = false) :
    prefixGraph (i + 1) hk mask =
      addEdgeGraph (prefixGraph i (by omega) mask) (edgeAt ⟨i, hi⟩).1 (edgeAt ⟨i, hi⟩).2
        (edgeAt_ne ⟨i, hi⟩) := by
  ext a b
  rw [prefixGraph_succ_adj hi hk]
  simp [addEdgeGraph, hcut, and_comm, or_assoc, eq_comm]

/-- The one-edge step of the checker: cut the edge or union its endpoints. -/
def stepEdge (i : Nat) (mask : Nat) (comps : List (Nat × Nat)) : List (Nat × Nat) :=
  if mask.testBit i then comps
  else
    let (u, v) := edgeTable.getD i (0, 0)
    addEdge comps u v

theorem processEdgesAux_one (i : Nat) (mask : Nat) (comps : List (Nat × Nat)) :
    processEdgesAux 1 i mask comps = stepEdge i mask comps := rfl

theorem stepEdge_represents {i : Nat} (hi : i < 30) (mask : Nat) (comps : List (Nat × Nat))
    (hrep : Represents comps (prefixGraph i (by omega) mask)) :
    Represents (stepEdge i mask comps) (prefixGraph (i + 1) (by omega) mask) := by
  by_cases hcut : mask.testBit i
  · simp only [stepEdge, hcut, reduceIte]
    rw [prefixGraph_succ_of_cut hi (by omega) (mask := mask) hcut]
    exact hrep
  · have hcutf : mask.testBit i = false := by simpa using hcut
    simp only [stepEdge, hcut, reduceIte]
    let u : Fin 31 := (edgeAt ⟨i, hi⟩).1
    let v : Fin 31 := (edgeAt ⟨i, hi⟩).2
    have huv : u ≠ v := edgeAt_ne ⟨i, hi⟩
    have hget := edgeTable_getD_eq ⟨i, hi⟩
    have hadd : addEdge comps (edgeTable.getD i (0, 0)).1 (edgeTable.getD i (0, 0)).2 =
        addEdge comps u.val v.val := by
      rw [hget]
    rw [hadd]
    rw [prefixGraph_succ_of_kept hi (by omega) (mask := mask) hcutf]
    exact addEdge_represents huv hrep

theorem processEdgesAux_represents (fuel i : Nat) (mask : Nat) (comps : List (Nat × Nat))
    (hi : i + fuel ≤ 30) :
    Represents comps (prefixGraph i (by omega) mask) →
      Represents (processEdgesAux fuel i mask comps) (prefixGraph (i + fuel) (by omega) mask) := by
  induction fuel generalizing i comps with
  | zero =>
    intro hrep
    simpa using hrep
  | succ fuel ih =>
    intro hrep
    have hi30 : i < 30 := by omega
    have hstep := stepEdge_represents hi30 mask comps hrep
    have hrec := ih (i + 1) (stepEdge i mask comps) (by omega) hstep
    rw [show processEdgesAux (fuel + 1) i mask comps =
        processEdgesAux fuel (i + 1) mask (stepEdge i mask comps) from rfl]
    simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hrec

theorem compList_represents_mask (mask : Nat) :
    Represents (compList 31) (prefixGraph 0 (by decide) mask) := by
  refine ⟨(by decide : (compList 31).Nodup), compList_covered, compList_nonempty,
    compList_sizeCorrect, ?_⟩
  intro u v
  rw [compList_uf, prefixGraph_zero, SimpleGraph.reachable_bot]

theorem processEdges_represents (mask : Nat) :
    Represents (processEdges mask) (cutGraph mask) := by
  unfold processEdges cutGraph
  exact processEdgesAux_represents 30 0 mask (compList 31) (by omega)
    (compList_represents_mask mask)

theorem insertDesc_perm (x : Nat) (l : List Nat) : (insertDesc x l).Perm (x :: l) := by
  induction l with
  | nil => simp [insertDesc]
  | cons y ys ih =>
    simp only [insertDesc]
    split
    · simp
    · exact (List.Perm.cons y ih).trans (List.Perm.swap x y ys)

theorem sortDesc_perm (l : List Nat) : (sortDesc l).Perm l := by
  induction l with
  | nil => simp [sortDesc]
  | cons x xs ih =>
    exact (insertDesc_perm x (sortDesc xs)).trans (List.Perm.cons x ih)

theorem insertDesc_pairwise (x : Nat) (l : List Nat) (h : l.Pairwise (· ≥ ·)) :
    (insertDesc x l).Pairwise (· ≥ ·) := by
  induction l with
  | nil => simp [insertDesc]
  | cons y ys ih =>
    simp only [insertDesc]
    split
    · rename_i hxy
      rw [List.pairwise_cons]
      refine ⟨?_, h⟩
      intro z hz
      rcases List.mem_cons.mp hz with rfl | hz
      · exact hxy
      · have hyz : y ≥ z := (List.pairwise_cons.mp h).1 z hz
        exact le_trans hyz hxy
    · rename_i hxy
      have hyx : y ≥ x := by omega
      rw [List.pairwise_cons]
      refine ⟨?_, ih (List.pairwise_cons.mp h).2⟩
      intro z hz
      have hz' : z = x ∨ z ∈ ys := by
        have := (insertDesc_perm x ys).mem_iff.mp hz
        simpa using this
      rcases hz' with rfl | hz
      · exact hyx
      · exact (List.pairwise_cons.mp h).1 z hz

theorem sortDesc_pairwise (l : List Nat) : (sortDesc l).Pairwise (· ≥ ·) := by
  induction l with
  | nil => simp [sortDesc]
  | cons x xs ih => exact insertDesc_pairwise x (sortDesc xs) ih

noncomputable def suppFinset (H : SimpleGraph (Fin 31)) (C : H.ConnectedComponent) :
    Finset (Fin 31) := by
  classical
  exact Finset.univ.filter (fun v => v ∈ C.supp)

noncomputable def componentCard (H : SimpleGraph (Fin 31)) (C : H.ConnectedComponent) : Nat :=
  (suppFinset H C).card

theorem suppFinset_mem {H : SimpleGraph (Fin 31)} (C : H.ConnectedComponent) (v : Fin 31) :
    v ∈ suppFinset H C ↔ v ∈ C.supp := by
  classical
  simp [suppFinset]

noncomputable def compOf (comps : List (Nat × Nat)) (H : SimpleGraph (Fin 31))
    (hne : MasksNonempty comps) (c : Nat × Nat) (hc : c ∈ comps) : H.ConnectedComponent :=
  H.connectedComponentMk (Classical.choose (hne c hc))

theorem compOf_supp_eq {comps : List (Nat × Nat)} {H : SimpleGraph (Fin 31)}
    (hrep : Represents comps H) {c : Nat × Nat} (hc : c ∈ comps) :
    suppFinset H (compOf comps H hrep.2.2.1 c hc) = maskSet c.1 := by
  rcases hrep with ⟨hnd, hcov, hne, hsize, huf⟩
  let r : Fin 31 := Classical.choose (hne c hc)
  have hr : r ∈ maskSet c.1 := Classical.choose_spec (hne c hc)
  ext v
  rw [suppFinset_mem, SimpleGraph.ConnectedComponent.mem_supp_iff]
  change H.connectedComponentMk v = H.connectedComponentMk r ↔ v ∈ maskSet c.1
  rw [SimpleGraph.ConnectedComponent.eq]
  constructor
  · intro hreach
    have hufv : UF comps v r := (huf v r).mpr hreach
    obtain ⟨d, hd, hv_d, hr_d⟩ := hufv
    have hdc : d = c := covered_eq_of_common hcov hd hc hr_d hr
    rw [hdc] at hv_d
    exact hv_d
  · intro hv
    have hufv : UF comps v r := ⟨c, hc, hv, hr⟩
    exact (huf v r).mp hufv

theorem compOf_card {comps : List (Nat × Nat)} {H : SimpleGraph (Fin 31)}
    (hrep : Represents comps H) {c : Nat × Nat} (hc : c ∈ comps) :
    componentCard H (compOf comps H hrep.2.2.1 c hc) = c.2 := by
  rcases hrep with ⟨hnd, hcov, hne, hsize, huf⟩
  unfold componentCard
  rw [compOf_supp_eq ⟨hnd, hcov, hne, hsize, huf⟩ hc]
  exact (hsize c hc).symm

theorem compOf_injective {comps : List (Nat × Nat)} {H : SimpleGraph (Fin 31)}
    (hrep : Represents comps H) {c d : Nat × Nat} (hc : c ∈ comps) (hd : d ∈ comps)
    (hcd : compOf comps H hrep.2.2.1 c hc = compOf comps H hrep.2.2.1 d hd) : c = d := by
  rcases hrep with ⟨hnd, hcov, hne, hsize, huf⟩
  let r : Fin 31 := Classical.choose (hne c hc)
  let s : Fin 31 := Classical.choose (hne d hd)
  have hr : r ∈ maskSet c.1 := Classical.choose_spec (hne c hc)
  have hs : s ∈ maskSet d.1 := Classical.choose_spec (hne d hd)
  have hr_supp : r ∈ (compOf comps H hne c hc).supp := by
    rw [SimpleGraph.ConnectedComponent.mem_supp_iff]
    rfl
  have hr_supp_d : r ∈ (compOf comps H hne d hd).supp := by
    rwa [hcd] at hr_supp
  have hreach : H.Reachable r s := by
    rw [SimpleGraph.ConnectedComponent.mem_supp_iff] at hr_supp_d
    have : H.connectedComponentMk r = H.connectedComponentMk s := by
      simpa [compOf] using hr_supp_d
    exact SimpleGraph.ConnectedComponent.eq.mp this
  have hufr : UF comps r s := (huf r s).mpr hreach
  obtain ⟨e, he, hre, hse⟩ := hufr
  have hec : e = c := covered_eq_of_common hcov he hc hre hr
  have hed : e = d := covered_eq_of_common hcov he hd hse hs
  exact hec.symm.trans hed

theorem compOf_surjective {comps : List (Nat × Nat)} {H : SimpleGraph (Fin 31)}
    (hrep : Represents comps H) (C : H.ConnectedComponent) :
    ∃ (c : Nat × Nat) (hc : c ∈ comps), compOf comps H hrep.2.2.1 c hc = C := by
  rcases hrep with ⟨hnd, hcov, hne, hsize, huf⟩
  obtain ⟨v, hv⟩ := C.nonempty_supp
  obtain ⟨c, ⟨hc, hcv⟩, hcuniq⟩ := hcov v
  refine ⟨c, hc, ?_⟩
  apply SimpleGraph.ConnectedComponent.eq_of_common_vertex
  · have : v ∈ suppFinset H (compOf comps H hne c hc) := by
      rw [compOf_supp_eq ⟨hnd, hcov, hne, hsize, huf⟩ hc]
      exact hcv
    exact (suppFinset_mem _ _).mp this
  · exact hv

noncomputable def compListOf (comps : List (Nat × Nat)) (H : SimpleGraph (Fin 31))
    (hne : MasksNonempty comps) : List H.ConnectedComponent :=
  comps.attach.map (fun c => compOf comps H hne c.1 c.2)

theorem compListOf_nodup {comps : List (Nat × Nat)} {H : SimpleGraph (Fin 31)}
    (hrep : Represents comps H) :
    (compListOf comps H hrep.2.2.1).Nodup := by
  rcases hrep with ⟨hnd, hcov, hne, hsize, huf⟩
  unfold compListOf
  apply List.Nodup.map_on
  · intro a ha b hb heq
    exact Subtype.ext (compOf_injective ⟨hnd, hcov, hne, hsize, huf⟩ a.2 b.2 heq)
  · exact hnd.attach

theorem compListOf_complete {comps : List (Nat × Nat)} {H : SimpleGraph (Fin 31)}
    (hrep : Represents comps H) (C : H.ConnectedComponent) :
    C ∈ compListOf comps H hrep.2.2.1 := by
  rcases hrep with ⟨hnd, hcov, hne, hsize, huf⟩
  obtain ⟨c, hc, hC⟩ := compOf_surjective ⟨hnd, hcov, hne, hsize, huf⟩ C
  unfold compListOf
  rw [← hC]
  exact List.mem_map.mpr ⟨⟨c, hc⟩, List.mem_attach _ _, rfl⟩

theorem compListOf_card {comps : List (Nat × Nat)} {H : SimpleGraph (Fin 31)}
    (hrep : Represents comps H) :
    (compListOf comps H hrep.2.2.1).map (componentCard H) = comps.map (fun c => c.2) := by
  rcases hrep with ⟨hnd, hcov, hne, hsize, huf⟩
  unfold compListOf
  rw [List.map_map]
  trans (comps.attach.map (fun c => c.1.2))
  · apply List.map_congr_left
    intro c _hc
    exact compOf_card ⟨hnd, hcov, hne, hsize, huf⟩ c.2
  · exact List.attach_map_val

theorem sizes_eq_components (mask : Nat) :
    ∃ (C : List ((cutGraph mask).ConnectedComponent)),
      C.Nodup ∧
      (∀ D : (cutGraph mask).ConnectedComponent, D ∈ C) ∧
      sizes mask = sortDesc (C.map (componentCard (cutGraph mask))) := by
  rcases processEdges_represents mask with ⟨hnd, hcov, hne, hsize, huf⟩
  let comps := processEdges mask
  let H := cutGraph mask
  have hrep : Represents comps H := ⟨hnd, hcov, hne, hsize, huf⟩
  refine ⟨compListOf comps H hne, compListOf_nodup hrep,
    fun C => compListOf_complete hrep C, ?_⟩
  unfold sizes
  change sortDesc (comps.map (fun c => c.2)) =
    sortDesc ((compListOf comps H hne).map (componentCard H))
  rw [compListOf_card hrep]

end LiFinal