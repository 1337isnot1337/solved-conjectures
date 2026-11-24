import Mathlib.Order.Minimal
import Mathlib.Data.Fintype.Powerset
import Mathlib.Data.Finset.BooleanAlgebra
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Tauto
import Mathlib.Tactic.FinCases
import Mathlib.Data.Fintype.Prod
import Mathlib.Data.Fintype.Sum

/-!
# Sonntag–Teichert tournament domination theorem

The theorem `tournament_no_separation` states directly that the family of
minimal dominating sets of a finite tournament cannot be split across two
disjoint vertex sets with an edge on each side. The proof includes finite
blocker duality, the split-product lemma, representative counting and the
source case. The forward two-star classification is `oriented_separation_stars`;
`build_realizes_two_stars` constructs every such pair, with arbitrary extra
vertices shown isolated by `build_remaining_vertices_isolated`.
-/

noncomputable section
namespace Sonntag
open Finset
variable {V : Type*} [Fintype V] [DecidableEq V]

def hits (F : Finset (Finset V)) (s : Finset V) : Prop :=
  ∀ e ∈ F, ∃ v, v ∈ s ∧ v ∈ e

def blocker (F : Finset (Finset V)) : Finset (Finset V) :=
  by classical exact univ.filter (Minimal (hits F))

omit [DecidableEq V] in
theorem exists_minimal_hit (F : Finset (Finset V)) (s : Finset V) (hs : hits F s) :
    ∃ t ∈ blocker F, t ⊆ s := by
  obtain ⟨t, hts, ht⟩ := exists_minimal_le_of_wellFoundedLT (hits F) s hs
  exact ⟨t, by simp [blocker, ht], hts⟩

omit [Fintype V] [DecidableEq V] in
theorem hits_mono (F : Finset (Finset V)) {s t : Finset V} (h : s ⊆ t) :
    hits F s → hits F t := by
  intro hs e he
  obtain ⟨v, hv, hv'⟩ := hs e he
  exact ⟨v, h hv, hv'⟩

theorem hits_blocker_iff (F : Finset (Finset V)) (s : Finset V) :
    hits (blocker F) s ↔ ∃ e ∈ F, e ⊆ s := by
  classical
  constructor
  · intro h
    by_contra hn
    have hc : hits F (univ \ s) := by
      intro e he
      have hnsub : ¬ e ⊆ s := by
        intro hsub
        exact hn ⟨e, he, hsub⟩
      obtain ⟨v, hve, hvs⟩ := not_subset.mp hnsub
      exact ⟨v, by simp [hvs], hve⟩
    obtain ⟨t, ht, hsub⟩ := exists_minimal_hit F (univ \ s) hc
    obtain ⟨v, hvs, hvt⟩ := h t ht
    have hv := hsub hvt
    simp only [mem_sdiff, mem_univ, true_and] at hv
    exact hv hvs
  · rintro ⟨e, he, hsub⟩ t ht
    have ht' : hits F t := by
      have hm : Minimal (hits F) t := by simpa [blocker] using ht
      exact hm.1
    obtain ⟨v, hvt, hve⟩ := ht' e he
    exact ⟨v, hsub hve, hvt⟩

def minEdges (F : Finset (Finset V)) : Finset (Finset V) :=
  by classical exact univ.filter (Minimal (fun e => e ∈ F))

omit [DecidableEq V] in
theorem mem_blocker (F : Finset (Finset V)) (s : Finset V) :
    s ∈ blocker F ↔ Minimal (hits F) s := by
  classical
  simp [blocker]

omit [DecidableEq V] in
theorem mem_minEdges (F : Finset (Finset V)) (s : Finset V) :
    s ∈ minEdges F ↔ Minimal (fun e => e ∈ F) s := by
  classical
  simp [minEdges]

theorem blocker_involution (F : Finset (Finset V)) :
    blocker (blocker F) = minEdges F := by
  classical
  ext s
  rw [mem_blocker, mem_minEdges]
  constructor
  · intro h
    obtain ⟨e, he, hes⟩ := (hits_blocker_iff F s).mp h.1
    have hehit : hits (blocker F) e := (hits_blocker_iff F e).mpr ⟨e, he, Subset.rfl⟩
    have hse : s ⊆ e := h.2 hehit hes
    have hEq : s = e := Subset.antisymm hse hes
    subst e
    refine ⟨he, ?_⟩
    intro t ht hts
    have hthit : hits (blocker F) t := (hits_blocker_iff F t).mpr ⟨t, ht, Subset.rfl⟩
    exact h.2 hthit hts
  · intro h
    refine ⟨(hits_blocker_iff F s).mpr ⟨s, h.1, Subset.rfl⟩, ?_⟩
    intro t ht hts
    obtain ⟨e, he, het⟩ := (hits_blocker_iff F t).mp ht
    have hse : s ⊆ e := h.2 he (het.trans hts)
    exact hse.trans het

def inClosed (arc : V → V → Prop) (v : V) : Finset V :=
  by classical exact univ.filter (fun u => u = v ∨ arc u v)

def neighbourhoods (arc : V → V → Prop) : Finset (Finset V) :=
  univ.image (inClosed arc)

def dominates (arc : V → V → Prop) (s : Finset V) : Prop :=
  ∀ v, v ∉ s → ∃ u ∈ s, arc u v

theorem domination_iff_hits (arc : V → V → Prop) (s : Finset V) :
    dominates arc s ↔ hits (neighbourhoods arc) s := by
  classical
  constructor
  · intro h e he
    obtain ⟨v, _, rfl⟩ := mem_image.mp he
    by_cases hv : v ∈ s
    · exact ⟨v, hv, by simp [inClosed]⟩
    · obtain ⟨u, hu, hArc⟩ := h v hv
      exact ⟨u, hu, by simp [inClosed, hArc]⟩
  · intro h v hv
    have he : inClosed arc v ∈ neighbourhoods arc := by simp [neighbourhoods]
    obtain ⟨u, hu, hIn⟩ := h (inClosed arc v) he
    have hIn' : u = v ∨ arc u v := by simpa [inClosed] using hIn
    rcases hIn' with huv | hArc
    · subst u
      exact False.elim (hv hu)
    · exact ⟨u, hu, hArc⟩

theorem minimal_domination_blocker (arc : V → V → Prop) (s : Finset V) :
    s ∈ blocker (neighbourhoods arc) ↔ Minimal (dominates arc) s := by
  rw [mem_blocker]
  have heq : hits (neighbourhoods arc) = dominates arc := by
    funext t
    exact propext (domination_iff_hits arc t).symm
  rw [heq]

theorem domination_double_blocker (arc : V → V → Prop) :
    blocker (blocker (neighbourhoods arc)) = minEdges (neighbourhoods arc) :=
  blocker_involution _

theorem closed_neighbourhoods_intersect (arc : V → V → Prop)
    (total : ∀ u v, u ≠ v → arc u v ∨ arc v u) (u v : V) :
    ∃ w, w ∈ inClosed arc u ∧ w ∈ inClosed arc v := by
  classical
  by_cases h : u = v
  · subst v
    exact ⟨u, by simp [inClosed], by simp [inClosed]⟩
  · rcases total u v h with huv | hvu
    · exact ⟨u, by simp [inClosed], by simp [inClosed, huv]⟩
    · exact ⟨v, by simp [inClosed, hvu], by simp [inClosed]⟩

theorem closed_neighbourhood_mutual_impossible (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u) (u v : V) (hne : u ≠ v)
    (huv : u ∈ inClosed arc v) (hvu : v ∈ inClosed arc u) : False := by
  classical
  have ha : arc u v := by
    have h : u = v ∨ arc u v := by simpa [inClosed] using huv
    exact h.resolve_left hne
  have hb : arc v u := by
    have h : v = u ∨ arc v u := by simpa [inClosed] using hvu
    exact h.resolve_left (Ne.symm hne)
  exact oriented u v ha hb

omit [Fintype V] in
theorem hits_split (F G : Finset (Finset V)) (X Y s : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) :
    hits (F ∪ G) s ↔ hits F (s ∩ X) ∧ hits G (s ∩ Y) := by
  constructor
  · intro h
    constructor
    · intro e he
      obtain ⟨v, hv, hve⟩ := h e (mem_union_left G he)
      exact ⟨v, mem_inter.mpr ⟨hv, hF e he hve⟩, hve⟩
    · intro e he
      obtain ⟨v, hv, hve⟩ := h e (mem_union_right F he)
      exact ⟨v, mem_inter.mpr ⟨hv, hG e he hve⟩, hve⟩
  · rintro ⟨h1, h2⟩ e he
    rcases mem_union.mp he with he | he
    · obtain ⟨v, hv, hve⟩ := h1 e he
      exact ⟨v, (mem_inter.mp hv).1, hve⟩
    · obtain ⟨v, hv, hve⟩ := h2 e he
      exact ⟨v, (mem_inter.mp hv).1, hve⟩

