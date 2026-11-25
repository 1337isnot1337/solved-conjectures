# Lean verification: Benfield–Lippard’s stable Waring-gap parity conjecture

[Lean module](../../lean/Conjectures/BenfieldLippardParity.lean) · [Written proof](PROOF.md) · [Original source, §10.1](https://arxiv.org/html/2404.08193v2#S10.Thmtheorem4)

The endpoint `BenfieldLippardParity.benfieldLippard_conj10_4` proves both assertions of Conjecture 10.4 for every exponent at least two. It defines representability using a list of exactly `j` positive bases whose powers sum to `j + n`; stability requires this for all sufficiently large `j`. The exact finite set has as members precisely the positive offsets that fail this stability condition. It has an odd largest element and odd cardinality.

Adding the first odd shifted-power generator pairs the even gaps with the odd gaps above that generator. Below it, the odd offsets form a set of odd cardinality. An even largest gap would have a strictly larger odd partner. The stronger two-adic congruences in the written proof are **not** formalized here.

Conjecture credit: Brennan Benfield and Oliver Lippard. The written argument and its priority caveat remain unchanged. The Lean source is unchanged from Cinna Davis’s [research commit](https://github.com/1337isnot1337/solved-conjectures/commit/3870fcfd0b97898c6c4cfda860142ba572b52867).

## Reproduce the scoped gate

After installing the pinned Mathlib cache, run from the repository root:

```sh
python3 scripts/verify_lean_target.py --root Conjectures.BenfieldLippardParity --require BenfieldLippardParity.benfieldLippard_conj10_4 --out /tmp/benfield-lippard-parity-check
```

The [receipt](verification/receipt.json) binds the strict build, all-owned axiom audit, and independent stock kernel replay to the exact proof source and tools. It does not certify the repository-wide gate.
