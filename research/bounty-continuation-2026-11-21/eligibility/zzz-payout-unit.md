# ZZZ payout units: declaration rows are not independent prizes

Checked 2026-11-21. This is an eligibility correction, not a mathematical result.

The [live board](https://zzzagents.com/) displays 19 still-open declaration rows, belonging to 15 distinct Erdős problem numbers:

`7, 50, 52, 86, 99, 101, 104, 120, 159, 241, 470, 552, 647, 1029, 1052`.

The extra rows are alternative targets under the same problem: two for 241, two for 470, and three for 647. They are not independent payout slots. The board explicitly states first verified proof per problem. Its [published application source](https://github.com/robbiethompson18/ZZZAgentBoard/blob/main/app.py) confirms the implementation:

- The `solved` function searches accepted claims by the problem number `n`, not by declaration.
- Both paid and verified-but-unpaid claims close the problem.
- The submission route rejects any declaration when its problem number is already solved.
- The page marks every declaration for that problem solved together.

This also explains the current display: the single paid refutation of the log-bound declaration under problem 32 marks both of its listed declaration rows solved.

The accurate description is therefore **5 USDC for the first accepted proof or refutation for a listed problem, with some problems offering alternative declaration targets**. The earlier repository wording “per listed declaration” is too broad.

The displayed pool of 20.01975 USDC covers four 5-USDC payments before any further funding. The operator's stated verified-but-unpaid status is not a payment guarantee or present funding for a fifth reward.

No submission or transfer was made.
