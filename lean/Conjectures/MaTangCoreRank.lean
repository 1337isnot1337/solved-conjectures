import Conjectures.MaTangCoreSubspace

/-!
# Ma–Tang's random subset-sum threshold conjecture

Exact finite rank-nullity for a surjective binary matrix. This is proved
by constructing a bijection between the binary domain and the product
of the codomain and an encoded kernel; cardinalities are derived from
duplicate-free enumerations, without a rank-nullity axiom.
-/

namespace MaTangCoreRank

open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace

theorem xorVec_zero_right (u : List Bool) :
    xorVec u (List.replicate u.length false) = u := by
  induction u with
  | nil => rfl
  | cons b bs ih =>
    cases b <;> simp [xorVec,List.replicate_succ,ih]

theorem rowDot_zero_right (row : List Bool) (n : Nat) :
    rowDot row (List.replicate n false) = false := by
  induction row generalizing n with
  | nil => rfl
  | cons b bs ih =>
    cases n with
    | zero => rfl
    | succ n => simp [rowDot,List.replicate_succ,ih n]

theorem applyMatrix_zero_right (rows : List (List Bool)) (n : Nat) :
    applyMatrix rows (List.replicate n false) = List.replicate rows.length false := by
  induction rows with
  | nil => rfl
  | cons r rs ih =>
    change rowDot r (List.replicate n false) :: applyMatrix rs (List.replicate n false) =
      List.replicate (rs.length+1) false
    rw [rowDot_zero_right,ih,List.replicate_succ]

def kernelSpace (rows : List (List Bool)) (k : Nat) : BinarySubspace k where
  contains u := u.length = k ∧ applyMatrix rows u = List.replicate rows.length false
  length_eq _ h := h.1
  zero_mem := ⟨by simp,applyMatrix_zero_right rows k⟩
  xor_mem u v hu hv := by
    have h : u.length = v.length := hu.1.trans hv.1.symm
    refine ⟨(xorVec_length u v h).trans hu.1,?_⟩
    rw [applyMatrix_xor rows u v h,hu.2,hv.2,xorVec_self]
    simp

def cube (n : Nat) : List (List Bool) := words [false,true] n

theorem cube_mem (n : Nat) (u : List Bool) :
    u ∈ cube n ↔ u.length = n := by
  rw [cube,mem_words]
  constructor
  · exact And.left
  · intro h
    refine ⟨h,?_⟩
    intro a _
    cases a <;> simp

theorem cube_nodup (n : Nat) : (cube n).Nodup :=
  nodup_words [false,true] n (by simp)

theorem cube_length (n : Nat) : (cube n).length = 2^n := by
  simp [cube,words_length]

/-- Basic finite-set cardinal comparison from a duplicate-free list
and a membership inclusion, without assuming any cardinality theory. -/
theorem nodup_subset_length {α : Type} [BEq α] [LawfulBEq α]
    (xs ys : List α) (hx : xs.Nodup) (h : ∀ x ∈ xs, x ∈ ys) :
    xs.length ≤ ys.length := by
  induction xs generalizing ys with
  | nil => simp
  | cons a rest ih =>
    obtain ⟨hn,ht⟩ := List.nodup_cons.mp hx
    have ha := h a (by simp)
    have hrest : ∀ b ∈ rest, b ∈ ys.erase a := by
      intro b hb
      have hne : b ≠ a := by
        intro he
        subst b
        exact hn hb
      exact (List.mem_erase_of_ne hne).mpr (h b (by simp [hb]))
    have hle := ih (ys.erase a) ht hrest
    rw [List.length_erase_of_mem ha] at hle
    have hpos : 0 < ys.length := by
      cases ys with
      | nil => simp at ha
      | cons b bs => simp
    simp only [List.length_cons]
    omega

