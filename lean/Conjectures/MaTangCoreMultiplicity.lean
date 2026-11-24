import Conjectures.MaTangCoreFactor

/-!
# Ma–Tang's random subset-sum threshold conjecture

Exact finite multiplicities of the incidence relation between surjective
quotient matrices and injective kernel generators.
-/
namespace MaTangCoreMultiplicity
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear
open MaTangCoreEncoding MaTangCoreFactor

def matrices (d k : Nat) : List (List (List Bool)) := words (cube k) d

theorem matrices_mem (d k : Nat) (A : List (List Bool)) :
    A ∈ matrices d k ↔ A.length = d ∧ RowsOfSize A k := by
  rw [matrices,mem_words]
  constructor
  · intro h
    exact ⟨h.1,fun a ha => (cube_mem k a).mp (h.2 a ha)⟩
  · intro h
    exact ⟨h.1,fun a ha => (cube_mem k a).mpr (h.2 a ha)⟩

theorem matrices_nodup (d k : Nat) : (matrices d k).Nodup :=
  nodup_words _ _ (cube_nodup k)

theorem matrices_length (d k : Nat) : (matrices d k).length = (2^k)^d := by
  simp [matrices,words_length,cube_length]

noncomputable def invertibles (n : Nat) : List (List (List Bool)) := by
  classical
  exact (matrices n n).filter fun U => decide (IsoMatrix n U)

theorem invertibles_mem (n : Nat) (U : List (List Bool)) :
    U ∈ invertibles n ↔ IsoMatrix n U := by
  classical
  simp only [invertibles,List.mem_filter,matrices_mem,decide_eq_true_eq]
  constructor
  · exact fun h => h.2
  · exact fun h => ⟨⟨h.1,h.2.1⟩,h⟩

theorem invertibles_nodup (n : Nat) : (invertibles n).Nodup := by
  classical
  unfold invertibles
  exact List.filter_sublist.nodup (matrices_nodup n n)

theorem invertibles_pos (n : Nat) : 0 < (invertibles n).length := by
  obtain ⟨U,hU,_⟩ := exists_iso_rep n (fun u => u)
    ⟨fun _ h => h,fun _ _ _ _ => rfl⟩ (fun v hv => ⟨v,hv,rfl⟩)
    (fun _ _ _ _ h => h)
  have hmem := (invertibles_mem n U).mpr hU
  cases h : invertibles n with
  | nil => simp [h] at hmem
  | cons u us => simp

noncomputable def quotients (d k : Nat) : List (List (List Bool)) := by
  classical
  exact (matrices d k).filter fun A => decide (CoversBinary A k)

theorem quotients_mem (d k : Nat) (A : List (List Bool)) :
    A ∈ quotients d k ↔ A.length = d ∧ RowsOfSize A k ∧ CoversBinary A k := by
  classical
  simp [quotients,matrices_mem, and_assoc]

theorem quotients_nodup (d k : Nat) : (quotients d k).Nodup := by
  classical
  unfold quotients
  exact List.filter_sublist.nodup (matrices_nodup d k)

def labelWords (r k : Nat) : List (List Nat) := words (codes r) k

theorem labelWords_mem (r k : Nat) (ls : List Nat) :
    ls ∈ labelWords r k ↔ ls.length = k ∧ ∀ b ∈ ls, b < 2^r := by
  rw [labelWords,mem_words]
  exact ⟨fun h => ⟨h.1,fun b hb => (codes_mem r b).mp (h.2 b hb)⟩,
    fun h => ⟨h.1,fun b hb => (codes_mem r b).mpr (h.2 b hb)⟩⟩

theorem labelWords_nodup (r k : Nat) : (labelWords r k).Nodup :=
  nodup_words _ _ (codes_nodup r)

noncomputable def encodings (A : List (List Bool)) (k r : Nat) : List (List Nat) := by
  classical
  exact (labelWords r k).filter fun ls => decide (Encoding (kernelSpace A k) r ls)

theorem encodings_mem (A : List (List Bool)) (k r : Nat) (ls : List Nat) :
    ls ∈ encodings A k r ↔ Encoding (kernelSpace A k) r ls := by
  classical
  simp only [encodings,List.mem_filter,labelWords_mem,decide_eq_true_eq]
  exact ⟨fun h => h.2,fun h => ⟨⟨h.length_eq,h.bound⟩,h⟩⟩

theorem encodings_nodup (A : List (List Bool)) (k r : Nat) :
    (encodings A k r).Nodup := by
  classical
  unfold encodings
  exact List.filter_sublist.nodup (labelWords_nodup r k)

