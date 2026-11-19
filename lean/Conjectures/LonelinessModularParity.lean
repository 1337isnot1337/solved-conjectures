import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCriticalBase
import Conjectures.LonelinessCoalescenceValue

/-! The one-odd-coordinate pruning rule, derived from half-turn distance
complementarity and an explicit lower-dimensional runner bound. -/

namespace Loneliness.Modular.Search

theorem half_le_abs_sub_int (z : ℤ) : (1/2 : ℝ)≤|(1/2 : ℝ)-z| := by
  by_cases hz : z≤0
  · have hzR : (z : ℝ)≤0 := by exact_mod_cast hz
    rw [abs_of_nonneg (by linarith : (0 : ℝ)≤1/2-z)]
    linarith
  · have hz1 : 1≤z := by omega
    have hzR : (1 : ℝ)≤z := by exact_mod_cast hz1
    rw [abs_of_nonpos (by linarith : (1/2 : ℝ)-z≤0)]
    linarith

theorem distance_add_half_sum_lower (x : ℝ) :
    (1/2 : ℝ)≤distance x+distance (x+1/2) := by
  have h := half_le_abs_sub_int (round (x+1/2)-round x)
  have he : (1/2 : ℝ)-((round (x+1/2)-round x : ℤ) : ℝ)=
      (x+1/2-(round (x+1/2) : ℝ))-(x-(round x : ℝ)) := by
    push_cast
    ring
  rw [he] at h
  calc
    (1/2 : ℝ)≤|(x+1/2-(round (x+1/2) : ℝ))-(x-(round x : ℝ))| := h
    _ ≤ |x+1/2-(round (x+1/2) : ℝ)|+|x-(round x : ℝ)| := by
      simpa only [sub_eq_add_neg,abs_neg] using
        abs_add_le (x+1/2-(round (x+1/2) : ℝ)) (-(x-(round x : ℝ)))
    _ = distance x+distance (x+1/2) := by
      simp only [distance]
      ring

theorem distance_add_half_sum_upper (x : ℝ) :
    distance x+distance (x+1/2)≤(1/2 : ℝ) := by
  let e : ℝ := x-(round x : ℝ)
  have he : |e|≤(1/2 : ℝ) := distance_le_half x
  have helo := (abs_le.mp he).1
  have hehi := (abs_le.mp he).2
  have hd : distance x=|e| := rfl
  by_cases hsign : e≤0
  · have hnear := distance_le_int (x+1/2) (round x)
    have heq : x+1/2-(round x : ℝ)=e+1/2 := by dsimp [e]; ring
    rw [heq,abs_of_nonneg (by linarith : (0 : ℝ)≤e+1/2)] at hnear
    rw [hd,abs_of_nonpos hsign]
    linarith
  · have hpos : 0≤e := by linarith
    have hnear := distance_le_int (x+1/2) (round x+1)
    have heq : x+1/2-((round x+1 : ℤ) : ℝ)=e-1/2 := by
      dsimp [e]
      push_cast
      ring
    rw [heq,abs_of_nonpos (by linarith : e-1/2≤(0 : ℝ))] at hnear
    rw [hd,abs_of_nonneg hpos]
    linarith

theorem distance_add_half (x : ℝ) :
    distance (x+1/2)=(1/2 : ℝ)-distance x := by
  have hlow := distance_add_half_sum_lower x
  have hupp := distance_add_half_sum_upper x
  linarith

theorem distance_mul_half_even (d : ℕ) (hd : d%2=0) (t : ℝ) :
    distance ((d : ℝ)*(t+1/2))=distance ((d : ℝ)*t) := by
  let q : ℕ := d/2
  have hdecomp := Nat.mod_add_div d 2
  have hdq : d=2*q := by dsimp [q]; omega
  have hdR : (d : ℝ)=2*(q : ℝ) := by exact_mod_cast hdq
  have he : (d : ℝ)*(t+1/2)=(d : ℝ)*t+((q : ℤ) : ℝ) := by
    push_cast
    rw [hdR]
    ring
  rw [he,CriticalFamilies.distance_add_int]