theorem nodup_map_of_injective_on {α β : Type} (f : α → β) (xs : List α)
    (h : xs.Nodup)
    (hinj : ∀ x ∈ xs, ∀ y ∈ xs, f x = f y → x = y) :
    (xs.map f).Nodup := by
  induction xs with
  | nil => simp
  | cons a rest ih =>
    obtain ⟨hn,hr⟩ := List.nodup_cons.mp h
    simp only [List.map_cons,List.nodup_cons]
    constructor
    · intro he
      obtain ⟨b,hb,hfb⟩ := List.mem_map.mp he
      have hba := hinj b (by simp [hb]) a (by simp) hfb
      exact hn (hba ▸ hb)
    · exact ih hr (fun x hx y hy he =>
        hinj x (by simp [hx]) y (by simp [hy]) he)

def CoversBinary (rows : List (List Bool)) (k : Nat) : Prop :=
  ∀ b : List Bool, b.length = rows.length →
    ∃ u : List Bool, u.length = k ∧ applyMatrix rows u = b

noncomputable def representative (rows : List (List Bool)) (k : Nat)
    (hs : CoversBinary rows k) (b : List Bool) : List Bool :=
  if hb : b.length = rows.length then Classical.choose (hs b hb) else []

theorem representative_spec (rows : List (List Bool)) (k : Nat)
    (hs : CoversBinary rows k) (b : List Bool) (hb : b.length = rows.length) :
    (representative rows k hs b).length = k ∧
      applyMatrix rows (representative rows k hs b) = b := by
  rw [representative,dite_eq_left hb]
  exact Classical.choose_spec (hs b hb)

noncomputable def fiberList (rows : List (List Bool)) (k r : Nat)
    (hs : CoversBinary rows k) (ls : List Nat) (b : List Bool) : List (List Bool) :=
  (cube r).map fun t => xorVec (representative rows k hs b) (labelVector ls t)

theorem fiberList_length (rows : List (List Bool)) (k r : Nat)
    (hs : CoversBinary rows k) (ls : List Nat) (b : List Bool) :
    (fiberList rows k r hs ls b).length = 2^r := by
  simp [fiberList,cube_length]

theorem fiberList_spec (rows : List (List Bool)) (k r : Nat)
    (hs : CoversBinary rows k) (ls : List Nat) (E : Encoding (kernelSpace rows k) r ls)
    (b : List Bool) (hb : b.length = rows.length) (u : List Bool) :
    u ∈ fiberList rows k r hs ls b ↔ u.length = k ∧ applyMatrix rows u = b := by
  have hrep := representative_spec rows k hs b hb
  constructor
  · intro h
    obtain ⟨t,ht,he⟩ := List.mem_map.mp h
    have htlen := (cube_mem r t).mp ht
    have hk := E.image t htlen
    change (labelVector ls t).length = k ∧
      applyMatrix rows (labelVector ls t) = List.replicate rows.length false at hk
    have hlen := hrep.1.trans hk.1.symm
    subst u
    refine ⟨(xorVec_length _ _ hlen).trans hrep.1,?_⟩
    rw [applyMatrix_xor rows _ _ hlen,hrep.2,hk.2,← hb,xorVec_zero_right]
  · rintro ⟨hu,hAu⟩
    let w := xorVec (representative rows k hs b) u
    have hlen : (representative rows k hs b).length = u.length :=
      hrep.1.trans hu.symm
    have hw : (kernelSpace rows k).contains w := by
      change w.length = k ∧ applyMatrix rows w = List.replicate rows.length false
      refine ⟨(xorVec_length _ _ hlen).trans hrep.1,?_⟩
      dsimp [w]
      rw [applyMatrix_xor rows _ _ hlen,hrep.2,hAu,xorVec_self,hb]
    obtain ⟨t,ht,he⟩ := E.surj w hw
    refine List.mem_map.mpr ⟨t,(cube_mem r t).mpr ht,?_⟩
    rw [he]
    exact xorVec_cancel _ _ hlen

