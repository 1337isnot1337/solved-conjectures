# Sun’s squarefree power-sum conjecture

Zhi-Wei Sun asks whether every integer $n>7$ has the form $p+2^k+(1+(n\bmod 2))5^b$, where $p$ is an odd prime, $k,b\ge0$, and the part after $p$ is squarefree. He offers $250 for the first explicit counterexample and $2,500 for the first proof. His entry records verification through 20 billion. [Sponsor’s statement and prize](https://oeis.org/A304081) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/225)

## A common set of shifts

Set $S=\{2^a+5^b:a\ge1,\ b\ge0,\ 2^a+5^b\text{ squarefree}\}$. An even integer is represented exactly when it lies in $p+S$ for some odd prime $p$. An odd integer is represented exactly when it lies in $p+2S$. For even $n$, the power of two must be even. For odd $n$, the squarefree shift is even. Its power of two cannot be $1$ by parity or $2$ because $2+2\cdot5^b$ is divisible by four. The remaining shift is twice an odd number, whose squarefreeness is equivalent to that of the shift. Moreover, $9\mid 2^a+5^b$ exactly when $a+b\equiv3\pmod6$, since $5\equiv 2^{-1}\pmod9$ and $2$ has order six.

Sun also records the common-shift formulation in OEIS A304122. [Sun’s equivalent formulation](https://oeis.org/A304122)

The Lean file proves both equivalences for arbitrary inputs. It also proves that testing a given $n$ requires only positive power-of-two exponents up to $\lfloor\log_2 n\rfloor$ and power-of-five exponents through $\lfloor\log_5 n\rfloor$. The finite-search theorem checks the residual prime, its parity and squarefreeness of the underlying odd shift. [Lean proofs](PowerSums.lean)

## Search beyond the published range

Every integer from **20,000,000,001 through 80,500,000,000** had an odd-prime witness. The 60.5 billion checks cover both endpoints and every intervening integer. This extends the range reported by Sun. The unrestricted conjecture remains open.

The C++ search generates the original exponent pairs separately for each parity. It checks squarefreeness by trial division by prime squares. A segmented sieve records small-shift witnesses in blocks of 64 target integers. For each position still missing a witness, it checks the remaining distinct shifts individually. The seven strong probable-prime bases $2,3,5,7,11,13,17$ are deterministic below 341,550,071,728,321, above the program’s input cap of $10^{14}$. The rerun of the first 500 million cases sent 351,858 positions to individual testing. The remaining 60 billion sent 54,600,041. [Search implementation](search.cpp) · [Jaeschke’s primality bound](https://cr.yp.to/bib/1993/jaeschke.pdf)

From the repository root, the following commands reproduce the checks. The independent Python calculation counts exponent pairs by trial division and matches every one of Sun’s 10,000 published values, including all six unrepresented positive integers up to 7. [Independent check](verify.py) · [Reference counts](https://oeis.org/A304081/b304081.txt)

```sh
cd lean
lake build Mathlib.Data.Nat.Squarefree
lake env lean ../research/sun-squarefree-powers/PowerSums.lean
cd ../research/sun-squarefree-powers
curl -fsSL https://oeis.org/A304081/b304081.txt -o /tmp/b304081.txt
python3 verify.py /tmp/b304081.txt
c++ -O3 -std=c++17 -Wall -Wextra -Werror search.cpp -o /tmp/sun-powers
/tmp/sun-powers 20000000001 20500000000
for i in $(seq 0 29); do
    start=$((20500000001 + 2000000000 * i))
    /tmp/sun-powers "$start" "$((start + 1999999999))" || exit 1
done
```
