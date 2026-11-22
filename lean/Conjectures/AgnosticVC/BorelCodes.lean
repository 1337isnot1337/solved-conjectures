module

public import Conjectures.AgnosticVC.BorelExample
public import Mathlib.Order.FixedPoints
public import Mathlib.MeasureTheory.MeasurableSpace.Pi

/-! Monotone Boolean syntax on countably branching trees. All codes have a truth
assignment, while every Borel set has a code with a prescribed root truth value. -/

@[expose] public section

open Set MeasureTheory MeasurableSpace

namespace AgnosticVC.BorelCode

abbrev Node := List ℕ
abbrev Op := ℕ × Bool
abbrev Code := Node → Op
abbrev Assignment := Node → Bool

/-- A positive first coordinate encodes a literal. Its Boolean coordinate chooses
equality or inequality with the encoded entry in the input. -/
def literal (op : Op) (x : Code) : Prop :=
  let key := (Encodable.decode (α := Node × Op) (op.1 - 1)).getD ([], (0, false))
  if op.2 then x key.1 = key.2 else x key.1 ≠ key.2

def localValue (op : Op) (x : Code) (A : Set Node) (t : Node) : Prop :=
  if op.1 = 0 then
    if op.2 then ∃ k : ℕ, k :: t ∈ A else ∀ k : ℕ, k :: t ∈ A
  else literal op x

def step (c x : Code) : Set Node →o Set Node where
  toFun A := {t | localValue (c t) x A t}
  monotone' := by
    intro A B h t ht
    change localValue (c t) x A t at ht
    change localValue (c t) x B t
    by_cases hz : (c t).1 = 0
    · cases hb : (c t).2 with
      | false =>
        simp only [localValue, hz, ite_true, hb, Bool.false_eq_true, ite_false] at ht ⊢
        exact fun k => h (ht k)
      | true =>
        simp only [localValue, hz, ite_true, hb] at ht ⊢
        obtain ⟨k,hk⟩ := ht
        exact ⟨k,h hk⟩
    · simpa [localValue, hz] using ht

def trueNodes (v : Assignment) : Set Node := {t | v t = true}

def Valid (c x : Code) (v : Assignment) : Prop := trueNodes v = step c x (trueNodes v)

theorem valid_iff (c x : Code) (v : Assignment) :
    Valid c x v ↔ ∀ t, v t = true ↔ localValue (c t) x (trueNodes v) t := by
  unfold Valid
  exact Set.ext_iff

theorem exists_valid (c x : Code) : ∃ v, Valid c x v := by
  classical
  let A := (step c x).lfp
  let v : Assignment := fun t => decide (t ∈ A)
  have hv : trueNodes v = A := by ext t; simp [trueNodes, v]
  exact ⟨v, by unfold Valid; rw [hv]; exact (step c x).map_lfp.symm⟩

def Represents (c : Code) (s : Set Code) : Prop :=
  ∀ x v, Valid c x v → (v [] = true ↔ x ∈ s)

def cylinderCode (t : Node) (op : Op) : Code :=
  fun _ => (Encodable.encode (t, op) + 1, true)

theorem represents_cylinder (t : Node) (op : Op) :
    Represents (cylinderCode t op) {x | x t = op} := by
  intro x v hv
  have h := (valid_iff _ _ _).mp hv []
  simpa [cylinderCode, localValue, literal, Encodable.encodek] using h

def negateCode (c : Code) : Code := fun t => ((c t).1, !(c t).2)

def negateAssignment (v : Assignment) : Assignment := fun t => !(v t)

theorem localValue_negate (c x : Code) (v : Assignment) (t : Node) :
    localValue (negateCode c t) x (trueNodes v) t ↔
      ¬ localValue (c t) x (trueNodes (negateAssignment v)) t := by
  by_cases hz : (c t).1 = 0 <;> cases h : (c t).2 <;>
    simp [localValue, literal, negateCode, trueNodes, negateAssignment, hz, h, not_forall]

