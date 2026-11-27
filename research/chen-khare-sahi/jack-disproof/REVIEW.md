# Review of the Jack semiring counterexample

Codex derived this result in the WadeDavis research session. Independent project reviewers checked the argument and constructed the witness by two exact methods. The result is a written disproof with reproducible arithmetic checks. External refereeing and Lean verification are outstanding.

The proof uses dominance of equal-degree partitions, the positive leading term of each nonzero Schur generator, and additivity of its exponent under products. Degrees through five specialize injectively in five or more variables, so the sign character can be applied to factors and products through that degree. Vanishing on the diagonal eliminates pure products. The leading width bound eliminates every product having two difference factors. The column Schur coefficient of each remaining product is nonpositive. The hook evaluation at negative dimension computes the strictly positive target coefficient for the entire parameter interval. [Proof](PROOF.md)

Two calculations recover the witness independently in five variables.

- The [differential-operator verifier](verify.py) constructs the monic Jack polynomials in the monomial basis, computes the column coefficient by polynomial specialization at negative dimension, and counts every degree-five product. The 77 products consist of 27 pure products, 35 nonpure products of width at least four, and 15 eligible products. Among the 15, seven column coefficients vanish and eight are strictly negative.
- The [Gram–Schmidt verifier](independent_gram_check.py) constructs Jack polynomials from their defining scalar product and Schurs from Jacobi–Trudi determinants. It finds the target’s seven ordinary Schur coefficients to be 0, 0, 10/2261, −79/13566, 1/13566, −13/6783, 1/4522 in descending lexicographic partition order. In the same order, take the linear functional assigning values 4, 2, 1, 1, 1, 1, 0 to the **normalized** Schur basis. On all 27 products without a difference, 46 with one difference, and four with two differences its value is nonnegative. On the target its value is −1/4522. This checks nonmembership directly, independently of the width argument.

Run both scripts with Python 3 and the standard library.

```sh
python3 verify.py
python3 independent_gram_check.py
```

The obstruction concerns Chen–Khare–Sahi Conjecture 4 in arXiv:2509.19649v2. It is consistent with the pointwise normalized Jack inequality and the repository’s positive two-column result. Conjecture 5 asks a distinct question for Macdonald polynomials. [Primary statement](https://arxiv.org/html/2509.19649v2#S4.SS2) · [Two-column theorem](../TWO-COLUMNS.md) · [Issue #201](https://github.com/1337isnot1337/solved-conjectures/issues/201) · [Bounded source and duplicate audit](SOURCE_AUDIT.md)