theorem distance_mul_half_odd (d : ℕ) (hd : d%2=1) (t : ℝ) :
    distance ((d : ℝ)*(t+1/2))=(1/2 : ℝ)-distance ((d : ℝ)*t) := by
  let q : ℕ := d/2
  have hdecomp := Nat.mod_add_div d 2
  have hdq : d=2*q+1 := by dsimp [q]; omega
  have hdR : (d : ℝ)=2*(q : ℝ)+1 := by exact_mod_cast hdq
  have he : (d : ℝ)*(t+1/2)=((d : ℝ)*t+1/2)+((q : ℤ) : ℝ) := by
    push_cast
    rw [hdR]
    ring
  rw [he,CriticalFamilies.distance_add_int,distance_add_half]

theorem clearance_add_half_even (ds : List ℕ)
    (heven : ∀ d∈ds, d%2=0) (t : ℝ) :
    clearance ds (t+1/2)=clearance ds t := by
  induction ds with
  | nil => rfl
  | cons d ds ih =>
    have hd : d%2=0 := heven d (by simp)
    have htail : ∀ a∈ds, a%2=0 := fun a ha => heven a (by simp [ha])
    change min (distance ((d : ℝ)*(t+1/2))) (clearance ds (t+1/2))=
      min (distance ((d : ℝ)*t)) (clearance ds t)
    rw [distance_mul_half_even d hd t,ih htail]

/-- The lower-dimensional bound is an explicit premise. No general lonely
runner theorem is assumed by the parity argument. -/
theorem value_lower_of_odd_cons_even (odd : ℕ) (ds : List ℕ) (r : ℝ)
    (hodd : odd%2=1) (heven : ∀ d∈ds, d%2=0)
    (hquarter : r≤1/4) (hvalue : r≤value ds) :
    r≤value (odd::ds) := by
  obtain ⟨t,_ht,htvalue⟩ := value_max ds
  have hclear : r≤clearance ds t := by rwa [htvalue]
  by_cases hgood : r≤distance ((odd : ℝ)*t)
  · have h : r≤clearance (odd::ds) t := le_min hgood hclear
    exact h.trans (CriticalFamilies.le_value_any _ t)
  · have hbad : distance ((odd : ℝ)*t)<r := lt_of_not_ge hgood
    have hgood' : r≤distance ((odd : ℝ)*(t+1/2)) := by
      rw [distance_mul_half_odd odd hodd t]
      linarith
    have hclear' : r≤clearance ds (t+1/2) := by
      rw [clearance_add_half_even ds heven t]
      exact hclear
    have h : r≤clearance (odd::ds) (t+1/2) := le_min hgood' hclear'
    exact h.trans (CriticalFamilies.le_value_any _ (t+1/2))

theorem value_odd_cons_even_lower (odd : ℕ) (ds : List ℕ)
    (hodd : odd%2=1) (heven : ∀ d∈ds, d%2=0) :
    min (value ds) (1/4)≤value (odd::ds) :=
  value_lower_of_odd_cons_even odd ds _ hodd heven (min_le_right _ _) (min_le_left _ _)

theorem value_lower_of_odd_even_perm (ds es : List ℕ) (odd : ℕ) (r : ℝ)
    (hperm : ds.Perm (odd::es)) (hodd : odd%2=1)
    (heven : ∀ d∈es, d%2=0) (hquarter : r≤1/4) (hvalue : r≤value es) :
    r≤value ds := by
  rw [CriticalFamilies.value_perm hperm]
  exact value_lower_of_odd_cons_even odd es r hodd heven hquarter hvalue

def oddSpeeds (ds : List ℕ) : List ℕ := ds.filter (fun d => decide (d%2=1))

