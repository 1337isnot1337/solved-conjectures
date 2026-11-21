import Conjectures.HornakResidues

/-! Connected intervals in the actual star-like graph. -/
namespace Hornak

def armSegment {m : ℕ} {arms : Fin m → ℕ} (i : Fin m) (lo hi : ℕ) : Set (Vertex arms) :=
  {v | ∃ p : Fin (arms i), v = some ⟨i,p⟩ ∧ lo ≤ p.val ∧ p.val < hi}

theorem armSegment_member {m : ℕ} {arms : Fin m → ℕ} (i : Fin m)
    (lo hi : ℕ) (p : Fin (arms i)) (hl : lo ≤ p.val) (hh : p.val < hi) :
    some ⟨i,p⟩ ∈ armSegment i lo hi := ⟨p,rfl,hl,hh⟩

theorem armSegment_connected {m : ℕ} {arms : Fin m → ℕ} (i : Fin m)
    (lo hi : ℕ) (hlo : lo < hi) (hhi : hi ≤ arms i) :
    ((graph arms).induce (armSegment i lo hi)).Connected := by
  let root : {v // v ∈ armSegment i lo hi} :=
    ⟨some ⟨i,⟨lo, by omega⟩⟩, armSegment_member (arms := arms) i lo hi ⟨lo, by omega⟩ (by simp) hlo⟩
  rw [SimpleGraph.connected_iff_exists_forall_reachable]
  refine ⟨root, ?_⟩
  intro v
  obtain ⟨p,hv,hpl,hph⟩ := v.property
  have hreach : ∀ n (hl : lo ≤ n) (hn : n < hi),
      ((graph arms).induce (armSegment i lo hi)).Reachable root
        ⟨some ⟨i,⟨n, by omega⟩⟩, armSegment_member (arms := arms) i lo hi ⟨n, by omega⟩ hl hn⟩ := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro hl hn
      by_cases he : n = lo
      · subst n
        exact SimpleGraph.Reachable.rfl
      · have hprev := ih (n-1) (by omega) (by omega) (by omega)
        apply hprev.trans
        apply SimpleGraph.Adj.reachable
        change (graph arms).Adj (some ⟨i,⟨n-1, by omega⟩⟩) (some ⟨i,⟨n, by omega⟩⟩)
        simp only [graph, adj, true_and]
        omega
  have h := hreach p.val hpl hph
  convert h using 1
  apply Subtype.ext
  exact hv

def position {m : ℕ} {arms : Fin m → ℕ} : Vertex arms → ℕ
  | none => 0
  | some ⟨_,p⟩ => p.val

theorem armSegment_card {m : ℕ} {arms : Fin m → ℕ} (i : Fin m)
    (lo hi : ℕ) (hlo : lo ≤ hi) (hhi : hi ≤ arms i) :
    Nat.card {v : Vertex arms // v ∈ armSegment i lo hi} = hi-lo := by
  classical
  have bounds (v : {v : Vertex arms // v ∈ armSegment i lo hi}) :
      lo ≤ position v.val ∧ position v.val < hi := by
    obtain ⟨p,hp,hl,hh⟩ := v.property
    rw [hp]
    exact ⟨hl,hh⟩
  let e : Fin (hi-lo) ≃ {v : Vertex arms // v ∈ armSegment i lo hi} := {
    toFun t := ⟨some ⟨i,⟨lo+t.val, by omega⟩⟩,
      armSegment_member (arms := arms) i lo hi ⟨lo+t.val, by omega⟩ (by simp) (by change lo+t.val < hi; have ht := t.isLt; omega)⟩
    invFun v := ⟨position v.val-lo, by have h := bounds v; omega⟩
    left_inv := by
      intro t
      apply Fin.ext
      simp [position]
    right_inv := by
      intro v
      apply Subtype.ext
      obtain ⟨p,hp,hl,hh⟩ := v.property
      change some ⟨i,⟨lo+(position v.val-lo), _⟩⟩ = v.val
      have hpos : position v.val = p.val := by rw [hp]; rfl
      have heq : (⟨lo+(position v.val-lo), by have h := bounds v; omega⟩ : Fin (arms i)) = p := by
        apply Fin.ext
        simp only [hpos]
        omega
      calc
        some ⟨i,⟨lo+(position v.val-lo), _⟩⟩ = some ⟨i,p⟩ := by rw [heq]
        _ = v.val := hp.symm
  }
  exact (Nat.card_congr e).symm.trans (by simp)

/-- The center together with an initial segment of each arm. -/
def centralSet {m : ℕ} {arms : Fin m → ℕ} (cut : Fin m → ℕ) : Set (Vertex arms)
  | none => True
  | some ⟨i,p⟩ => p.val < cut i

theorem centralSet_connected {m : ℕ} {arms : Fin m → ℕ} (cut : Fin m → ℕ) :
    ((graph arms).induce (centralSet (arms := arms) cut)).Connected := by
  let root : {v // v ∈ centralSet (arms := arms) cut} := ⟨none, trivial⟩
  rw [SimpleGraph.connected_iff_exists_forall_reachable]
  refine ⟨root, ?_⟩
  intro v
  rcases v with ⟨v,hv⟩
  cases v with
  | none => exact SimpleGraph.Reachable.rfl
  | some v =>
    rcases v with ⟨i,p⟩
    have hreach : ∀ n (hn : n < arms i) (hc : n < cut i),
        ((graph arms).induce (centralSet (arms := arms) cut)).Reachable root
          ⟨some ⟨i,⟨n,hn⟩⟩, hc⟩ := by
      intro n
      induction n using Nat.strong_induction_on with
      | h n ih =>
        intro hn hc
        by_cases he : n = 0
        · subst n
          apply SimpleGraph.Adj.reachable
          change (graph arms).Adj none (some ⟨i,⟨0,hn⟩⟩)
          rfl
        · have hprev := ih (n-1) (by omega) (by omega) (by omega)
          apply hprev.trans
          apply SimpleGraph.Adj.reachable
          change (graph arms).Adj (some ⟨i,⟨n-1, by omega⟩⟩) (some ⟨i,⟨n,hn⟩⟩)
          simp only [graph, adj, true_and]
          omega
    exact hreach p.val p.isLt hv

theorem centralSet_card {m : ℕ} {arms : Fin m → ℕ} (cut : Fin m → ℕ)
    (hcut : ∀ i, cut i ≤ arms i) :
    Nat.card {v : Vertex arms // v ∈ centralSet (arms := arms) cut} = 1 + ∑ i, cut i := by
  classical
  let e : Vertex cut ≃ {v : Vertex arms // v ∈ centralSet (arms := arms) cut} := {
    toFun := fun v => match v with
      | none => ⟨none, trivial⟩
      | some ⟨i,p⟩ => ⟨some ⟨i,⟨p.val, lt_of_lt_of_le p.isLt (hcut i)⟩⟩, p.isLt⟩
    invFun := fun v => match v with
      | ⟨none,_⟩ => none
      | ⟨some ⟨i,p⟩,h⟩ => some ⟨i,⟨p.val,h⟩⟩
    left_inv := by
      intro v
      cases v with
      | none => rfl
      | some v => rcases v with ⟨i,p⟩; rfl
    right_inv := by
      intro ⟨v,h⟩
      cases v with
      | none => rfl
      | some v => rcases v with ⟨i,p⟩; rfl
  }
  calc
    Nat.card {v : Vertex arms // v ∈ centralSet (arms := arms) cut} = Nat.card (Vertex cut) :=
      (Nat.card_congr e).symm
    _ = Fintype.card (Vertex cut) := Nat.card_eq_fintype_card
    _ = 1 + ∑ i, cut i := vertex_card cut

/-- A finite disjoint connected set cover with the specified cardinalities is
an actual connected-fiber partition of the star graph. -/
theorem partition_of_sets {m p : ℕ} (arms : Fin m → ℕ) (sizes : Fin p → ℕ)
    (pieces : Fin p → Set (Vertex arms))
    (hcover : ∀ v, ∃ i, v ∈ pieces i)
    (hdisj : ∀ i j v, v ∈ pieces i → v ∈ pieces j → i = j)
    (hsize : ∀ i, Nat.card (pieces i) = sizes i)
    (hconn : ∀ i, ((graph arms).induce (pieces i)).Connected) :
    Partitionable arms sizes := by
  classical
  let color : Vertex arms → Fin p := fun v => Classical.choose (hcover v)
  have hcolor (v : Vertex arms) : v ∈ pieces (color v) := Classical.choose_spec (hcover v)
  have hfiber (i : Fin p) : {v : Vertex arms | color v = i} = pieces i := by
    ext v
    constructor
    · intro h
      rw [← h]
      exact hcolor v
    · intro h
      exact hdisj (color v) i v (hcolor v) h
  refine ⟨color, ?_⟩
  intro i
  constructor
  · have hcard : Nat.card {v : Vertex arms // color v = i} = Nat.card (pieces i) := by
      apply Nat.card_congr
      exact Set.equivOfEq (hfiber i)
    simpa [Nat.card_eq_fintype_card] using hcard.trans (hsize i)
  · rw [hfiber i]
    exact hconn i

theorem armSegment_iff {m : ℕ} {arms : Fin m → ℕ} (i : Fin m)
    (lo hi : ℕ) (v : Vertex arms) :
    v ∈ armSegment i lo hi ↔ branch v = some i ∧ lo ≤ position v ∧ position v < hi := by
  cases v with
  | none => simp [armSegment, branch]
  | some v =>
    rcases v with ⟨j,p⟩
    constructor
    · rintro ⟨q,h,hl,hh⟩
      have he : j = i := by
        have h' := Option.some.inj h
        exact congrArg Sigma.fst h'
      subst j
      have hp : p = q := by
        have h' := Option.some.inj h
        exact eq_of_heq (Sigma.mk.inj_iff.mp h').2
      subst q
      exact ⟨rfl,hl,hh⟩
    · rintro ⟨he,hl,hh⟩
      simp only [branch, Option.some.injEq] at he
      subst j
      exact ⟨p,rfl,hl,hh⟩

theorem centralSet_member {m : ℕ} {arms : Fin m → ℕ} (cut : Fin m → ℕ)
    (v : Vertex arms) : v ∈ centralSet (arms := arms) cut ↔
      v = none ∨ ∃ i, branch v = some i ∧ position v < cut i := by
  cases v with
  | none => change True ↔ _; simp
  | some v =>
    rcases v with ⟨j,p⟩
    change p.val < cut j ↔ _
    simp only [Option.some_ne_none, false_or, branch, Option.some.injEq, position]
    constructor
    · intro h
      exact ⟨j,rfl,h⟩
    · rintro ⟨i,h,hp⟩
      subst i
      exact hp

/-- A numerical tiling of the arm suffixes realizes an actual connected
partition, with the unoccupied prefixes forming the central piece. -/
theorem partition_of_interval_tiling {m p : ℕ} (arms cut : Fin m → ℕ)
    (host : Fin p → Fin m) (lo hi : Fin p → ℕ)
    (hcut : ∀ i, cut i ≤ arms i)
    (hinterval : ∀ k, cut (host k) ≤ lo k ∧ lo k < hi k ∧ hi k ≤ arms (host k))
    (hcover : ∀ i n, cut i ≤ n → n < arms i →
      ∃ k, host k = i ∧ lo k ≤ n ∧ n < hi k)
    (hdisj : ∀ k l, k ≠ l → host k = host l → hi k ≤ lo l ∨ hi l ≤ lo k) :
    Partitionable arms (Fin.cases (1 + ∑ i, cut i) (fun k => hi k-lo k)) := by
  classical
  let pieces : Fin (p+1) → Set (Vertex arms) := Fin.cases
    (centralSet (arms := arms) cut) (fun k => armSegment (host k) (lo k) (hi k))
  have hsep (k : Fin p) : Disjoint (centralSet (arms := arms) cut) (armSegment (host k) (lo k) (hi k)) := by
    rw [Set.disjoint_left]
    intro v hv hs
    obtain ⟨hbranch, hl, _⟩ := (armSegment_iff (host k) (lo k) (hi k) v).1 hs
    rcases (centralSet_member cut v).1 hv with hv | ⟨i,hi',hc⟩
    · subst v
      simp [branch] at hbranch
    · have he : i = host k := by simpa [hbranch] using hi'.symm
      subst i
      have := (hinterval k).1
      omega
  apply partition_of_sets arms _ pieces
  · intro v
    by_cases hc : v ∈ centralSet (arms := arms) cut
    · exact ⟨0,hc⟩
    · cases v with
      | none => exact (hc trivial).elim
      | some v =>
        rcases v with ⟨i,q⟩
        have hq : cut i ≤ q.val := by
          by_contra hh
          apply hc
          change q.val < cut i
          omega
        obtain ⟨k,hhost,hl,hh⟩ := hcover i q.val hq q.isLt
        refine ⟨k.succ, ?_⟩
        change some ⟨i,q⟩ ∈ armSegment (host k) (lo k) (hi k)
        apply (armSegment_iff _ _ _ _).2
        simp [branch, position, hhost, hl, hh]
  · intro x y v hx hy
    cases x using Fin.cases with
    | zero =>
      cases y using Fin.cases with
      | zero => rfl
      | succ k => exact ((Set.disjoint_left.mp (hsep k)) hx hy).elim
    | succ k =>
      cases y using Fin.cases with
      | zero => exact ((Set.disjoint_left.mp (hsep k)) hy hx).elim
      | succ l =>
        by_cases he : k = l
        · subst l
          rfl
        · change v ∈ armSegment (host k) (lo k) (hi k) at hx
          change v ∈ armSegment (host l) (lo l) (hi l) at hy
          obtain ⟨hk,hlk,huk⟩ := (armSegment_iff _ _ _ _).1 hx
          obtain ⟨hl,hll,hul⟩ := (armSegment_iff _ _ _ _).1 hy
          have hosts : host k = host l := Option.some.inj (hk.symm.trans hl)
          rcases hdisj k l he hosts with h | h <;> omega
  · intro x
    cases x using Fin.cases with
    | zero => exact centralSet_card cut hcut
    | succ k => exact armSegment_card (host k) (lo k) (hi k) (by have := hinterval k; omega) (hinterval k).2.2
  · intro x
    cases x using Fin.cases with
    | zero => exact centralSet_connected cut
    | succ k => exact armSegment_connected (host k) (lo k) (hi k) (hinterval k).2.1 (hinterval k).2.2

/-- Connected partitions are invariant under any reordering of their sizes. -/
theorem partitionable_reorder {m p q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin p → ℕ) (sizes' : Fin q → ℕ)
    (hcounts : ∀ n, Nat.card {j // sizes j = n} = Nat.card {j // sizes' j = n})
    (hpart : Partitionable arms sizes) : Partitionable arms sizes' := by
  classical
  let fibers (n : ℕ) : {j // sizes j = n} ≃ {j // sizes' j = n} :=
    Fintype.equivOfCardEq (by simpa [Nat.card_eq_fintype_card] using hcounts n)
  let e : Fin p ≃ Fin q := Equiv.ofFiberEquiv fibers
  have emap (j : Fin p) : sizes' (e j) = sizes j := Equiv.ofFiberEquiv_map fibers j
  obtain ⟨color,hcolor⟩ := hpart
  refine ⟨fun v => e (color v), ?_⟩
  intro j
  have heq : {v : Vertex arms | e (color v) = j} = {v | color v = e.symm j} := by
    ext v
    constructor
    · intro h
      apply e.injective
      simpa using h
    · intro h
      change color v = e.symm j at h
      change e (color v) = j
      rw [h, e.apply_symm_apply]
  have hcard : Fintype.card {v : Vertex arms // e (color v) = j} =
      Fintype.card {v : Vertex arms // color v = e.symm j} :=
    Fintype.card_congr (Set.equivOfEq heq)
  have hsize : sizes' j = sizes (e.symm j) := by simpa using emap (e.symm j)
  constructor
  · rw [hcard, (hcolor (e.symm j)).1, hsize]
  · rw [heq]
    exact (hcolor (e.symm j)).2

end Hornak
