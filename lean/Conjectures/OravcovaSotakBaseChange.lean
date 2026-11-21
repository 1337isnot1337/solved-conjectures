import Conjectures.OravcovaSotakBasic
import Mathlib.Data.Int.GCD

/-! An explicit Bezout formula for the two-parameter coloring transfer.
No choice of representations of an integer is left as a hypothesis. -/

namespace OravcovaSotak

def linearValue (s t : ℤ) (f : ℤ × ℤ) : ℤ := f.1*s+f.2*t

def formDistances (F : List (ℤ × ℤ)) (s t : ℤ) : List ℕ :=
  F.map (fun f => (linearValue s t f).natAbs)

def coloringOfForms (F : List (ℤ × ℤ)) (s t : ℤ) (k : ℕ) (c : ℤ → Fin k)
    (hc : ∀ f ∈ F, ∀ n : ℤ, c n ≠ c (n+linearValue s t f)) :
    (graph (formDistances F s t)).Coloring (Fin k) :=
  SimpleGraph.Coloring.mk c (by
    intro m n hadj
    obtain ⟨f,hf,he⟩ := List.mem_map.mp hadj.2
    change (linearValue s t f).natAbs = (m-n).natAbs at he
    rcases Int.natAbs_eq_natAbs_iff.mp he.symm with hpos | hneg
    · have hm : m = n+linearValue s t f := by omega
      have hh : c n ≠ c m := by simpa only [← hm] using hc f hf n
      exact hh.symm
    · have hn : n = m+linearValue s t f := by omega
      simpa only [← hn] using hc f hf m)

theorem bezout_form_difference (s t s0 t0 a b : ℤ)
    (hbez : a*s+b*t = 1) (f : ℤ × ℤ) :
    s*t0-t*s0 ∣ (a*s0+b*t0)*linearValue s t f-linearValue s0 t0 f := by
  refine ⟨b*f.1-a*f.2, ?_⟩
  calc
    (a*s0+b*t0)*linearValue s t f-linearValue s0 t0 f =
        (a*s0+b*t0)*linearValue s t f-linearValue s0 t0 f*(a*s+b*t) := by rw [hbez, mul_one]
    _ = (s*t0-t*s0)*(b*f.1-a*f.2) := by unfold linearValue; ring

/-- A periodic coloring of the base vector transfers to any primitive
integer parameter vector at the determinant period. -/
theorem base_change (F : List (ℤ × ℤ)) (s t s0 t0 : ℤ) (k : ℕ)
    (hcop : Int.gcd s t = 1)
    (hbase : ∀ f ∈ F, linearValue s0 t0 f ≠ 0)
    (hcolor : HasPeriod (formDistances F s0 t0) k (s*t0-t*s0).natAbs) :
    HasPeriod (formDistances F s t) k (s*t0-t*s0).natAbs := by
  obtain ⟨C,hperiod⟩ := hcolor
  let a := Int.gcdA s t
  let b := Int.gcdB s t
  let h := a*s0+b*t0
  have hbez : a*s+b*t = 1 := by
    have hb := Int.gcd_eq_gcd_ab s t
    rw [hcop] at hb
    dsimp [a,b]
    simpa only [Nat.cast_one, mul_comm] using hb.symm
  let c : ℤ → Fin k := fun n => C (n*h)
  let C' := coloringOfForms F s t k c (by
    intro f hf n
    have hd := bezout_form_difference s t s0 t0 a b hbez f
    have hN : ((s*t0-t*s0).natAbs : ℤ) ∣
        h*linearValue s t f-linearValue s0 t0 f :=
      Int.natAbs_dvd_self.trans hd
    have he : C ((n+linearValue s t f)*h) = C (n*h+linearValue s0 t0 f) := by
      apply periodic_eq_of_dvd C (s*t0-t*s0).natAbs hperiod
      convert hN using 1; ring
    change C (n*h) ≠ C ((n+linearValue s t f)*h)
    rw [he]
    apply coloring_shift C (n*h) (linearValue s0 t0 f)
    · exact List.mem_map.mpr ⟨f,hf,rfl⟩
    · exact hbase f hf)
  refine ⟨C', ?_⟩
  intro n
  change C ((n+((s*t0-t*s0).natAbs : ℤ))*h) = C (n*h)
  rw [show (n+((s*t0-t*s0).natAbs : ℤ))*h =
      n*h+h*((s*t0-t*s0).natAbs : ℤ) by ring]
  exact (hperiod.int_mul h) (n*h)

end OravcovaSotak
