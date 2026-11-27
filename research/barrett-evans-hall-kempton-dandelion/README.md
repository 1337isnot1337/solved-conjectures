# Barrett–Evans–Hall–Kempton’s dandelion conjecture

The dandelion minimizes the sum of the algebraic connectivities of a graph and its complement when both diameters are three. The proof covers every order and characterizes equality. Arbitrary edges may be added among the ordinary leaves of the dandelion, and either graph may be replaced by its complement. This is Conjecture 2 of the source paper. The weighted inequality in Conjecture 6 is a separate result. [Full proof](PROOF.md) · [Primary source](https://arxiv.org/pdf/2201.04225#page=15) · [Discovery record](https://github.com/1337isnot1337/solved-conjectures/issues/962)

**Verification.** Computer-assisted proof with independent internal mathematical review and exact finite certificates. No Lean formalization or external referee report is claimed. [Mathematical review and prior results](REVIEW.md) · [Independent arithmetic review](ARITHMETIC-REVIEW.md)

Cinna Davis and GPT-6.2 Astra developed the structural reduction, all-orders double-leaf comparison, large-order argument and original finite checks. The WadeDavis research session with Codex supplied the exact 21–64 interval certificate and the exhaustive anchored argument completing the source conjecture. The dandelion spectrum is due to Barrett, Evans, Hall and Kempton. [Structural reduction](https://github.com/1337isnot1337/solved-conjectures/commit/e41d1279f655efd121e144777bd51b7047f03c4d) · [Finite interval certificate](https://github.com/1337isnot1337/solved-conjectures/commit/1ee0932d56279d63c70c3ed70fbffbea52067694)

The WadeDavis research session with Codex proved the same minimum and equality cases for all connected complementary pairs. [Stronger theorem](CONNECTED-EXTENSION.md) · [Independent review](CONNECTED-REVIEW.md)

## Reproduction

From this directory, run the following under standard Python with assertions enabled and a C++17 compiler with signed 128-bit integer support. The small-order executable needs no external libraries.

```sh
c++ -O3 -std=c++17 check_anchored_dandelion.cpp -o /tmp/check_anchored_dandelion
for n in $(seq 4 20); do
  /tmp/check_anchored_dandelion "$n" || exit 1
done
python3 verify_connected_dandelion.py
python3 check_form_two_cut.py
python3 verify_finite_interval.py
python3 verify_effective_interval.py 65
python3 check_leaf_near_universal.py
```

Each anchored search must report `complete=1`. At order 20 the deterministic branching rule checks 735,471 multiplicity vectors, 183,999 symmetry representatives and 1,391,125 search nodes. The interval programs close all 3,276 finite-order branches and all 600 uniform branches. The double-leaf checker uses integer comparisons through order 49 and the written proof treats larger orders.
