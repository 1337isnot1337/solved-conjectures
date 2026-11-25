module

public import Conjectures.ShumyatskyPrimeSpectrum
public import Mathlib.GroupTheory.GroupAction.ConjAct
public import Mathlib.Algebra.BigOperators.Group.List.Basic
public import Mathlib.Data.Finset.Sort
public import Mathlib.Algebra.BigOperators.Associated
public import Mathlib.SetTheory.Cardinal.Finite

/-! Combine the independently chosen adjustments on commuting normal
subgroups. The product of their adjustments acts as the prescribed
inner automorphism on each factor and stays in the common kernel. -/

@[expose] public section

namespace Shumyatsky

variable {G A I Q : Type*} [Group G] [Group A] [Group Q]

private theorem mapped_list_prod_eq_one (f : I → G) (φ : G →* A)
    (xs : List I) (h : ∀ j ∈ xs, φ (f j) = 1) :
    φ (xs.map f |>.prod) = 1 := by
  induction xs with
  | nil => exact φ.map_one
  | cons j rest ih =>
    simp only [List.map_cons, List.prod_cons, map_mul]
    rw [h j (List.mem_cons_self ..), ih (fun k hk => h k (List.mem_cons_of_mem _ hk)), one_mul]

private theorem mapped_list_prod_eq_single (f : I → G) (φ : G →* A)
    (xs : List I) (hNodup : xs.Nodup) (i : I) (hi : i ∈ xs)
    (hOthers : ∀ j, j ≠ i → φ (f j) = 1) :
    φ (xs.map f |>.prod) = φ (f i) := by
  induction xs with
  | nil => cases hi
  | cons j rest ih =>
    simp only [List.map_cons, List.prod_cons, map_mul]
    rcases List.mem_cons.mp hi with rfl | hi
    · have hTail := mapped_list_prod_eq_one f φ rest fun k hk =>
        hOthers k (fun he => (List.nodup_cons.mp hNodup).1 (he ▸ hk))
      rw [hTail, mul_one]
    · have hne : j ≠ i := fun he => (List.nodup_cons.mp hNodup).1 (he.symm ▸ hi)
      rw [hOthers j hne, ih (List.nodup_cons.mp hNodup).2 hi, one_mul]

theorem conjNormal_eq_conj_of_mem (N : Subgroup G) [N.Normal] (u : N) :
    (MulAut.conjNormal (H := N)) (u : G) = MulAut.conj u := by
  apply MulEquiv.ext
  intro t
  apply Subtype.ext
  rfl

theorem conjNormal_eq_one_of_commutes (N : Subgroup G) [N.Normal] (a : G)
    (hCommute : ∀ v : N, Commute a (v : G)) :
    (MulAut.conjNormal (H := N)) a = 1 := by
  apply MulEquiv.ext
  intro t
  apply Subtype.ext
  change a * (t : G) * a⁻¹ = (t : G)
  rw [(hCommute t).eq, mul_assoc, mul_inv_cancel, mul_one]

/-- Adjustments in different commuting normal subgroups can be
    combined without changing the quotient image. -/
theorem exists_simultaneous_conjugation_adjustment [Finite I]
    (N : I → Subgroup G) [∀ i, (N i).Normal] (φ : G →* Q)
    (hKernel : ∀ i, N i ≤ φ.ker)
    (hCommute : ∀ i j, i ≠ j → ∀ u : N i, ∀ v : N j, Commute (u : G) (v : G))
    (u : ∀ i, N i) :
    ∃ a : G, φ a = 1 ∧ ∀ i, (MulAut.conjNormal (H := N i)) a = MulAut.conj (u i) := by
  classical
  let _ := Fintype.ofFinite I
  let indices := (Finset.univ : Finset I).toList
  let values (i : I) : G := u i
  have hAll (i : I) : i ∈ indices := by simp [indices]
  have hNodup : indices.Nodup := Finset.nodup_toList _
  refine ⟨(indices.map values).prod, ?_, ?_⟩
  · apply mapped_list_prod_eq_one
    intro j _
    exact MonoidHom.mem_ker.mp (hKernel j (u j).property)
  · intro i
    rw [mapped_list_prod_eq_single values (MulAut.conjNormal (H := N i)) indices hNodup i (hAll i)]
    · exact conjNormal_eq_conj_of_mem (N i) (u i)
    · intro j hji
      exact conjNormal_eq_one_of_commutes (N i) (values j) (hCommute j i hji (u j))


