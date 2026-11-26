module
public import Conjectures.CyrusianKaplanSignRadii
public import Conjectures.CyrusianKaplanOpenSimplexIndependent

@[expose] public section
namespace CyrusianKaplan
open Set

structure RationalSimplexTile (r : ℕ) where
  size : ℕ
  positive : 0<size
  vertices : Fin size→TupleSpace r
  rational : ∀ i,RationalTuple (vertices i)
  independent : AffineIndependent ℝ vertices

def RationalSimplexTile.carrier {r : ℕ} (v : RationalSimplexTile r) : Set (TupleSpace r) :=
  openBarycentricSimplex v.vertices

def RationalSimplexTile.singleton {r : ℕ} (x : TupleSpace r) (h : RationalTuple x) :
    RationalSimplexTile r where
  size := 1
  positive := Nat.one_pos
  vertices := fun _ => x
  rational := fun _ => h
  independent := by
    rw [affineIndependent_iff]
    intro s w hw _ i hi
    have hS : s={i} := Finset.eq_singleton_iff_unique_mem.mpr ⟨hi,fun j _ => Subsingleton.elim _ _⟩
    simpa [hS] using hw

theorem RationalSimplexTile.carrier_singleton {r : ℕ} (x : TupleSpace r) (h : RationalTuple x) :
    (RationalSimplexTile.singleton x h).carrier = {x} :=
  openBarycentricSimplex_singleton x

def RationalSimplexTile.cone {r : ℕ} (v : RationalSimplexTile r) {x : TupleSpace r}
    (hx : RationalTuple x) (f : TupleSpace r →ᵃ[ℝ] ℝ) (c : ℝ) (hn : f x≠c)
    (hV : ∀ i,f (v.vertices i)=c) : RationalSimplexTile r where
  size := v.size+1
  positive := Nat.succ_pos _
  vertices := Fin.cons x v.vertices
  rational := fun i => Fin.cases hx v.rational i
  independent := affineIndependent_cons_of_affine_hyperplane v.independent f c hn hV

theorem RationalSimplexTile.mem_carrier_cone {r : ℕ} (v : RationalSimplexTile r) {x y : TupleSpace r}
    (hx : RationalTuple x) (f : TupleSpace r →ᵃ[ℝ] ℝ) (c : ℝ) (hn : f x≠c)
    (hV : ∀ i,f (v.vertices i)=c) :
    y∈(v.cone hx f c hn hV).carrier ↔
      ∃ z∈v.carrier,∃ t∈Ioo (0:ℝ) 1,AffineMap.lineMap x z t=y :=
  mem_openBarycentricSimplex_cons v.positive x v.vertices y

def IsSignFibreTriangulation {r : ℕ} (s : TupleAffineTest r→Ordering)
    {I : Type*} (v : I→RationalSimplexTile r) : Prop :=
  (∀ j i,(v j).vertices i∈weakTupleSignPolyhedron 1 s) ∧
  (∀ y, y∈affineSignFibre (tupleAffineForm 1) s ↔ ∃ j,y∈(v j).carrier) ∧
  Pairwise (fun i j => Disjoint (v i).carrier (v j).carrier)

theorem IsSignFibreTriangulation.reindex {r : ℕ} {s : TupleAffineTest r→Ordering}
    {I J : Type*} {v : I→RationalSimplexTile r} (h : IsSignFibreTriangulation s v)
    (j : J≃I) : IsSignFibreTriangulation s (fun k => v (j k)) := by
  refine ⟨(fun k i => h.1 (j k) i),?_,?_⟩
  · intro y
    rw [h.2.1]
    constructor
    · rintro ⟨i,hi⟩
      exact ⟨j.symm i,by simpa only [Equiv.apply_symm_apply] using hi⟩
    · rintro ⟨i,hi⟩
      exact ⟨j i,hi⟩
  · intro i k hik
    exact h.2.2 (fun hh => hik (j.injective hh))

private theorem zero_form_of_weak_eq {r : ℕ} {t : TupleAffineTest r→Ordering}
    {z : TupleSpace r} (hz : z∈weakTupleSignPolyhedron 1 t) {i : TupleAffineTest r}
    (hi : t i=.eq) : tupleAffineMap 1 i z=0 := by
  have h : orientedTupleAffineMap 1 t i z=0 := hz.1 i hi
  rw [orientedTupleAffineMap_apply] at h
  rw [tupleAffineMap_apply]
  simpa [hi] using h

private theorem form_ne_of_fibre_ne {r : ℕ} {s : TupleAffineTest r→Ordering}
    {x : TupleSpace r} (hx : x∈affineSignFibre (tupleAffineForm 1) s)
    {i : TupleAffineTest r} (hi : s i≠.eq) : tupleAffineMap 1 i x≠0 := by
  intro hz
  apply hi
  rw [tupleAffineMap_apply] at hz
  exact (congrFun hx i).symm.trans ((affineTestSign_eq_eq _).mpr hz)

