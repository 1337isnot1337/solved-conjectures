module
public import Mathlib

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

private def reciprocalGap (k : ℕ) : ℚ :=
  1/(k:ℚ)-1/((k+1:ℕ):ℚ)

private theorem reciprocalGap_nonneg (k : ℕ) (hk : 0<k) : 0≤reciprocalGap k := by
  unfold reciprocalGap
  have hk' : (0:ℚ)<k := by exact_mod_cast hk
  push_cast
  exact sub_nonneg.mpr (one_div_le_one_div_of_le hk' (by linarith))

private theorem reciprocalGap_telescope (y n : ℕ) :
    (∑ i ∈ Finset.range n,reciprocalGap (y+i))=1/(y:ℚ)-1/((y+n:ℕ):ℚ) := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ,ih]
    change 1/(y:ℚ)-1/((y+n:ℕ):ℚ)+
      (1/((y+n:ℕ):ℚ)-1/(((y+n)+1:ℕ):ℚ))=_
    abel

/-- Uniform tail bound for every finite set above a positive cutoff;
no primality estimate is needed for the reciprocal squares. -/
theorem sum_reciprocal_sq_le_cutoff (P : Finset ℕ) (y : ℕ)
    (hy : 0<y) (hP : ∀ p∈P,y<p) :
    (∑ p ∈ P,(1/(p:ℚ))^2)≤1/(y:ℚ) := by
  let N := P.sup id
  have hle (p : ℕ) (hp : p∈P) : p≤N := Finset.le_sup (f:=id) hp
  have hinj : Set.InjOn (fun p : ℕ => p-(y+1)) (↑P : Set ℕ) := by
    intro a ha b hb he
    change a-(y+1)=b-(y+1) at he
    have ha' := hP a ha
    have hb' := hP b hb
    omega
  have hm : (P.image fun p => p-(y+1))⊆Finset.range N := by
    intro i hi
    obtain ⟨p,hp,rfl⟩ := Finset.mem_image.mp hi
    have h1 := hP p hp
    have h2 := hle p hp
    exact Finset.mem_range.mpr (by omega)
  have hsum : (∑ p ∈ P,reciprocalGap (p-1)) =
      ∑ i ∈ (P.image fun p => p-(y+1)),reciprocalGap (y+i) := by
    rw [Finset.sum_image hinj]
    apply Finset.sum_congr rfl
    intro p hp
    have hh := hP p hp
    congr 1
    omega
  calc
    _ ≤ ∑ p ∈ P,reciprocalGap (p-1) := by
      apply Finset.sum_le_sum
      intro p hp
      have hn := hP p hp
      have hp' : (0:ℚ)<p := by exact_mod_cast (show 0<p by omega)
      have hp₁ : (0:ℚ)<(p:ℚ)-1 := by
        have hz : (1:ℚ)<(p:ℚ) := by exact_mod_cast (show 1<p by omega)
        linarith
      have hn' : p-1+1=p := by omega
      unfold reciprocalGap
      rw [hn',Nat.cast_sub (by omega : 1≤p),Nat.cast_one]
      -- Multiply the exact identity (1/(p-1)-1/p)=1/((p-1)p).
      have he : 1/((p:ℚ)-1)-1/(p:ℚ)=1/(((p:ℚ)-1)*(p:ℚ)) := by
        field_simp; ring
      rw [he]
      rw [div_pow,one_pow]
      exact one_div_le_one_div_of_le (mul_pos hp₁ hp') (by nlinarith)
    _ ≤ ∑ i ∈ Finset.range N,reciprocalGap (y+i) := by
      rw [hsum]
      exact Finset.sum_le_sum_of_subset_of_nonneg hm
        (fun i _ _ => reciprocalGap_nonneg _ (by omega))
    _ ≤ _ := by
      rw [reciprocalGap_telescope]
      exact sub_le_self _ (by positivity)

end PomeranceSarkozy