theorem valid_negate (c x : Code) (v : Assignment) (hv : Valid (negateCode c) x v) :
    Valid c x (negateAssignment v) := by
  apply (valid_iff _ _ _).mpr
  intro t
  have h := ((valid_iff _ _ _).mp hv t).trans (localValue_negate c x v t)
  cases hb : v t <;> simp_all [negateAssignment]

theorem represents_compl {c : Code} {s : Set Code} (h : Represents c s) :
    Represents (negateCode c) sᶜ := by
  intro x v hv
  have he := h x (negateAssignment v) (valid_negate _ _ _ hv)
  cases hb : v [] <;> simp_all [negateAssignment]

def joinCode (cs : ℕ → Code) (t : Node) : Op :=
  match t.reverse with
  | [] => (0, true)
  | k :: rest => cs k rest.reverse

@[simp] theorem joinCode_append (cs : ℕ → Code) (k : ℕ) (t : Node) :
    joinCode cs (t ++ [k]) = cs k t := by simp [joinCode]

theorem represents_iUnion (cs : ℕ → Code) (ss : ℕ → Set Code)
    (hs : ∀ k, Represents (cs k) (ss k)) : Represents (joinCode cs) (⋃ k, ss k) := by
  intro x v hv
  let vsub (k : ℕ) (t : Node) := v (t ++ [k])
  have hsub (k : ℕ) : Valid (cs k) x (vsub k) := by
    apply (valid_iff _ _ _).mpr
    intro t
    have he := (valid_iff _ _ _).mp hv (t ++ [k])
    rw [joinCode_append] at he
    simpa [localValue, vsub, trueNodes] using he
  have hroot : v [] = true ↔ ∃ k : ℕ, v [k] = true := (valid_iff _ _ _).mp hv []
  rw [hroot, mem_iUnion]
  exact exists_congr fun k => hs k x (vsub k) (hsub k)

theorem exists_represents_empty : ∃ c : Code, Represents c ∅ := by
  let ss : ℕ → Set Code := fun k => {x | x [] = (k / 2, decide (k % 2 = 1))}
  let cs : ℕ → Code := fun k => cylinderCode [] (k / 2, decide (k % 2 = 1))
  have hall : (⋃ k, ss k) = Set.univ := by
    ext x
    simp only [mem_iUnion, mem_univ, iff_true]
    rcases hx : x [] with ⟨a,b⟩
    cases b with
    | false => exact ⟨2 * a, by simp [ss, hx]⟩
    | true => exact ⟨2 * a + 1, by simp [ss, hx]; omega⟩
  exact ⟨negateCode (joinCode cs), by
    have h := represents_compl (represents_iUnion cs ss (fun k => represents_cylinder _ _))
    rwa [hall, compl_univ] at h⟩

/-- Every Borel set of code inputs is represented by a code, including when the
code itself is later supplied as the input to its own assignment. -/
theorem exists_represents_measurableSet {s : Set Code} (hs : MeasurableSet s) :
    ∃ c, Represents c s := by
  classical
  rw [MeasurableSpace.pi_eq_generateFrom_projections] at hs
  refine generateFrom_induction _ (fun t _ => ∃ c, Represents c t) ?_ ?_ ?_ ?_ s hs
  · intro t ht _
    obtain ⟨q,A,_,rfl⟩ := ht
    by_cases he : A = ∅
    · simpa [he] using exists_represents_empty
    · have hne : A.Nonempty := Set.nonempty_iff_ne_empty.mpr he
      let a : A := ⟨hne.choose, hne.choose_spec⟩
      let e : ℕ → A := fun k => (Encodable.decode k).getD a
      let ss : ℕ → Set Code := fun k => {x | x q = (e k).val}
      have hh : (⋃ k, ss k) = Function.eval q ⁻¹' A := by
        ext x
        simp only [mem_iUnion, mem_preimage, Function.eval, ss, mem_ofPred_eq]
        constructor
        · rintro ⟨k,hk⟩; rw [hk]; exact (e k).property
        · intro hx
          obtain ⟨k,hk⟩ := Encodable.surjective_decode_getD A a ⟨x q,hx⟩
          exact ⟨k, congrArg Subtype.val hk.symm⟩
      rw [← hh]
      exact ⟨joinCode (fun k => cylinderCode q (e k).val),
        represents_iUnion _ _ (fun k => represents_cylinder _ _)⟩
  · exact exists_represents_empty
  · intro _ _ ih
    obtain ⟨c,hc⟩ := ih
    exact ⟨negateCode c, represents_compl hc⟩
  · intro ss _ ih
    choose cs hcs using ih
    exact ⟨joinCode cs, represents_iUnion cs ss hcs⟩

