# Lean formalization: Li's coefficient-sign counterexample

**Status: partial formalization.**

Lean proves the structural facts about the explicit 31-vertex tree and the
coefficient of `e₃e₂¹⁴` in its three-variable chromatic symmetric polynomial,
which is `+29`. The identification with the full `[e₃e₂¹⁴] X_T` coefficient is
the standard restriction argument explained below; it is not a separate Lean
theorem. The full counterexample in the note also requires the tree to realize
all 6,842 connected partition types and the eight triple-plus-pairs partitions.
The existing `verify.py` checks both finite coverage claims, but those claims
are not Lean-formalized. The three-variable coefficient computation is
kernel-checked; the overall claimed counterexample is therefore **partially
formalized**.

## Main theorem

`lean/Conjectures/LiMain.lean`:

```lean
theorem Li.li_coefficient :
    ((MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm
      ⟨chromPoly T, chromPoly_isSymmetric T⟩).coeff
      (Finsupp.single (1 : Fin 3) 14 + Finsupp.single (2 : Fin 3) 1) = 29
```

This is the coefficient of `e₃e₂¹⁴` in the three-variable chromatic symmetric
polynomial of the explicit tree `T`. The index `single 1 14 + single 2 1`
means `X₁^14 X₂`, i.e. `e₂^14 e₃` under `esymmAlgEquiv`. The three-variable
restriction is faithful for this coefficient because no `e_j` with `j > 3`
appears. This faithfulness argument is not itself formalized as a Lean bridge.

`#print axioms Li.li_coefficient` reports exactly:

```
[propext, Classical.choice, Quot.sound]
```

There is no `sorry`, no `native_decide`, and no project-specific axiom.

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
| `Conjectures/LiBasic.lean` | The explicit 31-vertex tree; 30 edges; tree, degree, leaf, spider/caterpillar, bipartition facts |
| `Conjectures/LiChromatic.lean` | Three-variable chromatic polynomial; symmetry; degree-31 homogeneity; `aeval` evaluation identity |
| `Conjectures/LiEliminate.lean` | General leaf-elimination theorem for the three-colour partition function |
| `Conjectures/LiDualFull.lean` | Dedicated dual-number ring `ℚ[ε]/(ε²)` with square-zero multiplication |
| `Conjectures/LiTrunc.lean`, `LiDualTrunc.lean` | The truncation `ℚ[t] → ℚ[ε]/(ε²)` and its compatibility with `aeval` |
| `Conjectures/LiBridge.lean` | Identifies the leaf-elimination partition function with the `aeval` sum |
| `Conjectures/LiWeighted.lean`, `LiWeighted2.lean` | Weighted-homogeneity transfer (weights 1,2,3) |
| `Conjectures/LiMonomial.lean` | Per-monomial coefficient extraction: only `Y₁¹⁴Y₂` contributes the linear `ε` term |
| `Conjectures/LiEmapFinal.lean` | Evaluates `e₁,e₂,e₃` at the truncated dual weights |
| `Conjectures/LiCompute.lean` | The 30-step leaf-elimination chain, checked by kernel reduction over `Dual`, giving `29` |
| `Conjectures/LiSpecFinal.lean` | The specialization lemma `[e₂¹⁴e₃]p = [t](aeval (1+t/2,-1+t/2,-t) g)` |
| `Conjectures/LiMain.lean` | Assembly of `Li.li_coefficient` |

## Reproduce

Requires Lean 4.35.0 through `elan` and the pinned Mathlib revision in
`lake-manifest.json`:

```sh
cd lean
lake exe cache get
cd ..
bash scripts/verify_lean.sh
```

A direct check that the main theorem compiles:

```sh
cd lean
lake env lean Conjectures/LiMain.lean
```

## Finite coverage claims

The full counterexample in `PROOF.md` also asserts:

- `b_{(3,2¹⁴)}(T) = 8`;
- all 6,842 integer partitions of 31 occur as connected partition types.

The existing `results/li-coefficient-sign/verify.py` checks both claims
exactly; `independent_check.py` checks the coefficient/vertex-deletion data.
The claims are part of Li's Problems 4.6 and 4.9. They are **not**
Lean-formalized and are not premises of `Li.li_coefficient`.