theorem fiberList_nodup (rows : List (List Bool)) (k r : Nat)
    (hs : CoversBinary rows k) (ls : List Nat) (E : Encoding (kernelSpace rows k) r ls)
    (b : List Bool) (hb : b.length = rows.length) :
    (fiberList rows k r hs ls b).Nodup := by
  apply nodup_map_of_injective_on _ _ (cube_nodup r)
  intro t ht u hu he
  have htlen := (cube_mem r t).mp ht
  have hulen := (cube_mem r u).mp hu
  have hrep := (representative_spec rows k hs b hb).1
  have htl : (representative rows k hs b).length = (labelVector ls t).length := by
    rw [labelVector_length,E.length_eq,hrep]
  have hul : (representative rows k hs b).length = (labelVector ls u).length := by
    rw [labelVector_length,E.length_eq,hrep]
  have hh := congrArg (xorVec (representative rows k hs b)) he
  rw [xorVec_cancel _ _ htl,xorVec_cancel _ _ hul] at hh
  exact E.inj t u htlen hulen hh

theorem flatMap_const_length {α β : Type} (xs : List α) (f : α → List β)
    (c : Nat) (h : ∀ x ∈ xs, (f x).length = c) :
    (xs.flatMap f).length = xs.length*c := by
  induction xs with
  | nil => simp
  | cons a rest ih =>
    have ha := h a (by simp)
    have hr := ih (fun x hx => h x (by simp [hx]))
    rw [List.flatMap_cons,List.length_append,ha,hr]
    simp [Nat.add_mul,Nat.add_comm]

theorem flatMap_nodup_of_disjoint {α β : Type} (xs : List α) (f : α → List β)
    (h : xs.Nodup) (hf : ∀ x ∈ xs, (f x).Nodup)
    (hd : ∀ x ∈ xs, ∀ y ∈ xs, x ≠ y → ∀ v ∈ f x, ∀ w ∈ f y, v ≠ w) :
    (xs.flatMap f).Nodup := by
  induction xs with
  | nil => simp
  | cons a rest ih =>
    obtain ⟨hna,hnr⟩ := List.nodup_cons.mp h
    rw [List.flatMap_cons,List.nodup_append]
    refine ⟨hf a (by simp),ih hnr
      (fun x hx => hf x (by simp [hx]))
      (fun x hx y hy hne => hd x (by simp [hx]) y (by simp [hy]) hne),?_⟩
    intro v hv w hw
    obtain ⟨b,hb,hwb⟩ := List.mem_flatMap.mp hw
    have hab : a ≠ b := by
      intro he
      subst b
      exact hna hb
    exact hd a (by simp) b (by simp [hb]) hab v hv w hwb

/-- The precise rank-nullity identity for the encoded kernel of a
surjective binary matrix: r + number of output rows = k. -/
theorem encoding_rank_nullity (rows : List (List Bool)) (k r : Nat)
    (hs : CoversBinary rows k) (ls : List Nat)
    (E : Encoding (kernelSpace rows k) r ls) : k = rows.length + r := by
  let all := (cube rows.length).flatMap (fiberList rows k r hs ls)
  have hcard : all.length = 2^rows.length * 2^r := by
    dsimp [all]
    rw [flatMap_const_length _ _ (2^r)
      (fun b _ => fiberList_length rows k r hs ls b),cube_length]
  have hnd : all.Nodup := by
    apply flatMap_nodup_of_disjoint _ _ (cube_nodup rows.length)
    · intro b hb
      exact fiberList_nodup rows k r hs ls E b ((cube_mem _ _).mp hb)
    · intro b hb c hc hne u hu v hv he
      subst v
      have hu' := (fiberList_spec rows k r hs ls E b ((cube_mem _ _).mp hb) u).mp hu
      have hv' := (fiberList_spec rows k r hs ls E c ((cube_mem _ _).mp hc) u).mp hv
      exact hne (hu'.2.symm.trans hv'.2)
  have hmem (u : List Bool) : u ∈ all ↔ u.length = k := by
    constructor
    · intro hu
      obtain ⟨b,hb,he⟩ := List.mem_flatMap.mp hu
      exact ((fiberList_spec rows k r hs ls E b ((cube_mem _ _).mp hb) u).mp he).1
    · intro hu
      let b := applyMatrix rows u
      have hb : b.length = rows.length := applyMatrix_length rows u
      exact List.mem_flatMap.mpr ⟨b,(cube_mem _ _).mpr hb,
        (fiberList_spec rows k r hs ls E b hb u).mpr ⟨hu,rfl⟩⟩
  have h1 := nodup_subset_length all (cube k) hnd
    (fun u hu => (cube_mem _ _).mpr ((hmem u).mp hu))
  have h2 := nodup_subset_length (cube k) all (cube_nodup k)
    (fun u hu => (hmem u).mpr ((cube_mem _ _).mp hu))
  rw [hcard,cube_length,← Nat.pow_add] at h1 h2
  have hle := (Nat.pow_le_pow_iff_right (by decide : 1 < (2:Nat))).mp h1
  have hge := (Nat.pow_le_pow_iff_right (by decide : 1 < (2:Nat))).mp h2
  omega