private theorem measurableSet_localValue (op : Op) (t : Node) :
    MeasurableSet {p : Code × Assignment | localValue op p.1 (trueNodes p.2) t} := by
  by_cases hz : op.1 = 0
  · cases hb : op.2 with
    | false =>
      have he : {p : Code × Assignment | localValue op p.1 (trueNodes p.2) t} =
          ⋂ k : ℕ, {p | p.2 (k :: t) = true} := by
        ext p
        simp [localValue, hz, hb, trueNodes]
      rw [he]
      exact MeasurableSet.iInter fun k => measurableSet_eq_fun
        ((measurable_pi_apply (k :: t)).comp measurable_snd) measurable_const
    | true =>
      have he : {p : Code × Assignment | localValue op p.1 (trueNodes p.2) t} =
          ⋃ k : ℕ, {p | p.2 (k :: t) = true} := by
        ext p
        simp [localValue, hz, hb, trueNodes]
      rw [he]
      exact MeasurableSet.iUnion fun k => measurableSet_eq_fun
        ((measurable_pi_apply (k :: t)).comp measurable_snd) measurable_const
  · simp only [localValue, hz, ite_false, literal]
    let key := (Encodable.decode (α := Node × Op) (op.1 - 1)).getD ([], (0, false))
    have hkey : MeasurableSet {p : Code × Assignment | p.1 key.1 = key.2} :=
      measurableSet_eq_fun ((measurable_pi_apply key.1).comp measurable_fst) measurable_const
    cases hb : op.2 with
    | false =>
      simp only [Bool.false_eq_true, ite_false]
      exact hkey.compl
    | true => simpa only [key, hb, ite_true] using hkey

/-- The inputs paired with any valid valuation of their own code form a Borel relation. -/
theorem measurableSet_valid_self : MeasurableSet {p : Code × Assignment | Valid p.1 p.1 p.2} := by
  have he : {p : Code × Assignment | Valid p.1 p.1 p.2} =
      ⋂ t : Node, {p | p.2 t = true ↔ localValue (p.1 t) p.1 (trueNodes p.2) t} := by
    ext p
    simp [valid_iff]
  rw [he]
  apply MeasurableSet.iInter
  intro t
  let L : Set (Code × Assignment) := {p | p.2 t = true}
  let R : Set (Code × Assignment) := {p | localValue (p.1 t) p.1 (trueNodes p.2) t}
  have hL : MeasurableSet L := measurableSet_eq_fun
    ((measurable_pi_apply t).comp measurable_snd) measurable_const
  have hr : R = ⋃ a : Op, {p | p.1 t = a} ∩ {p | localValue a p.1 (trueNodes p.2) t} := by
    ext p
    simp [R]
  have hR : MeasurableSet R := by
    rw [hr]
    exact MeasurableSet.iUnion fun a => (measurableSet_eq_fun
      ((measurable_pi_apply t).comp measurable_fst) measurable_const).inter (measurableSet_localValue a t)
  have hEq : {p : Code × Assignment | p.2 t = true ↔ localValue (p.1 t) p.1 (trueNodes p.2) t} =
      L ∩ R ∪ (Lᶜ ∩ Rᶜ) := by
    ext p
    simp only [L, R, mem_ofPred_eq, mem_union, mem_inter_iff, mem_compl_iff]
    tauto
  rw [hEq]
  exact (hL.inter hR).union (hL.compl.inter hR.compl)

end AgnosticVC.BorelCode
