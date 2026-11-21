# CKZ upstream Lean dependencies

The Lean files under `D5/` are adapted from the
[trureturing project](https://github.com/the-omega-institute/trureturing/tree/bba1aad31d92f0ac31774c3a7e7c04a3db945c56/D5),
commit `bba1aad31d92f0ac31774c3a7e7c04a3db945c56`, under Apache License 2.0;
see [LICENSE](LICENSE). The upstream project supplies the prior Conjecture 2
all-index tail proof and the actual separable-permutation decomposition.
The imported closure is limited to dependencies of `RecordAllIndex`.

Changes to the upstream files: import paths were prefixed for this repository;
deprecated conditional lemmas and a few linter findings were adjusted for the
repository's warnings-as-errors build; harmless simp-argument and unnecessary-
simpa linters were disabled in the adapted files; and intermediate decomposition
identities and unrestricted record symmetries were exposed in the conclusions
of existing theorems. The resulting theorem dependencies are audited and replayed
with the rest of the project. The original record-decline conclusion is preserved.

`Conjectures/CKZBridge.lean` also adapts short low-coefficient and cardinality
arguments from the same sources and combines them with this repository's direct
Pell certificates to prove the original Chen–Kitaev–Zhang Conjectures 1 and 3.
