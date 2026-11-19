import Conjectures.LonelinessModularCubeSearch

/-! Three finite prime-127 cube certificates. The native producer supplies
data only; `all_checked` evaluates the complete checker in Lean's kernel.
The real-value exclusion retains LonelyRunnerBound 9 explicitly. -/

namespace Loneliness.Modular.TenSpeed.CubeProbe

private abbrev CubeTree := FoldedSearch.Closed.Cube.Tree 10

private def n0_0 : CubeTree := .strictWitness 59
private def n0_2 : CubeTree := .strictWitness 107
private def n0_3 : CubeTree := .strictWitness 67
private def n0_7 : CubeTree := .allEven
private def n0_17 : CubeTree := .strictWitness 101
private def n0_20 : CubeTree := .strictWitness 27
private def n0_24 : CubeTree := .strictWitness 45
private def n0_26 : CubeTree := .strictWitness 103
private def n0_29 : CubeTree := .strictWitness 99
private def n0_44 : CubeTree := .strictWitness 71
private def n0_57 : CubeTree := .strictWitness 29
private def n0_60 : CubeTree := .strictWitness 35
private def n0_74 : CubeTree := .strictWitness 83
private def n0_76 : CubeTree := .strictWitness 61
private def n0_91 : CubeTree := .strictWitness 41
private def n0_94 : CubeTree := .strictWitness 89
private def n0_106 : CubeTree := .strictWitness 95
private def n0_129 : CubeTree := .strictWitness 31
private def n0_160 : CubeTree := .strictWitness 121
private def n0_164 : CubeTree := .strictWitness 37
private def n0_211 : CubeTree := .strictWitness 81
private def n0_382 : CubeTree := .strictWitness 113
private def n0_433 : CubeTree := .strictWitness 115
private def n0_502 : CubeTree := .strictWitness 25
private def n0_1110 : CubeTree := .strictWitness 17
private def n0_1125 : CubeTree := .strictWitness 9
private def n0_1153 : CubeTree := .strictWitness 5
private def n0_1178 : CubeTree := .strictWitness 109
private def n0_1224 : CubeTree := .strictWitness 19
private def n0_1287 : CubeTree := .strictWitness 23
private def n0_2006 : CubeTree := .split 4 n0_1224 n0_7
private def n0_2007 : CubeTree := .split 2 n0_24 n0_2006
private def n0_2008 : CubeTree := .split 9 n0_2007 n0_0
private def n0_2009 : CubeTree := .split 5 n0_2008 n0_129
private def n0_2010 : CubeTree := .split 7 n0_3 n0_2009
private def n0_2011 : CubeTree := .split 1 n0_2010 n0_1125
private def n0_2012 : CubeTree := .split 0 n0_433 n0_2011
private def n0_2013 : CubeTree := .split 6 n0_17 n0_2012
private def n0_2014 : CubeTree := .split 8 n0_2013 n0_26
private def n0_2015 : CubeTree := .split 3 n0_502 n0_2014
private def n0_3252 : CubeTree := .split 8 n0_7 n0_1287
private def n0_3293 : CubeTree := .split 9 n0_3 n0_29
private def n0_3294 : CubeTree := .split 8 n0_3293 n0_91
private def n0_3295 : CubeTree := .split 3 n0_3294 n0_60
private def n0_3296 : CubeTree := .split 7 n0_3295 n0_24
private def n0_3297 : CubeTree := .split 1 n0_3296 n0_160
private def n0_3298 : CubeTree := .split 5 n0_3297 n0_382
private def n0_3299 : CubeTree := .split 3 n0_1110 n0_164
private def n0_3300 : CubeTree := .split 0 n0_3298 n0_3299
private def n0_3301 : CubeTree := .split 9 n0_57 n0_1224
private def n0_3302 : CubeTree := .split 7 n0_3301 n0_1287
private def n0_3303 : CubeTree := .split 5 n0_91 n0_3302
private def n0_3304 : CubeTree := .split 3 n0_3303 n0_164
private def n0_3305 : CubeTree := .split 0 n0_160 n0_3304
private def n0_3306 : CubeTree := .split 1 n0_76 n0_3305
private def n0_3307 : CubeTree := .split 8 n0_106 n0_3306
private def n0_3308 : CubeTree := .split 4 n0_3300 n0_3307
private def n0_3309 : CubeTree := .split 3 n0_94 n0_1178
private def n0_3310 : CubeTree := .split 9 n0_3309 n0_29
private def n0_3311 : CubeTree := .split 5 n0_3310 n0_382
private def n0_3312 : CubeTree := .split 7 n0_211 n0_44
private def n0_3313 : CubeTree := .split 3 n0_1110 n0_3312
private def n0_3314 : CubeTree := .split 3 n0_1110 n0_3252
private def n0_3315 : CubeTree := .split 7 n0_211 n0_3314
private def n0_3316 : CubeTree := .split 9 n0_3 n0_3315
private def n0_3317 : CubeTree := .split 5 n0_3313 n0_3316
private def n0_3318 : CubeTree := .split 1 n0_3317 n0_1153
private def n0_3319 : CubeTree := .split 0 n0_3311 n0_3318
private def n0_3320 : CubeTree := .split 3 n0_94 n0_2
private def n0_3321 : CubeTree := .split 9 n0_3320 n0_29
private def n0_3322 : CubeTree := .split 5 n0_3321 n0_74
private def n0_3323 : CubeTree := .split 0 n0_3322 n0_1153
private def n0_3324 : CubeTree := .split 1 n0_76 n0_3323
private def n0_3325 : CubeTree := .split 8 n0_106 n0_3324
private def n0_3326 : CubeTree := .split 4 n0_3319 n0_3325
private def n0_3327 : CubeTree := .split 2 n0_3308 n0_3326
private def n0_3328 : CubeTree := .split 5 n0_17 n0_20
private def n0_3329 : CubeTree := .split 6 n0_3327 n0_3328
private def n1_21 : CubeTree := .strictWitness 111
private def n1_24 : CubeTree := .strictWitness 63
private def n1_43 : CubeTree := .strictWitness 35
private def n1_52 : CubeTree := .strictWitness 239
private def n1_57 : CubeTree := .strictWitness 53
private def n1_61 : CubeTree := .strictWitness 97
private def n1_64 : CubeTree := .strictWitness 11
private def n1_73 : CubeTree := .strictWitness 49
private def n1_79 : CubeTree := .strictWitness 205
private def n1_104 : CubeTree := .strictWitness 157
private def n1_114 : CubeTree := .strictWitness 201
private def n1_118 : CubeTree := .strictWitness 61
private def n1_120 : CubeTree := .strictWitness 125
private def n1_121 : CubeTree := .strictWitness 129
private def n1_311 : CubeTree := .strictWitness 143
private def n1_380 : CubeTree := .strictWitness 219
private def n1_419 : CubeTree := .strictWitness 77
private def n1_428 : CubeTree := .split 5 n1_21 n1_73
private def n1_429 : CubeTree := .split 3 n1_114 n1_428
private def n1_430 : CubeTree := .strictWitness 139
private def n1_431 : CubeTree := .split 1 n1_61 n1_380
private def n1_432 : CubeTree := .split 0 n1_431 n1_64
private def n1_433 : CubeTree := .split 5 n1_21 n1_432
private def n1_434 : CubeTree := .split 3 n1_430 n1_433
private def n1_435 : CubeTree := .split 8 n1_434 n1_121
private def n1_436 : CubeTree := .split 7 n1_429 n1_435
private def n1_437 : CubeTree := .split 1 n1_43 n1_104
private def n1_438 : CubeTree := .split 0 n1_52 n1_437
private def n1_439 : CubeTree := .split 5 n1_438 n1_73
private def n1_440 : CubeTree := .split 3 n1_439 n1_118
private def n1_441 : CubeTree := .split 8 n1_120 n1_440
private def n1_442 : CubeTree := .split 5 n1_79 n1_311
private def n1_443 : CubeTree := .split 3 n1_442 n1_57
private def n1_444 : CubeTree := .split 7 n1_441 n1_443
private def n1_445 : CubeTree := .split 4 n1_436 n1_444
private def n1_446 : CubeTree := .split 2 n1_419 n1_445
private def n1_447 : CubeTree := .split 6 n1_24 n1_446

