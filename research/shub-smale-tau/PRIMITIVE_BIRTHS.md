# Primitive power equations at the first vanishing register

Status: research preprocessing lemma. This note gives an exact reduction
for arbitrary integer root sets. It does not bound the roots of the
resulting primitive equations and does not prove tau. It does not extract
a radical or a consecutive-root factor.

Programs start from 1 and x and use binary +,-,* gates. All polynomials
and all reconstructed programs below have integer coefficients.

## 1. A circuit-level covering statement

### Proposition 1.1

Let a length-s program compute a nonzero f in Z[x]. There is a family
of at most 2s+1 nonzero integer polynomials whose real zero sets cover
the real zero set of f. One member may be x. Every other member has
the form


```math
A-B\quad\hbox{or}\quad A+B,
 \qquad
 A=\prod_{j=0}^{r}G_j^{a_j},\quad
 B=\prod_{j=0}^{r}G_j^{b_j},
\tag{1.1}
```


where G_0=x and the other G_j are nonzero outputs of earlier addition
or subtraction gates of the original program. The exponent vectors
in (1.1) have disjoint supports and satisfy


```math
\gcd(a_0,\ldots,a_r,b_0,\ldots,b_r)=1.
\tag{1.2}
```


Each covering polynomial has a charged constant-free program of size
O((s+1)^2), with an absolute implicit constant. The entire family can
share the original program and has total construction size
O((s+1)^3). Every integer root of f is therefore covered as well.

The exponent condition is relative to these labelled generators. They
need not be algebraically or multiplicatively independent. It is not a
claim that the covering polynomial has small degree or few roots.

More precisely, the construction assigns a nonzero root to its first
vanishing nonzero register. At that root all generators preceding the
assigned gate are nonzero. The equation in (1.1) then follows by
cancellation of nonzero evaluated factors; no cancellation at a zero
is used.

The choices of which original registers are identically zero may be
made nonuniformly. The proposition is a circuit-existence statement,
not a deterministic polynomial-time identity-testing algorithm.

## 2. Monomial descriptions between addition gates

Give every nonzero addition or subtraction output its own generator
label. Give x the label G_0, and represent the register 1 by the empty
monomial. Every nonzero register can then be represented as a monomial
in x and the preceding labelled outputs:

* an addition/subtraction output is its own newly introduced generator;
* at a multiplication gate, add the two input exponent vectors.

A nonzero product cannot have an identically zero input, because Z[x]
is an integral domain. Consequently identically zero registers do not
need a monomial representation. They may still occur in the original
program; no modification of that program is needed.

At every stage there are at most s+1 generator labels. The sum of the
entries of any exponent vector after i operations is at most 2^i:
this is true initially; multiplication adds two preceding sums, and
introducing an addition generator resets the sum to one. In particular
every exponent has at most s+1 binary digits.

## 3. Assigning roots and removing common powers

Fix a real root alpha of f. If alpha=0, the covering polynomial x
suffices. Otherwise choose the earliest register which is a nonzero
polynomial and vanishes at alpha. It is not a multiplication output,
because a product of two nonzero real evaluated inputs is nonzero.

Write this addition or subtraction output as U+sigma V, where
sigma is +1 or -1. Both input polynomials are nonzero. If one were
identically zero, the other would be an earlier nonzero register
vanishing at alpha. Both evaluated inputs are also nonzero, by the
choice of the first vanishing register.

Using their monomial descriptions, subtract the componentwise minimum
of the two exponent vectors. This factors


```math
U=C A_1,\qquad V=C B_1,
```


where A_1,B_1 have disjoint generator supports and C(alpha)!=0.
If both exponent vectors are now zero, A_1=B_1=1, and there is no
first vanishing nonzero output: the sum is 2C and the difference is
identically zero. Thus at an assigned gate at least one exponent is
positive.

Let g>=1 be the gcd of all remaining exponents. Dividing them by g
gives monomials A,B with disjoint supports and gcd one, and


```math
U+\sigma V=C(A^g+\sigma B^g).
\tag{3.1}
```


At alpha the quantities A(alpha),B(alpha) are nonzero real numbers.
Hence the exact alternatives are:

* if g is odd and sigma=-1, A(alpha)-B(alpha)=0;
* if g is odd and sigma=+1, A(alpha)+B(alpha)=0;
* if g is even and sigma=-1, either A(alpha)-B(alpha)=0 or
  A(alpha)+B(alpha)=0;
* if g is even and sigma=+1, no such first zero can occur.

The odd cases use the injectivity of the odd power map on the real
numbers. The even cases use positivity of even powers and equality
of their absolute values. These arguments also apply to integer and
rational evaluations, but they are not assertions about arbitrary
complex evaluated inputs.

For each nonzero addition/subtraction output, include the indicated
one or two polynomials whenever its two nonzero operands have a
positive residual exponent. Skip the remaining gates. Together with
x this gives at most 2s+1 covering polynomials.

Every included polynomial is nonzero. In an odd case, an identically
zero A+sigma B would make A^g+sigma B^g identically zero. In the
even subtraction case, either identity A=B or A=-B would have the
same consequence. Equation (3.1), with C a nonzero monomial, would
then make the original output identically zero, contrary to the gate
selection. This verifies the nonzero-output condition for all covering
members.

## 4. Charged cost and exact scope

All generators used at one assigned gate are available from the
original prefix of length at most s. Every normalized exponent is at
most 2^s. Binary powering therefore computes each needed generator
power in O(s+1) multiplications. There are at most s+1 such powers in
the two disjoint supports together. Multiplication within A and B,
followed by the final addition or subtraction, adds O(s+1) gates.
This proves the O((s+1)^2) bound. Empty products use the available
constant 1. No exponent is inserted as a free scalar: it specifies a
binary multiplication schedule. Repeating this construction at at
most s gates proves the shared O((s+1)^3) bound.

This removes a common exponent that only repeats an already present
real zero set. It does not make the remaining exponents small. For
example, x^n-2 is primitive in the two generators x and the earlier
constant register 2=1+1: its exponent pair (n,1) has gcd one. For
n>=2 it has no integer roots, even though its degree and arithmetic
resultant quantities can be large.

Nor does the proposition bound the roots of a primitive last
subtraction with a complicated shared prefix. The positive-register
pair simulation already recorded in the circuit-history notes can
put all roots of an arbitrary f at such a subtraction with only
constant-factor overhead. Thus a new bound for the covering family
must use quantitative information from the prefix, not merely the
primitive-exponent condition.

For a consecutive-root input, an assigned birth set need not itself
be consecutive. Covering the root set by a small number of these
equations therefore supplies no unproved interval-preservation step.
