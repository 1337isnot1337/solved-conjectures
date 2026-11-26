import Conjectures.CircularInsertionBasePairs
import Mathlib.Tactic.SplitIfs
import Mathlib.Tactic.NormNum

/-! Rotation indices and circular distances in the base colouring. -/

namespace CircularIndex.Insertion

def vertexCount (g : Nat) := 6*g+1

def rotate (n v shift : Nat) := if v+shift<n then v+shift else v+shift-n

theorem rotate_lt {n v s : Nat} (hv : v<n) (hs : s<n) : rotate n v s<n := by
  unfold rotate
  split <;> omega

theorem rotate_left_inj {n a b s : Nat} (ha : a<n) (hb : b<n) (_hs : s<n)
    (h : rotate n a s = rotate n b s) : a=b := by
  unfold rotate at h
  split at h <;> split at h <;> omega

theorem rotate_right_inj {n a s t : Nat} (_ha : a<n) (hs : s<n) (ht : t<n)
    (h : rotate n a s = rotate n a t) : s=t := by
  unfold rotate at h
  split at h <;> split at h <;> omega

def distance (n x y : Nat) := cyclicLength n (min x y) (max x y)

theorem distance_swap (n x y : Nat) : distance n x y = distance n y x := by
  simp only [distance,Nat.min_comm,Nat.max_comm]

theorem rotated_distance {n a b s : Nat} (hab : a<b) (hb : b<n) (hs : s<n) :
    distance n (rotate n a s) (rotate n b s) = cyclicLength n a b := by
  unfold distance rotate cyclicLength
  split <;> split <;> omega

theorem rotate_pair_inj {g a b s t : Nat} (hab : a<b) (hb : b<vertexCount g)
    (hs : s<vertexCount g) (ht : t<vertexCount g)
    (h : (rotate (vertexCount g) a s = rotate (vertexCount g) a t ∧
          rotate (vertexCount g) b s = rotate (vertexCount g) b t) ∨
         (rotate (vertexCount g) a s = rotate (vertexCount g) b t ∧
          rotate (vertexCount g) b s = rotate (vertexCount g) a t)) : s=t := by
  rcases h with h | ⟨h₁,h₂⟩
  · exact rotate_right_inj (by omega) hs ht h.1
  · unfold vertexCount rotate at *
    split at h₁ <;> split at h₁ <;> split at h₂ <;> split at h₂ <;> omega

/-- Colours repeat in blocks of six. The classes are translates of the two
base matchings by the six shifts in Section 4. -/
def baseShift (g c : Nat) : Nat :=
  c/6 + (if c%6=0 ∨ c%6=3 then 0 else if c%6=1 then 2*g
         else if c%6=4 then 2*g+1 else 4*g+1)

theorem baseShift_lt {g c : Nat} (hc : c < 2*vertexCount g) :
    baseShift g c < vertexCount g := by
  unfold baseShift vertexCount at *
  split_ifs <;> omega

theorem baseShift_inj {g c d : Nat} (hc : c < 2*vertexCount g)
    (hd : d < 2*vertexCount g) (he : c%2=d%2) (hs : baseShift g c = baseShift g d) : c=d := by
  unfold baseShift vertexCount at *
  split_ifs at hs <;> omega

def NearBase (g c d : Nat) : Prop :=
  d=c+1 ∨ d=c+2 ∨ d+2*vertexCount g=c+1 ∨ d+2*vertexCount g=c+2

theorem rotate_eq_offset {n a b s t : Nat} (h : rotate n a s = rotate n b t) :
    a+s=b+t ∨ a+s+n=b+t ∨ a+s=b+t+n := by
  unfold rotate at h
  split at h <;> split at h <;> omega

