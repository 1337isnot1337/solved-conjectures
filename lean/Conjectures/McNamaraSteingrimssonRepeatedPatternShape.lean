module

public import Conjectures.McNamaraSteingrimssonBlockNormalize
public import Conjectures.McNamaraSteingrimssonOmittedBlock
public import Conjectures.McNamaraSteingrimssonPointedCount

@[expose] public section
namespace McNamaraSteingrimsson

def repeatedWidths (n A K : ℕ) : Fin (n+1)→ℕ :=
  Fin.cases A (fun _ => K)

@[simp] theorem repeatedWidths_head (n A K : ℕ) : repeatedWidths n A K 0=A := rfl
@[simp] theorem repeatedWidths_tail (n A K : ℕ) (i : Fin n) :
    repeatedWidths n A K i.succ=K := rfl

def repeatedOrders {n A K : ℕ} (a : Equiv.Perm (Fin A)) (p : Equiv.Perm (Fin K)) :
    BlockOrder (repeatedWidths n A K) :=
  fun i => Fin.cases (motive := fun i => Equiv.Perm (Fin (repeatedWidths n A K i)))
    a (fun _ => p) i

@[simp] theorem repeatedOrders_tail {n A K : ℕ} (a : Equiv.Perm (Fin A))
    (p : Equiv.Perm (Fin K)) (i : Fin n) :
    repeatedOrders a p i.succ=p := rfl

theorem repeatedWidths_le {n A K : ℕ} (h : A≤K) : ∀ i,repeatedWidths n A K i≤K := by
  intro i
  refine Fin.cases (motive := fun i => repeatedWidths n A K i≤K) ?_ (fun j => ?_) i
  · exact h
  · exact le_rfl

theorem cardinal_repeatedBlocks (n A K : ℕ) :
    Fintype.card (BlockPosition (repeatedWidths n A K))=A+n*K := by
  rw [card_blockPosition,Fin.sum_univ_succ]
  simp

/-- The literal order-normalized direct sum of the short initial summand
and the specified number of copies of the long summand. -/
noncomputable def repeatedPattern (n : ℕ) {A K : ℕ} (a : Equiv.Perm (Fin A))
    (p : Equiv.Perm (Fin K)) (h : A≤K) :
    Equiv.Perm (Fin (Fintype.card (BlockPosition (repeatedWidths n A K)))) :=
  blockPermutation (repeatedWidths_le h) (repeatedOrders a p)

theorem pointed_beginsWithMaximum {n : ℕ} (p : Equiv.Perm (Fin n)) :
    BeginsWithMaximum (pointedPermutation p) := by
  intro i hi
  have he : i=0 := Fin.ext hi
  subst i
  rw [pointed_zero]
  rfl

/-- An occurrence of the literal repeated source pattern uses exactly
all but one long host block, and uses every slot of each selected copy. -/
theorem repeatedPattern_exactly_one_omitted {n A K : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)} (hAK : A < K)
    (hm : BeginsWithMaximum p)
    (h : ClassicalPattern (repeatedPattern n a p hAK.le)
      (repeatedPattern (n+1) a p hAK.le)) :
    ∃ (f : BlockEmbedding (repeatedOrders (n := n) a p) (repeatedOrders (n := n+1) a p))
      (g : Fin n→Fin (n+1)) (miss : Fin (n+1)), StrictMono g ∧
      (∀ j : Fin (n+1), j≠miss ↔ ∃ i : Fin n,g i=j) ∧
      ∀ i : Fin n, ∃ (hp : 0 < repeatedWidths n A K i.succ),
        blockEmbedding_anchor f hp=(g i).succ ∧
          Function.Surjective (blockEmbedding_slots f hp (by simpa using hm)) := by
  obtain ⟨f⟩ := (blockPermutation_pattern_iff _ _ _ _).mp h
  have hK : 0<K := Nat.zero_le _ |>.trans_lt hAK
  have hhead : repeatedWidths (n+1) A K 0<K := hAK
  have tail (i : Fin n) : repeatedWidths n A K i.succ=K := rfl
  have host (i : Fin (n+1)) : repeatedWidths (n+1) A K i.succ=K := rfl
  have hmax (i : Fin n) : BeginsWithMaximum (repeatedOrders (n := n) a p i.succ) := hm
  obtain ⟨g,miss,hmono,hmissing,hfill⟩ := repeatedBlocks_one_omission f hK hhead tail host hmax
  exact ⟨f,g,miss,hmono,hmissing,hfill⟩

def piCaseWord : List Bool := List.replicate 33 true

theorem pi_weight : layerWeight piCaseWord=66 := by decide

theorem written_repeated_endpoint_sizes :
    Fintype.card (BlockPosition (repeatedWidths 1627
      (Fintype.card (LayerPosition alphaCaseWord)+1)
      (Fintype.card (LayerPosition piCaseWord)+1))) = 109051 ∧
    Fintype.card (BlockPosition (repeatedWidths 1628
      (Fintype.card (LayerPosition alphaCaseWord)+1)
      (Fintype.card (LayerPosition piCaseWord)+1))) = 109118 := by
  rw [cardinal_repeatedBlocks,cardinal_repeatedBlocks,card_layerPosition,card_layerPosition,
    alpha_weight,pi_weight]
  decide

end McNamaraSteingrimsson
