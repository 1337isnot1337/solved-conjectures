# Lonely Runner — inserting two speeds into tight families

**The general conjecture remains open.** Start with any of the Goddyn–Wong simultaneous accelerations of the consecutive speeds $1,\ldots,p-1$, with $p\ge3$. Adjoin any two positive integer speeds. There is a time between $1/(p+2)$ and $1/p$ at which all the speeds are at least $1/(p+2)$ from the nearest integer after multiplication by that time. The two added speeds can be arbitrarily large. A three-speed example shows the limit of this prescribed-interval method. [Proof](PROOF.md) · [Goddyn and Wong, Theorems 2.3 and 3.1](https://www.sfu.ca/~goddyn/Papers/063tight_lonely_runner.pdf)

Run `python3 two_additions.py`. The verifier exhausts the finite cases left by the analytic bound using rational endpoints. It also checks the three-speed obstruction. The argument is unrefereed and has no Lean formalization or priority claim.
