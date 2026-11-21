import Conjectures.LonelinessDistanceColoring
import Mathlib.Algebra.Ring.Periodic
import Mathlib.Data.Int.ModEq
import Mathlib.Tactic.Ring

/-!
# Integer distance colorings and periodic certificates

These lemmas use the actual integer distance graph already defined in
`Loneliness.DistanceColoring`. They formalize the periodic-coloring and
distance-transport parts of aadrianvv's Oravcova--Sotak proof.
-/

namespace OravcovaSotak

abbrev graph := Loneliness.DistanceColoring.graph

instance (D : List ℕ) : DecidableRel (graph D).Adj := fun m n =>
  inferInstanceAs (Decidable (m ≠ n ∧ (m-n).natAbs ∈ D))

/-- A proper coloring with a specified integer period. -/
def HasPeriod (D : List ℕ) (k p : ℕ) : Prop :=
  ∃ C : (graph D).Coloring (Fin k), Function.Periodic C (p : ℤ)

theorem graph_eq_of_mem_iff (D E : List ℕ) (h : ∀ d, d ∈ D ↔ d ∈ E) :
    graph D = graph E := by
  ext m n
  simp only [Loneliness.DistanceColoring.graph_adj, h]

theorem graph_eq_of_perm {D E : List ℕ} (h : D.Perm E) : graph D = graph E :=
  graph_eq_of_mem_iff D E (fun _ => h.mem_iff)

theorem hasPeriod_perm {D E : List ℕ} {k p : ℕ} (h : D.Perm E)
    (hp : HasPeriod D k p) : HasPeriod E k p := by
  unfold HasPeriod at *
  rwa [← graph_eq_of_perm h]

theorem colorable_perm {D E : List ℕ} {k : ℕ} (h : D.Perm E)
    (hc : (graph D).Colorable k) : (graph E).Colorable k := by
  rwa [← graph_eq_of_perm h]

theorem coloring_shift {D : List ℕ} {k : ℕ} (C : (graph D).Coloring (Fin k))
    (n d : ℤ) (hd : d.natAbs ∈ D) (hd0 : d ≠ 0) : C n ≠ C (n+d) := by
  apply C.valid
  refine ⟨by omega, ?_⟩
  simpa only [show n - (n+d) = -d by omega, Int.natAbs_neg] using hd

/-- Checking every positive forward displacement suffices for the
undirected distance graph. -/
def coloringOfForward (D : List ℕ) (k : ℕ) (c : ℤ → Fin k)
    (hc : ∀ n : ℤ, ∀ d ∈ D, 0 < d → c n ≠ c (n+(d : ℤ))) :
    (graph D).Coloring (Fin k) :=
  SimpleGraph.Coloring.mk c (by
    intro m n hadj
    let d := (m-n).natAbs
    have hd : d ∈ D := hadj.2
    have hd0 : 0 < d := Int.natAbs_pos.mpr (sub_ne_zero.mpr hadj.1)
    have habs : (d : ℤ) = |m-n| := Int.natCast_natAbs (m-n)
    by_cases hmn : m ≤ n
    · have he : n = m+(d : ℤ) := by
        rw [abs_of_nonpos (by omega)] at habs
        omega
      simpa only [← he] using hc m d hd hd0
    · have he : m = n+(d : ℤ) := by
        rw [abs_of_nonneg (by omega)] at habs
        omega
      have hh : c n ≠ c m := by simpa only [← he] using hc n d hd hd0
      exact hh.symm)

theorem hasPeriod_colorable {D : List ℕ} {k p : ℕ} (h : HasPeriod D k p) :
    (graph D).Colorable k := by
  obtain ⟨C, _⟩ := h
  exact ⟨C⟩

theorem periodic_eq_of_dvd {α : Type*} (f : ℤ → α) (p : ℤ)
    (hp : Function.Periodic f p) (a b : ℤ) (hab : p ∣ b-a) : f b = f a := by
  obtain ⟨j, hj⟩ := hab
  have he : b = a+j*p := by nlinarith only [hj]
  rw [he]
  exact (hp.int_mul j) a

