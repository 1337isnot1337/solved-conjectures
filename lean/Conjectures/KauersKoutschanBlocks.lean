import Conjectures.KauersKoutschanPermutationCount

/-! Consecutive value-edge runs transport to consecutive position blocks. -/

namespace KauersKoutschan

theorem mem_edge_intersection {n : ℕ} (s : Finset (Fin (n - 2)))
    (p : Equiv.Perm (Fin n)) :
    p ∈ s.inf edgeEvent ↔
      ∀ e ∈ s, (p.symm (upper e) : ℕ) = (p.symm (lower e) : ℕ) + 2 := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert e s _ ih =>
    rw [Finset.inf_insert]
    change (p ∈ edgeEvent e ∩ s.inf edgeEvent) ↔ _
    rw [Finset.mem_inter, ih]
    have he : p ∈ edgeEvent e ↔ (p.symm (upper e) : ℕ) = (p.symm (lower e) : ℕ) + 2 := by
      unfold edgeEvent
      rw [Finset.mem_filter]
      simp only [Finset.mem_univ, true_and]
      rfl
    rw [he]
    simp

/-- The graph on the value chain has a chosen edge with this lower endpoint. -/
def selectedAt {n : ℕ} (s : Finset (Fin (n - 2))) (x : ℕ) : Prop :=
  x ∈ s.image Fin.val

/-- Every value block is sent by the inverse permutation to an ordered block
in one position parity chain, with each offset preserved exactly. -/
theorem inverse_preserves_block_offsets {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent)
    (b k : ℕ) (hb : b + 2 * k < n)
    (edges : ∀ j < k, selectedAt s (b + 2 * j)) :
    (p.symm ⟨b + 2 * k, hb⟩ : ℕ) = (p.symm ⟨b, by omega⟩ : ℕ) + 2 * k := by
  induction k with
  | zero => simp
  | succ k ih =>
    have hlast := edges k (Nat.lt_succ_self k)
    obtain ⟨e, he, hval⟩ := Finset.mem_image.mp hlast
    have hlow : lower e = ⟨b + 2 * k, by omega⟩ := Fin.ext hval
    have hhigh : upper e = ⟨b + 2 * (k + 1), hb⟩ := Fin.ext (by
      change (e : ℕ) + 2 = b + 2 * (k + 1)
      omega)
    have hstep := (mem_edge_intersection s p).mp hp e he
    rw [hlow, hhigh] at hstep
    have hprev := ih (by omega) (fun j hj => edges j (by omega))
    rw [hstep, hprev]
    omega

instance {n : ℕ} (s : Finset (Fin (n - 2))) (x : ℕ) : Decidable (selectedAt s x) :=
  inferInstanceAs (Decidable (x ∈ s.image Fin.val))

/-- The first value of the maximal selected run containing a value. -/
def blockStart {n : ℕ} (s : Finset (Fin (n - 2))) (v : ℕ) : ℕ :=
  if h : 2 ≤ v ∧ selectedAt s (v - 2) then blockStart s (v - 2) else v
termination_by v
decreasing_by omega

/-- Each value is reached from its block start by successive selected edges,
and the start itself has no selected incoming edge. -/
theorem blockStart_spec {n : ℕ} (s : Finset (Fin (n - 2))) (v : ℕ) :
    ¬ (2 ≤ blockStart s v ∧ selectedAt s (blockStart s v - 2)) ∧
      ∃ k, v = blockStart s v + 2 * k ∧
        ∀ j < k, selectedAt s (blockStart s v + 2 * j) := by
  induction v using Nat.strongRecOn with
  | ind v ih =>
    rw [blockStart]
    split_ifs with hv
    · obtain ⟨hfirst, k, hk, he⟩ := ih (v - 2) (by omega)
      refine ⟨hfirst, k + 1, by omega, ?_⟩
      intro j hj
      by_cases h : j < k
      · exact he j h
      · have hjk : j = k := by omega
        subst j
        rw [← hk]
        exact hv.2
    · exact ⟨hv, 0, by omega, fun j hj => False.elim (by omega)⟩

/-- Any run starting without an incoming edge has its stated start.
Together with `blockStart_spec` this gives a unique partition into runs. -/
theorem blockStart_of_run {n : ℕ} (s : Finset (Fin (n - 2))) (b k : ℕ)
    (hfirst : ¬ (2 ≤ b ∧ selectedAt s (b - 2)))
    (he : ∀ j < k, selectedAt s (b + 2 * j)) :
    blockStart s (b + 2 * k) = b := by
  induction k with
  | zero => simp [blockStart, hfirst]
  | succ k ih =>
    rw [blockStart, dite_eq_left ⟨by omega, by
      rw [show b + 2 * (k + 1) - 2 = b + 2 * k by omega]
      exact he k (Nat.lt_succ_self k)⟩,
      show b + 2 * (k + 1) - 2 = b + 2 * k by omega]
    exact ih (fun j hj => he j (by omega))

