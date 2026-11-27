import Conjectures.ChenKhareSahiJackSchur

/-!
# Finite cone certificate for the Chen–Khare–Sahi Conjecture 4 counterexample

Five variables, source parameter `σ = 1` (normalized Schur polynomials), target
parameter `τ = 3/2` (Stanley's `α = 2/3`), partitions `(3,2) ⪰ (3,1,1)`. The normalized
Jack difference is not in the full source semiring.

Certificate. Only degree-five products matter after homogeneous extraction. Record each
function by its values at `(1,1,1,0,0)`, `(2,1,0,0,0)` and `(1,1,1,1,0)`. In each degree
`d ≤ 5` the value vectors of all degree-`d` generator products form the finite list
`tab d`; the lists are closed under multiplication, so every homogeneous semiring element
of degree five has its value vector in the cone of `tab 5`. The functional
`-45 f(1,1,1,0,0) + 10 f(2,1,0,0,0) + 18 f(1,1,1,1,0)` is nonnegative on `tab 5` and
equals `-3/4522` on the normalized Jack difference. All finite checks are kernel
reductions (`decide +kernel`); no native computation is used.
-/

namespace ChenKhareSahi.Jack

noncomputable section

set_option maxRecDepth 65536
set_option maxHeartbeats 64000000

/-! ## Value-vector tables -/

def tab0 : List V3 :=
  [(0, 0, 0),
   (1, 1, 1)]

def tab1 : List V3 :=
  [(0, 0, 0),
   (3/5, 3/5, 4/5)]

def tab2 : List V3 :=
  [(0, 0, 0),
   (1/10, 4/15, 1/15),
   (3/10, 1/5, 3/5),
   (9/25, 9/25, 16/25),
   (2/5, 7/15, 2/3)]

def tab3 : List V3 :=
  [(0, 0, 0),
   (3/50, 4/25, 4/75),
   (3/35, 39/140, 1/14),
   (1/10, 0, 2/5),
   (1/10, 3/20, 1/10),
   (9/50, 3/25, 12/25),
   (13/70, 3/7, 6/35),
   (1/5, 3/20, 1/2),
   (27/125, 27/125, 64/125),
   (6/25, 7/25, 8/15),
   (2/7, 3/7, 4/7)]

def tab4 : List V3 :=
  [(0, 0, 0),
   (0, 0, 1/5),
   (1/100, 16/225, 1/225),
   (4/175, 4/75, 1/35),
   (3/100, 4/75, 1/25),
   (9/250, 12/125, 16/375),
   (1/25, 28/225, 2/45),
   (9/175, 117/700, 2/35),
   (4/75, 2/25, 1/15),
   (3/50, 0, 8/25),
   (3/50, 9/100, 2/25),
   (1/15, 0, 2/15),
   (1/15, 0, 1/3),
   (1/14, 13/42, 1/14),
   (8/105, 2/15, 2/21),
   (9/100, 1/25, 9/25),
   (33/350, 127/350, 1/10),
   (27/250, 9/125, 48/125),
   (39/350, 9/35, 24/175),
   (3/25, 2/25, 1/5),
   (3/25, 2/25, 2/5),
   (3/25, 9/100, 2/5),
   (3/25, 7/75, 2/5),
   (81/625, 81/625, 256/625),
   (1/7, 2/15, 8/35),
   (1/7, 2/15, 3/7),
   (18/125, 21/125, 32/75),
   (31/210, 31/70, 1/6),
   (4/25, 49/225, 4/9),
   (6/35, 9/35, 16/35),
   (3/14, 31/70, 3/10),
   (3/14, 31/70, 1/2)]

def tab5 : List V3 :=
  [(0, 0, 0),
   (0, 0, 4/25),
   (0, 0, 1/6),
   (3/500, 16/375, 4/1125),
   (4/525, 0, 2/105),
   (3/350, 13/175, 1/210),
   (1/100, 0, 2/75),
   (1/100, 1/25, 1/150),
   (12/875, 4/125, 4/175),
   (9/500, 4/125, 4/125),
   (13/700, 4/35, 2/175),
   (1/50, 1/25, 1/30),
   (3/140, 183/2800, 9/280),
   (27/1250, 36/625, 64/1875),
   (3/125, 28/375, 8/225),
   (9/350, 39/700, 3/70),
   (1/35, 4/35, 4/105),
   (3/100, 0, 6/25),
   (3/100, 3/100, 3/50),
   (27/875, 351/3500, 8/175),
   (4/125, 6/125, 4/75),
   (6/175, 13/100, 1/21),
   (9/250, 0, 32/125),
   (9/250, 27/500, 8/125),
   (4/105, 12/175, 2/35),
   (1/25, 0, 1/10),
   (1/25, 0, 8/75),
   (1/25, 0, 4/15),
   (1/25, 7/100, 1/15),
   (3/70, 13/70, 2/35),
   (8/175, 12/175, 8/105),
   (8/175, 2/25, 8/105),
   (1/21, 0, 5/42),
   (1/21, 0, 2/7),
   (27/500, 3/125, 36/125),
   (39/700, 3/35, 18/175),
   (99/1750, 381/1750, 2/25),
   (5/84, 15/112, 5/56),
   (5/84, 41/112, 5/72),
   (3/50, 3/100, 3/10),
   (81/1250, 27/625, 192/625),
   (117/1750, 27/175, 96/875),
   (47/700, 15/112, 13/120),
   (9/125, 6/125, 4/25),
   (9/125, 6/125, 8/25),
   (9/125, 27/500, 8/25),
   (9/125, 7/125, 8/25),
   (13/175, 1/5, 4/35),
   (243/3125, 243/3125, 1024/3125),
   (2/25, 7/100, 1/3),
   (17/210, 151/350, 32/315),
   (3/35, 12/175, 37/210),
   (3/35, 12/175, 12/35),
   (3/35, 2/25, 32/175),
   (3/35, 2/25, 12/35),
   (3/35, 3/35, 12/35),
   (54/625, 63/625, 128/375),
   (31/350, 93/350, 2/15),
   (12/125, 49/375, 16/45),
   (18/175, 27/175, 64/175),
   (3/28, 15/112, 5/24),
   (3/28, 15/112, 3/8),
   (4/35, 1/5, 8/21),
   (5/42, 1/2, 10/63),
   (19/150, 1/2, 8/45),
   (9/70, 93/350, 6/25),
   (9/70, 93/350, 2/5),
   (1/6, 1/2, 5/18),
   (1/6, 1/2, 4/9)]

/-- The value vectors of all degree-`d` generator products, `d ≤ 5`. -/
def tab : ℕ → List V3
  | 0 => tab0
  | 1 => tab1
  | 2 => tab2
  | 3 => tab3
  | 4 => tab4
  | 5 => tab5
  | _ => []

theorem tab_mul_closed : ∀ n : Fin 6, ∀ m : Fin 6, (n : ℕ) + m ≤ 5 →
    ∀ u ∈ tab n, ∀ w ∈ tab m, u * w ∈ tab ((n : ℕ) + m) := by
  decide +kernel

theorem tab5_sep : ∀ u ∈ tab 5, 0 ≤ sepQ u := by
  decide +kernel

/-! ## Exact Schur values -/

/-- Partitions of size at most five, with the integer values of `s_λ` at the three
evaluation points and at `(1,1,1,1,1)`. -/
def schurRaw : List ((Fin 5 → ℕ) × ℤ × ℤ × ℤ × ℤ) :=
  [(![0, 0, 0, 0, 0], 1, 1, 1, 1),
   (![1, 0, 0, 0, 0], 3, 3, 4, 5),
   (![2, 0, 0, 0, 0], 6, 7, 10, 15),
   (![1, 1, 0, 0, 0], 3, 2, 6, 10),
   (![3, 0, 0, 0, 0], 10, 15, 20, 35),
   (![2, 1, 0, 0, 0], 8, 6, 20, 40),
   (![1, 1, 1, 0, 0], 1, 0, 4, 10),
   (![4, 0, 0, 0, 0], 15, 31, 35, 70),
   (![3, 1, 0, 0, 0], 15, 14, 45, 105),
   (![2, 2, 0, 0, 0], 6, 4, 20, 50),
   (![2, 1, 1, 0, 0], 3, 0, 15, 45),
   (![1, 1, 1, 1, 0], 0, 0, 1, 5),
   (![5, 0, 0, 0, 0], 21, 63, 56, 126),
   (![4, 1, 0, 0, 0], 24, 30, 84, 224),
   (![3, 2, 0, 0, 0], 15, 12, 60, 175),
   (![3, 1, 1, 0, 0], 6, 0, 36, 126),
   (![2, 2, 1, 0, 0], 3, 0, 20, 75),
   (![2, 1, 1, 1, 0], 0, 0, 4, 24),
   (![1, 1, 1, 1, 1], 0, 0, 0, 1)]

def ones5 : Fin 5 → ℕ := ![1, 1, 1, 1, 1]

/-- The values `h_0, …, h_9` at a point. -/
def hvals (a : Fin 5 → ℕ) : List ℕ := (List.range 10).map (hl (List.ofFn a))

/-- The integer Jacobi–Trudi matrix read from a list of `h` values. -/
def jtL (p : Fin 5 → ℕ) (hs : List ℕ) : Matrix (Fin 5) (Fin 5) ℤ :=
  Matrix.of fun i j =>
    if 0 ≤ (p i : ℤ) - (i : ℕ) + (j : ℕ) then
      ((hs.getD ((p i : ℤ) - (i : ℕ) + (j : ℕ)).toNat 0 : ℕ) : ℤ) else 0

theorem jtInt_eq_jtL (p a : Fin 5 → ℕ) (hp : ∀ i, p i ≤ 5) : jtInt p a = jtL p (hvals a) := by
  ext i j
  simp only [jtInt, jtL, Matrix.of_apply]
  split_ifs with h
  · have hi := hp i
    have hlt : ((p i : ℤ) - (i : ℕ) + (j : ℕ)).toNat < 10 := by omega
    rw [hvals, List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range hlt]
    rfl
  · rfl

theorem hvals_values :
    hvals pt1 = [1, 3, 6, 10, 15, 21, 28, 36, 45, 55] ∧
    hvals pt2 = [1, 3, 7, 15, 31, 63, 127, 255, 511, 1023] ∧
    hvals pt3 = [1, 4, 10, 20, 35, 56, 84, 120, 165, 220] ∧
    hvals ones5 = [1, 5, 15, 35, 70, 126, 210, 330, 495, 715] := by
  decide +kernel

theorem schurRaw_small : ∀ e ∈ schurRaw, ∀ i, e.1 i ≤ 5 := by
  decide +kernel

theorem schurRaw_lists : ∀ e ∈ schurRaw,
    lap 5 (jtL e.1 [1, 3, 6, 10, 15, 21, 28, 36, 45, 55]) = e.2.1 ∧
      lap 5 (jtL e.1 [1, 3, 7, 15, 31, 63, 127, 255, 511, 1023]) = e.2.2.1 ∧
      lap 5 (jtL e.1 [1, 4, 10, 20, 35, 56, 84, 120, 165, 220]) = e.2.2.2.1 ∧
      lap 5 (jtL e.1 [1, 5, 15, 35, 70, 126, 210, 330, 495, 715]) = e.2.2.2.2 := by
  decide +kernel

theorem schurRaw_values : ∀ e ∈ schurRaw,
    lap 5 (jtInt e.1 pt1) = e.2.1 ∧ lap 5 (jtInt e.1 pt2) = e.2.2.1 ∧
      lap 5 (jtInt e.1 pt3) = e.2.2.2.1 ∧ lap 5 (jtInt e.1 ones5) = e.2.2.2.2 := by
  intro e he
  obtain ⟨h1, h2, h3, h4⟩ := hvals_values
  simp only [jtInt_eq_jtL _ _ (schurRaw_small e he), h1, h2, h3, h4]
  exact schurRaw_lists e he

/-- Normalized value vector of a table entry. -/
def nvec (e : (Fin 5 → ℕ) × ℤ × ℤ × ℤ × ℤ) : V3 :=
  ((e.2.1 : ℚ) / e.2.2.2.2, (e.2.2.1 : ℚ) / e.2.2.2.2, (e.2.2.2.1 : ℚ) / e.2.2.2.2)

theorem val_nschur (e : (Fin 5 → ℕ) × ℤ × ℤ × ℤ × ℤ) (he : e ∈ schurRaw) :
    val (nschur e.1) = toR (nvec e) := by
  obtain ⟨h1, h2, h3, h4⟩ := schurRaw_values e he
  simp only [val, nschur, one_eq_natPt, schur_natPt, toR, nvec]
  rw [show (![1, 1, 1, 1, 1] : Fin 5 → ℕ) = ones5 from rfl, h1, h2, h3, h4]
  push_cast
  rfl

theorem schurRaw_gen : ∀ e ∈ schurRaw, nvec e ∈ tab (size e.1) := by
  decide +kernel

/-- Componentwise difference, written with addition and negation for kernel reduction. -/
def vsub (u w : V3) : V3 := (u.1 + -w.1, u.2.1 + -w.2.1, u.2.2 + -w.2.2)

theorem toR_vsub (u w : V3) : toR (vsub u w) = toR u - toR w := by
  simp [toR, vsub, sub_eq_add_neg]

theorem schurRaw_diff : ∀ e ∈ schurRaw, ∀ e' ∈ schurRaw, DominatesFin e.1 e'.1 →
    vsub (nvec e) (nvec e') ∈ tab (size e.1) := by
  decide +kernel

/-- Every partition with at most five parts and size at most five is in the table. -/
theorem partition_mem (p : Fin 5 → ℕ) (hp : Antitone p) (hs : size p ≤ 5) :
    ∃ e ∈ schurRaw, e.1 = p := by
  have h10 : p 1 ≤ p 0 := hp (by decide)
  have h21 : p 2 ≤ p 1 := hp (by decide)
  have h32 : p 3 ≤ p 2 := hp (by decide)
  have h43 : p 4 ≤ p 3 := hp (by decide)
  have hsum : p 0 + p 1 + p 2 + p 3 + p 4 ≤ 5 := by
    simpa [size, Fin.sum_univ_five] using hs
  have hp' : p = ![p 0, p 1, p 2, p 3, p 4] := by
    funext i; fin_cases i <;> rfl
  rw [hp']
  generalize p 0 = a at *
  generalize p 1 = b at *
  generalize p 2 = c at *
  generalize p 3 = d at *
  generalize p 4 = f at *
  have ha : a ≤ 5 := by omega
  interval_cases a <;> interval_cases b <;> interval_cases c <;> interval_cases d <;>
    interval_cases f <;> first | omega | decide +kernel

/-! ## Homogeneous semiring elements of degree at most five -/

theorem HomSchur.cone {n : ℕ} {f : Pt → ℝ} (hf : HomSchur n f) (hn : n ≤ 5) :
    Cone (tab n) (val f) := by
  induction hf with
  | zero n => exact Cone.zero
  | schur p hp =>
    obtain ⟨e, he, rfl⟩ := partition_mem p hp hn
    rw [val_nschur e he]
    exact Cone.gen _ (schurRaw_gen e he)
  | difference a b ha hb hab =>
    obtain ⟨e, he, rfl⟩ := partition_mem a ha hn
    obtain ⟨e', he', rfl⟩ := partition_mem b hb (hab.1 ▸ hn)
    have hv : val (fun x => nschur e.1 x - nschur e'.1 x) = toR (vsub (nvec e) (nvec e')) := by
      rw [toR_vsub, ← val_nschur e he, ← val_nschur e' he']
      rfl
    rw [hv]
    exact Cone.gen _ (schurRaw_diff e he e' he' ((dominates_iff _ _).mp hab))
  | add _ _ ihf ihg => exact Cone.add (ihf hn) (ihg hn)
  | @mul n m f g _ _ ihf ihg =>
    have hc := Cone.mul (tab_mul_closed ⟨n, by omega⟩ ⟨m, by omega⟩ hn)
      (ihf (by omega)) (ihg (by omega))
    exact hc
  | scale c hc _ ih => exact Cone.scale c hc (ih hn)

end

end ChenKhareSahi.Jack