/-- Replacing one positive distance by a congruent distance, up to sign,
preserves a proper periodic coloring. -/
theorem transport_extra_distance (W : List ℕ) (k p r x : ℕ)
    (hr : 0 < r) (h : HasPeriod (r :: W) k p)
    (hcong : (p : ℤ) ∣ (x : ℤ)-r ∨ (p : ℤ) ∣ (x : ℤ)+r) :
    HasPeriod (x :: W) k p := by
  obtain ⟨C, hperiod⟩ := h
  let C' : (graph (x :: W)).Coloring (Fin k) := coloringOfForward (x :: W) k C (by
    intro n d hd hdpos
    rcases List.mem_cons.mp hd with hdx | hdW
    · subst d
      rcases hcong with hpos | hneg
      · have he := periodic_eq_of_dvd C p hperiod (n+(r : ℤ)) (n+(x : ℤ))
          (by simpa using hpos)
        rw [he]
        exact coloring_shift C n r (by simp) (by omega)
      · have he := periodic_eq_of_dvd C p hperiod (n-(r : ℤ)) (n+(x : ℤ))
          (by convert hneg using 1; ring)
        rw [he]
        simpa only [sub_eq_add_neg] using coloring_shift C n (-(r : ℤ))
          (by simp) (by omega)
    · exact coloring_shift C n d (by simpa using List.mem_cons_of_mem r hdW) (by omega))
  exact ⟨C', hperiod⟩

/-- The nonnegative representative of an integer modulo a positive period. -/
def residue (p : ℕ) (x : ℤ) : ℕ := (x % (p : ℤ)).toNat

theorem residue_cast (p : ℕ) (hp : 0 < p) (x : ℤ) :
    (residue p x : ℤ) = x % (p : ℤ) := by
  apply Int.toNat_of_nonneg
  exact Int.emod_nonneg _ (by omega)

theorem residue_lt (p : ℕ) (hp : 0 < p) (x : ℤ) : residue p x < p := by
  have h := Int.emod_lt_of_pos x (by exact_mod_cast hp : (0 : ℤ) < p)
  rw [← residue_cast p hp x] at h
  exact_mod_cast h

theorem residue_add_nat (p : ℕ) (hp : 0 < p) (x : ℤ) (d : ℕ) :
    residue p (x+(d : ℤ)) = (residue p x+d)%p := by
  apply Int.natCast_inj.mp
  rw [residue_cast p hp, Int.natCast_emod, Nat.cast_add, residue_cast p hp]
  simp only [Int.add_emod, Int.emod_emod]

theorem residue_periodic (p : ℕ) : Function.Periodic (residue p) (p : ℤ) := by
  intro x
  simp [residue]

/-- A finite periodic word certificate. Every quantifier ranges over
the finite word or the supplied finite distance list. -/
def WordCertificate (D : List ℕ) (k p : ℕ) (f : ℕ → ℕ) : Prop :=
  (∀ i : Fin p, f i.val < k) ∧
  ∀ d ∈ D, ∀ i : Fin p, f i.val ≠ f ((i.val+d)%p)

instance (D : List ℕ) (k p : ℕ) (f : ℕ → ℕ) : Decidable (WordCertificate D k p f) :=
  inferInstanceAs (Decidable ((∀ i : Fin p, f i.val < k) ∧
    ∀ d ∈ D, ∀ i : Fin p, f i.val ≠ f ((i.val+d)%p)))

theorem wordCertificate_hasPeriod (D : List ℕ) (k p : ℕ) (f : ℕ → ℕ)
    (hp : 0 < p) (hf : WordCertificate D k p f) : HasPeriod D k p := by
  let c : ℤ → Fin k := fun x => ⟨f (residue p x), hf.1 ⟨_, residue_lt p hp x⟩⟩
  let C := coloringOfForward D k c (by
    intro n d hd _hdpos he
    have he' := congrArg Fin.val he
    change f (residue p n) = f (residue p (n+(d : ℤ))) at he'
    rw [residue_add_nat p hp] at he'
    exact hf.2 d hd ⟨_, residue_lt p hp n⟩ he')
  refine ⟨C, ?_⟩
  intro x
  apply Fin.ext
  change f (residue p (x+(p : ℤ))) = f (residue p x)
  rw [residue_periodic p x]

end OravcovaSotak