/-- An actual surjective matrix has kernel column labels of precisely
the dimension k−d, with unique coefficient representations. -/
theorem surjective_matrix_encoding (rows : List (List Bool)) (k : Nat)
    (hs : CoversBinary rows k) :
    ∃ ls : List Nat, Encoding (kernelSpace rows k) (k-rows.length) ls := by
  obtain ⟨r,_,ls,E⟩ := exists_encoding k (kernelSpace rows k)
  have he := encoding_rank_nullity rows k r hs ls E
  have hr : k-rows.length = r := by omega
  rw [hr]
  exact ⟨ls,E⟩


def pairLabels : List Nat → List Int → List Raw
  | b :: bs, c :: cs => (b,c) :: pairLabels bs cs
  | _, _ => []

theorem pairLabels_fst (ls : List Nat) (cs : List Int)
    (h : ls.length = cs.length) :
    (pairLabels ls cs).map Prod.fst = ls := by
  induction ls generalizing cs with
  | nil => rfl
  | cons b bs ih =>
    cases cs with
    | nil => simp at h
    | cons c ds =>
      have ht : bs.length = ds.length := by simpa using h
      simp [pairLabels,ih ds ht]

theorem pairLabels_snd (ls : List Nat) (cs : List Int)
    (h : ls.length = cs.length) :
    (pairLabels ls cs).map Prod.snd = cs := by
  induction ls generalizing cs with
  | nil =>
    cases cs with
    | nil => rfl
    | cons c ds => simp at h
  | cons b bs ih =>
    cases cs with
    | nil => rfl
    | cons c ds =>
      have ht : bs.length = ds.length := by simpa using h
      simp [pairLabels,ih ds ht]

theorem pairLabels_length (ls : List Nat) (cs : List Int)
    (h : ls.length = cs.length) :
    (pairLabels ls cs).length = cs.length := by
  have he := congrArg List.length (pairLabels_snd ls cs h)
  simpa using he

theorem kernelVector_pairLabels (ls : List Nat) (cs : List Int)
    (t : List Bool) (h : ls.length = cs.length) :
    kernelVector (pairLabels ls cs) t = labelVector ls t := by
  induction ls generalizing cs with
  | nil => rfl
  | cons b bs ih =>
    cases cs with
    | nil => simp at h
    | cons c ds =>
      have ht : bs.length = ds.length := by simpa using h
      change encodedDot b t :: kernelVector (pairLabels bs ds) t =
        encodedDot b t :: labelVector bs t
      rw [ih ds ht]

def sumCoeffs : List Int → List Bool → Int
  | c :: cs, b :: bs => (if b then c else 0) + sumCoeffs cs bs
  | _, _ => 0

theorem sumBits_eq_sumCoeffs (w : List Raw) (u : List Bool) :
    sumBits w u = sumCoeffs (w.map Prod.snd) u := by
  induction w generalizing u with
  | nil => cases u <;> rfl
  | cons a w ih =>
    cases u with
    | nil => rfl
    | cons b bs => simp [sumBits,sumCoeffs,ih bs]