omit [Fintype V] in
theorem minimal_split_union (F G : Finset (Finset V)) (X Y a b : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) (hXY : Disjoint X Y)
    (haX : a ⊆ X) (hbY : b ⊆ Y)
    (ha : Minimal (hits F) a) (hb : Minimal (hits G) b) :
    Minimal (hits (F ∪ G)) (a ∪ b) := by
  constructor
  · intro e he
    rcases mem_union.mp he with he | he
    · obtain ⟨v, hva, hve⟩ := ha.1 e he
      exact ⟨v, mem_union_left b hva, hve⟩
    · obtain ⟨v, hvb, hve⟩ := hb.1 e he
      exact ⟨v, mem_union_right a hvb, hve⟩
  · intro t ht hts
    have hsplit := (hits_split F G X Y t hF hG).mp ht
    have hta : t ∩ X ⊆ a := by
      intro v hv
      have hvT := (mem_inter.mp hv).1
      have hvX := (mem_inter.mp hv).2
      rcases mem_union.mp (hts hvT) with hva | hvb
      · exact hva
      · exact False.elim ((disjoint_left.mp hXY) hvX (hbY hvb))
    have htb : t ∩ Y ⊆ b := by
      intro v hv
      have hvT := (mem_inter.mp hv).1
      have hvY := (mem_inter.mp hv).2
      rcases mem_union.mp (hts hvT) with hva | hvb
      · exact False.elim ((disjoint_left.mp hXY) (haX hva) hvY)
      · exact hvb
    have haT : a ⊆ t := (ha.2 hsplit.1 hta).trans inter_subset_left
    have hbT : b ⊆ t := (hb.2 hsplit.2 htb).trans inter_subset_left
    exact union_subset haT hbT

