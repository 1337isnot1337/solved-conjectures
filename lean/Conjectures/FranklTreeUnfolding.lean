module

public import Conjectures.FranklTreeBall
public import Conjectures.FranklTreeGluing
public import Mathlib.Data.Fintype.Option
public import Mathlib.Data.Fintype.Sigma

/-! A finite-depth unfolding without immediate reversals.

Vertices are built from an actual graph's neighbor sets. Under girth sixteen,
every path of depth at most seven is simple and has a unique endpoint. The
root unfolding therefore has exactly the vertices of the actual graph ball.
The graph structure records the disjoint branch construction explicitly. -/
@[expose] public section

namespace FranklTreeUnfolding

open SimpleGraph FranklTreeBall FranklTreeGluing

universe u

variable {V : Type u}

def Children (G : SimpleGraph V) (parent root : V) :=
  {v : V // G.Adj root v ∧ v ≠ parent}

def Vertex (G : SimpleGraph V) : ℕ → V → V → Type u
  | 0, _, _ => PUnit
  | n + 1, parent, root => Option (Σ child : Children G parent root,
      Vertex G n root child.1)

def rootVertex (G : SimpleGraph V) : ∀ n parent root, Vertex G n parent root
  | 0, _, _ => PUnit.unit
  | _ + 1, _, _ => none

def endpoint (G : SimpleGraph V) : ∀ n parent root, Vertex G n parent root → V
  | 0, _, root, _ => root
  | _ + 1, _, root, none => root
  | n + 1, _, root, some ⟨child, x⟩ => endpoint G n root child.1 x

def walk (G : SimpleGraph V) :
    ∀ n parent root (x : Vertex G n parent root), G.Walk root (endpoint G n parent root x)
  | 0, _, _, _ => .nil
  | _ + 1, _, _, none => .nil
  | n + 1, _, root, some ⟨child, x⟩ => .cons child.2.1 (walk G n root child.1 x)

def graph (G : SimpleGraph V) : ∀ n parent root, SimpleGraph (Vertex G n parent root)
  | 0, _, _ => ⊥
  | n + 1, parent, root => attachedGraph
      (fun child : Children G parent root => graph G n root child.1)
      (fun child => rootVertex G n root child.1)

instance finiteVertex (G : SimpleGraph V) [Finite V] (n : ℕ) (parent root : V) :
    Finite (Vertex G n parent root) := by
  classical
  let _ : Fintype V := Fintype.ofFinite V
  induction n generalizing parent root with
  | zero =>
      change Finite PUnit
      infer_instance
  | succ n ih =>
      let _ (child : Children G parent root) : Fintype (Vertex G n root child.1) :=
        @Fintype.ofFinite (Vertex G n root child.1) (ih root child.1)
      change Finite (Option (Σ child : Children G parent root, Vertex G n root child.1))
      infer_instance

theorem endpoint_rootVertex (G : SimpleGraph V) (n : ℕ) (parent root : V) :
    endpoint G n parent root (rootVertex G n parent root) = root := by
  cases n <;> rfl

theorem walk_rootVertex_support (G : SimpleGraph V) (n : ℕ) (parent root : V) :
    (walk G n parent root (rootVertex G n parent root)).support = [root] := by
  cases n <;> rfl

theorem walk_length_le (G : SimpleGraph V) (n : ℕ) (parent root : V)
    (x : Vertex G n parent root) : (walk G n parent root x).length ≤ n := by
  induction n generalizing parent root with
  | zero => exact Nat.zero_le _
  | succ n ih =>
      cases x with
      | none => exact Nat.zero_le _
      | some x =>
          rcases x with ⟨child, x⟩
          exact Nat.succ_le_succ (ih root child.1 x)

theorem support_head {G : SimpleGraph V} {u v : V} (p : G.Walk u v) :
    p.support.head? = some u := by
  cases p <;> rfl

theorem walk_support_injective (G : SimpleGraph V) (n : ℕ) (parent root : V) :
    Function.Injective (fun x : Vertex G n parent root => (walk G n parent root x).support) := by
  induction n generalizing parent root with
  | zero =>
      intro x y _
      cases x
      cases y
      rfl
  | succ n ih =>
      intro x y h
      cases x with
      | none =>
          cases y with
          | none => rfl
          | some y =>
              rcases y with ⟨child, y⟩
              change root :: [] = root :: (walk G n root child.1 y).support at h
              exact False.elim ((walk G n root child.1 y).support_ne_nil (List.cons.inj h).2.symm)
      | some x =>
          rcases x with ⟨child, x⟩
          cases y with
          | none =>
              change root :: (walk G n root child.1 x).support = root :: [] at h
              exact False.elim ((walk G n root child.1 x).support_ne_nil (List.cons.inj h).2)
          | some y =>
              rcases y with ⟨other, y⟩
              change root :: (walk G n root child.1 x).support =
                root :: (walk G n root other.1 y).support at h
              have ht := (List.cons.inj h).2
              have hc : child.1 = other.1 := by
                apply Option.some.inj
                simpa only [support_head] using congrArg List.head? ht
              have hchild : child = other := Subtype.ext hc
              cases hchild
              have hx := ih root child.1 ht
              cases hx
              rfl

theorem neighbor_not_mem_support {G : SimpleGraph V} (hg : NoShortCycle G 16)
    {start u v : V} (p : G.Walk start u) (hp : p.IsPath) (hlen : p.length ≤ 7)
    (hadj : G.Adj u v) (hprev : v ≠ p.penultimate) : v ∉ p.support := by
  classical
  intro hv
  let q := p.takeUntil v hv
  have hq : q.IsPath := hp.takeUntil hv
  have hqlen : q.length ≤ p.length := p.length_takeUntil_le_length hv
  rcases short_paths_edge hg p q hp hq hlen (hqlen.trans hlen) hadj with he | he
  · have hl := congrArg Walk.length he
    simp only [Walk.length_concat] at hl
    omega
  · have hvp := congrArg Walk.penultimate he
    simp only [Walk.penultimate_concat] at hvp
    exact hprev hvp

theorem append_walk_isPath {G : SimpleGraph V} (hg : NoShortCycle G 16) {start : V} :
    ∀ (n : ℕ) (parent root : V) (x : Vertex G n parent root) (p : G.Walk start root),
      p.IsPath → (p.Nil ∨ parent = p.penultimate) → p.length + n ≤ 7 →
      (p.append (walk G n parent root x)).IsPath := by
  intro n
  induction n with
  | zero =>
      intro parent root x p hp _ _
      simpa only [walk, endpoint, Walk.append_nil] using hp
  | succ n ih =>
      intro parent root x p hp hparent hlen
      cases x with
      | none => simpa only [walk, endpoint, Walk.append_nil] using hp
      | some x =>
          rcases x with ⟨child, x⟩
          have hc : child.1 ≠ p.penultimate := by
            rcases hparent with hnil | hparent
            · cases hnil
              exact child.2.1.ne.symm
            · exact fun h => child.2.2 (h.trans hparent.symm)
          have hnot := neighbor_not_mem_support hg p hp (by omega) child.2.1 hc
          have hp' := hp.concat hnot child.2.1
          have hi := ih root child.1 x (p.concat child.2.1) hp'
            (Or.inr (Walk.penultimate_concat p child.2.1).symm) (by
              simp only [Walk.length_concat]
              omega)
          simpa only [walk, endpoint, Walk.concat_append] using hi

theorem walk_isPath {G : SimpleGraph V} (hg : NoShortCycle G 16)
    (n : ℕ) (hlen : n ≤ 7) (parent root : V) (x : Vertex G n parent root) :
    (walk G n parent root x).IsPath := by
  have h := append_walk_isPath hg n parent root x (.nil : G.Walk root root)
    Walk.IsPath.nil (Or.inl Walk.Nil.nil) (by simpa using hlen)
  simpa only [Walk.nil_append] using h

theorem endpoint_injective {G : SimpleGraph V} (hg : NoShortCycle G 16)
    (n : ℕ) (hlen : n ≤ 7) (parent root : V) :
    Function.Injective (endpoint G n parent root) := by
  intro x y h
  let q := (walk G n parent root y).copy rfl h.symm
  have hq : q.IsPath := by
    simpa only [q, Walk.isPath_def, Walk.support_copy] using
      walk_isPath hg n hlen parent root y
  have hlength : (walk G n parent root x).length + q.length < 16 := by
    have hx := walk_length_le G n parent root x
    have hy := walk_length_le G n parent root y
    simp only [q, Walk.length_copy]
    omega
  have hw := short_paths_unique hg (walk_isPath hg n hlen parent root x) hq hlength
  apply walk_support_injective G n parent root
  simpa only [q, Walk.support_copy] using congrArg Walk.support hw

theorem exists_endpoint_of_path (G : SimpleGraph V) :
    ∀ (n : ℕ) (parent root v : V) (p : G.Walk root v),
      p.IsPath → p.length ≤ n → parent ∉ p.support.tail →
      ∃ x : Vertex G n parent root, endpoint G n parent root x = v := by
  intro n
  induction n with
  | zero =>
      intro parent root v p _ hlen _
      exact ⟨PUnit.unit, Walk.eq_of_length_eq_zero (Nat.eq_zero_of_le_zero hlen)⟩
  | succ n ih =>
      intro parent root v p hp hlen havoid
      cases p with
      | nil => exact ⟨none, rfl⟩
      | @cons root next v hadj q =>
          have hnext : next ≠ parent := by
            intro heq
            apply havoid
            change parent ∈ q.support
            rw [← heq]
            exact q.start_mem_support
          have hpath := (Walk.cons_isPath_iff hadj q).mp hp
          have htail : root ∉ q.support.tail := fun h =>
            hpath.2 (List.mem_of_mem_tail h)
          obtain ⟨x, hx⟩ := ih root next v q hpath.1 (by
            simp only [Walk.length_cons] at hlen
            omega) htail
          exact ⟨some ⟨⟨next, hadj, hnext⟩, x⟩, hx⟩

theorem root_not_mem_tail {G : SimpleGraph V} {root v : V}
    (p : G.Walk root v) (hp : p.IsPath) : root ∉ p.support.tail := by
  have hn := (Walk.isPath_def p).mp hp
  rw [← p.cons_tail_support] at hn
  exact (List.nodup_cons.mp hn).1

def toBall {G : SimpleGraph V} (hg : NoShortCycle G 16)
    (n : ℕ) (hlen : n ≤ 7) (root : V) (x : Vertex G n root root) :
    pathBall G root n :=
  ⟨endpoint G n root root x, walk G n root root x,
    walk_isPath hg n hlen root root x, walk_length_le G n root root x⟩

theorem toBall_bijective {G : SimpleGraph V} (hg : NoShortCycle G 16)
    (n : ℕ) (hlen : n ≤ 7) (root : V) :
    Function.Bijective (toBall hg n hlen root) := by
  constructor
  · intro x y h
    exact endpoint_injective hg n hlen root root (congrArg Subtype.val h)
  · intro v
    obtain ⟨p, hp, hlength⟩ := v.2
    obtain ⟨x, hx⟩ := exists_endpoint_of_path G n root root v.1 p hp hlength
      (root_not_mem_tail p hp)
    exact ⟨x, Subtype.ext hx⟩

noncomputable def ballEquiv {G : SimpleGraph V} (hg : NoShortCycle G 16)
    (n : ℕ) (hlen : n ≤ 7) (root : V) :
    Vertex G n root root ≃ pathBall G root n :=
  Equiv.ofBijective (toBall hg n hlen root) (toBall_bijective hg n hlen root)

theorem ball_card_eq {G : SimpleGraph V} (hg : NoShortCycle G 16)
    (n : ℕ) (hlen : n ≤ 7) (root : V) :
    Nat.card (Vertex G n root root) = Nat.card (pathBall G root n) :=
  Nat.card_congr (ballEquiv hg n hlen root)

end FranklTreeUnfolding
