# Lean formalization: Li's coefficient-sign counterexample

**Status: complete for the formalized statements.**

Lean proves the structural facts about the explicit 31-vertex tree, the full
`e₃e₂¹⁴` coefficient, the count `b_{(3,2¹⁴)}(T) = 8`, and that all 6,842
connected partition types occur. There is no `sorry`, `admit`,
`native_decide`, custom axiom, `opaque`, or `unsafe`; `#print axioms` reports
only `propext`, `Classical.choice`, and `Quot.sound`.

## Main theorems

Full coefficient (`lean/Conjectures/LiFullCoeff.lean`):

```lean
theorem Li.full_li_coefficient :
    ((MvPolynomial.esymmAlgEquiv (Fin 31) ℚ (n := 31) (by decide)).symm
      ⟨LiFull.fullChromPoly T, LiFull.fullChromPoly_isSymmetric T⟩).coeff
      (Finsupp.single (1 : Fin 31) 14 + Finsupp.single (2 : Fin 31) 1) = 29
```

Colour-set independence (`lean/Conjectures/LiFullCoeffTrunc.lean`):

```lean
theorem Li.full_li_coefficient_of_card {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) :
    ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
      ⟨LiFull.fullChromPolyOn (σ := σ) T, LiFull.fullChromPolyOn_isSymmetric T⟩).coeff
      (Finsupp.single (⟨1, by omega⟩ : Fin (Fintype.card σ)) 14
        + Finsupp.single (⟨2, by omega⟩ : Fin (Fintype.card σ)) 1) = 29
```

The 31-variable case is the minimal sufficient colour set for a degree-31
coefficient; the second theorem proves the same coefficient for every finite
colour type of cardinality at least 31.

`b_{(3,2¹⁴)}(T) = 8` (`lean/Conjectures/LiTriplesFinal.lean`):

```lean
theorem Li.LiFinal325.b_triple_pairs :
    Fintype.card {P : Finset (Finset (Fin 31)) // LiBridge.Partition325 P} = 8
```

All 6,842 connected partition types (`lean/Conjectures/LiPartitionsFinal.lean`):

```lean
theorem LiFinal.T_hasAllPartitionTypes :
    ∀ p : List Nat, LiFinal.IsPartitionOf 31 p → LiFinal.ConnectedPartitionType p
```

`LiFinal.ConnectedPartitionType` is the genuine graph statement: `p` is the
descending list of connected-component sizes of `cutGraph mask` for some edge
cut of `Li.T`. The bridge from the kernel-reducible union-find checker to
`SimpleGraph.ConnectedComponent` is `LiFinal.sizes_eq_components`
(`lean/Conjectures/LiPartitionsGraph.lean`). The exact count is
`LiFinal.card_partitions_31 : Fintype.card {p // IsPartitionOf 31 p} = 6842`
in `lean/Conjectures/LiPartitionsCount.lean`.

## Structural facts

`lean/Conjectures/LiBasic.lean` proves:

- `Li.T_isTree`;
- maximum degree 4, with `0` the unique degree-4 vertex;
- the leaf-neighbour set of `0` is `{1}`;
- the tree is neither a spider nor a caterpillar;
- the bipartition has sizes 16 and 15.

## Module map

| Module | Content |
| :--- | :--- |
| `Conjectures/LiBasic.lean` | The explicit 31-vertex tree; tree, degree, leaf, spider/caterpillar, bipartition facts |
| `Conjectures/LiChromatic.lean` | Three-variable chromatic polynomial, symmetry, homogeneity, `aeval` identity |
| `Conjectures/LiEliminate.lean` | General leaf-elimination theorem for the three-colour partition function |
| `Conjectures/LiDualFull.lean`, `LiDualTrunc.lean`, `LiTrunc.lean` | Dual-number ring `ℚ[ε]/(ε²)` and truncation compatibility |
| `Conjectures/LiBridge.lean` | Leaf-elimination partition function as an `aeval` sum |
| `Conjectures/LiWeighted.lean`, `LiWeighted2.lean` | Weighted-homogeneity transfer (weights 1,2,3) |
| `Conjectures/LiMonomial.lean`, `LiEmapFinal.lean` | Per-monomial extraction and elementary-symmetric evaluations |
| `Conjectures/LiCompute.lean` | Kernel-checked 30-step leaf-elimination chain giving `29` |
| `Conjectures/LiSpecFinal.lean` | Three-variable specialization lemma |
| `Conjectures/LiMain.lean` | `Li.li_coefficient`, the three-variable coefficient |
| `Conjectures/LiFullCoeff.lean` | Full chromatic symmetric function and `Li.full_li_coefficient` |
| `Conjectures/LiFullCoeffTrunc.lean` | Independence of the coefficient from the finite colour set (`≥ 31`) |
| `Conjectures/LiTriples2.lean` | Edge table, listed connected triples, eight good triples, explicit matchings |
| `Conjectures/LiTriplesBridge.lean` | `ConnIn`, connected-block facts, `Partition325` |
| `Conjectures/LiTriplesFinal.lean` | Matching uniqueness, the bijection, and `b_triple_pairs = 8` |
| `Conjectures/LiPartitionsFinalCore.lean` | Kernel-reducible edge-cut/union-find checker |
| `Conjectures/LiPartitionsGraph.lean` | `cutGraph`, union-find correctness, `sizes_eq_components` |
| `Conjectures/LiPartitionsFinalEnum.lean` | Enumeration of all integer partitions of 31 |
| `Conjectures/LiPartitionsFinalData00.lean` … `Data13.lean` | 6,842 checked witness rows |
| `Conjectures/LiPartitionsFinal.lean` | Certificate and `T_hasAllPartitionTypes` |
| `Conjectures/LiPartitionsCount.lean` | `Nodup` and exact cardinality `6842` |

## Reproduce

Requires Lean 4.35.0 through `elan` and the pinned Mathlib revision in
`lake-manifest.json`:

```sh
cd lean
lake exe cache get
cd ..
bash scripts/verify_lean.sh
```

A direct check of the main theorems:

```sh
cd lean
lake env lean Conjectures/LiMain.lean
lake env lean Conjectures/LiFullCoeff.lean
lake env lean Conjectures/LiFullCoeffTrunc.lean
lake env lean Conjectures/LiTriplesFinal.lean
lake env lean Conjectures/LiPartitionsFinal.lean
lake env lean Conjectures/LiPartitionsCount.lean
```

## Finite coverage claims

The certificate in `LiPartitionsFinalData00..13` contains one witness mask for
each of the 6,842 integer partitions of 31. `LiFinal.certificate_ok` checks all
rows by kernel reduction; `LiFinal.sizes_eq_components` identifies the checker
output with the actual connected components of the cut tree; and
`LiFinal.card_partitions_31` proves the count is exactly 6,842. The triple count
is `Li.LiFinal325.b_triple_pairs`, not merely a list length.
