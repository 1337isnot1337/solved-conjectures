import Conjectures.LonelinessModularSupportLists
import Conjectures.LonelinessModularSupportMultiplicity
import Conjectures.LonelinessModularFoldedSearch

/-! Unit-orbit certificates for arbitrary folded-support multiplicities.

Every canonical representative of a retained support has its own checked
unit multiplier and literal root. Composing that multiplier with the initial
normalization gives an actual coordinate permutation of the original tuple.
Repeated coordinates are retained. Binary-tree checks, terminal semantics,
and integer classification are separate obligations.
-/

namespace Loneliness.Modular.SupportOrbits

open FourSpeed FoldedSearch

/-- A literal unit and root index for one multiplicity representative. -/
structure Witness (R : ℕ) where
  multiplier : ℕ
  inverse : ℕ
  index : Fin R

def Witness.Valid {R n : ℕ} (m : ℕ) (roots : Fin R → Fin n → ℕ)
    (witness : Witness R) (l : List ℕ) : Prop :=
  (witness.multiplier * witness.inverse) % m = 1 % m ∧
    (l.map (fun a => folded m (witness.multiplier * a))).Perm
      (List.ofFn (roots witness.index))

instance {R n : ℕ} (m : ℕ) (roots : Fin R → Fin n → ℕ)
    (witness : Witness R) (l : List ℕ) : Decidable (witness.Valid m roots l) :=
  inferInstanceAs (Decidable (_ ∧ _))

/-- A list is represented by a literal root after a unit action. -/
def HasRepresentative {R n : ℕ} (m : ℕ) (roots : Fin R → Fin n → ℕ)
    (l : List ℕ) : Prop :=
  ∃ j u inverse, (u * inverse) % m = 1 % m ∧
    (l.map (fun a => folded m (u * a))).Perm (List.ofFn (roots j))

theorem Witness.sound {R n m : ℕ} {roots : Fin R → Fin n → ℕ}
    {witness : Witness R} {l : List ℕ} (h : witness.Valid m roots l) :
    HasRepresentative m roots l :=
  ⟨witness.index, witness.multiplier, witness.inverse, h.1, h.2⟩

