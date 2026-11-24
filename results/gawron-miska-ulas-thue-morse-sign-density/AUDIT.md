# Scope and independent audit

The exact source is [Gawron–Miska–Ulas Conjecture 5.8](https://doi.org/10.1007/s00605-017-1041-2), with densities in the argument index of the sign-exception sets, not the substituted coefficient index. This is separate from their valuation Conjecture 5.2.

Independent internal review reproduced the six matrix rows by literal convolution at prefixes zero and one, checked nonvanishing, and verified the aligned-block deductions in the source's input variable. The conclusion concerns positive lower density, not existence or exact value of each limiting density. Searches found no earlier sign-density disproof.

At the time of the written audit no Lean proof was claimed. The subsequent [complete Lean audit](LEAN.md) verifies the original Conjecture 5.8 disproof, including the coefficient bridge and both finite-prefix estimates. No independent outside review or absolute priority claim is made.

The stronger all-progression result was independently audited: the exact four-matrix norm bound, uniform same-depth angular net, residue dynamics, non-atomic stationary law and dyadic-to-natural density passage all check.