omit [Fintype V] in
theorem minimal_split_parts (F G : Finset (Finset V)) (X Y s : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) (hXY : Disjoint X Y)
    (hs : Minimal (hits (F ∪ G)) s) :
    Minimal (hits F) (s ∩ X) ∧ Minimal (hits G) (s ∩ Y) ∧ s = (s ∩ X) ∪ (s ∩ Y) := by
  have hsplit := (hits_split F G X Y s hF hG).mp hs.1
  have union_hits : ∀ a b : Finset V, hits F a → hits G b → hits (F ∪ G) (a ∪ b) := by
    intro a b ha hb e he
    rcases mem_union.mp he with he | he
    · obtain ⟨v, hv, hve⟩ := ha e he
      exact ⟨v, mem_union_left b hv, hve⟩
    · obtain ⟨v, hv, hve⟩ := hb e he
      exact ⟨v, mem_union_right a hv, hve⟩
  have hsU : s ⊆ (s ∩ X) ∪ (s ∩ Y) :=
    hs.2 (union_hits _ _ hsplit.1 hsplit.2) (union_subset inter_subset_left inter_subset_left)
  have hsEq : s = (s ∩ X) ∪ (s ∩ Y) :=
    Subset.antisymm hsU (union_subset inter_subset_left inter_subset_left)
  refine ⟨⟨hsplit.1, ?_⟩, ⟨hsplit.2, ?_⟩, hsEq⟩
  · intro a ha has
    have hsub : a ∪ (s ∩ Y) ⊆ s := union_subset (has.trans inter_subset_left) inter_subset_left
    have hs' := hs.2 (union_hits _ _ ha hsplit.2) hsub
    intro v hv
    have hvx := (mem_inter.mp hv).2
    rcases mem_union.mp (hs' (mem_inter.mp hv).1) with hva | hvy
    · exact hva
    · exact False.elim ((disjoint_left.mp hXY) hvx (mem_inter.mp hvy).2)
  · intro b hb hbs
    have hsub : (s ∩ X) ∪ b ⊆ s := union_subset inter_subset_left (hbs.trans inter_subset_left)
    have hs' := hs.2 (union_hits _ _ hsplit.1 hb) hsub
    intro v hv
    have hvy := (mem_inter.mp hv).2
    rcases mem_union.mp (hs' (mem_inter.mp hv).1) with hvx | hvb
    · exact False.elim ((disjoint_left.mp hXY) (mem_inter.mp hvx).2 hvy)
    · exact hvb

omit [Fintype V] in
theorem minimal_hits_subset (F : Finset (Finset V)) (X a : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (ha : Minimal (hits F) a) : a ⊆ X := by
  have hint : hits F (a ∩ X) := by
    intro e he
    obtain ⟨v, hv, hve⟩ := ha.1 e he
    exact ⟨v, mem_inter.mpr ⟨hv, hF e he hve⟩, hve⟩
  exact (ha.2 hint inter_subset_left).trans inter_subset_right

theorem blocker_split (F G : Finset (Finset V)) (X Y s : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) (hXY : Disjoint X Y) :
    s ∈ blocker (F ∪ G) ↔ ∃ a ∈ blocker F, ∃ b ∈ blocker G, s = a ∪ b := by
  rw [mem_blocker]
  constructor
  · intro hs
    obtain ⟨ha, hb, hEq⟩ := minimal_split_parts F G X Y s hF hG hXY hs
    exact ⟨s ∩ X, (mem_blocker F _).mpr ha, s ∩ Y, (mem_blocker G _).mpr hb, hEq⟩
  · rintro ⟨a, ha, b, hb, rfl⟩
    have ha' := (mem_blocker F a).mp ha
    have hb' := (mem_blocker G b).mp hb
    exact minimal_split_union F G X Y a b hF hG hXY
      (minimal_hits_subset F X a hF ha') (minimal_hits_subset G Y b hG hb') ha' hb'

omit [DecidableEq V] in
theorem blocker_nonempty (F : Finset (Finset V))
    (hne : ∀ e ∈ F, e.Nonempty) : (blocker F).Nonempty := by
  have hh : hits F univ := by
    intro e he
    obtain ⟨v, hv⟩ := hne e he
    exact ⟨v, mem_univ v, hv⟩
  obtain ⟨a, ha, _⟩ := exists_minimal_hit F univ hh
  exact ⟨a, ha⟩

omit [DecidableEq V] in
theorem blocker_member_nonempty (F : Finset (Finset V)) (hF : F.Nonempty)
    (a : Finset V) (ha : a ∈ blocker F) : a.Nonempty := by
  obtain ⟨e, he⟩ := hF
  have ha' := (mem_blocker F a).mp ha
  obtain ⟨v, hv, _⟩ := ha'.1 e he
  exact ⟨v, hv⟩

theorem no_singleton_implies_two_left (F G : Finset (Finset V)) (X Y : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) (hXY : Disjoint X Y)
    (hFn : F.Nonempty) (hFne : ∀ e ∈ F, e.Nonempty)
    (hNo : ∀ v : V, ¬ hits (blocker (F ∪ G)) {v}) :
    ∃ a ∈ blocker F, ∃ b ∈ blocker F, a ≠ b := by
  classical
  obtain ⟨a, ha⟩ := blocker_nonempty F hFne
  obtain ⟨v, hv⟩ := blocker_member_nonempty F hFn a ha
  have hex : ∃ b ∈ blocker F, a ≠ b := by
    by_contra hn
    have hunique : ∀ b ∈ blocker F, b = a := by
      intro b hb
      by_contra hba
      exact hn ⟨b, hb, Ne.symm hba⟩
    have hhit : hits (blocker (F ∪ G)) {v} := by
      intro t ht
      obtain ⟨a', ha', b, hb, ht'⟩ := (blocker_split F G X Y t hF hG hXY).mp ht
      have hEq := hunique a' ha'
      subst a'
      exact ⟨v, by simp, by rw [ht']; exact mem_union_left b hv⟩
    exact hNo v hhit
  obtain ⟨b, hb, hab⟩ := hex
  exact ⟨a, ha, b, hb, hab⟩

omit [Fintype V] in
theorem representatives_bound {A B : Type*} [Fintype A] [Fintype B]
    (row : A → Finset V) (col : B → Finset V) (rep : A → B → V)
    (hcover : ∀ a b, rep a b ∈ row a ∨ rep a b ∈ col b)
    (hrow : ∀ a b₁ b₂, rep a b₁ ∈ row a → rep a b₂ ∈ row a → b₁ = b₂)
    (hcol : ∀ b a₁ a₂, rep a₁ b ∈ col b → rep a₂ b ∈ col b → a₁ = a₂) :
    Fintype.card A * Fintype.card B ≤ Fintype.card A + Fintype.card B := by
  classical
  let f : A × B → A ⊕ B := fun p => if rep p.1 p.2 ∈ row p.1 then Sum.inl p.1 else Sum.inr p.2
  have hf : Function.Injective f := by
    rintro ⟨a, b⟩ ⟨a', b'⟩ h
    dsimp [f] at h
    split at h <;> split at h
    · rename_i h₁ h₂
      have ha : a = a' := Sum.inl.inj h
      subst a'
      have hb : b = b' := hrow a b b' h₁ h₂
      subst b'
      rfl
    · cases h
    · cases h
    · rename_i h₁ h₂
      have hb : b = b' := Sum.inr.inj h
      subst b'
      have ha : a = a' := hcol b a a'
        ((hcover a b).resolve_left h₁) ((hcover a' b).resolve_left h₂)
      subst a'
      rfl
  have hc := Fintype.card_le_of_injective f hf
  simpa [Fintype.card_prod, Fintype.card_sum] using hc

omit [Fintype V] [DecidableEq V] in
theorem card_two_of_product_bound (p q : ℕ) (hp : 2 ≤ p) (hq : 2 ≤ q)
    (h : p*q ≤ p+q) : p = 2 ∧ q = 2 := by
  have h1 : p*2 ≤ p*q := Nat.mul_le_mul_left p hq
  have h2 : q*2 ≤ q*p := Nat.mul_le_mul_left q hp
  have hs : p = q := by nlinarith
  subst q
  have heq : p = 2 := by nlinarith
  exact ⟨heq, heq⟩

omit [Fintype V] in
theorem split_union_injective (X Y a a' b b' : Finset V) (hXY : Disjoint X Y)
    (ha : a ⊆ X) (ha' : a' ⊆ X) (hb : b ⊆ Y) (hb' : b' ⊆ Y)
    (h : a ∪ b = a' ∪ b') : a = a' ∧ b = b' := by
  constructor
  · apply Finset.Subset.antisymm
    · intro v hv
      have ht : v ∈ a' ∪ b' := h ▸ mem_union_left b hv
      rcases mem_union.mp ht with ht | ht
      · exact ht
      · exact False.elim ((disjoint_left.mp hXY) (ha hv) (hb' ht))
    · intro v hv
      have ht : v ∈ a ∪ b := h.symm ▸ mem_union_left b' hv
      rcases mem_union.mp ht with ht | ht
      · exact ht
      · exact False.elim ((disjoint_left.mp hXY) (ha' hv) (hb ht))
  · apply Finset.Subset.antisymm
    · intro v hv
      have ht : v ∈ a' ∪ b' := h ▸ mem_union_right a hv
      rcases mem_union.mp ht with ht | ht
      · exact False.elim ((disjoint_left.mp hXY) (ha' ht) (hb hv))
      · exact ht
    · intro v hv
      have ht : v ∈ a ∪ b := h.symm ▸ mem_union_right a' hv
      rcases mem_union.mp ht with ht | ht
      · exact False.elim ((disjoint_left.mp hXY) (ha ht) (hb' hv))
      · exact ht

theorem row_representatives_unique {A B : Type*} (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (X Y : Finset V) (hXY : Disjoint X Y) (row : A → Finset V) (col : B → Finset V)
    (hr : ∀ a, row a ⊆ X) (hc : ∀ b, col b ⊆ Y) (col_inj : Function.Injective col)
    (rep : A → B → V) (hrep : ∀ a b, inClosed arc (rep a b) = row a ∪ col b)
    (a : A) (b b' : B) (hb : rep a b ∈ row a) (hb' : rep a b' ∈ row a) : b = b' := by
  by_contra hne
  have hrepne : rep a b ≠ rep a b' := by
    intro heq
    have hu : row a ∪ col b = row a ∪ col b' := by
      rw [← hrep a b, ← hrep a b', heq]
    have hcol := (split_union_injective X Y (row a) (row a) (col b) (col b')
      hXY (hr a) (hr a) (hc b) (hc b') hu).2
    exact hne (col_inj hcol)
  apply closed_neighbourhood_mutual_impossible arc oriented (rep a b) (rep a b') hrepne
  · rw [hrep]
    exact mem_union_left _ hb
  · rw [hrep]
    exact mem_union_left _ hb'

theorem column_representatives_unique {A B : Type*} (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (X Y : Finset V) (hXY : Disjoint X Y) (row : A → Finset V) (col : B → Finset V)
    (hr : ∀ a, row a ⊆ X) (hc : ∀ b, col b ⊆ Y) (row_inj : Function.Injective row)
    (rep : A → B → V) (hrep : ∀ a b, inClosed arc (rep a b) = row a ∪ col b)
    (b : B) (a a' : A) (ha : rep a b ∈ col b) (ha' : rep a' b ∈ col b) : a = a' := by
  by_contra hne
  have hrepne : rep a b ≠ rep a' b := by
    intro heq
    have hu : row a ∪ col b = row a' ∪ col b := by
      rw [← hrep a b, ← hrep a' b, heq]
    have hrow := (split_union_injective X Y (row a) (row a') (col b) (col b)
      hXY (hr a) (hr a') (hc b) (hc b) hu).1
    exact hne (row_inj hrow)
  apply closed_neighbourhood_mutual_impossible arc oriented (rep a b) (rep a' b) hrepne
  · rw [hrep]
    exact mem_union_right _ ha
  · rw [hrep]
    exact mem_union_right _ ha'

theorem two_blocker_members_disjoint (F G : Finset (Finset V)) (X Y : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) (hXY : Disjoint X Y)
    (hNo : ∀ v : V, ¬ hits (blocker (F ∪ G)) {v})
    (hcard : (blocker F).card = 2) (a a' : Finset V)
    (ha : a ∈ blocker F) (ha' : a' ∈ blocker F) (hne : a ≠ a') : Disjoint a a' := by
  classical
  apply disjoint_left.mpr
  intro v hv hv'
  have hall : ∀ c ∈ blocker F, v ∈ c := by
    intro c hc
    obtain ⟨u, w, huw, hset⟩ := Finset.card_eq_two.mp hcard
    have hu : a = u ∨ a = w := by simpa [hset] using ha
    have hw : a' = u ∨ a' = w := by simpa [hset] using ha'
    have hc' : c = u ∨ c = w := by simpa [hset] using hc
    rcases hu with h1 | h1 <;> rcases hw with h2 | h2 <;> rcases hc' with h3 | h3
    all_goals subst_vars
    all_goals first | exact hv | exact hv' | contradiction
  have hhit : hits (blocker (F ∪ G)) {v} := by
    intro t ht
    obtain ⟨a'', ha'', b, _, ht'⟩ := (blocker_split F G X Y t hF hG hXY).mp ht
    exact ⟨v, by simp, by rw [ht']; exact mem_union_left b (hall a'' ha'')⟩
  exact hNo v hhit

theorem separated_blockers_impossible (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (total : ∀ u v, u ≠ v → arc u v ∨ arc v u)
    (F G : Finset (Finset V)) (X Y : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) (hXY : Disjoint X Y)
    (hFn : F.Nonempty) (hGn : G.Nonempty)
    (hFne : ∀ e ∈ F, e.Nonempty) (hGne : ∀ e ∈ G, e.Nonempty)
    (hD : blocker (neighbourhoods arc) = F ∪ G)
    (hNo : ∀ v : V, ¬ hits (blocker (F ∪ G)) {v}) : False := by
  classical
  have hNo' : ∀ v : V, ¬ hits (blocker (G ∪ F)) {v} := by
    simpa [union_comm] using hNo
  obtain ⟨a, ha, a', ha', hane⟩ := no_singleton_implies_two_left F G X Y hF hG hXY hFn hFne hNo
  obtain ⟨b, hb, b', hb', hbne⟩ := no_singleton_implies_two_left G F Y X hG hF hXY.symm hGn hGne hNo'
  have hcarda : 2 ≤ (blocker F).card := (Finset.one_lt_card.mpr ⟨a,ha,a',ha',hane⟩)
  have hcardb : 2 ≤ (blocker G).card := (Finset.one_lt_card.mpr ⟨b,hb,b',hb',hbne⟩)
  let A := {z // z ∈ blocker F}
  let B := {z // z ∈ blocker G}
  let row : A → Finset V := fun z => z.val
  let col : B → Finset V := fun z => z.val
  have hr : ∀ z, row z ⊆ X := by
    intro z
    exact minimal_hits_subset F X z.val hF ((mem_blocker F z.val).mp z.property)
  have hc : ∀ z, col z ⊆ Y := by
    intro z
    exact minimal_hits_subset G Y z.val hG ((mem_blocker G z.val).mp z.property)
  have hasrep : ∀ (r : A) (c : B), ∃ v, inClosed arc v = row r ∪ col c := by
    intro r c
    have hm : row r ∪ col c ∈ blocker (F ∪ G) :=
      (blocker_split F G X Y _ hF hG hXY).mpr ⟨r.val, r.property, c.val, c.property, rfl⟩
    rw [← hD, domination_double_blocker] at hm
    have hm' := (mem_minEdges (neighbourhoods arc) _).mp hm
    obtain ⟨v, _, hv⟩ := mem_image.mp hm'.1
    exact ⟨v, hv⟩
  let rep : A → B → V := fun r c => Classical.choose (hasrep r c)
  have hrep : ∀ r c, inClosed arc (rep r c) = row r ∪ col c := fun r c => Classical.choose_spec (hasrep r c)
  have hcover : ∀ r c, rep r c ∈ row r ∨ rep r c ∈ col c := by
    intro r c
    have hself : rep r c ∈ inClosed arc (rep r c) := by simp [inClosed]
    rw [hrep] at hself
    exact mem_union.mp hself
  have hrow : ∀ r c c', rep r c ∈ row r → rep r c' ∈ row r → c = c' :=
    row_representatives_unique arc oriented X Y hXY row col hr hc Subtype.val_injective rep hrep
  have hcol : ∀ c r r', rep r c ∈ col c → rep r' c ∈ col c → r = r' :=
    column_representatives_unique arc oriented X Y hXY row col hr hc Subtype.val_injective rep hrep
  have hcount := representatives_bound row col rep hcover hrow hcol
  have hprod : (blocker F).card * (blocker G).card ≤ (blocker F).card + (blocker G).card := by
    simpa [A, B, Fintype.card_coe] using hcount
  obtain ⟨hca, hcb⟩ := card_two_of_product_bound _ _ hcarda hcardb hprod
  have hadis := two_blocker_members_disjoint F G X Y hF hG hXY hNo hca a a' ha ha' hane
  have hbdis := two_blocker_members_disjoint G F Y X hG hF hXY.symm hNo' hcb b b' hb hb' hbne
  let r : A := ⟨a,ha⟩
  let r' : A := ⟨a',ha'⟩
  let c : B := ⟨b,hb⟩
  let c' : B := ⟨b',hb'⟩
  obtain ⟨w, hw, hw'⟩ := closed_neighbourhoods_intersect arc total (rep r c) (rep r' c')
  rw [hrep] at hw hw'
  change w ∈ a ∪ b at hw
  change w ∈ a' ∪ b' at hw'
  have haX : a ⊆ X := hr r
  have haX' : a' ⊆ X := hr r'
  have hbY : b ⊆ Y := hc c
  have hbY' : b' ⊆ Y := hc c'
  rcases mem_union.mp hw with hwa | hwb <;> rcases mem_union.mp hw' with hwa' | hwb'
  · exact (disjoint_left.mp hadis) hwa hwa'
  · exact (disjoint_left.mp hXY) (haX hwa) (hbY' hwb')
  · exact (disjoint_left.mp hXY) (haX' hwa') (hbY hwb)
  · exact (disjoint_left.mp hbdis) hwb hwb'

theorem separated_blockers_count (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (F G : Finset (Finset V)) (X Y : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) (hXY : Disjoint X Y)
    (hFn : F.Nonempty) (hGn : G.Nonempty)
    (hFne : ∀ e ∈ F, e.Nonempty) (hGne : ∀ e ∈ G, e.Nonempty)
    (hD : blocker (neighbourhoods arc) = F ∪ G)
    (hNo : ∀ v : V, ¬ hits (blocker (F ∪ G)) {v}) :
    (blocker F).card = 2 ∧ (blocker G).card = 2 := by
  classical
  have hNo' : ∀ v : V, ¬ hits (blocker (G ∪ F)) {v} := by
    simpa [union_comm] using hNo
  obtain ⟨a, ha, a', ha', hane⟩ := no_singleton_implies_two_left F G X Y hF hG hXY hFn hFne hNo
  obtain ⟨b, hb, b', hb', hbne⟩ := no_singleton_implies_two_left G F Y X hG hF hXY.symm hGn hGne hNo'
  have hcarda : 2 ≤ (blocker F).card := (Finset.one_lt_card.mpr ⟨a,ha,a',ha',hane⟩)
  have hcardb : 2 ≤ (blocker G).card := (Finset.one_lt_card.mpr ⟨b,hb,b',hb',hbne⟩)
  let A := {z // z ∈ blocker F}
  let B := {z // z ∈ blocker G}
  let row : A → Finset V := fun z => z.val
  let col : B → Finset V := fun z => z.val
  have hr : ∀ z, row z ⊆ X := by
    intro z
    exact minimal_hits_subset F X z.val hF ((mem_blocker F z.val).mp z.property)
  have hc : ∀ z, col z ⊆ Y := by
    intro z
    exact minimal_hits_subset G Y z.val hG ((mem_blocker G z.val).mp z.property)
  have hasrep : ∀ (r : A) (c : B), ∃ v, inClosed arc v = row r ∪ col c := by
    intro r c
    have hm : row r ∪ col c ∈ blocker (F ∪ G) :=
      (blocker_split F G X Y _ hF hG hXY).mpr ⟨r.val, r.property, c.val, c.property, rfl⟩
    rw [← hD, domination_double_blocker] at hm
    have hm' := (mem_minEdges (neighbourhoods arc) _).mp hm
    obtain ⟨v, _, hv⟩ := mem_image.mp hm'.1
    exact ⟨v, hv⟩
  let rep : A → B → V := fun r c => Classical.choose (hasrep r c)
  have hrep : ∀ r c, inClosed arc (rep r c) = row r ∪ col c := fun r c => Classical.choose_spec (hasrep r c)
  have hcover : ∀ r c, rep r c ∈ row r ∨ rep r c ∈ col c := by
    intro r c
    have hself : rep r c ∈ inClosed arc (rep r c) := by simp [inClosed]
    rw [hrep] at hself
    exact mem_union.mp hself
  have hrow : ∀ r c c', rep r c ∈ row r → rep r c' ∈ row r → c = c' :=
    row_representatives_unique arc oriented X Y hXY row col hr hc Subtype.val_injective rep hrep
  have hcol : ∀ c r r', rep r c ∈ col c → rep r' c ∈ col c → r = r' :=
    column_representatives_unique arc oriented X Y hXY row col hr hc Subtype.val_injective rep hrep
  have hcount := representatives_bound row col rep hcover hrow hcol
  have hprod : (blocker F).card * (blocker G).card ≤ (blocker F).card + (blocker G).card := by
    simpa [A, B, Fintype.card_coe] using hcount
  obtain ⟨hca, hcb⟩ := card_two_of_product_bound _ _ hcarda hcardb hprod
  exact ⟨hca,hcb⟩

omit [Fintype V] in
theorem source_mem_dominating (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (v : V) (hsource : dominates arc {v}) (s : Finset V) (hs : dominates arc s) : v ∈ s := by
  classical
  by_contra hv
  obtain ⟨u, hu, huv⟩ := hs v hv
  have huvne : u ≠ v := by
    intro h
    subst u
    exact hv hu
  obtain ⟨w, hw, hvu⟩ := hsource u (by simpa using huvne)
  have hwv : w = v := by simpa using hw
  subst w
  exact oriented v u hvu huv

omit [Fintype V] [DecidableEq V] in
theorem dominating_nonempty (arc : V → V → Prop) (v : V) (s : Finset V)
    (hs : dominates arc s) : s.Nonempty := by
  classical
  by_contra hn
  have he : s = ∅ := not_nonempty_iff_eq_empty.mp hn
  subst s
  obtain ⟨u, hu, _⟩ := hs v (by simp)
  simp at hu

theorem tournament_no_separation (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (total : ∀ u v, u ≠ v → arc u v ∨ arc v u)
    (X Y : Finset V) (hXY : Disjoint X Y)
    (hpart : ∀ e ∈ blocker (neighbourhoods arc), e ⊆ X ∨ e ⊆ Y)
    (hleft : ∃ e ∈ blocker (neighbourhoods arc), e.Nonempty ∧ e ⊆ X)
    (hright : ∃ e ∈ blocker (neighbourhoods arc), e.Nonempty ∧ e ⊆ Y) : False := by
  classical
  obtain ⟨eL, heL, heLn, heLX⟩ := hleft
  obtain ⟨eR, heR, heRn, heRY⟩ := hright
  obtain ⟨v0, _⟩ := heLn
  by_cases hsource : ∃ v, dominates arc {v}
  · obtain ⟨v, hv⟩ := hsource
    have hDL : dominates arc eL := ((minimal_domination_blocker arc eL).mp heL).1
    have hDR : dominates arc eR := ((minimal_domination_blocker arc eR).mp heR).1
    exact (disjoint_left.mp hXY) (heLX (source_mem_dominating arc oriented v hv eL hDL))
      (heRY (source_mem_dominating arc oriented v hv eR hDR))
  · let D := blocker (neighbourhoods arc)
    let F := D.filter (fun e => e ⊆ X)
    let G := D.filter (fun e => e ⊆ Y)
    have hD : D = F ∪ G := by
      ext e
      simp only [F, G, mem_union, mem_filter]
      constructor
      · intro he
        rcases hpart e he with h | h
        · exact Or.inl ⟨he,h⟩
        · exact Or.inr ⟨he,h⟩
      · rintro (⟨he,_⟩ | ⟨he,_⟩) <;> exact he
    have hF : ∀ e ∈ F, e ⊆ X := by
      intro e he
      exact (mem_filter.mp he).2
    have hG : ∀ e ∈ G, e ⊆ Y := by
      intro e he
      exact (mem_filter.mp he).2
    have hFn : F.Nonempty := ⟨eL, mem_filter.mpr ⟨heL, heLX⟩⟩
    have hGn : G.Nonempty := ⟨eR, mem_filter.mpr ⟨heR, heRY⟩⟩
    have hFne : ∀ e ∈ F, e.Nonempty := by
      intro e he
      exact dominating_nonempty arc v0 e ((minimal_domination_blocker arc e).mp (mem_filter.mp he).1).1
    have hGne : ∀ e ∈ G, e.Nonempty := by
      intro e he
      exact dominating_nonempty arc v0 e ((minimal_domination_blocker arc e).mp (mem_filter.mp he).1).1
    have hNo : ∀ v : V, ¬ hits (blocker (F ∪ G)) {v} := by
      intro v hh
      rw [← hD] at hh
      obtain ⟨e, he, hsub⟩ := (hits_blocker_iff D {v}).mp hh
      have hehits := ((mem_blocker (neighbourhoods arc) e).mp he).1
      have hsingleton := hits_mono (neighbourhoods arc) hsub hehits
      exact hsource ⟨v, (domination_iff_hits arc {v}).mpr hsingleton⟩
    exact separated_blockers_impossible arc oriented total F G X Y hF hG hXY hFn hGn hFne hGne hD hNo

def quad (a a' b b' : Finset V) : Finset (Finset V) := {a ∪ b, a ∪ b', a' ∪ b, a' ∪ b'}

def meets (s a : Finset V) : Prop := ∃ v, v ∈ s ∧ v ∈ a

omit [Fintype V] in
theorem hits_quad_iff (a a' b b' s : Finset V) :
    hits (quad a a' b b') s ↔ (meets s a ∧ meets s a') ∨ (meets s b ∧ meets s b') := by
  classical
  have hsplit (x y : Finset V) : (∃ v, v ∈ s ∧ v ∈ x ∪ y) ↔ meets s x ∨ meets s y := by
    simp only [meets, mem_union, and_or_left, exists_or]
  simp only [hits, quad, mem_insert, mem_singleton, forall_eq_or_imp, forall_eq, hsplit]
  tauto

noncomputable def pairs (a a' : Finset V) : Finset (Finset V) :=
  univ.filter (fun e => ∃ x ∈ a, ∃ y ∈ a', e = {x,y})

omit [Fintype V] in
theorem quad_minimal_forward (a a' b b' s : Finset V)
    (hs : Minimal (hits (quad a a' b b')) s) :
    (∃ x ∈ a, ∃ y ∈ a', s = {x,y}) ∨ (∃ x ∈ b, ∃ y ∈ b', s = {x,y}) := by
  classical
  rcases (hits_quad_iff a a' b b' s).mp hs.1 with ⟨⟨x,hxs,hxa⟩,⟨y,hys,hya⟩⟩ | ⟨⟨x,hxs,hxb⟩,⟨y,hys,hyb⟩⟩
  · left
    have hp : hits (quad a a' b b') {x,y} := (hits_quad_iff a a' b b' _).mpr
      (Or.inl ⟨⟨x, by simp, hxa⟩, ⟨y, by simp, hya⟩⟩)
    have hsub : ({x,y} : Finset V) ⊆ s := by simp [hxs, hys, insert_subset]
    have heq : s = {x,y} := Subset.antisymm (hs.2 hp hsub) hsub
    exact ⟨x,hxa,y,hya,heq⟩
  · right
    have hp : hits (quad a a' b b') {x,y} := (hits_quad_iff a a' b b' _).mpr
      (Or.inr ⟨⟨x, by simp, hxb⟩, ⟨y, by simp, hyb⟩⟩)
    have hsub : ({x,y} : Finset V) ⊆ s := by simp [hxs, hys, insert_subset]
    have heq : s = {x,y} := Subset.antisymm (hs.2 hp hsub) hsub
    exact ⟨x,hxb,y,hyb,heq⟩

omit [Fintype V] in
theorem quad_pair_minimal (a a' b b' X Y : Finset V) (x y : V)
    (hXY : Disjoint X Y) (hAA : Disjoint a a')
    (ha : a ⊆ X) (ha' : a' ⊆ X) (hb : b ⊆ Y)
    (hxa : x ∈ a) (hya : y ∈ a') :
    Minimal (hits (quad a a' b b')) ({x,y} : Finset V) := by
  classical
  constructor
  · exact (hits_quad_iff a a' b b' _).mpr
      (Or.inl ⟨⟨x, by simp, hxa⟩, ⟨y, by simp, hya⟩⟩)
  · intro t ht hsub
    rcases (hits_quad_iff a a' b b' t).mp ht with ⟨⟨u,hut,hua⟩,⟨v,hvt,hva⟩⟩ | ⟨⟨u,hut,hub⟩,_⟩
    · have hu : u = x := by
        have hm : u = x ∨ u = y := by simpa using hsub hut
        rcases hm with h | h
        · exact h
        · subst u
          exact False.elim ((disjoint_left.mp hAA) hua hya)
      have hv : v = y := by
        have hm : v = x ∨ v = y := by simpa using hsub hvt
        rcases hm with h | h
        · subst v
          exact False.elim ((disjoint_left.mp hAA) hxa hva)
        · exact h
      subst u
      subst v
      intro z hz
      have hz' : z = x ∨ z = y := by simpa using hz
      rcases hz' with rfl | rfl <;> assumption
    · have hm : u = x ∨ u = y := by simpa using hsub hut
      rcases hm with h | h
      · subst u
        exact False.elim ((disjoint_left.mp hXY) (ha hxa) (hb hub))
      · subst u
        exact False.elim ((disjoint_left.mp hXY) (ha' hya) (hb hub))

omit [Fintype V] in
theorem quad_swap (a a' b b' : Finset V) : quad a a' b b' = quad b b' a a' := by
  ext s
  simp only [quad, mem_insert, mem_singleton, union_comm b a, union_comm b' a,
    union_comm b a', union_comm b' a']
  tauto

theorem blocker_quad (a a' b b' X Y : Finset V)
    (hXY : Disjoint X Y) (hAA : Disjoint a a') (hBB : Disjoint b b')
    (ha : a ⊆ X) (ha' : a' ⊆ X) (hb : b ⊆ Y) (hb' : b' ⊆ Y) :
    blocker (quad a a' b b') = pairs a a' ∪ pairs b b' := by
  classical
  ext s
  rw [mem_blocker]
  simp only [mem_union, pairs, mem_filter, mem_univ, true_and]
  constructor
  · exact quad_minimal_forward a a' b b' s
  · rintro (⟨x,hx,y,hy,rfl⟩ | ⟨x,hx,y,hy,rfl⟩)
    · exact quad_pair_minimal a a' b b' X Y x y hXY hAA ha ha' hb hx hy
    · rw [quad_swap]
      exact quad_pair_minimal b b' a a' Y X x y hXY.symm hBB hb hb' ha hx hy

theorem blocker_double_of_blocker (F : Finset (Finset V)) : blocker (blocker (blocker F)) = blocker F := by
  rw [blocker_involution]
  classical
  ext s
  rw [mem_minEdges]
  constructor
  · exact fun h => h.1
  · intro hs
    refine ⟨hs, ?_⟩
    intro t ht hts
    have ht' := (mem_blocker F t).mp ht
    exact ((mem_blocker F s).mp hs).2 ht'.1 hts

theorem split_blocker_quad (F G : Finset (Finset V)) (X Y a a' b b' : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) (hXY : Disjoint X Y)
    (ha : blocker F = {a,a'}) (hb : blocker G = {b,b'}) :
    blocker (F ∪ G) = quad a a' b b' := by
  classical
  ext s
  rw [blocker_split F G X Y s hF hG hXY]
  simp only [ha, hb, mem_insert, mem_singleton, quad]
  constructor
  · rintro ⟨r, (rfl | rfl), c, (rfl | rfl), rfl⟩ <;> simp
  · intro hs
    rcases hs with rfl | rfl | rfl | rfl
    · exact ⟨a, Or.inl rfl, b, Or.inl rfl, rfl⟩
    · exact ⟨a, Or.inl rfl, b', Or.inr rfl, rfl⟩
    · exact ⟨a', Or.inr rfl, b, Or.inl rfl, rfl⟩
    · exact ⟨a', Or.inr rfl, b', Or.inr rfl, rfl⟩

theorem separated_oriented_bicliques (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (F G : Finset (Finset V)) (X Y : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) (hXY : Disjoint X Y)
    (hFn : F.Nonempty) (hGn : G.Nonempty)
    (hFne : ∀ e ∈ F, e.Nonempty) (hGne : ∀ e ∈ G, e.Nonempty)
    (hD : blocker (neighbourhoods arc) = F ∪ G)
    (hNo : ∀ v : V, ¬ hits (blocker (F ∪ G)) {v}) :
    ∃ a a' b b' : Finset V, a.Nonempty ∧ a'.Nonempty ∧ b.Nonempty ∧ b'.Nonempty ∧
      Disjoint a a' ∧ Disjoint b b' ∧ a ⊆ X ∧ a' ⊆ X ∧ b ⊆ Y ∧ b' ⊆ Y ∧
      blocker (neighbourhoods arc) = pairs a a' ∪ pairs b b' ∧
      minEdges (neighbourhoods arc) = quad a a' b b' := by
  classical
  obtain ⟨hca,hcb⟩ := separated_blockers_count arc oriented F G X Y hF hG hXY hFn hGn hFne hGne hD hNo
  obtain ⟨a,a',hane,ha⟩ := Finset.card_eq_two.mp hca
  obtain ⟨b,b',hbne,hb⟩ := Finset.card_eq_two.mp hcb
  have h1 : a ∈ blocker F := by rw [ha]; simp
  have h2 : a' ∈ blocker F := by rw [ha]; simp
  have h3 : b ∈ blocker G := by rw [hb]; simp
  have h4 : b' ∈ blocker G := by rw [hb]; simp
  have haX := minimal_hits_subset F X a hF ((mem_blocker F a).mp h1)
  have haX' := minimal_hits_subset F X a' hF ((mem_blocker F a').mp h2)
  have hbY := minimal_hits_subset G Y b hG ((mem_blocker G b).mp h3)
  have hbY' := minimal_hits_subset G Y b' hG ((mem_blocker G b').mp h4)
  have had := two_blocker_members_disjoint F G X Y hF hG hXY hNo hca a a' h1 h2 hane
  have hNo' : ∀ v : V, ¬ hits (blocker (G ∪ F)) {v} := by simpa [union_comm] using hNo
  have hbd := two_blocker_members_disjoint G F Y X hG hF hXY.symm hNo' hcb b b' h3 h4 hbne
  have hquad : blocker (blocker (neighbourhoods arc)) = quad a a' b b' := by
    rw [hD]
    exact split_blocker_quad F G X Y a a' b b' hF hG hXY ha hb
  have hstructure : blocker (neighbourhoods arc) = pairs a a' ∪ pairs b b' := by
    calc
      blocker (neighbourhoods arc) = blocker (blocker (blocker (neighbourhoods arc))) := (blocker_double_of_blocker _).symm
      _ = blocker (quad a a' b b') := congrArg blocker hquad
      _ = pairs a a' ∪ pairs b b' := blocker_quad a a' b b' X Y hXY had hbd haX haX' hbY hbY'
  exact ⟨a,a',b,b', blocker_member_nonempty F hFn a h1,
    blocker_member_nonempty F hFn a' h2, blocker_member_nonempty G hGn b h3,
    blocker_member_nonempty G hGn b' h4, had, hbd, haX, haX', hbY, hbY', hstructure,
    by simpa only [blocker_involution] using hquad⟩

omit [Fintype V] in
theorem quad_inside_forced (a a' b b' t : Finset V) (u w : V)
    (hu : u ∈ a) (hw : w ∈ b') (hnu : u ∉ t) (hnw : w ∉ t)
    (hex : ∃ e ∈ quad a a' b b', e ⊆ t) : a' ⊆ t ∧ b ⊆ t := by
  classical
  obtain ⟨e, he, hsub⟩ := hex
  simp only [quad, mem_insert, mem_singleton] at he
  rcases he with rfl | rfl | rfl | rfl
  · exact False.elim (hnu (hsub (mem_union_left b hu)))
  · exact False.elim (hnu (hsub (mem_union_left b' hu)))
  · exact ⟨fun v hv => hsub (mem_union_left b hv), fun v hv => hsub (mem_union_right a' hv)⟩
  · exact False.elim (hnw (hsub (mem_union_right a' hw)))

theorem closed_contains_minimal_neighbourhood (arc : V → V → Prop) (v : V) :
    ∃ e ∈ minEdges (neighbourhoods arc), e ⊆ inClosed arc v := by
  have he : inClosed arc v ∈ neighbourhoods arc := by simp [neighbourhoods]
  obtain ⟨e, hsub, hmin⟩ := exists_minimal_le_of_wellFoundedLT (fun e => e ∈ neighbourhoods arc) _ he
  exact ⟨e, (mem_minEdges _ _).mpr hmin, hsub⟩

theorem arc_from_closed (arc : V → V → Prop) (x y : V) (hne : x ≠ y)
    (h : x ∈ inClosed arc y) : arc x y := by
  have h' : x = y ∨ arc x y := by simpa [inClosed] using h
  exact h'.resolve_left hne

theorem closed_excludes_outgoing (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u) (x y : V) (hne : x ≠ y)
    (hxy : arc x y) : y ∉ inClosed arc x := by
  intro h
  have hyx := arc_from_closed arc y x (Ne.symm hne) h
  exact oriented x y hxy hyx

omit [Fintype V] in
theorem quad_swap_both (a a' b b' : Finset V) : quad a a' b b' = quad a' a b' b := by
  ext s
  simp only [quad, mem_insert, mem_singleton]
  tauto

theorem two_stars_row (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (a a' b b' X Y : Finset V) (u w u' w' : V)
    (hXY : Disjoint X Y) (hAA : Disjoint a a')
    (haX : a ⊆ X) (haX' : a' ⊆ X) (hbY : b ⊆ Y) (hbY' : b' ⊆ Y)
    (hu : u ∈ a) (hw : w ∈ b') (hu' : u' ∈ a') (hw' : w' ∈ b)
    (hIu : inClosed arc u = a ∪ b) (hIw : inClosed arc w = a ∪ b')
    (hIu' : inClosed arc u' = a' ∪ b') (hIw' : inClosed arc w' = a' ∪ b)
    (hmin : minEdges (neighbourhoods arc) = quad a a' b b') :
    a = {u} ∨ a' = {u'} := by
  classical
  by_contra hn
  have ha_ne : a ≠ {u} := fun h => hn (Or.inl h)
  have ha'_ne : a' ≠ {u'} := fun h => hn (Or.inr h)
  have hx : ∃ x ∈ a, x ≠ u := by
    by_contra hh
    have hsub : a ⊆ {u} := by
      intro x hx
      have heq : x = u := by
        by_contra hne
        exact hh ⟨x,hx,hne⟩
      simp [heq]
    exact ha_ne (Subset.antisymm hsub (by simpa using hu))
  have hy : ∃ y ∈ a', y ≠ u' := by
    by_contra hh
    have hsub : a' ⊆ {u'} := by
      intro y hy
      have heq : y = u' := by
        by_contra hne
        exact hh ⟨y,hy,hne⟩
      simp [heq]
    exact ha'_ne (Subset.antisymm hsub (by simpa using hu'))
  obtain ⟨x,hxa,hxu⟩ := hx
  obtain ⟨y,hya,hyu⟩ := hy
  have hxw : x ≠ w := by
    intro h
    subst x
    exact (disjoint_left.mp hXY) (haX hxa) (hbY' hw)
  have hyw' : y ≠ w' := by
    intro h
    subst y
    exact (disjoint_left.mp hXY) (haX' hya) (hbY hw')
  have hxuArc : arc x u := arc_from_closed arc x u hxu (by rw [hIu]; exact mem_union_left b hxa)
  have hxwArc : arc x w := arc_from_closed arc x w hxw (by rw [hIw]; exact mem_union_left b' hxa)
  have hyuArc : arc y u' := arc_from_closed arc y u' hyu (by rw [hIu']; exact mem_union_left b' hya)
  have hywArc : arc y w' := arc_from_closed arc y w' hyw' (by rw [hIw']; exact mem_union_left b hya)
  obtain ⟨ex,hex,hsubx⟩ := closed_contains_minimal_neighbourhood arc x
  rw [hmin] at hex
  have hforcedX := quad_inside_forced a a' b b' (inClosed arc x) u w hu hw
    (closed_excludes_outgoing arc oriented x u hxu hxuArc)
    (closed_excludes_outgoing arc oriented x w hxw hxwArc) ⟨ex,hex,hsubx⟩
  obtain ⟨ey,hey,hsuby⟩ := closed_contains_minimal_neighbourhood arc y
  rw [hmin, quad_swap_both] at hey
  have hforcedY := quad_inside_forced a' a b' b (inClosed arc y) u' w' hu' hw'
    (closed_excludes_outgoing arc oriented y u' hyu hyuArc)
    (closed_excludes_outgoing arc oriented y w' hyw' hywArc) ⟨ey,hey,hsuby⟩
  have hxy : x ≠ y := by
    intro h
    subst y
    exact (disjoint_left.mp hAA) hxa hya
  have hyxArc : arc y x := arc_from_closed arc y x (Ne.symm hxy) (hforcedX.1 hya)
  have hxyArc : arc x y := arc_from_closed arc x y hxy (hforcedY.1 hxa)
  exact oriented x y hxyArc hyxArc

omit [Fintype V] in
theorem quad_swap_columns (a a' b b' : Finset V) : quad a a' b b' = quad a a' b' b := by
  ext s
  simp only [quad, mem_insert, mem_singleton]
  tauto

theorem quad_rows_have_singleton (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (a a' b b' X Y : Finset V)
    (hXY : Disjoint X Y) (hAA : Disjoint a a') (hBB : Disjoint b b')
    (haX : a ⊆ X) (haX' : a' ⊆ X) (hbY : b ⊆ Y) (hbY' : b' ⊆ Y)
    (ha : a.Nonempty) (hb : b.Nonempty)
    (hmin : minEdges (neighbourhoods arc) = quad a a' b b') :
    a.card = 1 ∨ a'.card = 1 := by
  classical
  have hane : a ≠ a' := by
    intro heq
    obtain ⟨x,hx⟩ := ha
    exact (disjoint_left.mp hAA) hx (heq ▸ hx)
  have hbne : b ≠ b' := by
    intro heq
    obtain ⟨x,hx⟩ := hb
    exact (disjoint_left.mp hBB) hx (heq ▸ hx)
  let row : Fin 2 → Finset V := fun i => if i = 0 then a else a'
  let col : Fin 2 → Finset V := fun i => if i = 0 then b else b'
  have hr : ∀ i, row i ⊆ X := by
    intro i
    fin_cases i <;> simp [row, haX, haX']
  have hc : ∀ i, col i ⊆ Y := by
    intro i
    fin_cases i <;> simp [col, hbY, hbY']
  have hri : Function.Injective row := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp_all [row]
  have hci : Function.Injective col := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp_all [col]
  have hasrep : ∀ i j, ∃ v, inClosed arc v = row i ∪ col j := by
    intro i j
    have hmem : row i ∪ col j ∈ minEdges (neighbourhoods arc) := by
      rw [hmin]
      fin_cases i <;> fin_cases j <;> simp [quad, row, col]
    have hm := (mem_minEdges (neighbourhoods arc) _).mp hmem
    obtain ⟨v, _, hv⟩ := mem_image.mp hm.1
    exact ⟨v,hv⟩
  let rep : Fin 2 → Fin 2 → V := fun i j => Classical.choose (hasrep i j)
  have hrep : ∀ i j, inClosed arc (rep i j) = row i ∪ col j := fun i j => Classical.choose_spec (hasrep i j)
  have hcover : ∀ i j, rep i j ∈ row i ∨ rep i j ∈ col j := by
    intro i j
    have hself : rep i j ∈ inClosed arc (rep i j) := by simp [inClosed]
    rw [hrep] at hself
    exact mem_union.mp hself
  have hrow : ∀ i j k, rep i j ∈ row i → rep i k ∈ row i → j = k :=
    row_representatives_unique arc oriented X Y hXY row col hr hc hci rep hrep
  have hcol : ∀ j i k, rep i j ∈ col j → rep k j ∈ col j → i = k :=
    column_representatives_unique arc oriented X Y hXY row col hr hc hri rep hrep
  have hrow0 : ¬ (rep 0 0 ∈ a ∧ rep 0 1 ∈ a) := by
    rintro ⟨h1,h2⟩
    have h := hrow 0 0 1 (by simpa [row] using h1) (by simpa [row] using h2)
    norm_num at h
  have hrow1 : ¬ (rep 1 0 ∈ a' ∧ rep 1 1 ∈ a') := by
    rintro ⟨h1,h2⟩
    have h := hrow 1 0 1 (by simpa [row] using h1) (by simpa [row] using h2)
    norm_num at h
  have hcol0 : ¬ (rep 0 0 ∈ b ∧ rep 1 0 ∈ b) := by
    rintro ⟨h1,h2⟩
    have h := hcol 0 0 1 (by simpa [col] using h1) (by simpa [col] using h2)
    norm_num at h
  have hcol1 : ¬ (rep 0 1 ∈ b' ∧ rep 1 1 ∈ b') := by
    rintro ⟨h1,h2⟩
    have h := hcol 1 0 1 (by simpa [col] using h1) (by simpa [col] using h2)
    norm_num at h
  have hc00 : rep 0 0 ∈ a ∨ rep 0 0 ∈ b := by simpa [row,col] using hcover 0 0
  have hc01 : rep 0 1 ∈ a ∨ rep 0 1 ∈ b' := by simpa [row,col] using hcover 0 1
  have hc10 : rep 1 0 ∈ a' ∨ rep 1 0 ∈ b := by simpa [row,col] using hcover 1 0
  have hc11 : rep 1 1 ∈ a' ∨ rep 1 1 ∈ b' := by simpa [row,col] using hcover 1 1
  have pattern : (rep 0 0 ∈ a ∧ rep 0 1 ∈ b' ∧ rep 1 1 ∈ a' ∧ rep 1 0 ∈ b) ∨
      (rep 0 1 ∈ a ∧ rep 0 0 ∈ b ∧ rep 1 0 ∈ a' ∧ rep 1 1 ∈ b') := by
    tauto
  have hi00 : inClosed arc (rep 0 0) = a ∪ b := by simpa [row,col] using hrep 0 0
  have hi01 : inClosed arc (rep 0 1) = a ∪ b' := by simpa [row,col] using hrep 0 1
  have hi10 : inClosed arc (rep 1 0) = a' ∪ b := by simpa [row,col] using hrep 1 0
  have hi11 : inClosed arc (rep 1 1) = a' ∪ b' := by simpa [row,col] using hrep 1 1
  rcases pattern with ⟨h00,h01,h11,h10⟩ | ⟨h01,h00,h10,h11⟩
  · rcases two_stars_row arc oriented a a' b b' X Y (rep 0 0) (rep 0 1) (rep 1 1) (rep 1 0)
      hXY hAA haX haX' hbY hbY' h00 h01 h11 h10 hi00 hi01 hi11 hi10 hmin with h | h
    · left; simp [h]
    · right; simp [h]
  · have hmin' : minEdges (neighbourhoods arc) = quad a a' b' b := by rw [hmin, quad_swap_columns]
    rcases two_stars_row arc oriented a a' b' b X Y (rep 0 1) (rep 0 0) (rep 1 0) (rep 1 1)
      hXY hAA haX haX' hbY' hbY h01 h00 h10 h11 hi01 hi00 hi10 hi11 hmin' with h | h
    · left; simp [h]
    · right; simp [h]

theorem oriented_two_star_structure (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (F G : Finset (Finset V)) (X Y : Finset V)
    (hF : ∀ e ∈ F, e ⊆ X) (hG : ∀ e ∈ G, e ⊆ Y) (hXY : Disjoint X Y)
    (hFn : F.Nonempty) (hGn : G.Nonempty)
    (hFne : ∀ e ∈ F, e.Nonempty) (hGne : ∀ e ∈ G, e.Nonempty)
    (hD : blocker (neighbourhoods arc) = F ∪ G)
    (hNo : ∀ v : V, ¬ hits (blocker (F ∪ G)) {v}) :
    ∃ a a' b b' : Finset V, a.Nonempty ∧ a'.Nonempty ∧ b.Nonempty ∧ b'.Nonempty ∧
      Disjoint a a' ∧ Disjoint b b' ∧ a ⊆ X ∧ a' ⊆ X ∧ b ⊆ Y ∧ b' ⊆ Y ∧
      (a.card = 1 ∨ a'.card = 1) ∧ (b.card = 1 ∨ b'.card = 1) ∧
      blocker (neighbourhoods arc) = pairs a a' ∪ pairs b b' := by
  obtain ⟨a,a',b,b',ha,ha',hb,hb',hAA,hBB,haX,haX',hbY,hbY',hstruct,hmin⟩ :=
    separated_oriented_bicliques arc oriented F G X Y hF hG hXY hFn hGn hFne hGne hD hNo
  have hrow := quad_rows_have_singleton arc oriented a a' b b' X Y hXY hAA hBB
    haX haX' hbY hbY' ha hb hmin
  have hmin' : minEdges (neighbourhoods arc) = quad b b' a a' := by rw [hmin, quad_swap]
  have hcol := quad_rows_have_singleton arc oriented b b' a a' Y X hXY.symm hBB hAA
    hbY hbY' haX haX' hb ha hmin'
  exact ⟨a,a',b,b',ha,ha',hb,hb',hAA,hBB,haX,haX',hbY,hbY',hrow,hcol,hstruct⟩

theorem oriented_separation_stars (arc : V → V → Prop)
    (oriented : ∀ u v, arc u v → ¬ arc v u)
    (X Y : Finset V) (hXY : Disjoint X Y)
    (hpart : ∀ e ∈ blocker (neighbourhoods arc), e ⊆ X ∨ e ⊆ Y)
    (hleft : ∃ e ∈ blocker (neighbourhoods arc), e.Nonempty ∧ e ⊆ X)
    (hright : ∃ e ∈ blocker (neighbourhoods arc), e.Nonempty ∧ e ⊆ Y) :
    ∃ a a' b b' : Finset V, a.Nonempty ∧ a'.Nonempty ∧ b.Nonempty ∧ b'.Nonempty ∧
      Disjoint a a' ∧ Disjoint b b' ∧ a ⊆ X ∧ a' ⊆ X ∧ b ⊆ Y ∧ b' ⊆ Y ∧
      (a.card = 1 ∨ a'.card = 1) ∧ (b.card = 1 ∨ b'.card = 1) ∧
      blocker (neighbourhoods arc) = pairs a a' ∪ pairs b b' := by
  classical
  obtain ⟨eL, heL, heLn, heLX⟩ := hleft
  obtain ⟨eR, heR, _, heRY⟩ := hright
  obtain ⟨v0, _⟩ := heLn
  have hsource : ¬ ∃ v, dominates arc {v} := by
    rintro ⟨v,hv⟩
    have hDL : dominates arc eL := ((minimal_domination_blocker arc eL).mp heL).1
    have hDR : dominates arc eR := ((minimal_domination_blocker arc eR).mp heR).1
    exact (disjoint_left.mp hXY) (heLX (source_mem_dominating arc oriented v hv eL hDL))
      (heRY (source_mem_dominating arc oriented v hv eR hDR))
  let D := blocker (neighbourhoods arc)
  let F := D.filter (fun e => e ⊆ X)
  let G := D.filter (fun e => e ⊆ Y)
  have hD : D = F ∪ G := by
    ext e
    simp only [F, G, mem_union, mem_filter]
    constructor
    · intro he
      rcases hpart e he with h | h
      · exact Or.inl ⟨he,h⟩
      · exact Or.inr ⟨he,h⟩
    · rintro (⟨he,_⟩ | ⟨he,_⟩) <;> exact he
  have hF : ∀ e ∈ F, e ⊆ X := by
    intro e he
    exact (mem_filter.mp he).2
  have hG : ∀ e ∈ G, e ⊆ Y := by
    intro e he
    exact (mem_filter.mp he).2
  have hFn : F.Nonempty := ⟨eL, mem_filter.mpr ⟨heL, heLX⟩⟩
  have hGn : G.Nonempty := ⟨eR, mem_filter.mpr ⟨heR, heRY⟩⟩
  have hFne : ∀ e ∈ F, e.Nonempty := by
    intro e he
    exact dominating_nonempty arc v0 e ((minimal_domination_blocker arc e).mp (mem_filter.mp he).1).1
  have hGne : ∀ e ∈ G, e.Nonempty := by
    intro e he
    exact dominating_nonempty arc v0 e ((minimal_domination_blocker arc e).mp (mem_filter.mp he).1).1
  have hNo : ∀ v : V, ¬ hits (blocker (F ∪ G)) {v} := by
    intro v hh
    rw [← hD] at hh
    obtain ⟨e, he, hsub⟩ := (hits_blocker_iff D {v}).mp hh
    have hehits := ((mem_blocker (neighbourhoods arc) e).mp he).1
    have hsingleton := hits_mono (neighbourhoods arc) hsub hehits
    exact hsource ⟨v, (domination_iff_hits arc {v}).mpr hsingleton⟩
  exact oriented_two_star_structure arc oriented F G X Y hF hG hXY hFn hGn hFne hGne hD hNo

def buildArc (A B : Finset V) (u w r s : V) (x y : V) : Prop :=
  x ≠ y ∧
  if y = u then x = w
  else if y = w then x ∈ A
  else if y = r then x ∈ A ∨ x ∈ B
  else if y = s then x = u ∨ x ∈ B
  else if y ∈ A then x = u ∨ x ∈ B
  else if y ∈ B then x = u ∨ x = w
  else x = u ∨ x = w ∨ x ∈ A ∨ x ∈ B

omit [Fintype V] in
theorem build_oriented (A B : Finset V) (u w r s : V)
    (hAB : Disjoint A B) (huA : u ∉ A) (huB : u ∉ B) (hwA : w ∉ A) (hwB : w ∉ B)
    (_huw : u ≠ w) (hr : r ∈ A) (hs : s ∈ B) :
    ∀ x y, buildArc A B u w r s x y → ¬ buildArc A B u w r s y x := by
  classical
  intro x y hxy hyx
  have hdis : ∀ z, z ∈ A → z ∈ B → False := fun _ ha hb => (disjoint_left.mp hAB) ha hb
  simp only [buildArc] at hxy hyx
  rcases hxy with ⟨hxyne,hxy⟩
  rcases hyx with ⟨hyxne,hyx⟩
  split_ifs at hxy hyx <;> simp_all

theorem build_neighbourhoods (A B : Finset V) (u w r s : V)
    (hAB : Disjoint A B) (huA : u ∉ A) (huB : u ∉ B) (hwA : w ∉ A) (hwB : w ∉ B)
    (huw : u ≠ w) (hr : r ∈ A) (hs : s ∈ B) :
    inClosed (buildArc A B u w r s) u = {u} ∪ {w} ∧
    inClosed (buildArc A B u w r s) w = A ∪ {w} ∧
    inClosed (buildArc A B u w r s) r = A ∪ B ∧
    inClosed (buildArc A B u w r s) s = {u} ∪ B := by
  classical
  have hru : r ≠ u := by intro h; subst r; exact huA hr
  have hrw : r ≠ w := by intro h; subst r; exact hwA hr
  have hsu : s ≠ u := by intro h; subst s; exact huB hs
  have hsw : s ≠ w := by intro h; subst s; exact hwB hs
  have hrs : r ≠ s := by intro h; subst r; exact (disjoint_left.mp hAB) hr hs
  constructor
  · ext x
    simp [inClosed, buildArc]
    tauto
  constructor
  · ext x
    simp [inClosed, buildArc, Ne.symm huw]
    tauto
  constructor
  · ext x
    by_cases hx : x = r
    · subst x
      simp [inClosed, buildArc, hru, hrw, hr]
    · simp [inClosed, buildArc, hru, hrw, hx]
  · ext x
    by_cases hx : x = s
    · subst x
      simp [inClosed, buildArc, hsu, hsw, Ne.symm hrs, hs]
    · simp [inClosed, buildArc, hsu, hsw, Ne.symm hrs, hx]

theorem build_coverage (A B : Finset V) (u w r s : V)
    (hAB : Disjoint A B) (huA : u ∉ A) (huB : u ∉ B) (hwA : w ∉ A) (hwB : w ∉ B)
    (huw : u ≠ w) (hr : r ∈ A) (hs : s ∈ B) (v : V) :
    ∃ e ∈ quad {u} A {w} B, e ⊆ inClosed (buildArc A B u w r s) v := by
  classical
  obtain ⟨hIu,hIw,hIr,hIs⟩ := build_neighbourhoods A B u w r s hAB huA huB hwA hwB huw hr hs
  by_cases hvu : v = u
  · subst v
    exact ⟨{u} ∪ {w}, by simp [quad], by rw [hIu]⟩
  by_cases hvw : v = w
  · subst v
    exact ⟨A ∪ {w}, by simp [quad], by rw [hIw]⟩
  by_cases hvr : v = r
  · subst v
    exact ⟨A ∪ B, by simp [quad], by rw [hIr]⟩
  by_cases hvs : v = s
  · subst v
    exact ⟨{u} ∪ B, by simp [quad], by rw [hIs]⟩
  by_cases hvA : v ∈ A
  · refine ⟨{u} ∪ B, by simp [quad], ?_⟩
    intro x hx
    simp only [mem_union, mem_singleton] at hx
    by_cases hxv : x = v
    · subst x; simp [inClosed]
    · simp [inClosed, buildArc, hvu, hvw, hvr, hvs, hvA, hxv]
      exact hx
  by_cases hvB : v ∈ B
  · refine ⟨{u} ∪ {w}, by simp [quad], ?_⟩
    intro x hx
    simp only [mem_union, mem_singleton] at hx
    by_cases hxv : x = v
    · subst x; simp [inClosed]
    · simp [inClosed, buildArc, hvu, hvw, hvr, hvs, hvA, hvB, hxv]
      exact hx
  · refine ⟨{u} ∪ {w}, by simp [quad], ?_⟩
    intro x hx
    simp only [mem_union, mem_singleton] at hx
    by_cases hxv : x = v
    · subst x; simp [inClosed]
    · simp [inClosed, buildArc, hvu, hvw, hvr, hvs, hvA, hvB, hxv]
      tauto

theorem build_hits_quad (A B : Finset V) (u w r s : V)
    (hAB : Disjoint A B) (huA : u ∉ A) (huB : u ∉ B) (hwA : w ∉ A) (hwB : w ∉ B)
    (huw : u ≠ w) (hr : r ∈ A) (hs : s ∈ B) (t : Finset V) :
    hits (neighbourhoods (buildArc A B u w r s)) t ↔ hits (quad {u} A {w} B) t := by
  classical
  obtain ⟨hIu,hIw,hIr,hIs⟩ := build_neighbourhoods A B u w r s hAB huA huB hwA hwB huw hr hs
  have hsubset : quad {u} A {w} B ⊆ neighbourhoods (buildArc A B u w r s) := by
    intro e he
    simp only [quad, mem_insert, mem_singleton] at he
    rcases he with rfl | rfl | rfl | rfl
    · exact mem_image.mpr ⟨u, mem_univ u, hIu⟩
    · exact mem_image.mpr ⟨s, mem_univ s, hIs⟩
    · exact mem_image.mpr ⟨w, mem_univ w, hIw⟩
    · exact mem_image.mpr ⟨r, mem_univ r, hIr⟩
  constructor
  · intro h e he
    exact h e (hsubset he)
  · intro h e he
    obtain ⟨v,_,rfl⟩ := mem_image.mp he
    obtain ⟨c,hc,hsub⟩ := build_coverage A B u w r s hAB huA huB hwA hwB huw hr hs v
    obtain ⟨x,hxt,hxc⟩ := h c hc
    exact ⟨x,hxt,hsub hxc⟩

theorem build_blocker_quad (A B : Finset V) (u w r s : V)
    (hAB : Disjoint A B) (huA : u ∉ A) (huB : u ∉ B) (hwA : w ∉ A) (hwB : w ∉ B)
    (huw : u ≠ w) (hr : r ∈ A) (hs : s ∈ B) :
    blocker (neighbourhoods (buildArc A B u w r s)) = blocker (quad {u} A {w} B) := by
  ext t
  rw [mem_blocker, mem_blocker]
  have heq : hits (neighbourhoods (buildArc A B u w r s)) = hits (quad {u} A {w} B) := by
    funext t
    exact propext (build_hits_quad A B u w r s hAB huA huB hwA hwB huw hr hs t)
  rw [heq]

theorem build_realizes_two_stars (A B : Finset V) (u w r s : V)
    (hAB : Disjoint A B) (huA : u ∉ A) (huB : u ∉ B) (hwA : w ∉ A) (hwB : w ∉ B)
    (huw : u ≠ w) (hr : r ∈ A) (hs : s ∈ B) :
    (∀ x y, buildArc A B u w r s x y → ¬ buildArc A B u w r s y x) ∧
    blocker (neighbourhoods (buildArc A B u w r s)) = pairs {u} A ∪ pairs {w} B := by
  classical
  constructor
  · exact build_oriented A B u w r s hAB huA huB hwA hwB huw hr hs
  · rw [build_blocker_quad A B u w r s hAB huA huB hwA hwB huw hr hs]
    have hXY : Disjoint ({u} ∪ A) ({w} ∪ B) := by
      apply disjoint_left.mpr
      intro v hx hy
      simp only [mem_union, mem_singleton] at hx hy
      rcases hx with rfl | hx <;> rcases hy with hy | hy
      · exact huw hy
      · exact huB hy
      · subst v; exact hwA hx
      · exact (disjoint_left.mp hAB) hx hy
    have hAA : Disjoint ({u} : Finset V) A := by simpa [disjoint_left] using huA
    have hBB : Disjoint ({w} : Finset V) B := by simpa [disjoint_left] using hwB
    exact blocker_quad {u} A {w} B ({u} ∪ A) ({w} ∪ B) hXY hAA hBB
      (subset_union_left) (subset_union_right) (subset_union_left) (subset_union_right)

theorem build_remaining_vertices_isolated (A B : Finset V) (u w r s : V)
    (hAB : Disjoint A B) (huA : u ∉ A) (huB : u ∉ B) (hwA : w ∉ A) (hwB : w ∉ B)
    (huw : u ≠ w) (hr : r ∈ A) (hs : s ∈ B) (v : V)
    (hvu : v ≠ u) (hvw : v ≠ w) (hvA : v ∉ A) (hvB : v ∉ B) :
    ∀ e ∈ blocker (neighbourhoods (buildArc A B u w r s)), v ∉ e := by
  classical
  intro e he
  have hreal := (build_realizes_two_stars A B u w r s hAB huA huB hwA hwB huw hr hs).2
  rw [hreal] at he
  simp only [mem_union, pairs, mem_filter, mem_univ, true_and] at he
  rcases he with ⟨x,hx,y,hy,rfl⟩ | ⟨x,hx,y,hy,rfl⟩
  · have hx' : x = u := by simpa using hx
    subst x
    intro hv
    simp only [mem_insert, mem_singleton] at hv
    rcases hv with hv | hv
    · exact hvu hv
    · subst y; exact hvA hy
  · have hx' : x = w := by simpa using hx
    subst x
    intro hv
    simp only [mem_insert, mem_singleton] at hv
    rcases hv with hv | hv
    · exact hvw hv
    · subst y; exact hvB hy

omit [Fintype V] in
theorem build_irreflexive (A B : Finset V) (u w r s : V) :
    ∀ v, ¬ buildArc A B u w r s v v := by
  intro v h
  exact h.1 rfl

end Sonntag
end
