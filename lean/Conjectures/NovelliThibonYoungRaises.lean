module
public import Conjectures.NovelliThibonSchurExtraction
public import Mathlib.Combinatorics.Young.YoungDiagram

@[expose] public section
namespace NovelliThibon

/-- Construct the actual Ferrers diagram of bounded, weakly decreasing row lengths. -/
noncomputable def diagramFromRows {k : ℕ} (r : Fin k → ℕ) (hr : Antitone r) : YoungDiagram where
  cells := Finset.univ.biUnion fun i => (Finset.range (r i)).image fun j => (i.val,j)
  isLowerSet := by
    intro b a hab hb
    simp only [Finset.mem_coe,Finset.mem_biUnion,Finset.mem_univ,true_and,Finset.mem_image,Finset.mem_range] at hb ⊢
    obtain ⟨i,j,hj,rfl⟩ := hb
    have hai : a.1 < k := lt_of_le_of_lt hab.1 i.isLt
    let ai : Fin k := ⟨a.1,hai⟩
    have hai' : ai ≤ i := hab.1
    have haj : a.2 ≤ j := hab.2
    exact ⟨ai,a.2,lt_of_le_of_lt haj (hj.trans_le (hr hai')),rfl⟩

theorem mem_diagramFromRows {k : ℕ} (r : Fin k → ℕ) (hr : Antitone r) (i j : ℕ) :
    (i,j) ∈ diagramFromRows r hr ↔ ∃ hi : i < k, j < r ⟨i,hi⟩ := by
  change (i,j) ∈ Finset.univ.biUnion (fun i : Fin k => (Finset.range (r i)).image fun j => (i.val,j)) ↔ _
  simp only [Finset.mem_biUnion,Finset.mem_univ,true_and,Finset.mem_image,Finset.mem_range,Prod.mk.injEq]
  constructor
  · rintro ⟨a,b,hb,ha,rfl⟩
    exact ⟨ha ▸ a.isLt,by simpa [← ha] using hb⟩
  · rintro ⟨hi,hj⟩
    exact ⟨⟨i,hi⟩,j,hj,rfl,rfl⟩

theorem rowLen_diagramFromRows {k : ℕ} (r : Fin k → ℕ) (hr : Antitone r) (i : Fin k) :
    (diagramFromRows r hr).rowLen i.val = r i := by
  have h (j : ℕ) : j < (diagramFromRows r hr).rowLen i.val ↔ j < r i := by
    rw [← YoungDiagram.mem_iff_lt_rowLen,mem_diagramFromRows]
    exact ⟨fun ⟨_,hj⟩ => hj,fun hj => ⟨i.isLt,hj⟩⟩
  apply le_antisymm
  · exact Nat.le_of_not_gt (fun hn => (lt_irrefl _) ((h _).mp hn))
  · exact Nat.le_of_not_gt (fun hn => (lt_irrefl _) ((h _).mpr hn))

theorem rowLen_eq_zero_of_bound (μ : YoungDiagram) {i : ℕ} (hi : μ.colLen 0 ≤ i) :
    μ.rowLen i = 0 := by
  by_contra! h
  have hm : (i,0) ∈ μ := YoungDiagram.mem_iff_lt_rowLen.mpr (Nat.pos_of_ne_zero h)
  exact (YoungDiagram.mem_iff_lt_colLen.mp hm).not_ge hi

theorem diagramFromRows_reconstruct {k : ℕ} (μ : YoungDiagram) (hμ : μ.colLen 0 ≤ k) :
    diagramFromRows (fun i : Fin k => μ.rowLen i.val)
      (fun _ _ hij => μ.rowLen_anti _ _ hij) = μ := by
  apply YoungDiagram.ext
  apply Finset.ext
  rintro ⟨i,j⟩
  let r : Fin k → ℕ := fun i => μ.rowLen i.val
  have hr : Antitone r := by
    intro a b hab
    exact μ.rowLen_anti a.val b.val hab
  change (i,j) ∈ diagramFromRows r hr ↔ (i,j) ∈ μ
  calc
    _ ↔ ∃ hi : i<k,j<r ⟨i,hi⟩ := mem_diagramFromRows r hr i j
    _ ↔ j < μ.rowLen i := by
      refine ⟨fun ⟨_,hj⟩ => hj,fun hj => ⟨?_,hj⟩⟩
      by_contra! h
      rw [rowLen_eq_zero_of_bound μ (hμ.trans h)] at hj
      omega
    _ ↔ (i,j) ∈ μ := YoungDiagram.mem_iff_lt_rowLen.symm

def shapeExponents (μ : YoungDiagram) {m : ℕ} (i : Fin (m+2)) : ℕ :=
  μ.rowLen i.val + staircase i

theorem shapeExponents_strict (μ : YoungDiagram) (m : ℕ) :
    StrictAnti (shapeExponents μ (m:=m)) := by
  intro i j hij
  have hv : i.val<j.val := hij
  have hanti := μ.rowLen_anti i.val j.val hv.le
  have := j.isLt
  unfold shapeExponents staircase
  omega

/-- Raising one exponent of a Ferrers partition stays strictly
decreasing precisely when the incremented row lengths remain antitone. -/
theorem shape_raise_valid_iff (μ : YoungDiagram) {m : ℕ} (j : Fin (m+2)) :
    StrictAnti (raiseAt (shapeExponents μ) j) ↔
      Antitone (raiseAt (fun i : Fin (m+2) => μ.rowLen i.val) j) := by
  let r := raiseAt (fun i : Fin (m+2) => μ.rowLen i.val) j
  have h (i : Fin (m+2)) : raiseAt (shapeExponents μ) j i = r i + staircase i := by
    simp only [r,raiseAt,shapeExponents]
    omega
  constructor
  · intro ha i k hik
    induction hgap : k.val-i.val generalizing k with
    | zero =>
      have e : i = k := Fin.ext (by have hv : i.val≤k.val := hik; omega)
      simp [e]
    | succ n ih =>
      let l : Fin (m+2) := ⟨k.val-1,by have := k.isLt; omega⟩
      have hv : i.val≤k.val := hik
      have hlk : l < k := by change k.val-1<k.val; omega
      have hprev := ha hlk
      rw [h,h] at hprev
      have hk := k.isLt
      have hlv : l.val+1=k.val := by dsimp [l]; omega
      have hr : r k ≤ r l := by unfold staircase at hprev; omega
      exact hr.trans (ih (show i.val≤l.val by omega) (by omega))
  · intro ha i k hik
    have hv : i.val<k.val := hik
    have hi := i.isLt
    have hk := k.isLt
    have hr : r k ≤ r i := ha hik.le
    rw [h,h]
    unfold staircase
    omega

/-- A valid one-exponent raise is realized by a literal Young diagram
with one more cell, in the chosen row and at the original row end. -/
theorem diagram_raise_cells (μ : YoungDiagram) {m : ℕ} (j : Fin (m+2))
    (hμ : μ.colLen 0 ≤ m+2) (h : StrictAnti (raiseAt (shapeExponents μ) j)) :
    (diagramFromRows _ ((shape_raise_valid_iff μ j).mp h)).cells =
      insert (j.val,μ.rowLen j.val) μ.cells := by
  ext p
  rcases p with ⟨i,k⟩
  change (i,k) ∈ diagramFromRows _ _ ↔ (i,k) ∈ insert (j.val,μ.rowLen j.val) μ.cells
  rw [mem_diagramFromRows,Finset.mem_insert]
  change (∃ hi : i<m+2,k<raiseAt (fun x : Fin (m+2) => μ.rowLen x.val) j ⟨i,hi⟩) ↔
    (i,k) = (j.val,μ.rowLen j.val) ∨ (i,k) ∈ μ
  rw [YoungDiagram.mem_iff_lt_rowLen,Prod.mk.injEq]
  by_cases hi : i<m+2
  · have hh : (⟨i,hi⟩ : Fin (m+2)) = j ↔ i=j.val := Fin.ext_iff
    simp only [raiseAt,hh,exists_prop,hi,true_and]
    by_cases hz : i=j.val
    · subst i
      simp only [ite_true,true_and]
      omega
    · simp [hz]
  · have hz : i≠j.val := fun e => hi (e ▸ j.isLt)
    rw [rowLen_eq_zero_of_bound μ (hμ.trans (Nat.le_of_not_gt hi))]
    simp [hi,hz]

theorem shapeExponents_injective_of_height {m : ℕ} {lam μ : YoungDiagram}
    (hlam : lam.colLen 0 ≤ m+2) (hμ : μ.colLen 0 ≤ m+2)
    (h : shapeExponents lam (m:=m) = shapeExponents μ (m:=m)) : lam=μ := by
  apply YoungDiagram.ext
  apply Finset.ext
  rintro ⟨i,j⟩
  change (i,j) ∈ lam ↔ (i,j) ∈ μ
  rw [YoungDiagram.mem_iff_lt_rowLen,YoungDiagram.mem_iff_lt_rowLen]
  by_cases hi : i<m+2
  · have he := congrFun h ⟨i,hi⟩
    change lam.rowLen i + staircase (⟨i,hi⟩ : Fin (m+2)) =
      μ.rowLen i + staircase (⟨i,hi⟩ : Fin (m+2)) at he
    rw [Nat.add_right_cancel he]
  · rw [rowLen_eq_zero_of_bound lam (hlam.trans (Nat.le_of_not_gt hi)),
      rowLen_eq_zero_of_bound μ (hμ.trans (Nat.le_of_not_gt hi))]

theorem diagramFromRows_height {k : ℕ} (r : Fin k → ℕ) (hr : Antitone r) :
    (diagramFromRows r hr).colLen 0 ≤ k := by
  by_contra! h
  have e : (k,0) ∈ diagramFromRows r hr := YoungDiagram.mem_iff_lt_colLen.mpr h
  obtain ⟨hk,_⟩ := (mem_diagramFromRows r hr k 0).mp e
  exact (lt_irrefl _) hk

noncomputable def raiseDiagram (μ : YoungDiagram) {m : ℕ} (j : Fin (m+2))
    (h : StrictAnti (raiseAt (shapeExponents μ) j)) : YoungDiagram :=
  diagramFromRows _ ((shape_raise_valid_iff μ j).mp h)

theorem shapeExponents_raiseDiagram (μ : YoungDiagram) {m : ℕ} (j : Fin (m+2))
    (h : StrictAnti (raiseAt (shapeExponents μ) j)) :
    shapeExponents (raiseDiagram μ j h) =
      raiseAt (shapeExponents μ) j := by
  funext i
  unfold shapeExponents raiseDiagram
  rw [rowLen_diagramFromRows]
  simp only [raiseAt]
  omega

theorem raiseDiagram_height (μ : YoungDiagram) {m : ℕ} (j : Fin (m+2))
    (h : StrictAnti (raiseAt (shapeExponents μ) j)) :
    (raiseDiagram μ j h).colLen 0 ≤ m+2 :=
  diagramFromRows_height _ _

/-- The vertical two-box shape in the literal Mathlib Young diagram model. -/
def verticalTwoDiagram : YoungDiagram where
  cells := {(0,0),(1,0)}
  isLowerSet := by
    intro b a hab hb
    simp only [Finset.mem_coe,Finset.mem_insert,Finset.mem_singleton] at hb ⊢
    rcases hb with rfl|rfl
    · left
      exact Prod.ext (Nat.eq_zero_of_le_zero hab.1) (Nat.eq_zero_of_le_zero hab.2)
    · have hr : a.1≤1 := hab.1
      have hc : a.2=0 := Nat.eq_zero_of_le_zero hab.2
      have hr' : a.1=0 ∨ a.1=1 := by omega
      exact hr'.imp (fun he => Prod.ext he hc) (fun he => Prod.ext he hc)

theorem verticalTwoDiagram_rowLen (i : ℕ) :
    verticalTwoDiagram.rowLen i = if i<2 then 1 else 0 := by
  have h (j : ℕ) : j<verticalTwoDiagram.rowLen i ↔ j<(if i<2 then 1 else 0) := by
    rw [← YoungDiagram.mem_iff_lt_rowLen]
    change (i,j) ∈ ({(0,0),(1,0)}:Finset (ℕ×ℕ)) ↔ _
    simp only [Finset.mem_insert,Finset.mem_singleton,Prod.mk.injEq]
    split <;> omega
  apply le_antisymm
  · exact Nat.le_of_not_gt (fun hn => (lt_irrefl _) ((h _).mp hn))
  · exact Nat.le_of_not_gt (fun hn => (lt_irrefl _) ((h _).mpr hn))

theorem shapeExponents_verticalTwoDiagram (m : ℕ) :
    shapeExponents verticalTwoDiagram = verticalTwoExponents m := by
  funext i
  have hh : i ∈ firstTwo m ↔ i.val<2 := by
    simp only [firstTwo,Finset.mem_insert,Finset.mem_singleton,Fin.ext_iff]
    omega
  simp only [shapeExponents,verticalTwoExponents,raiseOn,verticalTwoDiagram_rowLen,hh]
  ac_rfl

end NovelliThibon
