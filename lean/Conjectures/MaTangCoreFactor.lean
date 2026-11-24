import Conjectures.MaTangCoreEncoding

/-!
# Ma–Tang's random subset-sum threshold conjecture

Factorization through surjective quotient maps and injective
parametrizations. No random-kernel distribution is assumed.
-/
namespace MaTangCoreFactor
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear MaTangCoreEncoding

def SurjOn (n m : Nat) (f : List Bool → List Bool) : Prop :=
  ∀ v, v.length = m → ∃ u, u.length = n ∧ f u = v

def InjOn (n : Nat) (f : List Bool → List Bool) : Prop :=
  ∀ u v, u.length = n → v.length = n → f u = f v → u = v

def IsoMatrix (n : Nat) (rows : List (List Bool)) : Prop :=
  rows.length = n ∧ RowsOfSize rows n ∧
    SurjOn n n (applyMatrix rows) ∧ InjOn n (applyMatrix rows)

theorem xorVec_eq_zero_iff (u v : List Bool) (h : u.length = v.length) :
    xorVec u v = List.replicate u.length false ↔ u = v := by
  constructor
  · intro e
    have ee := congrArg (xorVec u) e
    rw [xorVec_cancel u v h,xorVec_zero_right] at ee
    exact ee.symm
  · intro e
    subst v
    exact xorVec_self u

theorem linear_fiber_iff {n m : Nat} {f : List Bool → List Bool}
    (hf : LinearOn n m f) (u v : List Bool) (hu : u.length = n) (hv : v.length = n) :
    f u = f v ↔ f (xorVec u v) = List.replicate m false := by
  rw [hf.2 u v hu hv,← hf.1 u hu]
  exact (xorVec_eq_zero_iff _ _ ((hf.1 u hu).trans (hf.1 v hv).symm)).symm

noncomputable def preimageOn (n m : Nat) (f : List Bool → List Bool)
    (h : SurjOn n m f) (v : List Bool) : List Bool :=
  if hv : v.length = m then Classical.choose (h v hv) else []

theorem preimageOn_spec (n m : Nat) (f : List Bool → List Bool)
    (h : SurjOn n m f) (v : List Bool) (hv : v.length = m) :
    (preimageOn n m f h v).length = n ∧ f (preimageOn n m f h v) = v := by
  rw [preimageOn,dite_eq_left hv]
  exact Classical.choose_spec (h v hv)

theorem exists_iso_rep (n : Nat) (g : List Bool → List Bool)
    (hg : LinearOn n n g) (hs : SurjOn n n g) (hi : InjOn n g) :
    ∃ U, IsoMatrix n U ∧ ∀ u, u.length = n → applyMatrix U u = g u := by
  obtain ⟨U,hU,hsize,he⟩ := linear_matrix_exists n n g hg
  refine ⟨U,⟨hU,hsize,?_,?_⟩,he⟩
  · intro v hv
    obtain ⟨u,hu,e⟩ := hs v hv
    exact ⟨u,hu,(he u hu).trans e⟩
  · intro u v hu hv e
    rw [he u hu,he v hv] at e
    exact hi u v hu hv e

/-- Surjective maps with the same zero fiber differ by a unique
invertible map of their common codomain. -/
theorem post_factor (n m : Nat) (a b : List Bool → List Bool)
    (ha : LinearOn n m a) (hb : LinearOn n m b)
    (hsa : SurjOn n m a) (hsb : SurjOn n m b)
    (hk : ∀ u, u.length = n →
      (a u = List.replicate m false ↔ b u = List.replicate m false)) :
    ∃ U, IsoMatrix m U ∧
      (∀ u, u.length = n → applyMatrix U (a u) = b u) ∧
      ∀ V, RowsOfSize V m →
        (∀ u, u.length = n → applyMatrix V (a u) = b u) → V = U := by
  have hfib (u v : List Bool) (hu : u.length = n) (hv : v.length = n) :
      a u = a v ↔ b u = b v := by
    rw [linear_fiber_iff ha u v hu hv,linear_fiber_iff hb u v hu hv]
    exact hk _ ((xorVec_length u v (hu.trans hv.symm)).trans hu)
  let p := preimageOn n m a hsa
  have hp (v : List Bool) (hv : v.length = m) :
      (p v).length = n ∧ a (p v) = v := preimageOn_spec n m a hsa v hv
  let g := fun v => b (p v)
  have hfac (u : List Bool) (hu : u.length = n) : g (a u) = b u := by
    have h := hp (a u) (ha.1 u hu)
    exact (hfib (p (a u)) u h.1 hu).mp h.2
  have hg : LinearOn m m g := by
    constructor
    · intro v hv
      exact hb.1 _ (hp v hv).1
    · intro u v hu hv
      have hpu := hp u hu
      have hpv := hp v hv
      have hw : (xorVec (p u) (p v)).length = n :=
        (xorVec_length _ _ (hpu.1.trans hpv.1.symm)).trans hpu.1
      have e := ha.2 (p u) (p v) hpu.1 hpv.1
      rw [hpu.2,hpv.2] at e
      have ee := hfac _ hw
      rw [e,hb.2 _ _ hpu.1 hpv.1] at ee
      exact ee
  have hgs : SurjOn m m g := by
    intro v hv
    obtain ⟨u,hu,e⟩ := hsb v hv
    exact ⟨a u,ha.1 u hu,(hfac u hu).trans e⟩
  have hgi : InjOn m g := by
    intro u v hu hv e
    have hpu := hp u hu
    have hpv := hp v hv
    have ee := (hfib _ _ hpu.1 hpv.1).mpr e
    rwa [hpu.2,hpv.2] at ee
  obtain ⟨U,hU,happ⟩ := exists_iso_rep m g hg hgs hgi
  have he (u : List Bool) (hu : u.length = n) : applyMatrix U (a u) = b u :=
    (happ _ (ha.1 u hu)).trans (hfac u hu)
  refine ⟨U,hU,he,?_⟩
  intro V hv hV
  apply matrix_ext m V U hv hU.2.1
  intro y hy
  obtain ⟨u,hu,e⟩ := hsa y hy
  rw [← e,hV u hu,he u hu]

