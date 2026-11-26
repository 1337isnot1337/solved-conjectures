import Conjectures.MeylenderThalmaierComparison

/-! The rational pentagonal cover for the truncation legs 1/10 and 9/10.
The five closed half-planes follow the cyclic order of the edges in the
original certificate, in coordinates with the normal triangles reflected. -/

noncomputable section

namespace MeylenderThalmaier

def halfPlane (u v w : ℝ) : Set Plane := {p | u*p 0+v*p 1≤w}

private theorem convex_halfPlane (u v w : ℝ) : Convex ℝ (halfPlane u v w) := by
  intro x hx y hy s t hs ht hst
  change u*x 0+v*x 1≤w at hx
  change u*y 0+v*y 1≤w at hy
  change u*(s • x+t • y) 0+v*(s • x+t • y) 1≤w
  calc _ = s*(u*x 0+v*x 1)+t*(u*y 0+v*y 1) := by simp only [Pi.add_apply,Pi.smul_apply,smul_eq_mul]; ring
       _ ≤ s*w+t*w := add_le_add (mul_le_mul_of_nonneg_left hx hs) (mul_le_mul_of_nonneg_left hy ht)
       _ = w := by rw [←add_mul,hst,one_mul]

def pentagon : Set Plane := halfPlane (-114) (-125) 71 ∩
  (halfPlane 2031 (-2275) 836 ∩ (halfPlane 309855 (-345800) 127453 ∩
  (halfPlane 22659 20480 8405 ∩ halfPlane (-111) 125 79)))

theorem pentagon_mem (p : Plane) : p∈pentagon ↔
    (-114)*p 0+(-125)*p 1≤71 ∧ 2031*p 0+(-2275)*p 1≤836 ∧
    309855*p 0+(-345800)*p 1≤127453 ∧ 22659*p 0+20480*p 1≤8405 ∧
    (-111)*p 0+125*p 1≤79 := Iff.rfl

theorem convex_pentagon : Convex ℝ pentagon :=
  (convex_halfPlane ..).inter ((convex_halfPlane ..).inter ((convex_halfPlane ..).inter
    ((convex_halfPlane ..).inter (convex_halfPlane ..))))

def pentagonVertices : Fin 5 → Plane :=
  ![![-2/3,1/25],![-1/9,-7/15],![1/3,-159/2275],![177/455,-1/50],![-1/9,8/15]]

theorem pentagon_vertices (i : Fin 5) : pentagonVertices i∈pentagon := by
  fin_cases i <;> norm_num [pentagonVertices,pentagon,halfPlane]

theorem pentagon_covers : fourShapes (1/10) (9/10) pentagon := by
  refine ⟨fits_convexHull convex_pentagon ?_,fits_convexHull convex_pentagon ?_,
    fits_convexHull convex_pentagon ?_,fits_convexHull convex_pentagon ?_⟩
  · refine ⟨![-2/3,1/25],?_⟩
    intro p hp
    rcases (show p=0 ∨ p=![1,0] from hp) with rfl|rfl <;> norm_num [pentagon,halfPlane]
  · refine ⟨![-1/9,-7/15],?_⟩
    intro p hp
    rcases (show p=0 ∨ p=![0,1] from hp) with rfl|rfl <;> norm_num [pentagon,halfPlane]
  · refine ⟨![-3/5,-1/50],?_⟩
    intro p hp
    simp only [triangle,Set.mem_insert_iff,Set.mem_singleton_iff] at hp
    rcases hp with rfl|rfl|rfl <;> norm_num [pentagon,halfPlane,legX,legY,cut]
  · refine ⟨![1/3,1/25],?_⟩
    intro p hp
    simp only [triangle,Set.mem_insert_iff,Set.mem_singleton_iff] at hp
    rcases hp with rfl|rfl|rfl <;> norm_num [pentagon,halfPlane,legX,legY,cut]

theorem pentagon_span {p : Plane} (h : p∈pentagon) : -7/15≤p 1 ∧ p 1≤8/15 := by
  obtain ⟨_,_,_,_,_⟩ := (pentagon_mem p).mp h
  constructor <;> linarith

theorem pentagon_scale : coverScale (1/10) (9/10) pentagon=1 := by
  have one (s : Set Plane) : scaled 1 s=s := by simp [scaled]
  have atOne : coversAt (1/10) (9/10) pentagon 1 := by
    simpa only [coversAt,fourShapes,one,zero_le_one,true_and] using pentagon_covers
  have upper (r : ℝ) (hr : coversAt (1/10) (9/10) pentagon r) : r≤1 := by
    obtain ⟨z,hz⟩ := hr.2.2.1
    have base : (0 : Plane)∈convexHull ℝ vertical := subset_convexHull ℝ _ (Or.inl rfl)
    have tip : (![0,1] : Plane)∈convexHull ℝ vertical := subset_convexHull ℝ _ (Or.inr rfl)
    have lo := (pentagon_span (hz _ ⟨0,base,rfl⟩)).1
    have hi := (pentagon_span (hz _ ⟨![0,1],tip,rfl⟩)).2
    simp at lo hi
    linarith
  apply le_antisymm (csSup_le ⟨1,atOne⟩ upper)
  exact le_csSup ⟨1,upper⟩ atOne

end MeylenderThalmaier