def evenSpeeds (ds : List ℕ) : List ℕ := ds.filter (fun d => decide (d%2=0))

theorem complement_odd_predicate :
    (fun d : ℕ => !decide (d%2=1))=(fun d : ℕ => decide (d%2=0)) := by
  funext d
  have hmod := Nat.mod_lt d (by decide : 0<2)
  by_cases heven : d%2=0
  · have hodd : ¬d%2=1 := by omega
    simp [heven,hodd]
  · have hodd : d%2=1 := by omega
    simp [heven,hodd]

theorem oddSpeeds_append_evenSpeeds_perm (ds : List ℕ) :
    (oddSpeeds ds++evenSpeeds ds).Perm ds := by
  have hperm := List.filter_append_perm (fun d : ℕ => decide (d%2=1)) ds
  rw [complement_odd_predicate] at hperm
  exact hperm

theorem parity_partition_length (ds : List ℕ) :
    (oddSpeeds ds).length+(evenSpeeds ds).length=ds.length := by
  simpa only [List.length_append] using (oddSpeeds_append_evenSpeeds_perm ds).length_eq

theorem value_lower_of_one_odd (ds : List ℕ) (r : ℝ)
    (hone : (oddSpeeds ds).length=1) (hquarter : r≤1/4)
    (hvalue : r≤value (evenSpeeds ds)) : r≤value ds := by
  obtain ⟨odd,hoddlist⟩ := List.length_eq_one_iff.mp hone
  have hmem : odd∈oddSpeeds ds := by rw [hoddlist]; simp
  have hodd : odd%2=1 := of_decide_eq_true (List.mem_filter.mp hmem).2
  have heven : ∀ d∈evenSpeeds ds, d%2=0 := by
    intro d hd
    exact of_decide_eq_true (List.mem_filter.mp hd).2
  have hperm := oddSpeeds_append_evenSpeeds_perm ds
  rw [hoddlist,List.singleton_append] at hperm
  exact value_lower_of_odd_even_perm ds (evenSpeeds ds) odd r
    hperm.symm hodd heven hquarter hvalue

/-- Removing the only odd coordinate leaves an ordinary lower-dimensional
runner problem. Its lower bound is an explicit assumption. -/
theorem value_lower_of_one_odd_of_runner_bound (ds : List ℕ) (k : ℕ)
    (hbound : CoordinateSubspace.LonelyRunnerBound k)
    (hnodup : ds.Nodup) (hpositive : ∀ d∈ds, 0<d)
    (hone : (oddSpeeds ds).length=1) (hmin : 2≤ds.length)
    (hsize : ds.length≤k+1) (hquarter : (1 : ℝ)/(k+1)≤1/4) :
    (1 : ℝ)/(k+1)≤value ds := by
  have hlength := parity_partition_length ds
  have hnonempty : evenSpeeds ds≠[] := by
    intro he
    rw [hone,he] at hlength
    simp only [List.length_nil] at hlength
    omega
  have hsize' : (evenSpeeds ds).length≤k := by omega
  have hnodup' : (evenSpeeds ds).Nodup := hnodup.filter _
  have hpositive' : ∀ d∈evenSpeeds ds, 0<d := by
    intro d hd
    exact hpositive d (List.mem_filter.mp hd).1
  exact value_lower_of_one_odd ds _ hone hquarter
    (hbound _ hnonempty hnodup' hsize' hpositive')

theorem ten_speed_one_odd_value_lower
    (hbound : CoordinateSubspace.LonelyRunnerBound 9)
    (ds : List ℕ) (hlength : ds.length=10)
    (hnodup : ds.Nodup) (hpositive : ∀ d∈ds, 0<d)
    (hone : (oddSpeeds ds).length=1) :
    (1/10 : ℝ)≤value ds := by
  apply value_lower_of_one_odd_of_runner_bound ds 9 hbound hnodup hpositive hone
  · omega
  · omega
  · norm_num

end Loneliness.Modular.Search
