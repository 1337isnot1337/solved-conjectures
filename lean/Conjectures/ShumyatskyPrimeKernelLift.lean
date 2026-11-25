module

public import Conjectures.ShumyatskyPrimeSpectrum
public import Conjectures.ShumyatskyAbelianComplements
public import Mathlib.GroupTheory.OrderOfElement
public import Mathlib.Tactic.Group

/-! Lift across a kernel with a single prime divisor. The conjugacy of
complements is kept as an explicit Schur–Zassenhaus hypothesis. -/

@[expose] public section

namespace Shumyatsky

variable {G Q : Type*} [Group G] [Group Q]

private theorem order_dvd_card_of_mem (H : Subgroup G) {x : G} (hx : x ∈ H) :
    orderOf x ∣ Nat.card H := by
  have h := orderOf_injective H.subtype H.subtype_injective (⟨x, hx⟩ : H)
  change orderOf x = orderOf (⟨x, hx⟩ : H) at h
  rw [h]
  exact orderOf_dvd_natCard _

private theorem prime_dvd_order_of_kernel_ne_one (φ : G →* Q) {p : ℕ}
    (hPrimes : primeSpectrum φ.ker ⊆ {p}) {x : G} (hx : φ x = 1) (hne : x ≠ 1) :
    p ∣ orderOf x := by
  obtain ⟨q, hq, hqo⟩ := Nat.exists_prime_and_dvd (fun ho => hne (orderOf_eq_one_iff.mp ho))
  have hqp : q = p := Set.mem_singleton_iff.mp
    (hPrimes ⟨hq, hqo.trans (order_dvd_card_of_mem φ.ker (MonoidHom.mem_ker.mpr hx))⟩)
  rwa [hqp] at hqo

private theorem eq_one_of_mem_prime_free_supplement (φ : G →* Q) {p : ℕ}
    (hPrimes : primeSpectrum φ.ker ⊆ {p}) (H : Subgroup G) (hFree : ¬p ∣ Nat.card H)
    {x : G} (hx : x ∈ H) (hφx : φ x = 1) : x = 1 := by
  by_contra hne
  exact hFree ((prime_dvd_order_of_kernel_ne_one φ hPrimes hφx hne).trans
    (order_dvd_card_of_mem H hx))

private theorem map_pair_closure_prime_kernel (φ : G →* Q) (x y : G) :
    (Subgroup.closure ({x, y} : Set G)).map φ = Subgroup.closure {φ x, φ y} := by
  rw [MonoidHom.map_closure, Set.image_insert_eq, Set.image_singleton]

/-- A conjugate generating pair of the quotient of a minimal group
    lifts across a prime-power kernel, given conjugacy of complements. -/
