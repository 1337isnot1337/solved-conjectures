# Dall’Ara–Dumitrescu’s higher-dimensional cube covering question

For every dimension $`d\ge3`$, a finite collection of axis-parallel cubes of different sizes can force every disjoint subfamily to cover strictly less than $`2^{-d}`$ of its union. More precisely,

```math
F(Q^d)\le 2^{-d}-\frac{1}{1088}\left(\frac{2}{7}\right)^{d-2}.
```

Cinna Davis constructs the higher-dimensional examples from Ajtai’s planar arrangement. Ajtai anticipated the qualitative conclusion in 1973. The explicit argument answers §7.2(6) in the survey and leaves the exact optimal fraction open. [Primary question](https://arxiv.org/pdf/2604.17509v3#page=14) · [Historical attribution](https://adriandumitrescu.org/rado.pdf#page=20)

**Verification.** Independently reviewed written proof with two exact Python checks. No Lean formalization or external referee report is recorded. [Proof](PROOF.md) · [Independent review and replay instructions](REVIEW.md) · [Planar verifier](verify-planar-gadget.py) · [Cube bound verifier](verify_lift.py)
