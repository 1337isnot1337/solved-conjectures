import Conjectures.CircularInsertionRotations
import Mathlib.Data.List.Basic

/-! Exhaustive exclusions for the two base matchings at g = 3, 4 and 5. -/

namespace CircularIndex.Insertion

/-- A matching is represented by its fixed-point-free partner involution on the support. -/
def Partners (vs : List ℕ) (f : ℕ → ℕ) : Prop :=
  ∀ x ∈ vs, f x ∈ vs ∧ f (f x)=x ∧ f x ≠ x

def UniqueLengths (n : ℕ) (vs : List ℕ) (f : ℕ → ℕ) : Prop :=
  ∀ x ∈ vs, ∀ y ∈ vs, distance n x (f x) = distance n y (f y) → y=x ∨ y=f x

/-- Select a partner for the first remaining vertex and recurse on the others. -/
def lengthProfiles (n : ℕ) : ℕ → List ℕ → List (List ℕ)
  | 0, [] => [[]]
  | 0, _::_ => []
  | _+1, [] => []
  | k+1, x::xs => xs.flatMap fun y =>
      (lengthProfiles n k (xs.erase y)).map (List.cons (distance n x y))

theorem lengthProfiles_complete {n : ℕ} {k : ℕ} {vs : List ℕ} {f : ℕ → ℕ}
    (hcard : vs.length=2*k) (hn : vs.Nodup) (hp : Partners vs f) (hu : UniqueLengths n vs f) :
    ∃ L ∈ lengthProfiles n k vs, L.Nodup ∧
      ∀ a ∈ L, ∃ x ∈ vs, a=distance n x (f x) := by
  induction k generalizing vs with
  | zero =>
    have hv : vs=[] := List.length_eq_zero_iff.mp (by omega)
    subst vs
    exact ⟨[],by simp [lengthProfiles],by decide,by simp⟩
  | succ k ih =>
    cases vs with
    | nil => simp at hcard
    | cons x xs =>
      obtain ⟨hx,hxs⟩ := List.nodup_cons.mp hn
      obtain ⟨hy,hyx,hyne⟩ := hp x (List.mem_cons_self ..)
      have hym : f x∈xs := (List.mem_cons.mp hy).resolve_left hyne
      let rest := xs.erase (f x)
      have mem {z : ℕ} : z ∈ rest ↔ z ≠ f x ∧ z ∈ xs := hxs.mem_erase_iff
      have card : rest.length=2*k := by
        have hl := List.length_erase_add_one hym
        simp only [List.length_cons] at hcard
        dsimp only [rest]
        omega
      have incl {z : ℕ} (hz : z∈rest) : z∈x::xs := List.mem_cons_of_mem _ (mem.mp hz).2
      have partners : Partners rest f := by
        intro z hz
        obtain ⟨hz₁,hz₂⟩ := mem.mp hz
        obtain ⟨hf,hfz,hne⟩ := hp z (incl hz)
        have hzx : z≠x := fun h => hx (h ▸ hz₂)
        have hfx : f z≠x := fun h => hz₁ (hfz ▸ congrArg f h)
        have hfy : f z≠f x := fun h => hzx (hfz ▸ hyx ▸ congrArg f h)
        exact ⟨mem.mpr ⟨hfy,(List.mem_cons.mp hf).resolve_left hfx⟩,hfz,hne⟩
      have unique : UniqueLengths n rest f := fun z hz w hw => hu z (incl hz) w (incl hw)
      obtain ⟨L,hL,hnd,hsrc⟩ := ih card (hxs.erase _) partners unique
      have hnot : distance n x (f x) ∉ L := by
        intro h
        obtain ⟨z,hz,hh⟩ := hsrc _ h
        rcases hu x (List.mem_cons_self ..) z (incl hz) hh with he|he
        · exact hx (he ▸ (mem.mp hz).2)
        · exact (mem.mp hz).1 he
      refine ⟨distance n x (f x)::L,?_,List.nodup_cons.mpr ⟨hnot,hnd⟩,?_⟩
      · apply List.mem_flatMap.mpr
        exact ⟨f x,hym,List.mem_map.mpr ⟨L,hL,rfl⟩⟩
      · intro a ha
        rcases List.mem_cons.mp ha with ha|ha
        · exact ⟨x,List.mem_cons_self ..,ha⟩
        · obtain ⟨z,hz,he⟩ := hsrc a ha
          exact ⟨z,incl hz,he⟩