theorem primeSpectrum_pi_subset [Finite I] (N : I → Type*) :
    primeSpectrum (∀ i, N i) ⊆ ⋃ i, primeSpectrum (N i) := by
  classical
  let _ := Fintype.ofFinite I
  intro p hp
  have hDvd : p ∣ ∏ i, Nat.card (N i) := by
    rw [← Nat.card_pi]
    exact hp.2
  obtain ⟨i, _, hi⟩ := (hp.1.prime.dvd_finsetProd_iff _).1 hDvd
  exact Set.mem_iUnion.mpr ⟨i, hp.1, hi⟩

private theorem map_pair_closure (φ : G →* Q) (x y : G) :
    (Subgroup.closure ({x, y} : Set G)).map φ = Subgroup.closure {φ x, φ y} := by
  rw [MonoidHom.map_closure, Set.image_insert_eq, Set.image_singleton]

/-- If the normal factors of a direct-product kernel each admit the
    local prime-spectrum lift for a given quotient pair, both lifts
    can be chosen concurrently and generate the entire minimal group. -/
theorem exists_generating_pair_of_factor_lifts [Finite I]
    (N : I → Subgroup G) [∀ i, (N i).Normal]
    (φ : G →* Q) (hSurj : Function.Surjective φ) (hMinimal : PrimeSpectrumMinimal G)
    (hKernel : ∀ i, N i ≤ φ.ker)
    (hProduct : φ.ker ≃* ∀ i, N i)
    (hCommute : ∀ i j, i ≠ j → ∀ u : N i, ∀ v : N j, Commute (u : G) (v : G))
    (x₀ g₀ : G)
    (hQuotient : Subgroup.closure {φ x₀, φ g₀ * φ x₀ * (φ g₀)⁻¹} = ⊤)
    (hLocal : ∀ i, ∃ a b : N i,
      let x := (MulAut.conjNormal (H := N i)) x₀ * MulAut.conj a
      let g := (MulAut.conjNormal (H := N i)) g₀ * MulAut.conj b
      primeSpectrum (N i) ⊆ primeSpectrum (Subgroup.closure {x, g * x * g⁻¹})) :
    ∃ x g : G, φ x = φ x₀ ∧ φ g = φ g₀ ∧ Subgroup.closure {x, g * x * g⁻¹} = ⊤ := by
  classical
  choose a b hLocalSpectrum using hLocal
  obtain ⟨u, hu, hU⟩ := exists_simultaneous_conjugation_adjustment N φ hKernel hCommute a
  obtain ⟨v, hv, hV⟩ := exists_simultaneous_conjugation_adjustment N φ hKernel hCommute b
  let x := x₀ * u
  let g := g₀ * v
  let y := g * x * g⁻¹
  let H : Subgroup G := Subgroup.closure {x, y}
  have hx : φ x = φ x₀ := by simp [x, hu]
  have hg : φ g = φ g₀ := by simp [g, hv]
  have hy : φ y = φ g₀ * φ x₀ * (φ g₀)⁻¹ := by simp [y, hx, hg]
  have hMap : H.map φ = ⊤ := by
    change (Subgroup.closure ({x, y} : Set G)).map φ = ⊤
    rw [map_pair_closure, hx, hy]
    exact hQuotient
  have hFactor (i : I) : primeSpectrum (N i) ⊆ primeSpectrum H := by
    let R : G →* MulAut (N i) := MulAut.conjNormal
    have hRx : R x = R x₀ * MulAut.conj (a i) := by
      rw [show x = x₀ * u from rfl, map_mul, hU]
    have hRg : R g = R g₀ * MulAut.conj (b i) := by
      rw [show g = g₀ * v from rfl, map_mul, hV]
    have hRy : R y = R g * R x * (R g)⁻¹ := by
      change R (g * x * g⁻¹) = _
      simp only [map_mul, map_inv]
    have hImage : primeSpectrum (N i) ⊆ primeSpectrum (H.map R) := by
      change primeSpectrum (N i) ⊆ primeSpectrum ((Subgroup.closure ({x, y} : Set G)).map R)
      rw [map_pair_closure, hRy, hRx, hRg]
      exact hLocalSpectrum i
    exact hImage.trans (primeSpectrum_mono_of_surjective (R.subgroupMap H) (R.subgroupMap_surjective H))
  have hCard : Nat.card φ.ker = Nat.card (∀ i, N i) := Nat.card_congr hProduct.toEquiv
  have hPrimes : primeSpectrum φ.ker ⊆ primeSpectrum H := by
    intro p hp
    have hPi : p ∈ primeSpectrum (∀ i, N i) := by
      exact ⟨hp.1, hCard ▸ hp.2⟩
    obtain ⟨i, hi⟩ := Set.mem_iUnion.mp (primeSpectrum_pi_subset (fun i => N i) hPi)
    exact hFactor i hi
  exact ⟨x, g, hx, hg, eq_top_of_surjects_and_kernel_primes hMinimal φ hSurj H hMap hPrimes⟩


