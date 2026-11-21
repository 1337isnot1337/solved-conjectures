# Kauers–Koutschan recurrence conjecture

Let $a_n$ count the permutations of $1,\ldots,n$ for which no entries two positions apart give a rise of exactly two. Kauers and Koutschan conjectured a specific order-eight recurrence for $a_n$. We prove it for every $n\ge0$. The same argument verifies the order-thirteen recurrence that Spahn and Zeilberger also accept for their $100 OEIS donation challenge. Independent review and sponsor adjudication are pending. [Original conjecture, §6](https://arxiv.org/abs/2202.07966) · [Prize, Challenge 1](https://sites.math.rutgers.edu/~zeilberg/mamarim/mamarimPDF/perms.pdf) · [Published operators](https://oeis.org/A189281)

The proof cuts the position and value sets into their two parity chains. Inclusion–exclusion on matched adjacencies in the chains produces a matrix with a unitarily invariant distribution. Its two-variable Schur moments are divided differences of derangement numbers. These moments give a short recurrence for the sums occurring in the exact permutation count. [Proof](PROOF.md) · [Exact symbolic checker](verify.py) · [Original operator, coefficients in ascending degree](operator.txt)

The checker substitutes the counting formula directly into both published operators over a rational polynomial ring. It handles the four initial indices separately. As independent enumeration checks, exhaustive enumeration agrees through length eight, and the divided-difference formula agrees with all 301 entries of Matsuo’s published table. [Enumeration table](https://oeis.org/A189281/b189281.txt)

Run from this directory with Python 3.10 or later and SymPy 1.14.

```sh
python -m pip install sympy==1.14.0
python verify.py
```

## Prior work

Kauers and Koutschan guessed the recurrence from enumeration data. Matsuo computed through length 300. Spahn and Zeilberger gave inclusion–exclusion methods and posed the prize. Padhi subsequently proved the existence of a recurrence for the whole directed and undirected family. For this specific operator, §6 of Padhi’s paper proves part of the required reduction and records the remaining obstruction. The accompanying repository also lists Challenge 1 as partial. A search of the authors’ pages, the OEIS entry and references, arXiv, GitHub, and exact-operator searches on November 21, 2026 found no earlier full proof. [Original authors](https://www.algebra.uni-linz.ac.at/people/mkauers/publications/kauers22.pdf) · [Sponsor’s updates](https://sites.math.rutgers.edu/~zeilberg/mamarim/mamarimhtml/perms.html) · [Padhi, §§5–6](https://arxiv.org/abs/2608.11290) · [Padhi’s code and status](https://github.com/jaideepsaipadhi/zeilberger-challenges) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/218)
