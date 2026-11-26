# Remote branch archive, 26 November 2026

`heads.tsv` lists the original 255 remote branch names, exact commit IDs, and associated same-repository pull requests before the cleanup. All these commits are ancestors of this archive. The numbered parent commits collect history without changing either permanent branch. The archive concerns branches in this repository. Contributors’ forks are independent. [Cleanup record](https://github.com/1337isnot1337/solved-conjectures/issues/881)

To inspect or restore a former branch, fetch `git fetch origin tag branch-archive-2026-11-26` and look up its commit with `git show branch-archive-2026-11-26:heads.tsv`. Run `git show <commit>` to inspect it, or `git branch <local-branch> <commit>` to recreate it locally.