/-- Every compact, nonempty cell of the literal sign arrangement
admits a finite disjoint decomposition into rational open simplices.
The recursion is on the number of strict rows: each actual boundary
sign pattern has fewer, and radial uniqueness gives disjointness. -/
theorem compact_tupleSignFibre_triangulation {r : ℕ}
    (s : TupleAffineTest r→Ordering) (hc : IsCompact (weakTupleSignPolyhedron 1 s))
    (hS : (affineSignFibre (tupleAffineForm 1) s).Nonempty) :
    ∃ N : ℕ, ∃ v : Fin N→RationalSimplexTile r, IsSignFibreTriangulation s v := by
  classical
  let S (s : TupleAffineTest r→Ordering) := affineSignFibre (tupleAffineForm 1) s
  let W (s : TupleAffineTest r→Ordering) := weakTupleSignPolyhedron 1 s
  let card (s : TupleAffineTest r→Ordering) := (signNonzeros s).card
  have ind (n : ℕ) (s : TupleAffineTest r→Ordering) (hn : card s=n)
      (hc : IsCompact (W s)) (hs : (S s).Nonempty) :
      ∃ N : ℕ, ∃ v : Fin N→RationalSimplexTile r, IsSignFibreTriangulation s v := by
    induction n using Nat.strong_induction_on generalizing s with
    | h n ih =>
      obtain ⟨y,hy⟩ := hs
      obtain ⟨x,hx,hq⟩ := compact_signFibre_has_rational_point s y hc hy
      let Face := {t : TupleAffineTest r→Ordering // signSpecializes t s ∧ t≠s ∧ (S t).Nonempty}
      have hTiles (t : Face) :
          ∃ N,∃ v : Fin N→RationalSimplexTile r, IsSignFibreTriangulation t.val v := by
        have hlt : card t.val<n := hn ▸ signNonzeros_card_lt_of_specializes_ne t.property.1 t.property.2.1
        exact ih (card t.val) hlt t.val rfl (compact_of_signSpecializes t.property.1 hc) t.property.2.2
      choose N v hv using hTiles
      have hRow (t : Face) : ∃ i : TupleAffineTest r,t.val i=.eq ∧ s i≠.eq :=
        specialized_sign_face_separating_row t.property.1 t.property.2.1
      choose row hZero hNe using hRow
      have hz (t : Face) (j : Fin (N t)) (i : Fin (v t j).size) :
          tupleAffineMap 1 (row t) ((v t j).vertices i)=0 :=
        zero_form_of_weak_eq ((hv t).1 j i) (hZero t)
      let Cone (t : Face) (j : Fin (N t)) :=
        (v t j).cone hq (tupleAffineMap 1 (row t)) 0 (form_ne_of_fibre_ne hx (hNe t)) (hz t j)
      let I := Option (Σ t : Face, Fin (N t))
      let V : I→RationalSimplexTile r := fun u =>
        u.elim (RationalSimplexTile.singleton x hq) (fun tj => Cone tj.1 tj.2)
      have hC (t : Face) (j : Fin (N t)) {p : TupleSpace r} :
          p∈(Cone t j).carrier ↔
            ∃ z∈(v t j).carrier,∃ a∈Ioo (0:ℝ) 1,AffineMap.lineMap x z a=p :=
        RationalSimplexTile.mem_carrier_cone _ _ _ _ _ _
      have hFaceMem (t : Face) {z : TupleSpace r} (hzv : ∃ j,z∈(v t j).carrier) :
          affineSignCode (tupleAffineForm 1) z=t.val := ((hv t).2.1 z).mpr hzv
      have hxW : x∈W s := tuple_mem_weak_of_fibre hx
      have hPart : IsSignFibreTriangulation s V := by
        refine ⟨?_,?_,?_⟩
        · intro j i
          cases j with
          | none => exact hxW
          | some tj =>
            obtain ⟨t,j⟩ := tj
            revert i
            change ∀ i : Fin ((v t j).size+1),
              (@Fin.cons (v t j).size (fun _ => TupleSpace r) x (v t j).vertices) i∈W s
            intro i
            refine Fin.cases hxW (fun k => ?_) i
            have h := mem_weak_sign_iff_specializes.mp ((hv t).1 j k)
            apply mem_weak_sign_iff_specializes.mpr
            intro l
            rcases h l with he|he
            · exact (t.property.1 l).elim (fun hh => Or.inl (he.trans hh)) (fun hh => Or.inr (he.trans hh))
            · exact Or.inr he
        · intro p
          constructor
          · intro hp
            by_cases e : x=p
            · exact ⟨none,by simp [V,RationalSimplexTile.carrier_singleton,e]⟩
            · obtain ⟨z,hzr,_⟩ := tuple_fibre_open_radius hc hx hp e
              let t : Face := ⟨affineSignCode (tupleAffineForm 1) z.1,
                hzr.1.1,hzr.1.2,⟨z.1,rfl⟩⟩
              obtain ⟨j,hj⟩ := ((hv t).2.1 z.1).mp (show z.1∈S t.val from rfl)
              exact ⟨some ⟨t,j⟩,(hC t j).mpr ⟨z.1,hj,z.2,hzr.2⟩⟩
          · rintro ⟨j,hj⟩
            cases j with
            | none =>
              have he : p=x := by simpa [V,RationalSimplexTile.carrier_singleton] using hj
              rwa [he]
            | some tj =>
              obtain ⟨t,j⟩ := tj
              obtain ⟨z,hzv,a,ha,rfl⟩ := (hC t j).mp hj
              have hZ : z∈W s := by
                apply mem_weak_sign_iff_specializes.mpr
                rw [hFaceMem t ⟨j,hzv⟩]
                exact t.property.1
              exact lineMap_mem_tuple_fibre hx hZ ⟨ha.1.le,ha.2.le⟩ ha.2
        · intro j k hjk
          apply Set.disjoint_left.mpr
          intro p hp h'p
          have data (tj : Σ t : Face, Fin (N t)) (hp : p∈(V (some tj)).carrier) :
              ∃ z : TupleSpace r,∃ a : ℝ,
                z∈(v tj.1 tj.2).carrier ∧ affineSignCode (tupleAffineForm 1) z=tj.1.val ∧
                a∈Ioo (0:ℝ) 1 ∧ AffineMap.lineMap x z a=p := by
            obtain ⟨z,hz,a,ha,he⟩ := (hC tj.1 tj.2).mp hp
            exact ⟨z,a,hz,hFaceMem tj.1 ⟨tj.2,hz⟩,ha,he⟩
          cases j with
          | none =>
            have p_eq : p=x := by simpa [V,RationalSimplexTile.carrier_singleton] using hp
            cases k with
            | none => exact hjk rfl
            | some k =>
              obtain ⟨z,a,_,hco,ha,he⟩ := data k h'p
              exact tuple_radius_not_centre hx (hco.symm ▸ k.1.property.2.1) ha.1 (he.trans p_eq)
          | some j =>
            obtain ⟨z,a,hz,hco,ha,he⟩ := data j hp
            have hnZ : affineSignCode (tupleAffineForm 1) z≠s := hco.symm ▸ j.1.property.2.1
            have hne : x≠p := fun hp => tuple_radius_not_centre hx hnZ ha.1 (he.trans hp.symm)
            cases k with
            | none =>
              exact hne (by simpa [V,RationalSimplexTile.carrier_singleton,eq_comm] using h'p)
            | some k =>
              obtain ⟨z',a',hz',hco',ha',he'⟩ := data k h'p
              have hZ : signSpecializes (affineSignCode (tupleAffineForm 1) z) s := hco.symm ▸ j.1.property.1
              have hZ' : signSpecializes (affineSignCode (tupleAffineForm 1) z') s ∧
                  affineSignCode (tupleAffineForm 1) z'≠s :=
                hco'.symm ▸ ⟨k.1.property.1,k.1.property.2.1⟩
              have hpS : p∈S s := by
                rw [← he]
                exact lineMap_mem_tuple_fibre hx (mem_weak_sign_iff_specializes.mpr hZ)
                  ⟨ha.1.le,ha.2.le⟩ ha.2
              obtain ⟨w,_,hu⟩ := tuple_fibre_open_radius hc hx hpS hne
              have heq : (z,a)=(z',a') :=
                (hu (z,a) ⟨⟨hZ,hnZ⟩,ha,he⟩).trans (hu (z',a') ⟨hZ',ha',he'⟩).symm
              have hzEq : z=z' := congrArg Prod.fst heq
              have htEq : j.1=k.1 := Subtype.ext (hco.symm.trans (hzEq ▸ hco'))
              obtain ⟨t,j⟩ := j
              obtain ⟨t',k⟩ := k
              change t=t' at htEq
              subst t'
              have hjne : j≠k := fun e => hjk (by cases e; rfl)
              exact Set.disjoint_left.mp ((hv t).2.2 hjne) hz (hzEq.symm ▸ hz')
      let e := Fintype.equivFin I
      exact ⟨Fintype.card I,fun i => V (e.symm i),hPart.reindex e.symm⟩
  exact ind (card s) s rfl hc hS

end CyrusianKaplan
