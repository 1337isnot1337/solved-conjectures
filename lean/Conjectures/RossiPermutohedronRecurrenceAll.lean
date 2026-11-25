module

public import Conjectures.RossiPermutohedronDyadicRows126
public import Conjectures.RossiPermutohedronUniformGrid

@[expose] public section
namespace RossiPermutohedron

set_option maxHeartbeats 2000000 in
/-- Exact finite bridge for every length from 3 through 127. -/
theorem recurrence_model_roots_small (m : ℕ) (hm : 1≤m) (hn : m+2<128) :
    ∃ (s : Finset ℝ) (z : ℝ), s.card=m ∧ (∀ x∈s,x∈Set.Ioo (0:ℝ) 1) ∧ 1<z ∧
      (reciprocalShift (shiftedEulerian (eulerianRec (m+2)))).roots =
        (insert z (insert 1 s)).val := by
  have hm' : m≤125 := by omega
  interval_cases m
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid3
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid4
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid5
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid6
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid7
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid8
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid9
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid10
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid11
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid12
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid13
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid14
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid15
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid16
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid17
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid18
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid19
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid20
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid21
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid22
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid23
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid24
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid25
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid26
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid27
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid28
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid29
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid30
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid31
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid32
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid33
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid34
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid35
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid36
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid37
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid38
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid39
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid40
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid41
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid42
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid43
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid44
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid45
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid46
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid47
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid48
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid49
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid50
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid51
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid52
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid53
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid54
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid55
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid56
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid57
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid58
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid59
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid60
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid61
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid62
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid63
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid64
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid65
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid66
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid67
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid68
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid69
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid70
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid71
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid72
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid73
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid74
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid75
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid76
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid77
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid78
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid79
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid80
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid81
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid82
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid83
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid84
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid85
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid86
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid87
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid88
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid89
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid90
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid91
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid92
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid93
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid94
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid95
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid96
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid97
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid98
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid99
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid100
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid101
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid102
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid103
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid104
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid105
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid106
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid107
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid108
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid109
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid110
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid111
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid112
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid113
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid114
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid115
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid116
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid117
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid118
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid119
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid120
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid121
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid122
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid123
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid124
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid125
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid126
  · exact recurrence_model_roots_of_dyadic_certificate (by decide) FiniteData.checkedGrid127

theorem recurrence_model_roots_all (m : ℕ) (hm : 1≤m) :
    ∃ (s : Finset ℝ) (z : ℝ), s.card=m ∧ (∀ x∈s,x∈Set.Ioo (0:ℝ) 1) ∧ 1<z ∧
      (reciprocalShift (shiftedEulerian (eulerianRec (m+2)))).roots =
        (insert z (insert 1 s)).val := by
  by_cases h : m+2<128
  · exact recurrence_model_roots_small m hm h
  · exact recurrence_model_roots_large m (by omega)

end RossiPermutohedron