def baseVertices (g ε : ℕ) : List ℕ :=
  [ε,ε+1] ++ (List.range (2*g-2)).map (fun i => 2*g+3+i)

def goodProfiles (g ε : ℕ) : List (List ℕ) :=
  (lengthProfiles (vertexCount g) g (baseVertices g ε)).filter
    (fun L => decide (L.Nodup ∧ 1∉L))

def compatibleProfiles (g : ℕ) : Bool :=
  (goodProfiles g 0).any fun A => (goodProfiles g 1).any fun B =>
    A.all fun a => decide (a∉B)

/-- The original two-class base problem, with no unit length and globally distinct edge lengths. -/
def AdmissibleBase (g : ℕ) : Prop :=
  ∃ (f h : ℕ → ℕ),
    Partners (baseVertices g 0) f ∧ Partners (baseVertices g 1) h ∧
    UniqueLengths (vertexCount g) (baseVertices g 0) f ∧
    UniqueLengths (vertexCount g) (baseVertices g 1) h ∧
    (∀ x∈baseVertices g 0, distance (vertexCount g) x (f x) ≠ 1) ∧
    (∀ y∈baseVertices g 1, distance (vertexCount g) y (h y) ≠ 1) ∧
    ∀ x∈baseVertices g 0, ∀ y∈baseVertices g 1,
      distance (vertexCount g) x (f x) ≠ distance (vertexCount g) y (h y)

theorem compatible_of_admissible {g : ℕ}
    (hcard : ∀ ε : Fin 2, (baseVertices g ε.val).length=2*g)
    (hn : ∀ ε : Fin 2, (baseVertices g ε.val).Nodup) (h : AdmissibleBase g) :
    compatibleProfiles g=true := by
  obtain ⟨f,k,hf,hk,uf,uk,one₁,one₂,dis⟩ := h
  obtain ⟨A,hA,ha,sa⟩ := lengthProfiles_complete (hcard 0) (hn 0) hf uf
  obtain ⟨B,hB,hb,sb⟩ := lengthProfiles_complete (hcard 1) (hn 1) hk uk
  have h₁ : 1∉A := by
    intro hh
    obtain ⟨x,hx,e⟩ := sa 1 hh
    exact one₁ x hx e.symm
  have h₂ : 1∉B := by
    intro hh
    obtain ⟨y,hy,e⟩ := sb 1 hh
    exact one₂ y hy e.symm
  apply List.any_eq_true.mpr
  refine ⟨A,List.mem_filter.mpr ⟨hA,decide_eq_true ⟨ha,h₁⟩⟩,?_⟩
  apply List.any_eq_true.mpr
  refine ⟨B,List.mem_filter.mpr ⟨hB,decide_eq_true ⟨hb,h₂⟩⟩,List.all_eq_true.mpr ?_⟩
  intro a he
  apply decide_eq_true
  intro hh
  obtain ⟨x,hx,hx'⟩ := sa a he
  obtain ⟨y,hy,hy'⟩ := sb a hh
  exact dis x hx y hy (hx'.symm.trans hy')

set_option maxRecDepth 16000 in
set_option maxHeartbeats 5000000 in
theorem no_small_base {g : ℕ} (hg : g=3 ∨ g=4 ∨ g=5) : ¬AdmissibleBase g := by
  intro h
  rcases hg with rfl|rfl|rfl
  all_goals
    have hh := compatible_of_admissible (by decide) (by decide) h
    exact (by decide : compatibleProfiles _ ≠ true) hh

end CircularIndex.Insertion