/-- A block head and an admissible offset along its selected value run. -/
def BlockOffsets {n : ℕ} (s : Finset (Fin (n - 2))) :=
  {q : ℕ × ℕ // q.1 + 2 * q.2 < n ∧
    ¬ (2 ≤ q.1 ∧ selectedAt s (q.1 - 2)) ∧
    ∀ j < q.2, selectedAt s (q.1 + 2 * j)}

/-- The literal parity-chain vertices are partitioned by the block coordinates,
including singleton blocks and empty chains. -/
def blockCoordinateEquiv {n : ℕ} (s : Finset (Fin (n - 2))) : Fin n ≃ BlockOffsets s where
  toFun v := ⟨(blockStart s v, ((v : ℕ) - blockStart s v) / 2), by
    obtain ⟨hfirst, k, hk, hr⟩ := blockStart_spec s (v : ℕ)
    have ht : ((v : ℕ) - blockStart s v) / 2 = k := by omega
    simpa only [ht, ← hk] using And.intro v.isLt (And.intro hfirst hr)⟩
  invFun q := ⟨q.1.1 + 2 * q.1.2, q.2.1⟩
  left_inv v := by
    obtain ⟨_, k, hk, _⟩ := blockStart_spec s (v : ℕ)
    apply Fin.ext
    change blockStart s v + 2 * (((v : ℕ) - blockStart s v) / 2) = v
    omega
  right_inv q := by
    obtain ⟨⟨b, k⟩, hn, hb, hk⟩ := q
    apply Subtype.ext
    change (blockStart s (b + 2 * k), (b + 2 * k - blockStart s (b + 2 * k)) / 2) = (b, k)
    rw [blockStart_of_run s b k hb hk]
    congr 1
    omega

/-- A parity and zero-based position in its chain. The two chain lengths are
`(n+1)/2` and `n/2`. -/
def PositionCoordinates (n : ℕ) :=
  {q : ℕ × ℕ // q.1 < 2 ∧ q.2 < (n + 1 - q.1) / 2}

def positionCoordinateEquiv (n : ℕ) : Fin n ≃ PositionCoordinates n where
  toFun v := ⟨((v : ℕ) % 2, (v : ℕ) / 2), by
    have hv := v.isLt
    dsimp only
    omega⟩
  invFun q := ⟨2 * q.1.2 + q.1.1, by
    obtain ⟨⟨e, j⟩, he, hj⟩ := q
    dsimp only at he hj ⊢
    omega⟩
  left_inv v := by
    apply Fin.ext
    change 2 * ((v : ℕ) / 2) + (v : ℕ) % 2 = v
    omega
  right_inv q := by
    obtain ⟨⟨e, j⟩, he, hj⟩ := q
    apply Subtype.ext
    change ((2 * j + e) % 2, (2 * j + e) / 2) = (e, j)
    exact Prod.ext (by dsimp only at he; omega) (by dsimp only at he; omega)

/-- The blocks of any realizing permutation cover both position chains without
overlaps, as witnessed by this equivalence. -/
def placedBlockEquiv {n : ℕ} (s : Finset (Fin (n - 2))) (p : Equiv.Perm (Fin n)) :
    BlockOffsets s ≃ PositionCoordinates n :=
  ((blockCoordinateEquiv s).symm.trans p.symm).trans (positionCoordinateEquiv n)

/-- Each block occupies successive offsets of one of the two position chains. -/
theorem placedBlockEquiv_apply {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent) (q : BlockOffsets s) :
    (placedBlockEquiv s p q).1 =
      let first := (p.symm ⟨q.1.1, by have := q.2.1; omega⟩ : ℕ)
      (first % 2, first / 2 + q.1.2) := by
  have hoff := inverse_preserves_block_offsets hp q.1.1 q.1.2 q.2.1 q.2.2.2
  change (((p.symm ⟨q.1.1 + 2 * q.1.2, q.2.1⟩ : ℕ) % 2),
      ((p.symm ⟨q.1.1 + 2 * q.1.2, q.2.1⟩ : ℕ) / 2)) = _
  rw [hoff]
  dsimp only
  exact Prod.ext (by omega) (by omega)

end KauersKoutschan
