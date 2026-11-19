import Conjectures.LonelinessModularMultiplicity
import Conjectures.LonelinessTenSpeedInitialCoverage
import Conjectures.LonelinessModularFoldedSearch

/-! Finite orbit certificates for ten-coordinate folded supports. A support
of size nine has one repeated entry; its row checks every possible repeated
entry. The final bridge returns an actual permutation of the original
coordinates and the exact unit multiplier used by folded binary lifting. -/

namespace Loneliness.Modular.TenSpeed.Orbit

structure Witness (N : ℕ) where
  multiplier : ℕ
  inverse : ℕ
  index : Fin N

def Witness.Valid {N : ℕ} (m : ℕ) (roots : Fin N → Fin 10 → ℕ)
    (witness : Witness N) (l : List ℕ) : Prop :=
  (witness.multiplier*witness.inverse)%m=1%m ∧
    (l.map (fun a => folded m (witness.multiplier*a))).Perm
      (List.ofFn (roots witness.index))

instance {N : ℕ} (m : ℕ) (roots : Fin N → Fin 10 → ℕ)
    (witness : Witness N) (l : List ℕ) : Decidable (witness.Valid m roots l) :=
  inferInstanceAs (Decidable (_ ∧ _))

def HasRepresentative {N : ℕ} (m : ℕ) (roots : Fin N → Fin 10 → ℕ)
    (l : List ℕ) : Prop :=
  ∃ i u v, (u*v)%m=1%m ∧
    (l.map (fun a => folded m (u*a))).Perm (List.ofFn (roots i))

theorem Witness.sound {N : ℕ} {m : ℕ} {roots : Fin N → Fin 10 → ℕ}
    {witness : Witness N} {l : List ℕ} (h : witness.Valid m roots l) :
    HasRepresentative m roots l :=
  ⟨witness.index,witness.multiplier,witness.inverse,h.1,h.2⟩

