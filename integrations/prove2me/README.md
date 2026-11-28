# Solved Conjectures on Prove2Me

The collection is for exact Lean statements sourced to this repository. It includes genuinely open conjectures, written results awaiting formalization, and original results with existing Lean proofs. Each curated target gets its own mission. The Caiolo–Ferroni–Hoster pilot links to the written proof and reuses the repository’s formal statement for the rank-five family. [Pilot proof record](https://github.com/1337isnot1337/solved-conjectures/tree/4207a936b7bc1b722ad3f8d1b0fa090e8763b048/results/caiolo-ferroni-hoster)

This Lake package pins Lean 4.33.1 and Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` for Prove2Me. From this directory, with Elan and Python 3.11 or later installed, run:

```sh
lake exe cache get
python3 sync.py
python3 check_pilot_proof.py
```

`sync.py` elaborates the exact definition and theorem payloads. The theorem payload has the intentional proof placeholder required by Prove2Me. `check_pilot_proof.py` rebuilds the original proof’s import closure with the compatibility import path and applies that proof to the mission statement. It checks the resulting theorem’s axiom list.

## Add a mission to the queue

1. Add a directory under `missions/` with `mission.json`, its Lean statement, source-linked introduction, and independent read-backs. Use the pilot as a template. List Lean definition dependencies before the statements that import them. Keep original source and proof links on each item, and use `OpenProblem` only for a conjecture that remains open.
2. Run `python3 sync.py MISSION-SLUG`. The tool checks every selected payload and uses a stable mission title and declaration names to reconcile the same proposal on reruns. Use stable titles for all queued missions.
3. Run `python3 sync.py --apply --username YOUR_USERNAME MISSION-SLUG` with a local `PROVE2ME_API_KEY` or pass `--key-file /path/to/key`. A run with no slug stages the whole queue. The tool checks the account and platform pin before making changes. The account holder confirms each item and submits the proposal from [My Missions](https://prove2.me/my-missions). After moderation, `--collection SOLVED-CONJECTURES-SLUG` attaches reviewed public missions if that account has collection editor access. [Prove2Me proposal workflow](https://prove2.me/references/mission_captain.md)

## GitHub Actions

The workflow checks mission changes on pull requests and pushes. To enable draft sync on one trusted branch, set the repository Actions variables `PROVE2ME_SYNC_REF` to `refs/heads/research` or `refs/heads/main` and `PROVE2ME_USERNAME` to the proposal owner. Add the `PROVE2ME_API_KEY` Actions secret. Once the collection exists, set `PROVE2ME_COLLECTION` to its slug. Pushes that touch the integration trigger sync. Use the manual workflow to reconcile after a moderation decision. Rotate the Prove2Me key before expiry. [Prove2Me authentication](https://prove2.me/references/setup.md)

If you use a mission, please credit the authors named in its result record and cite the original source, [itsdavis.com](https://itsdavis.com/), and the [repository or exact proof](https://github.com/1337isnot1337/solved-conjectures) you used.
