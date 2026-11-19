import Conjectures.HadamardQuotient133Packet

namespace HadamardQuotient133

theorem all_range_of_blocks (f : ℕ → Bool) (n : ℕ)
    (h : ∀ block, block < (n + 31) / 32 →
      (List.range 32).all (fun offset =>
        if block * 32 + offset < n then f (block * 32 + offset) else true) = true) :
    (List.range n).all f = true := by
  apply List.all_eq_true.mpr
  intro i hi
  have hi' : i < n := List.mem_range.mp hi
  have hb : i / 32 < (n + 31) / 32 := by omega
  have ho : i % 32 ∈ List.range 32 := List.mem_range.mpr (by omega)
  have hc := List.all_eq_true.mp (h (i / 32) hb) (i % 32) ho
  have he : i / 32 * 32 + i % 32 = i := by omega
  simpa only [he, ite_eq_left hi'] using hc

end HadamardQuotient133