def root : Fin 3 → Fin 10 → ℕ := ![![1,2,3,5,7,8,9,17,32,60],![1,2,3,7,8,9,10,11,12,13],![1,123,122,9,19,103,28,47,75,74]]
def modulus : Fin 3 → ℕ := ![127,127,254]
def tree : Fin 3 → FoldedSearch.Closed.Cube.Tree 10 := ![n0_2015,n0_3329,n1_447]

theorem modulus_gt_one : ∀ i, 1<modulus i := by decide +kernel

theorem all_checked : ∀ i,
    FoldedSearch.Closed.Cube.check 1 11 (fun _ _ _ => false)
      (tree i) (modulus i) (root i) (fun _ => none)=true := by
  decide +kernel

def PositiveDistinct (v : Fin 10 → ℕ) : Prop :=
  (∀ i, 0<v i) ∧ (List.ofFn v).Nodup

theorem excludes_closed_value
    (hLRC : CoordinateSubspace.LonelyRunnerBound 9) (i : Fin 3)
    (v : Fin 10 → ℕ) (hrep : FoldedSearch.Represents (modulus i) (root i) v)
    (hp : Search.Primitive v) (hpositive : ∀ j, 0<v j)
    (hnodup : (List.ofFn v).Nodup) : ¬value (List.ofFn v)≤(1/11:ℝ) := by
  intro hlow
  have hterminal : FoldedSearch.Closed.TerminalSound 1 11
      (fun _ _ _ => false) PositiveDistinct (fun _ => False) := by
    intro m x index hm hcheck
    change false=true at hcheck
    cases hcheck
  have hone := FoldedSearch.Closed.ten_speed_oneOddSound hLRC PositiveDistinct
    (fun _ h => h.1) (fun _ h => h.2)
  exact FoldedSearch.Closed.Cube.checked_value (by decide) (by decide)
    (fun _ _ _ => false) PositiveDistinct (fun _ => False) hterminal hone
    (tree i) (root i) (modulus_gt_one i) (all_checked i) v hrep hp
    ⟨hpositive,hnodup⟩ (by simpa using hlow)

end Loneliness.Modular.TenSpeed.CubeProbe