theorem hasRepresentative_of_perm {N : ℕ} {m : ℕ} {roots : Fin N → Fin 10 → ℕ}
    {l l' : List ℕ} (hperm : l.Perm l') (h : HasRepresentative m roots l') :
    HasRepresentative m roots l := by
  obtain ⟨i,u,v,hunit,hrep⟩ := h
  exact ⟨i,u,v,hunit,(hperm.map _).trans hrep⟩

def SupportClassified {N : ℕ} (m : ℕ) (roots : Fin N → Fin 10 → ℕ)
    (s : Finset ℕ) : Prop :=
  ∀ l : List ℕ, l.toFinset=s → l.length=10 → HasRepresentative m roots l

structure Row (N : ℕ) where
  support : List ℕ
  single : Witness N
  repeated : ℕ → Witness N

def Row.Valid {N : ℕ} (m : ℕ) (roots : Fin N → Fin 10 → ℕ) (row : Row N) : Prop :=
  row.support.Nodup ∧
    ((row.support.length=10 ∧ row.single.Valid m roots row.support) ∨
      (row.support.length=9 ∧
        ∀ a∈row.support, (row.repeated a).Valid m roots (a::row.support)))

instance {N : ℕ} (m : ℕ) (roots : Fin N → Fin 10 → ℕ) (row : Row N) :
    Decidable (row.Valid m roots) :=
  inferInstanceAs (Decidable (_ ∧ ((_ ∧ _) ∨ (_ ∧ _))))

/-- A checked row covers every ten-entry list having its support, including
all possible locations and values of a repeated residue. -/
theorem Row.sound {N : ℕ} {m : ℕ} {roots : Fin N → Fin 10 → ℕ}
    (row : Row N) (hvalid : row.Valid m roots) :
    SupportClassified m roots row.support.toFinset := by
  intro l hset hlen
  have hbase : (row.support.toFinset.sort (·≤·)).Perm row.support :=
    (Multiplicity.perm_support_of_length row.support row.support.toFinset rfl
      (List.toFinset_card_of_nodup hvalid.1).symm).symm
  rcases hvalid.2 with ⟨hfull,himage⟩ | ⟨hrepeated,himage⟩
  · have hcard : row.support.toFinset.card=10 :=
      (List.toFinset_card_of_nodup hvalid.1).trans hfull
    have hl := Multiplicity.perm_support_of_length l row.support.toFinset hset (by omega)
    exact hasRepresentative_of_perm (hl.trans hbase) (Witness.sound himage)
  · have hcard : row.support.toFinset.card=9 :=
      (List.toFinset_card_of_nodup hvalid.1).trans hrepeated
    obtain ⟨a,ha,hperm⟩ := Multiplicity.ten_entries_nine_support l
      row.support.toFinset hset hlen hcard
    have hi := himage a (List.mem_toFinset.mp ha)
    exact hasRepresentative_of_perm (hperm.trans (hbase.cons a)) (Witness.sound hi)

/-- A retained leaf compares the complete finite support to an indexed row.
The expensive row validity proof can be checked once and reused by leaves. -/
def terminal {N R : ℕ} (rows : Fin R → Row N) (s : Finset ℕ) (index : ℕ) : Bool :=
  if h : index<R then decide (s=(rows ⟨index,h⟩).support.toFinset) else false

theorem terminal_sound {N R : ℕ} (m : ℕ) (roots : Fin N → Fin 10 → ℕ)
    (rows : Fin R → Row N) (hrows : ∀ i, (rows i).Valid m roots) :
    ∀ s index, terminal rows s index=true → SupportClassified m roots s := by
  intro s index hcheck
  by_cases hi : index<R
  · rw [terminal,dite_eq_left hi] at hcheck
    have heq : s=(rows ⟨index,hi⟩).support.toFinset := of_decide_eq_true hcheck
    rw [heq]
    exact (rows ⟨index,hi⟩).sound (hrows ⟨index,hi⟩)
  · rw [terminal,dite_eq_right hi] at hcheck
    cases hcheck

private theorem multiply_units {m u v a b : ℕ}
    (hu : (u*v)%m=1%m) (ha : (a*b)%m=1%m) :
    ((a*u)*(v*b))%m=1%m := by
  calc
    ((a*u)*(v*b))%m = ((u*v)*(a*b))%m := by congr 1; ring
    _ = ((u*v)%m*((a*b)%m))%m := Nat.mul_mod _ _ _
    _ = ((1%m)*(1%m))%m := by rw [hu,ha]
    _ = 1%m := by rw [←Nat.mul_mod]

/-- Support normalization and a finite orbit row give a literal folded
root representation of a permutation of the original integer speeds. -/
theorem normalized_represents {N m u inverse : ℕ} (hm : 0<m)
    (roots : Fin N → Fin 10 → ℕ) (v : Fin 10 → ℕ)
    (hunit : (u*inverse)%m=1%m)
    (hclassified : SupportClassified m roots
      (foldedSupport m u (FourSpeed.residueSupport m (List.ofFn v)))) :
    ∃ (i : Fin N) (σ : Equiv.Perm (Fin 10)), FoldedSearch.Represents m (roots i) (v ∘ σ) := by
  let l := (List.ofFn v).map (fun a => folded m (u*a))
  have hset : l.toFinset=
      foldedSupport m u (FourSpeed.residueSupport m (List.ofFn v)) :=
    (FourSpeed.transformed_support_eq m u hm (List.ofFn v)).symm
  have hlen : l.length=10 := by simp [l]
  obtain ⟨i,a,b,hab,hperm⟩ := hclassified l hset hlen
  have hperm' : (List.ofFn (fun j => folded m ((a*u)*v j))).Perm
      (List.ofFn (roots i)) := by
    simpa only [l,List.map_map,Function.comp_def,folded_action_comp m u a _ hm,
      List.map_ofFn] using hperm
  obtain ⟨σ,hσ⟩ := Multiplicity.folded_tuple_reindex m (a*u) v (roots i) hperm'
  exact ⟨i,σ,a*u,inverse*b,multiply_units hunit hab,hσ⟩

/-- Initial support search, multiplicity checks, and unit normalization
jointly cover every ten-entry actual tuple with nonzero prime residues.
The numerical support-search checks remain explicit premises here. -/
theorem checked_initial_represents {N R : ℕ} (m : ℕ) (hm : 2≤m) (hgrid : ¬11∣m)
    (inv : ℕ → ℕ) (hinv : ∀ a, 0<a → 2*a≤m → (a*inv a)%m=1%m)
    (roots : Fin N → Fin 10 → ℕ) (rows : Fin R → Row N)
    (hrows : ∀ i, (rows i).Valid m roots) (trees : ℕ → SupportSearch.Tree)
    (hcheck : ∀ b, 2≤b → 2*b≤m →
      SupportSearch.check (Initial.badTimes m) (Initial.pairCompatible m inv b)
        (terminal rows) (trees b) (Initial.selected b) (Initial.available m inv b)
        (Initial.uncovered m b) 8=true)
    (v : Fin 10 → ℕ) (hmod : ∀ i, v i%m≠0)
    (hlow : value (List.ofFn v)≤(1/11:ℝ)) :
    ∃ (i : Fin N) (σ : Equiv.Perm (Fin 10)), FoldedSearch.Represents m (roots i) (v ∘ σ) := by
  have hmod' : ∀ a∈List.ofFn v, a%m≠0 := by
    intro a ha
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp ha
    exact hmod i
  obtain ⟨u,inverse,hunit,hclassified⟩ := Initial.checked_initial_cover m hm hgrid inv hinv
    (terminal rows) (SupportClassified m roots) (terminal_sound m roots rows hrows)
    trees hcheck (List.ofFn v) (by simp) hmod' hlow
  exact normalized_represents (by omega : 0<m) roots v hunit hclassified

end Loneliness.Modular.TenSpeed.Orbit