theorem hasRepresentative_of_perm {R n m : ℕ} {roots : Fin R → Fin n → ℕ}
    {l l' : List ℕ} (hperm : l.Perm l') (h : HasRepresentative m roots l') :
    HasRepresentative m roots l := by
  obtain ⟨j, u, inverse, hunit, hrep⟩ := h
  exact ⟨j, u, inverse, hunit, (hperm.map _).trans hrep⟩

/-- Semantic orbit coverage of every multiplicity class of every row. -/
def OrbitCover {N R n : ℕ} (m : ℕ) (rows : Fin N → ℕ)
    (roots : Fin R → Fin n → ℕ) : Prop :=
  ∀ i, ∀ r ∈ SupportMultiplicity.representatives n (SupportSearch.Bits.decode (rows i)),
    HasRepresentative m roots r

/-- Finite checked witnesses supply the unit and root for every class.
The witness function is inspected only on the finite representative sets. -/
def WitnessCover {N R n : ℕ} (m : ℕ) (rows : Fin N → ℕ)
    (roots : Fin R → Fin n → ℕ) (witnesses : Fin N → List ℕ → Witness R) : Prop :=
  ∀ i, ∀ r ∈ SupportMultiplicity.representatives n (SupportSearch.Bits.decode (rows i)),
    (witnesses i r).Valid m roots r

instance {N R n : ℕ} (m : ℕ) (rows : Fin N → ℕ)
    (roots : Fin R → Fin n → ℕ) (witnesses : Fin N → List ℕ → Witness R) :
    Decidable (WitnessCover m rows roots witnesses) :=
  inferInstanceAs (Decidable (∀ i,
    ∀ r ∈ SupportMultiplicity.representatives n (SupportSearch.Bits.decode (rows i)),
      (witnesses i r).Valid m roots r))

theorem WitnessCover.sound {N R n m : ℕ} {rows : Fin N → ℕ}
    {roots : Fin R → Fin n → ℕ} {witnesses : Fin N → List ℕ → Witness R}
    (h : WitnessCover m rows roots witnesses) : OrbitCover m rows roots := by
  intro i r hr
  exact Witness.sound (h i r hr)

/-- All lists of the specified length and support have a root in the orbit. -/
def SupportClassified {R n : ℕ} (m : ℕ) (roots : Fin R → Fin n → ℕ)
    (s : Finset ℕ) : Prop :=
  ∀ l : List ℕ, l.toFinset = s → l.length = n → HasRepresentative m roots l

/-- Canonical finite representatives cover every coordinate ordering,
with no restriction on the support deficit. -/
theorem orbitCover_support_classified {N R n m : ℕ} (rows : Fin N → ℕ)
    (roots : Fin R → Fin n → ℕ) (hcover : OrbitCover m rows roots) (i : Fin N) :
    SupportClassified m roots (SupportSearch.Bits.decode (rows i)) := by
  intro l hset hlen
  obtain ⟨r, hr, hperm⟩ := SupportMultiplicity.exists_perm_representative (n := n)
    l (SupportSearch.Bits.decode (rows i)) hset hlen
  exact hasRepresentative_of_perm hperm (hcover i r hr)

private theorem multiply_units {m u inverse a b : ℕ}
    (hu : (u * inverse) % m = 1 % m) (ha : (a * b) % m = 1 % m) :
    ((a * u) * (inverse * b)) % m = 1 % m := by
  calc
    ((a * u) * (inverse * b)) % m = ((u * inverse) * (a * b)) % m := by
      congr 1
      ring
    _ = ((u * inverse) % m * ((a * b) % m)) % m := Nat.mul_mod _ _ _
    _ = ((1 % m) * (1 % m)) % m := by rw [hu, ha]
    _ = 1 % m := by rw [← Nat.mul_mod]

/-- Initial normalization and an orbit witness compose as actual units.
The resulting coordinate permutation is valid when folded entries repeat. -/
theorem normalized_represents {R n m u inverse : ℕ} (hm : 0 < m)
    (roots : Fin R → Fin n → ℕ) (v : Fin n → ℕ)
    (hunit : (u * inverse) % m = 1 % m)
    (hclassified : SupportClassified m roots
      (foldedSupport m u (residueSupport m (List.ofFn v)))) :
    ∃ j, ∃ σ : Equiv.Perm (Fin n), Represents m (roots j) (v ∘ σ) := by
  let l := (List.ofFn v).map (fun a => folded m (u * a))
  have hset : l.toFinset = foldedSupport m u (residueSupport m (List.ofFn v)) :=
    (transformed_support_eq m u hm (List.ofFn v)).symm
  have hlen : l.length = n := by simp [l]
  obtain ⟨j, a, b, hab, hperm⟩ := hclassified l hset hlen
  have hperm' : (List.ofFn (fun i => folded m ((a * u) * v i))).Perm
      (List.ofFn (roots j)) := by
    simpa only [l, List.map_map, Function.comp_def, folded_action_comp m u a _ hm,
      List.map_ofFn] using hperm
  obtain ⟨σ, hσ⟩ := Multiplicity.folded_tuple_reindex m (a * u) v (roots j) hperm'
  exact ⟨j, σ, a * u, inverse * b, multiply_units hunit hab, hσ⟩

/-- A retained row and exhaustive orbit coverage give a represented root. -/
theorem represented_root_of_orbit_retained {N R n m u inverse : ℕ} (hm : 0 < m)
    (rows : Fin N → ℕ) (roots : Fin R → Fin n → ℕ)
    (hcover : OrbitCover m rows roots) (v : Fin n → ℕ)
    (hunit : (u * inverse) % m = 1 % m)
    (hretained : SupportLists.Retained rows
      (foldedSupport m u (residueSupport m (List.ofFn v)))) :
    ∃ j, ∃ σ : Equiv.Perm (Fin n), Represents m (roots j) (v ∘ σ) := by
  obtain ⟨i, hsupport⟩ := hretained
  apply normalized_represents hm roots v hunit
  rw [hsupport]
  exact orbitCover_support_classified rows roots hcover i

/-- The executable finite witness premise discharges semantic orbit coverage. -/
theorem represented_root_of_witness_retained {N R n m u inverse : ℕ} (hm : 0 < m)
    (rows : Fin N → ℕ) (roots : Fin R → Fin n → ℕ)
    (witnesses : Fin N → List ℕ → Witness R)
    (hcover : WitnessCover m rows roots witnesses) (v : Fin n → ℕ)
    (hunit : (u * inverse) % m = 1 % m)
    (hretained : SupportLists.Retained rows
      (foldedSupport m u (residueSupport m (List.ofFn v)))) :
    ∃ j, ∃ σ : Equiv.Perm (Fin n), Represents m (roots j) (v ∘ σ) :=
  represented_root_of_orbit_retained hm rows roots hcover.sound v hunit hretained

/-- Complete initial support checks and multiplicity-orbit coverage cover
every actual tuple at the closed threshold. This theorem supplies no binary
tree, no discarded-branch symmetry, and no integer-direction conclusion. -/
theorem checked_initial_represents {N R n : ℕ} (hn : 2 ≤ n)
    (den : ℕ) (hden : 3 ≤ den) (m : ℕ) (hm : 2 ≤ m) (hgrid : ¬ den ∣ m)
    (inv : ℕ → ℕ) (hinv : ∀ a, 0 < a → 2 * a ≤ m → (a * inv a) % m = 1 % m)
    (rows : Fin N → ℕ) (roots : Fin R → Fin n → ℕ)
    (hcover : OrbitCover m rows roots) (trees : ℕ → SupportSearch.Tree)
    (hcheck : ∀ b, 2 ≤ b → 2 * b ≤ m →
      SupportSearch.check (InitialSupport.badTimes den m)
        (InitialSupport.pairCompatible m inv b) (SupportLists.terminal rows) (trees b)
        (InitialSupport.selected b) (InitialSupport.available m inv b)
        (InitialSupport.uncovered den m b) (n - 2) = true)
    (v : Fin n → ℕ) (hmod : ∀ i, v i % m ≠ 0)
    (hlow : value (List.ofFn v) ≤ (1 : ℝ) / den) :
    ∃ j, ∃ σ : Equiv.Perm (Fin n), Represents m (roots j) (v ∘ σ) := by
  have hne : List.ofFn v ≠ [] := by
    intro he
    have hlength := congrArg List.length he
    simp only [List.length_ofFn, List.length_nil] at hlength
    omega
  have hmod' : ∀ a ∈ List.ofFn v, a % m ≠ 0 := by
    intro a ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    exact hmod i
  obtain ⟨u, inverse, hunit, hretained⟩ := SupportLists.checked_list_cover
    n den m hn hden hm hgrid inv hinv rows trees hcheck
    (List.ofFn v) hne (by simp) hmod' hlow
  exact represented_root_of_orbit_retained (by omega : 0 < m)
    rows roots hcover v hunit hretained

end Loneliness.Modular.SupportOrbits