def CoversMixed (rows : List (List Bool)) (cs : List Int) : Prop :=
  ∀ b : List Bool, b.length = rows.length →
  ∀ z : Int, 0 ≤ z → z < 3 →
  ∃ u : List Bool, u.length = cs.length ∧
    applyMatrix rows u = b ∧ sumCoeffs cs u % 3 = z

theorem coversMixed_binary (rows : List (List Bool)) (cs : List Int)
    (h : CoversMixed rows cs) : CoversBinary rows cs.length := by
  intro b hb
  obtain ⟨u,hu,he,_⟩ := h b hb 0 (by decide) (by decide)
  exact ⟨u,hu,he⟩

/-- For every actual kernel encoding, coverage of the mixed group forces
a singleton occupied nonzero column type. The exact number of available
column types follows from the proved rank-nullity theorem. -/
theorem mixed_coverage_forces_singleton (rows : List (List Bool)) (cs : List Int)
    (r : Nat) (ls : List Nat) (E : Encoding (kernelSpace rows cs.length) r ls)
    (hc : CoversMixed rows cs) :
    ∃ d : Nat, d ≠ 0 ∧ d < 2^r ∧ countType (pairLabels ls cs) d = 1 := by
  let w := pairLabels ls cs
  have hlen : w.length = cs.length := pairLabels_length ls cs E.length_eq
  have hker : ∀ u : List Bool, u.length = w.length →
      applyMatrix rows u = List.replicate rows.length false →
      ∃ t : List Bool, u = kernelVector w t := by
    intro u hu hz
    have hm : (kernelSpace rows cs.length).contains u := ⟨hu.trans hlen,hz⟩
    obtain ⟨t,_,ht⟩ := E.surj u hm
    refine ⟨t,?_⟩
    rw [kernelVector_pairLabels ls cs t E.length_eq]
    exact ht.symm
  have hcov : ∀ b : List Bool, b.length = rows.length →
      ∀ z : Int, 0 ≤ z → z < 3 →
      ∃ u : List Bool, u.length = w.length ∧
        applyMatrix rows u = b ∧ sumBits w u % 3 = z := by
    intro b hb z hz0 hz3
    obtain ⟨u,hu,he,hs⟩ := hc b hb z hz0 hz3
    refine ⟨u,hu.trans hlen.symm,he,?_⟩
    rw [sumBits_eq_sumCoeffs,pairLabels_snd ls cs E.length_eq]
    exact hs
  by_cases hn : ∃ d : Nat, d ≠ 0 ∧ d < 2^r ∧ countType w d = 1
  · exact hn
  · have hno : ∀ d, d ≠ 0 → countType w d ≠ 1 := by
      intro d hd hs
      by_cases hlt : d < 2^r
      · exact hn ⟨d,hd,hlt,hs⟩
      · have hb : ∀ a ∈ w, a.1 < 2^r := by
          intro a ha
          have hm : a.1 ∈ ls := by
            rw [← pairLabels_fst ls cs E.length_eq]
            exact List.mem_map.mpr ⟨a,ha,rfl⟩
          exact E.bound a.1 hm
        have hz := countType_outside w (2^r) d (by omega) hb
        omega
    exact False.elim (not_covers_of_matrix_kernel w rows hno hker hcov)

/-- Every covered mixed binary/ternary group has an actual kernel
encoding of the correct dimension with a singleton occupied type. -/
theorem mixed_coverage_actual_kernel (rows : List (List Bool)) (cs : List Int)
    (hc : CoversMixed rows cs) :
    ∃ ls : List Nat,
      Encoding (kernelSpace rows cs.length) (cs.length-rows.length) ls ∧
      ∃ d : Nat, d ≠ 0 ∧ d < 2^(cs.length-rows.length) ∧
        countType (pairLabels ls cs) d = 1 := by
  obtain ⟨ls,E⟩ := surjective_matrix_encoding rows cs.length (coversMixed_binary rows cs hc)
  exact ⟨ls,E,mixed_coverage_forces_singleton rows cs _ ls E hc⟩

end MaTangCoreRank