noncomputable def quotientsFor (ls : List Nat) (r d k : Nat) :
    List (List (List Bool)) := by
  classical
  exact (quotients d k).filter fun A => decide (Encoding (kernelSpace A k) r ls)

theorem quotientsFor_mem (ls : List Nat) (r d k : Nat) (A : List (List Bool)) :
    A ∈ quotientsFor ls r d k ↔ A ∈ quotients d k ∧ Encoding (kernelSpace A k) r ls := by
  classical
  simp [quotientsFor]

theorem quotientsFor_nodup (ls : List Nat) (r d k : Nat) :
    (quotientsFor ls r d k).Nodup := by
  classical
  unfold quotientsFor
  exact List.filter_sublist.nodup (quotients_nodup d k)

theorem card_of_bijection {α β : Type} [BEq β] [LawfulBEq β]
    (xs : List α) (ys : List β) (hx : xs.Nodup) (hy : ys.Nodup)
    (f : α → β)
    (hmem : ∀ a ∈ xs, f a ∈ ys)
    (hinj : ∀ a ∈ xs, ∀ b ∈ xs, f a = f b → a = b)
    (hsurj : ∀ b ∈ ys, ∃ a ∈ xs, f a = b) :
    xs.length = ys.length := by
  have hnd := nodup_map_of_injective_on f xs hx hinj
  have hle : (xs.map f).length ≤ ys.length :=
    nodup_subset_length _ _ hnd (by
      intro b hb
      obtain ⟨a,ha,e⟩ := List.mem_map.mp hb
      rw [← e]
      exact hmem a ha)
  have hge : ys.length ≤ (xs.map f).length :=
    nodup_subset_length _ _ hy (by
      intro b hb
      obtain ⟨a,ha,e⟩ := hsurj b hb
      exact List.mem_map.mpr ⟨a,ha,e⟩)
  simp only [List.length_map] at hle hge
  omega

/-- A finite relation with exactly one partner in either direction
induces a bijection and hence equal cardinalities. -/
theorem card_of_unique_matching {α β : Type} [BEq β] [LawfulBEq β]
    (xs : List α) (ys : List β) (hx : xs.Nodup) (hy : ys.Nodup)
    (R : α → β → Prop)
    (hf : ∀ a ∈ xs, ∃ b, b ∈ ys ∧ R a b ∧ ∀ c ∈ ys, R a c → c = b)
    (hg : ∀ b ∈ ys, ∃ a, a ∈ xs ∧ R a b ∧ ∀ c ∈ xs, R c b → c = a) :
    xs.length = ys.length := by
  classical
  cases hxs : xs with
  | nil =>
    cases hys : ys with
    | nil => rfl
    | cons b bs =>
      obtain ⟨a,ha,_⟩ := hg b (by simp [hys])
      simp [hxs] at ha
  | cons a as =>
    obtain ⟨b,hb,_,_⟩ := hf a (by simp [hxs])
    let f : α → β := fun a =>
      if ha : a ∈ xs then Classical.choose (hf a ha) else b
    have spec (a : α) (ha : a ∈ xs) :
        f a ∈ ys ∧ R a (f a) ∧ ∀ c ∈ ys, R a c → c = f a := by
      dsimp [f]
      rw [dite_eq_left ha]
      exact Classical.choose_spec (hf a ha)
    rw [← hxs]
    apply card_of_bijection xs ys hx hy f
    · intro a ha
      exact (spec a ha).1
    · intro a ha c hc he
      obtain ⟨d,hd,_,hu⟩ := hg (f a) (spec a ha).1
      have ea := hu a ha (spec a ha).2.1
      have ec := hu c hc (by rw [he]; exact (spec c hc).2.1)
      exact ea.trans ec.symm
    · intro b hb
      obtain ⟨a,ha,hr,_⟩ := hg b hb
      exact ⟨a,ha,((spec a ha).2.2 b hb hr).symm⟩

