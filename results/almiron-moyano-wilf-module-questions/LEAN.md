# Lean coverage of the Wilf-module questions

The [Lean module](../../lean/Conjectures/AlmironMoyanoWilf.lean) checks three endpoints.

- `question_4_8_false` answers [Question 4.8](https://arxiv.org/html/2012.01358v3#S4.SS1). The additive submonoid has conductor 10 and threshold 2. The proof checks that every gap module has strictly negative Wilf number and that the conductor used for each count is least. The single witness refutes the full assertion. The written extension to all multiplicities at least five is not formalized.
- `question_4_13_uniform_threshold` proves [Question 4.13(1)–(2)](https://arxiv.org/html/2012.01358v3#S4.SS2) for normalized modules and positive integer thresholds. The threshold is exactly the multiplicity. The proof counts multiples of that multiplicity, then constructs a sharp witness.
- `question_4_13_at_generator_count` checks the individual-module inequality in Question 4.13(6), with normalization and with zero counted as a generator. Every such module has nonnegative Wilf number at its own minimal generator count if and only if the semigroup is all of the naturals.

The refined thresholds and classifications in Question 4.13(3)–(5) and the two-generator supplement still need formalization. The collection entry remains **partial**.
