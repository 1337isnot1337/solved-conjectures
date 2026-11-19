# Prime filtering: original complete hosted evidence

This directory preserves the original successful verification evidence from
[run 44591941338](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44591941338),
job `135799965938`, source `e6d53ced9fd3b6ad4a311c3eecbe1fcbd0cdd491`.
The unchanged receipt is [receipt.json](receipt.json); the independent
artifact checks are [authentication.json](authentication.json).

Artifact `14563378013`, named `prime-filtering-exact`, has ZIP SHA-256
`77f0d68ce157cab87fcf629a09d6997b50ab90489f91b1654c191966aab3eb19`.
The receipt has SHA-256
`009a768a638e275c6705f1bc08c316ca3686553bd591c2c25765fc29531ed394`.
[archive-members.json](archive-members.json) records every original member,
including all compiled objects. Sources, controls, literal statements,
generated audit, declaration inventory, logs and process profiles are
preserved without changing their bytes. Compiled objects can be reproduced
from the pinned source and toolchain; their original hashes remain recorded.

## Checked scope

The 18-module closure passed fresh compilation with `-j1 -M4500
-DwarningAsError=true`, 33 literal contracts, all 68 required theorem
endpoints, and an audit of every owned/raw declaration. That inventory has
299 declarations, 243 theorems and 10 private declarations. Only `propext`,
`Classical.choice` and `Quot.sound` occur as transitive axioms. Each of the
18 modules passed as the sole target of a fresh stock-kernel checker process.

The source formalizes Lemma 2 and Corollary 3 in J. Barajas and O. Serra,
[*The lonely runner with seven runners*](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v15i1r48/pdf/),
Electronic Journal of Combinatorics 15 (2008), R48, DOI 10.37236/772.
It proves general forbidden-set budgets, actual prime-power units, canonical
valuation levels, preservation of higher residues from a coprime seed,
and modular-witness and real-time loneliness consequences.

For prime seven, the `1/7` consequence requires at most three distinct
positive speeds at each valuation level strictly below the maximum. The
highest level is unrestricted. The uniform-level result permits any base
at least two and any number of inputs. These statements do not discharge
the remaining exceptional lower levels with four or five inputs. The full
six-speed runner theorem remains pending.

[registration.json](registration.json) lists the exact additive registry
changes. Previous entries and original contributor records are preserved.
Li is not registered by this component. No result-directory completion flag
changes. The merged accepted-package gate is a separate obligation.
