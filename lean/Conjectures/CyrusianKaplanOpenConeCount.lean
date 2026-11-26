module
public import Conjectures.CyrusianKaplanOpenCone
public import Conjectures.CyrusianKaplanRayShiftCount
public import Mathlib.Data.Fintype.Sigma

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

def openConeHeightSlice {d : ℕ} (w : Fin d → ℕ)
    (P : AddSubgroup (CoefficientSpace d)) (g : ℕ) :=
  {x : openConeLatticePoints P // (∑ i,(w i:ℝ)*x.val i)=(g:ℝ)}

abbrev OpenConeNumerator (k : ℕ) (P : AddSubgroup (CoefficientSpace (k+1)))
    (w : Fin (k+1) → ℕ) (p : ℕ) :=
  openFundamentalBoxPoints P × (∀ i, Fin (p/w i))

def openConeNumeratorShift {k : ℕ} {P : AddSubgroup (CoefficientSpace (k+1))}
    {w : Fin (k+1) → ℕ} {p : ℕ} (H : openFundamentalBoxPoints P → ℕ)
    (z : OpenConeNumerator k P w p) : ℕ :=
  H z.1 + ∑ i,w i*(z.2 i).val

/-- Combining the open-box decomposition with individual ray
residues gives a determined numerator and an unrestricted
vector of common-period quotients. -/
noncomputable def openConePeriodEquiv {k : ℕ} (P : AddSubgroup (CoefficientSpace (k+1)))
    (hP : ∀ q : Fin (k+1) → ℕ,naturalCoordinates q∈P)
    (w : Fin (k+1) → ℕ) (p : ℕ)
    (hp : 0<p) (hw : ∀ i,0<w i) (hdvd : ∀ i,w i∣p) :
    openConeLatticePoints P ≃ OpenConeNumerator k P w p × (Fin (k+1) → ℕ) :=
  (openConeLatticeDecomposition P hP).trans
    (((rayPeriodDecomposition w p hp hw hdvd).prodCongr (Equiv.refl _)).trans
      { toFun := fun v => ((v.2,v.1.2),v.1.1)
        invFun := fun v => ((v.2,v.1.2),v.1.1)
        left_inv := fun v => by rcases v with ⟨⟨_,_⟩,_⟩; rfl
        right_inv := fun v => by rcases v with ⟨⟨_,_⟩,_⟩; rfl })

theorem openConePeriod_height {k : ℕ} (P : AddSubgroup (CoefficientSpace (k+1)))
    (hP : ∀ q : Fin (k+1) → ℕ,naturalCoordinates q∈P)
    (w : Fin (k+1) → ℕ) (p : ℕ)
    (hp : 0<p) (hw : ∀ i,0<w i) (hdvd : ∀ i,w i∣p)
    (H : openFundamentalBoxPoints P → ℕ)
    (hH : ∀ b,(∑ i,(w i:ℝ)*b.val i)=(H b:ℝ))
    (x : openConeLatticePoints P) :
    (∑ i,(w i:ℝ)*x.val i) =
      (((openConeNumeratorShift H (openConePeriodEquiv P hP w p hp hw hdvd x).1) +
      p*(∑ i,(openConePeriodEquiv P hP w p hp hw hdvd x).2 i) : ℕ):ℝ) := by
  let v := openConeLatticeDecomposition P hP x
  let q := rayPeriodDecomposition w p hp hw hdvd v.1
  have hr : (∑ i,(w i:ℝ)*(v.1 i:ℝ)) =
      (((p*(∑ i,q.1 i)+∑ i,w i*(q.2 i).val : ℕ)):ℝ) := by
    exact_mod_cast ray_period_weighted_height w p hp hw hdvd v.1
  rw [weighted_height_lattice_decomposition (fun i => (w i:ℝ)) P hP]
  change (∑ i,(w i:ℝ)*(v.1 i:ℝ))+(∑ i,(w i:ℝ)*v.2.val i) =
    (((H v.2 + (∑ i,w i*(q.2 i).val) + p*(∑ i,q.1 i) : ℕ)):ℝ)
  rw [hr,hH]
  simp only [Nat.cast_add,add_comm,add_left_comm]

/-- Literal height slices have the exact disjoint finite numerator
decomposition. The fibre equation uses the actual genus and all
ray multiplicities, without a sufficiently-large restriction. -/
noncomputable def openConeHeightSliceEquiv {k : ℕ}
    (P : AddSubgroup (CoefficientSpace (k+1)))
    (hP : ∀ q : Fin (k+1) → ℕ,naturalCoordinates q∈P)
    (w : Fin (k+1) → ℕ) (p : ℕ)
    (hp : 0<p) (hw : ∀ i,0<w i) (hdvd : ∀ i,w i∣p)
    (H : openFundamentalBoxPoints P → ℕ)
    (hH : ∀ b,(∑ i,(w i:ℝ)*b.val i)=(H b:ℝ))
    (g : ℕ) :
    openConeHeightSlice w P g ≃
      Σ b : OpenConeNumerator k P w p,
        {q : Fin (k+1) → ℕ // openConeNumeratorShift H b + p*(∑ i,q i)=g} := by
  let E := openConePeriodEquiv P hP w p hp hw hdvd
  let E' : openConeHeightSlice w P g ≃
      {q : OpenConeNumerator k P w p × (Fin (k+1) → ℕ) //
        openConeNumeratorShift H q.1+p*(∑ i,q.2 i)=g} :=
    E.subtypeEquiv (fun x => by
      rw [openConePeriod_height P hP w p hp hw hdvd H hH]
      exact Nat.cast_inj)
  exact E'.trans
    { toFun := fun q => ⟨q.val.1,⟨q.val.2,q.property⟩⟩
      invFun := fun ⟨b,q⟩ => ⟨(b,q.val),q.property⟩
      left_inv := by rintro ⟨⟨_,_⟩,_⟩; rfl
      right_inv := by rintro ⟨_,⟨_,_⟩⟩; rfl }

private theorem finiteCommonPeriodHeightFibre (k p h g : ℕ) (hp : 0<p) :
    Finite {q : Fin (k+1) → ℕ // h+p*(∑ i,q i)=g} := by
  let E (q : {q : Fin (k+1) → ℕ // h+p*(∑ i,q i)=g}) : Fin (k+1) → Fin (g+1) :=
    fun i => ⟨q.val i,by
      have hTotal : (∑ i,q.val i)≤g := by
        have hMul : (∑ i,q.val i)≤p*(∑ i,q.val i) := by
          simpa only [one_mul] using Nat.mul_le_mul_right (∑ i,q.val i) (show 1≤p by omega)
        have hh := q.property
        omega
      have hi : q.val i≤∑ j,q.val j :=
        Finset.single_le_sum (fun j (_ : j∈Finset.univ) => Nat.zero_le (q.val j)) (Finset.mem_univ i)
      omega⟩
  apply Finite.of_injective E
  intro q r h
  exact Subtype.ext (funext fun i => congrArg Fin.val (congrFun h i))

theorem openConeHeightSlice_card {k : ℕ} (P : AddSubgroup (CoefficientSpace (k+1)))
    [Fintype (openFundamentalBoxPoints P)]
    (hP : ∀ q : Fin (k+1) → ℕ,naturalCoordinates q∈P)
    (w : Fin (k+1) → ℕ) (p : ℕ)
    (hp : 0<p) (hw : ∀ i,0<w i) (hdvd : ∀ i,w i∣p)
    (H : openFundamentalBoxPoints P → ℕ)
    (hH : ∀ b,(∑ i,(w i:ℝ)*b.val i)=(H b:ℝ))
    (g : ℕ) :
    Nat.card (openConeHeightSlice w P g) =
      ∑ b : OpenConeNumerator k P w p, rayShiftCount k p (openConeNumeratorShift H b) g := by
  have (b : OpenConeNumerator k P w p) :
      Finite {q : Fin (k+1) → ℕ // openConeNumeratorShift H b+p*(∑ i,q i)=g} :=
    finiteCommonPeriodHeightFibre k p (openConeNumeratorShift H b) g hp
  rw [Nat.card_congr (openConeHeightSliceEquiv P hP w p hp hw hdvd H hH g),Nat.card_sigma]
  rfl

/-- A literal height-slice count of an open simplicial lattice cone
is a quasipolynomial on all positive integral heights. The finite
box bound, integrality and finiteness are verified separately from
any triangulation of the actual ordinarization strata. -/
theorem openConeHeightSlice_quasipolynomial {k : ℕ}
    (P : AddSubgroup (CoefficientSpace (k+1))) [Fintype (openFundamentalBoxPoints P)]
    (hP : ∀ q : Fin (k+1) → ℕ,naturalCoordinates q∈P)
    (w : Fin (k+1) → ℕ) (p : ℕ)
    (hp : 0<p) (hw : ∀ i,0<w i) (hdvd : ∀ i,w i∣p)
    (H : openFundamentalBoxPoints P → ℕ)
    (hH : ∀ b,(∑ i,(w i:ℝ)*b.val i)=(H b:ℝ))
    (hB : ∀ b,H b≤∑ i,w i) :
    HasPositiveGenusQuasipolynomial (fun g => (Nat.card (openConeHeightSlice w P g):ℚ)) k := by
  have he : (fun g => (Nat.card (openConeHeightSlice w P g):ℚ)) =
      fun g => ∑ b : OpenConeNumerator k P w p,
        (rayShiftCount k p (openConeNumeratorShift H b) g:ℚ) := by
    funext g
    exact_mod_cast openConeHeightSlice_card P hP w p hp hw hdvd H hH g
  rw [he]
  apply finite_ray_shifts_quasipolynomial _ _ _ hp
  intro b
  exact open_cone_shift_le_period_times_dimension w p (H b.1) hdvd (hB b.1) b.2

end CyrusianKaplan