theorem encoding_transform (n r : Nat) (S : BinarySubspace n) (a : List Nat)
    (Ea : Encoding S r a) (U : List (List Bool)) (hU : IsoMatrix r U) :
    ∃ b, Encoding S r b ∧
      (∀ t, t.length = r → labelVector a (applyMatrix U t) = labelVector b t) ∧
      ∀ c, Encoding S r c →
        (∀ t, t.length = r → labelVector a (applyMatrix U t) = labelVector c t) → c = b := by
  have ha : LinearOn r n (labelVector a) := by
    rw [← Ea.length_eq]
    exact labelVector_linear r a Ea.bound
  have hu : LinearOn r r (applyMatrix U) := by
    have hh := matrix_linear U r
    rw [hU.1] at hh
    exact hh
  obtain ⟨rows,hlen,hsize,happ⟩ := linear_matrix_exists r n
    (fun t => labelVector a (applyMatrix U t)) (linear_comp hu ha)
  let b := rows.map codeRow
  have hb : b.length = n := by simp [b,hlen]
  have hbnd : ∀ c ∈ b, c < 2^r := by
    intro c hc
    obtain ⟨row,hr,e⟩ := List.mem_map.mp hc
    rw [← e,← hsize row hr]
    exact codeRow_bound row
  have he (t : List Bool) (ht : t.length = r) :
      labelVector a (applyMatrix U t) = labelVector b t := by
    rw [← generatorRows_apply r b hbnd,show generatorRows r b = rows from generatorRows_code r rows hsize]
    exact (happ t ht).symm
  have Eb : Encoding S r b := by
    constructor
    · exact hb
    · exact hbnd
    · intro t ht
      rw [← he t ht]
      exact Ea.image _ (hu.1 t ht)
    · intro u hSu
      obtain ⟨t,ht,e⟩ := Ea.surj u hSu
      obtain ⟨v,hv,ev⟩ := hU.2.2.1 t ht
      refine ⟨v,hv,?_⟩
      rw [← he v hv,ev,e]
    · intro t u ht hv e
      rw [← he t ht,← he u hv] at e
      exact hU.2.2.2 t u ht hv (Ea.inj _ _ (hu.1 t ht) (hu.1 u hv) e)
  refine ⟨b,Eb,he,?_⟩
  intro c Ec hc
  apply labels_ext r c b Ec.bound Eb.bound
  intro t ht
  rw [← hc t ht,he t ht]