/-- A minimal nontrivial normal subgroup of the ambient group. -/
structure IsMinimalNormalSubgroup (N : Subgroup G) : Prop where
  normal : N.Normal
  neBot : N ≠ ⊥
  eq_of_le : ∀ K : Subgroup G, K.Normal → K ≤ N → K ≠ ⊥ → K = N

theorem inf_eq_bot_of_distinct_minimal_normal {N M : Subgroup G}
    (hN : IsMinimalNormalSubgroup N) (hM : IsMinimalNormalSubgroup M) (hDistinct : N ≠ M) :
    N ⊓ M = ⊥ := by
  by_contra hNontrivial
  have : N.Normal := hN.normal
  have : M.Normal := hM.normal
  have hInf : N ⊓ M = N :=
    hN.eq_of_le _ inferInstance inf_le_left hNontrivial
  have hNM : N ≤ M := hInf ▸ inf_le_right
  exact hDistinct (hM.eq_of_le N hN.normal hNM hN.neBot)

/-- Distinct minimal normal factors commute as subgroups of G. -/
theorem commute_of_distinct_minimal_normal {N M : Subgroup G}
    (hN : IsMinimalNormalSubgroup N) (hM : IsMinimalNormalSubgroup M) (hDistinct : N ≠ M)
    (x : N) (y : M) : Commute (x : G) (y : G) := by
  let c := (x : G) * (y : G) * (x : G)⁻¹ * (y : G)⁻¹
  have hcN : c ∈ N := by
    change (x : G) * (y : G) * (x : G)⁻¹ * (y : G)⁻¹ ∈ N
    rw [mul_assoc (x : G) (y : G), mul_assoc]
    exact N.mul_mem x.property (hN.normal.conj_mem _ (N.inv_mem x.property) (y : G))
  have hcM : c ∈ M :=
    M.mul_mem (hM.normal.conj_mem _ y.property (x : G)) (M.inv_mem y.property)
  have hc : c ∈ N ⊓ M := ⟨hcN, hcM⟩
  rw [inf_eq_bot_of_distinct_minimal_normal hN hM hDistinct, Subgroup.mem_bot] at hc
  change (x : G) * (y : G) = (y : G) * (x : G)
  have h := mul_inv_eq_one.mp hc
  exact mul_inv_eq_iff_eq_mul.mp h

end Shumyatsky