theorem exists_lift_across_prime_kernel
    (φ : G →* Q) [Nontrivial φ.ker] (hSurj : Function.Surjective φ)
    (hMinimal : PrimeSpectrumMinimal G) {p : ℕ} (hp : p.Prime)
    (hPrimes : primeSpectrum φ.ker ⊆ {p})
    (hComplements : ∀ H K : Subgroup G, H.map φ = ⊤ → K.map φ = ⊤ →
      (¬p ∣ Nat.card H) → (¬p ∣ Nat.card K) →
      ∃ n : φ.ker, K = H.map (MulAut.conj (n : G)))
    (x g : G) (hQuotient : Subgroup.closure {φ x, φ g * φ x * (φ g)⁻¹} = ⊤) :
    ∃ x' g' : G, φ x' = φ x ∧ φ g' = φ g ∧
      Subgroup.closure {x', g' * x' * (g')⁻¹} = ⊤ := by
  let pair (a b : G) : Subgroup G := Subgroup.closure {a, b * a * b⁻¹}
  have hMap (a b : G) (ha : φ a = φ x) (hb : φ b = φ g) : (pair a b).map φ = ⊤ := by
    unfold pair
    rw [map_pair_closure_prime_kernel]
    simpa only [map_mul, map_inv, ha, hb] using hQuotient
  have hFree (H : Subgroup G) (hH : H.map φ = ⊤) (hProper : H ≠ ⊤) : ¬p ∣ Nat.card H := by
    intro hDiv
    apply hProper
    apply eq_top_of_surjects_and_kernel_primes hMinimal φ hSurj H hH
    intro q hq
    have he : q = p := Set.mem_singleton_iff.mp (hPrimes hq)
    exact he.symm ▸ (show p ∈ primeSpectrum H from ⟨hp, hDiv⟩)
  have hxPair (a b : G) : a ∈ pair a b := Subgroup.subset_closure (by simp)
  have hyPair (a b : G) : b * a * b⁻¹ ∈ pair a b := Subgroup.subset_closure (by simp)
  by_cases hWhole : pair x g = ⊤
  · exact ⟨x, g, rfl, rfl, hWhole⟩
  have hPrimeFree := hFree (pair x g) (hMap x g rfl rfl) hWhole
  have hMemEq (a b : G) (ha : a ∈ pair x g) (hb : b ∈ pair x g)
      (hEq : φ a = φ b) : a = b := by
    apply mul_inv_eq_one.mp
    apply eq_one_of_mem_prime_free_supplement φ hPrimes (pair x g) hPrimeFree
    · exact (pair x g).mul_mem ha ((pair x g).inv_mem hb)
    · rw [map_mul, map_inv, hEq, mul_inv_cancel]
  by_cases hCentral : ∃ n : φ.ker, (n : G) ≠ 1 ∧ Commute x (n : G)
  · obtain ⟨n, hn, hComm⟩ := hCentral
    have hnMap : φ (n : G) = 1 := MonoidHom.mem_ker.mp n.property
    have hNew : φ (x * (n : G)) = φ x := by rw [map_mul, hnMap, mul_one]
    refine ⟨x * (n : G), g, hNew, rfl, ?_⟩
    by_contra hProper
    have hFree' := hFree _ (hMap (x * (n : G)) g hNew rfl) hProper
    have hPowMem : (n : G) ^ orderOf x ∈ pair (x * (n : G)) g := by
      have h := (pair (x * (n : G)) g).pow_mem (hxPair (x * (n : G)) g) (orderOf x)
      rwa [hComm.mul_pow, pow_orderOf_eq_one, one_mul] at h
    have hPow : (n : G) ^ orderOf x = 1 := by
      apply eq_one_of_mem_prime_free_supplement φ hPrimes _ hFree' hPowMem
      rw [map_pow, hnMap, one_pow]
    exact hPrimeFree ((prime_dvd_order_of_kernel_ne_one φ hPrimes hnMap hn).trans
      ((orderOf_dvd_of_pow_eq_one hPow).trans (order_dvd_card_of_mem _ (hxPair x g))))
  · have hFixedFree (n : φ.ker) (h : Commute x (n : G)) : (n : G) = 1 := by
      by_contra hne
      exact hCentral ⟨n, hne, h⟩
    obtain ⟨v, hv⟩ := exists_ne (1 : φ.ker)
    have hvMap : φ (v : G) = 1 := MonoidHom.mem_ker.mp v.property
    have hvNe : (v : G) ≠ 1 := fun he => hv (Subtype.ext he)
    let y := g * x * g⁻¹
    let g' := (v : G) * g
    let y' := g' * x * (g')⁻¹
    have hG' : φ g' = φ g := by simp [g', hvMap]
    have hY' : y' = (v : G) * y * (v : G)⁻¹ := by
      unfold y' g' y
      group
    have hOutside : y' ∉ pair x g := by
      intro hIn
      have hSame : φ y' = φ y := by simp [y', y, hG']
      have hEqual := hMemEq y' y hIn (hyPair x g) hSame
      have hYV : Commute (v : G) y := (mul_inv_eq_iff_eq_mul.mp (hY'.symm.trans hEqual))
      let n : φ.ker := ⟨g⁻¹ * (v : G) * g, MonoidHom.mem_ker.mpr (by simp [hvMap])⟩
      have hComm : Commute x (n : G) := by
        change x * (g⁻¹ * (v : G) * g) = (g⁻¹ * (v : G) * g) * x
        have hh := congrArg (fun a : G => g⁻¹ * a * g) hYV.eq.symm
        dsimp [y] at hh
        convert hh using 1 <;> group
      have he := hFixedFree n hComm
      change g⁻¹ * (v : G) * g = 1 at he
      have hOne := congrArg (fun a : G => g * a * g⁻¹) he
      apply hvNe
      convert hOne using 1 <;> group
    refine ⟨x, g', rfl, hG', ?_⟩
    by_contra hProper
    have hMap' := hMap x g' rfl hG'
    obtain ⟨n, hn⟩ := hComplements (pair x g) (pair x g') (hMap x g rfl rfl) hMap'
      hPrimeFree (hFree _ hMap' hProper)
    have hx' : x ∈ (pair x g).map (MulAut.conj (n : G)) := hn ▸ hxPair x g'
    obtain ⟨a, ha, he⟩ := Subgroup.mem_map.mp hx'
    change (n : G) * a * (n : G)⁻¹ = x at he
    have hnMap : φ (n : G) = 1 := MonoidHom.mem_ker.mp n.property
    have hφa := congrArg φ he
    simp only [map_mul, map_inv, hnMap, one_mul, inv_one, mul_one] at hφa
    have hA := hMemEq a x ha (hxPair x g) hφa
    rw [hA] at he
    have hN : (n : G) = 1 := hFixedFree n (mul_inv_eq_iff_eq_mul.mp he).symm
    rw [hN, map_one] at hn
    change pair x g' = (pair x g).map (MonoidHom.id G) at hn
    have hEq : pair x g' = pair x g := by simpa only [Subgroup.map_id] using hn
    exact hOutside (hEq ▸ hyPair x g')


/-- In the abelian prime-kernel case, the actual conjugacy of
    complements follows from the kernel cocycle calculation. -/
theorem exists_lift_across_abelian_prime_kernel [Finite G]
    (φ : G →* Q) [Nontrivial φ.ker] [IsMulCommutative φ.ker]
    (hSurj : Function.Surjective φ) (hMinimal : PrimeSpectrumMinimal G) {p : ℕ} (hp : p.Prime)
    (hPrimes : primeSpectrum φ.ker ⊆ {p})
    (x g : G) (hQuotient : Subgroup.closure {φ x, φ g * φ x * (φ g)⁻¹} = ⊤) :
    ∃ x' g' : G, φ x' = φ x ∧ φ g' = φ g ∧
      Subgroup.closure {x', g' * x' * (g')⁻¹} = ⊤ := by
  apply exists_lift_across_prime_kernel φ hSurj hMinimal hp hPrimes _ x g hQuotient
  intro H K hH hK hFreeH hFreeK
  have hBijection (L : Subgroup G) (hL : L.map φ = ⊤) (hFree : ¬p ∣ Nat.card L) :
      Function.Bijective (φ.comp L.subtype) := by
    constructor
    · intro a b he
      apply Subtype.ext
      apply mul_inv_eq_one.mp
      apply eq_one_of_mem_prime_free_supplement φ hPrimes L hFree
        (L.mul_mem a.property (L.inv_mem b.property))
      change φ (a : G) = φ (b : G) at he
      rw [map_mul, map_inv, he, mul_inv_cancel]
    · intro q
      obtain ⟨u, hu, hEq⟩ := Subgroup.mem_map.mp (hL.symm ▸ Subgroup.mem_top q)
      exact ⟨⟨u, hu⟩, hEq⟩
  have hCoprime : (Nat.card H).Coprime (Nat.card φ.ker) := by
    apply Nat.coprime_of_dvd
    intro q hq hqH hqKer
    have he : q = p := Set.mem_singleton_iff.mp (hPrimes ⟨hq, hqKer⟩)
    exact hFreeH (he ▸ hqH)
  exact exists_kernel_conjugating_complements φ H K
    (hBijection H hH hFreeH) (hBijection K hK hFreeK) hCoprime

end Shumyatsky