theorem matrix_transform (k d r : Nat) (A : List (List Bool)) (ls : List Nat)
    (hA : A ∈ quotients d k) (E : Encoding (kernelSpace A k) r ls)
    (U : List (List Bool)) (hU : IsoMatrix d U) :
    ∃ B, B ∈ quotientsFor ls r d k ∧
      (∀ u, u.length = k → applyMatrix U (applyMatrix A u) = applyMatrix B u) ∧
      ∀ C, C ∈ quotientsFor ls r d k →
        (∀ u, u.length = k → applyMatrix U (applyMatrix A u) = applyMatrix C u) → C = B := by
  obtain ⟨hlen,hsize,hcover⟩ := (quotients_mem d k A).mp hA
  have ha : LinearOn k d (applyMatrix A) := by
    rw [← hlen]
    exact matrix_linear A k
  have hu : LinearOn d d (applyMatrix U) := by
    have hh := matrix_linear U d
    rw [hU.1] at hh
    exact hh
  obtain ⟨B,hB,hBsize,happ⟩ := linear_matrix_exists k d
    (fun u => applyMatrix U (applyMatrix A u)) (linear_comp ha hu)
  have hsB : CoversBinary B k := by
    intro v hv
    rw [hB] at hv
    obtain ⟨t,ht,et⟩ := hU.2.2.1 v hv
    obtain ⟨u,hu,eu⟩ := hcover t (ht.trans hlen.symm)
    refine ⟨u,hu,?_⟩
    rw [happ u hu,eu,et]
  have hk (u : List Bool) (hu' : u.length = k) :
      (kernelSpace B k).contains u ↔ (kernelSpace A k).contains u := by
    change (u.length = k ∧ applyMatrix B u = List.replicate B.length false) ↔
      (u.length = k ∧ applyMatrix A u = List.replicate A.length false)
    rw [happ u hu',hB,hlen]
    constructor
    · intro h
      refine ⟨h.1,?_⟩
      have ee : applyMatrix U (List.replicate d false) = List.replicate d false :=
        linear_zero hu
      exact hU.2.2.2 _ _ (ha.1 u hu') (by simp) (h.2.trans ee.symm)
    · intro h
      exact ⟨h.1,by rw [h.2,linear_zero hu]⟩
  have EB : Encoding (kernelSpace B k) r ls := by
    constructor
    · exact E.length_eq
    · exact E.bound
    · intro t ht
      have ha' := E.image t ht
      exact (hk _ ((kernelSpace A k).length_eq _ ha')).mpr ha'
    · intro u hu'
      exact E.surj _ ((hk _ ((kernelSpace B k).length_eq _ hu')).mp hu')
    · exact E.inj
  refine ⟨B,(quotientsFor_mem ls r d k B).mpr
    ⟨(quotients_mem d k B).mpr ⟨hB,hBsize,hsB⟩,EB⟩,
    fun u hu' => (happ u hu').symm,?_⟩
  intro C hC hCapp
  have hc := (quotients_mem d k C).mp ((quotientsFor_mem ls r d k C).mp hC).1
  apply matrix_ext k C B hc.2.1 hBsize
  intro u hu'
  rw [← hCapp u hu',happ u hu']

/-- Every surjective matrix has exactly as many encodings as there
are invertible parameter matrices. This is an exact finite equality. -/
theorem encoding_multiplicity (A : List (List Bool)) (d r k : Nat)
    (hk : k = d+r) (hA : A ∈ quotients d k) :
    (encodings A k r).length = (invertibles r).length := by
  have ha := (quotients_mem d k A).mp hA
  obtain ⟨a,Ea⟩ := surjective_matrix_encoding A k ha.2.2
  have hr : k-A.length = r := by omega
  rw [hr] at Ea
  apply card_of_unique_matching (encodings A k r) (invertibles r)
    (encodings_nodup A k r) (invertibles_nodup r)
    (fun b U => ∀ t, t.length = r →
      labelVector a (applyMatrix U t) = labelVector b t)
  · intro b hb
    have Eb := (encodings_mem A k r b).mp hb
    obtain ⟨U,hU,he,huniq⟩ := pre_factor k r (kernelSpace A k) a b Ea Eb
    refine ⟨U,(invertibles_mem r U).mpr hU,he,?_⟩
    intro V hv hV
    have hv' := (invertibles_mem r V).mp hv
    exact huniq V hv'.1 hv'.2.1 hV
  · intro U hU
    have hu := (invertibles_mem r U).mp hU
    obtain ⟨b,Eb,he,huniq⟩ := encoding_transform k r (kernelSpace A k) a Ea U hu
    refine ⟨b,(encodings_mem A k r b).mpr Eb,he,?_⟩
    intro c hc hec
    exact huniq c ((encodings_mem A k r c).mp hc) hec

/-- Every generator which admits a quotient has exactly as many
quotients as there are invertible codomain matrices. -/
theorem quotient_multiplicity (ls : List Nat) (r d k : Nat)
    (h : ∃ A, A ∈ quotientsFor ls r d k) :
    (quotientsFor ls r d k).length = (invertibles d).length := by
  obtain ⟨A,hA⟩ := h
  obtain ⟨ha,Ea⟩ := (quotientsFor_mem ls r d k A).mp hA
  have ha' := (quotients_mem d k A).mp ha
  have hlinA : LinearOn k d (applyMatrix A) := by
    rw [← ha'.1]
    exact matrix_linear A k
  have hsurjA : SurjOn k d (applyMatrix A) := by
    rw [← ha'.1]
    exact ha'.2.2
  apply card_of_unique_matching (quotientsFor ls r d k) (invertibles d)
    (quotientsFor_nodup ls r d k) (invertibles_nodup d)
    (fun B U => ∀ u, u.length = k →
      applyMatrix U (applyMatrix A u) = applyMatrix B u)
  · intro B hB
    obtain ⟨hb,Eb⟩ := (quotientsFor_mem ls r d k B).mp hB
    have hb' := (quotients_mem d k B).mp hb
    have hlinB : LinearOn k d (applyMatrix B) := by
      rw [← hb'.1]
      exact matrix_linear B k
    have hsurjB : SurjOn k d (applyMatrix B) := by
      rw [← hb'.1]
      exact hb'.2.2
    have hk (u : List Bool) (hu : u.length = k) :
        applyMatrix A u = List.replicate d false ↔ applyMatrix B u = List.replicate d false := by
      constructor
      · intro e
        have hAu : (kernelSpace A k).contains u := ⟨hu,by rw [ha'.1]; exact e⟩
        obtain ⟨t,ht,et⟩ := Ea.surj u hAu
        have hBu := Eb.image t ht
        rw [et] at hBu
        exact hBu.2.trans (by rw [hb'.1])
      · intro e
        have hBu : (kernelSpace B k).contains u := ⟨hu,by rw [hb'.1]; exact e⟩
        obtain ⟨t,ht,et⟩ := Eb.surj u hBu
        have hAu := Ea.image t ht
        rw [et] at hAu
        exact hAu.2.trans (by rw [ha'.1])
    obtain ⟨U,hU,he,huniq⟩ := post_factor k d _ _ hlinA hlinB hsurjA hsurjB hk
    refine ⟨U,(invertibles_mem d U).mpr hU,he,?_⟩
    intro V hV heV
    exact huniq V ((invertibles_mem d V).mp hV).2.1 heV
  · intro U hU
    obtain ⟨B,hB,he,huniq⟩ := matrix_transform k d r A ls ha Ea U
      ((invertibles_mem d U).mp hU)
    exact ⟨B,hB,he,huniq⟩

end MaTangCoreMultiplicity