set_option maxHeartbeats 3000000 in
theorem near_base_disjoint {g c d x y : Nat} (hg : 7 ≤ g) (hc : c<2*vertexCount g)
    (hn : NearBase g c d)
    (hx : Support g (c%2) x) (hy : Support g (d%2) y) :
    rotate (vertexCount g) x (baseShift g c) ≠ rotate (vertexCount g) y (baseShift g d) := by
  intro heq
  have h := rotate_eq_offset heq
  clear heq
  unfold NearBase vertexCount at hn
  unfold vertexCount at hc h
  unfold Support at hx hy
  rcases hn with h₁ | h₂ | h₁ | h₂
  · have hv : c%6=0 ∨ c%6=1 ∨ c%6=2 ∨ c%6=3 ∨ c%6=4 ∨ c%6=5 := by omega
    rcases hv with hv|hv|hv|hv|hv|hv
    · have hw : d%6=1 := by omega
      have hk : d/6=c/6 := by omega
      have hv₂ : c%2=0 := by omega
      have hw₂ : d%2=1 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
    · have hw : d%6=2 := by omega
      have hk : d/6=c/6 := by omega
      have hv₂ : c%2=1 := by omega
      have hw₂ : d%2=0 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
    · have hw : d%6=3 := by omega
      have hk : d/6=c/6 := by omega
      have hv₂ : c%2=0 := by omega
      have hw₂ : d%2=1 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
    · have hw : d%6=4 := by omega
      have hk : d/6=c/6 := by omega
      have hv₂ : c%2=1 := by omega
      have hw₂ : d%2=0 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
    · have hw : d%6=5 := by omega
      have hk : d/6=c/6 := by omega
      have hv₂ : c%2=0 := by omega
      have hw₂ : d%2=1 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
    · have hw : d%6=0 := by omega
      have hk : d/6=c/6+1 := by omega
      have hv₂ : c%2=1 := by omega
      have hw₂ : d%2=0 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
  · have hv : c%6=0 ∨ c%6=1 ∨ c%6=2 ∨ c%6=3 ∨ c%6=4 ∨ c%6=5 := by omega
    rcases hv with hv|hv|hv|hv|hv|hv
    · have hw : d%6=2 := by omega
      have hk : d/6=c/6 := by omega
      have hv₂ : c%2=0 := by omega
      have hw₂ : d%2=0 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
    · have hw : d%6=3 := by omega
      have hk : d/6=c/6 := by omega
      have hv₂ : c%2=1 := by omega
      have hw₂ : d%2=1 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
    · have hw : d%6=4 := by omega
      have hk : d/6=c/6 := by omega
      have hv₂ : c%2=0 := by omega
      have hw₂ : d%2=0 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
    · have hw : d%6=5 := by omega
      have hk : d/6=c/6 := by omega
      have hv₂ : c%2=1 := by omega
      have hw₂ : d%2=1 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
    · have hw : d%6=0 := by omega
      have hk : d/6=c/6+1 := by omega
      have hv₂ : c%2=0 := by omega
      have hw₂ : d%2=0 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
    · have hw : d%6=1 := by omega
      have hk : d/6=c/6+1 := by omega
      have hv₂ : c%2=1 := by omega
      have hw₂ : d%2=1 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      norm_num [baseShift,hv,hw,hk] at h
      omega
  · have hv : c%6=1 := by omega
    have hw : d%6=0 := by omega
    have hk : d/6=0 := by omega
    have hv₂ : c%2=1 := by omega
    have hw₂ : d%2=0 := by omega
    rw [hv₂] at hx
    rw [hw₂] at hy
    have hk₀ : c/6=2*g := by omega
    norm_num [baseShift,hv,hw,hk,hk₀] at h
    omega
  · rcases (show d=0 ∨ d=1 by omega) with hd₀|hd₀
    · have hv : c%6=0 := by omega
      have hw : d%6=0 := by omega
      have hk : d/6=0 := by omega
      have hv₂ : c%2=0 := by omega
      have hw₂ : d%2=0 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      have hk₀ : c/6=2*g := by omega
      norm_num [baseShift,hv,hw,hk,hk₀] at h
      omega
    · have hv : c%6=1 := by omega
      have hw : d%6=1 := by omega
      have hk : d/6=0 := by omega
      have hv₂ : c%2=1 := by omega
      have hw₂ : d%2=1 := by omega
      rw [hv₂] at hx
      rw [hw₂] at hy
      have hk₀ : c/6=2*g := by omega
      norm_num [baseShift,hv,hw,hk,hk₀] at h
      omega

end CircularIndex.Insertion