noncomputable def coordinates {n r : Nat} {S : BinarySubspace n}
    {ls : List Nat} (E : Encoding S r ls) (u : List Bool) : List Bool := by
  classical
  exact if hu : S.contains u then Classical.choose (E.surj u hu) else []

theorem coordinates_spec {n r : Nat} {S : BinarySubspace n}
    {ls : List Nat} (E : Encoding S r ls) (u : List Bool) (hu : S.contains u) :
    (coordinates E u).length = r ∧ labelVector ls (coordinates E u) = u := by
  classical
  rw [coordinates,dite_eq_left hu]
  exact Classical.choose_spec (E.surj u hu)

/-- Two encodings of the same subspace differ by a unique invertible
coordinate change on the parameter domain. -/
theorem pre_factor (n r : Nat) (S : BinarySubspace n) (a b : List Nat)
    (Ea : Encoding S r a) (Eb : Encoding S r b) :
    ∃ U, IsoMatrix r U ∧
      (∀ t, t.length = r → labelVector a (applyMatrix U t) = labelVector b t) ∧
      ∀ V, V.length = r → RowsOfSize V r →
        (∀ t, t.length = r → labelVector a (applyMatrix V t) = labelVector b t) → V = U := by
  let g := fun t => coordinates Ea (labelVector b t)
  have hspec (t : List Bool) (ht : t.length = r) :
      (g t).length = r ∧ labelVector a (g t) = labelVector b t :=
    coordinates_spec Ea _ (Eb.image t ht)
  have ha : LinearOn r n (labelVector a) := by
    rw [← Ea.length_eq]
    exact labelVector_linear r a Ea.bound
  have hb : LinearOn r n (labelVector b) := by
    rw [← Eb.length_eq]
    exact labelVector_linear r b Eb.bound
  have hg : LinearOn r r g := by
    constructor
    · intro t ht
      exact (hspec t ht).1
    · intro t u ht hu
      have htu : (xorVec t u).length = r :=
        (xorVec_length _ _ (ht.trans hu.symm)).trans ht
      have hgt := hspec t ht
      have hgu := hspec u hu
      have hgtu := hspec _ htu
      apply Ea.inj _ _ hgtu.1
        ((xorVec_length _ _ (hgt.1.trans hgu.1.symm)).trans hgt.1)
      rw [hgtu.2,ha.2 _ _ hgt.1 hgu.1,hgt.2,hgu.2,hb.2 _ _ ht hu]
  have hgi : InjOn r g := by
    intro t u ht hu e
    apply Eb.inj t u ht hu
    rw [← (hspec t ht).2,← (hspec u hu).2,e]
  have hgs : SurjOn r r g := by
    intro y hy
    obtain ⟨t,ht,e⟩ := Eb.surj _ (Ea.image y hy)
    refine ⟨t,ht,?_⟩
    apply Ea.inj _ _ (hspec t ht).1 hy
    exact (hspec t ht).2.trans e
  obtain ⟨U,hU,happ⟩ := exists_iso_rep r g hg hgs hgi
  have he (t : List Bool) (ht : t.length = r) :
      labelVector a (applyMatrix U t) = labelVector b t := by
    rw [happ t ht,(hspec t ht).2]
  refine ⟨U,hU,he,?_⟩
  intro V hlen hsize hV
  apply matrix_ext r V U hsize hU.2.1
  intro t ht
  apply Ea.inj _ _
  · rw [applyMatrix_length,hlen]
  · rw [applyMatrix_length,hU.1]
  · rw [hV t ht,he t ht]

end MaTangCoreFactor
