#!/usr/bin/env python3
"""Prepare additive Four20 registration from immutable public-main blobs."""
from pathlib import Path
import hashlib
import json
import re
import subprocess

WORK = Path('/workspace/scratch/9d6f8c81feea')
REPO = WORK / 'coverage-work'
HOSTED = WORK / 'prime-filtering/four-hosted44601096014'
BASE = 'a1f23e44eaed1d1c51855bdaab6a3bab4221158d'
SOURCE = '8d1933b7b568515fe5bf7e8b474fe22e284521e8'
OUT = WORK / 'prime-filtering/four-registration-a1f23e44'
EVIDENCE = 'docs/verification/prime-filtering-four-exact-44601096014'

def sha(data):
    return hashlib.sha256(data).hexdigest()

def git(path, ref=BASE):
    return subprocess.check_output(['git', 'show', ref + ':' + path], cwd=REPO)

def encoded(value):
    return json.dumps(value, indent=2, sort_keys=True) + '\n'

def write(path, data):
    p = OUT / path
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_bytes(data.encode() if isinstance(data, str) else data)

def main():
    assert not OUT.exists(), 'Preserve an existing prepared registration.'
    receipt_path = HOSTED / 'artifact/receipt.json'
    receipt = json.loads(receipt_path.read_text())
    authentication = json.loads((HOSTED / 'authentication.json').read_text())
    review_path = WORK / 'coverage-four-hosted-independent-review.json'
    assert sha(receipt_path.read_bytes()) == 'b1a3227b6ae4ebdad68c24553133ff781082593126f7b25ff86a4051700ceb10'
    assert sha(review_path.read_bytes()) == '08ae4c1fd00c8380a2b8af90022b75442775212f611078e61c38802c0dfefb8d'
    assert receipt['status'] == 'passed' and receipt['git_commit'] == SOURCE
    assert authentication['status'] == 'authenticated complete hosted pass'
    assert authentication['receipt_sha256'] == sha(receipt_path.read_bytes())
    assert receipt['full_six_speed_bound_claimed'] is False
    assert receipt['axiom_audit']['all_reachable_raw_variants_audited'] is True
    modules = receipt['project_modules']
    required = receipt['required_theorems']
    assert len(modules) == 20 and len(required) == 7

    roots_path = 'lean/Conjectures.lean'
    audit_path = 'lean/ProofAudit.lean'
    shell_path = 'scripts/verify_lean.sh'
    roots, audit, shell = (git(path).decode() for path in [roots_path, audit_path, shell_path])
    old_imports = re.findall(r'^import (\S+)$', roots, re.M)
    match = re.search(r'^modules=\(\n([\s\S]*?)^\)$', shell, re.M)
    assert match and len(re.findall(r'^modules=\(', shell, re.M)) == 1
    old_modules = match[1].split()
    required_match = re.search(r'(let required : Array Name := #\[)([\s\S]*?)(\]\s+for name in required)', audit)
    assert required_match
    old_required = re.findall(r'`([A-Za-z0-9_.]+)', required_match[2])
    assert len(old_modules) == len(set(old_modules))
    assert len(old_required) == len(set(old_required))
    additions = [m for m in modules if m not in old_modules]
    imports = [m for m in modules if m not in old_imports]
    endpoints = [n for n in required if n not in old_required]
    assert additions == imports == modules and endpoints == required
    assert all(m.startswith('Conjectures.LonelinessPrimeFiltering') for m in modules)
    for m in modules:
        path = 'lean/' + m.replace('.', '/') + '.lean'
        assert sha(git(path)) == receipt['source_sha256'][m]
        assert git(path) == git(path, SOURCE)
    for path, expected in receipt['gate_sha256'].items():
        assert sha(git(path, SOURCE)) == expected
        assert git(path) == git(path, SOURCE)

    assert roots.endswith('\n') and match[1].endswith('\n')
    new_roots = roots + ''.join('import ' + m + '\n' for m in imports)
    new_shell_body = match[1] + ''.join('  ' + m + '\n' for m in additions)
    new_shell = shell[:match.start(1)] + new_shell_body + shell[match.end(1):]
    old_body = required_match[2]
    trailing = old_body[len(old_body.rstrip()):]
    new_body = old_body.rstrip() + ',\n' + ',\n'.join('    `' + n for n in endpoints) + trailing
    new_audit = audit[:required_match.start(2)] + new_body + audit[required_match.end(2):]
    write(roots_path, new_roots)
    write(shell_path, new_shell)
    write(audit_path, new_audit)
    assert new_roots.startswith(roots)
    assert re.findall(r'^import (\S+)$', new_roots, re.M) == old_imports + imports
    assert re.search(r'^modules=\(\n([\s\S]*?)^\)$', new_shell, re.M)[1].split() == old_modules + additions
    out_required = re.findall(r'`([A-Za-z0-9_.]+)', re.search(r'let required : Array Name := #\[([\s\S]*?)\]\s+for name in required', new_audit)[1])
    assert out_required == old_required + endpoints and len(out_required) == len(set(out_required))
    assert new_shell[:match.start(1)] == shell[:match.start(1)]
    assert new_shell.endswith(shell[match.end(1):])
    assert new_audit[:required_match.start(2)] == audit[:required_match.start(2)]
    assert new_audit.endswith(audit[required_match.end(2):])
    registration = dict(base_commit=BASE, source_commit=SOURCE,
        added_imports=imports, added_prebuild_and_kernel_modules=additions,
        added_required_theorems=endpoints,
        prior_imports=len(old_imports), prior_modules=len(old_modules), prior_required=len(old_required),
        prior_entries_preserved_in_order=True, existing_import_file_preserved_as_exact_prefix=True,
        audit_body_outside_required_array_unchanged=True, shell_body_outside_modules_array_unchanged=True,
        axiom_whitelist_unchanged=True, theorem_source_bytes_unchanged=True,
        original_receipt_unchanged=True, li_registration_changed=False,
        full_six_speed_bound_claimed=False, result_directory_status_changed=False,
        merged_accepted_package_gate='Separate obligation; no merged-package pass is claimed here.')
    write(EVIDENCE + '/registration.json', encoded(registration))

    for path in sorted((HOSTED / 'artifact').rglob('*')):
        relative = path.relative_to(HOSTED / 'artifact')
        if path.is_file() and relative.parts[0] != 'lib':
            write(EVIDENCE + '/' + str(relative), path.read_bytes())
    for name in ['authentication.json', 'archive-members.json', 'run.json', 'job.json', 'artifacts.json', 'job.log']:
        write(EVIDENCE + '/' + name, (HOSTED / name).read_bytes())
    write(EVIDENCE + '/authenticate_hosted.py', (WORK / 'prime-filtering/authenticate_four_hosted.py').read_bytes())
    write(EVIDENCE + '/independent-source-controller-review.json', (WORK / 'coverage-four-independent-review.json').read_bytes())
    write(EVIDENCE + '/independent-hosted-authentication-review.json', review_path.read_bytes())
    for path, expected in receipt['gate_sha256'].items():
        data = git(path, SOURCE)
        assert sha(data) == expected
        write(EVIDENCE + '/controls/' + path, data)

    prose = '''## Four-input prime filtering, 19 November 2026

Twenty modules are registered for the four-input filtering step in the
seven-runner argument. For four natural inputs nonzero modulo seven and
any exponent `m`, the theorem gives `1 <= j <= 5` and `0 <= k <= 6` such
that `j + k*7^m` is coprime to `7^(m+1)` and each actual folded residue
is at least `7^m`. Every input divisible by seven keeps its full residue
relative to multiplication by `j`. Repeated inputs are allowed.

The finite quotient sampling, symmetry reduction, ten canonical decision
checks and natural arithmetic transport are all proved. No finite-check
hypothesis remains. The higher-family seed must still be safe under the
selected multiplier `j`; this component does not supply that seed or prove
the unrestricted six-speed runner theorem. The five-input lower-level
case also remains outside this component.

[Run 44601096014](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44601096014)
at `8d1933b7b568515fe5bf7e8b474fe22e284521e8` passed 20 fresh strict
source checks, four literal contracts, all seven required endpoints,
the complete owned and raw-occurrence audit, and 20 exact singleton
stock-kernel replays. The audit covers 133 declarations and 97 theorems.
Its closed raw dependency graph has 5,101 nodes and 70,060 edges, with
only `propext`, `Classical.choice`, and `Quot.sound`. All 128 original
artifact members and exact source, object, import, control, log and profile
bindings were independently authenticated.

[Original evidence and exact scope](verification/prime-filtering-four-exact-44601096014/README.md).
All prior accepted entries, verification code and the axiom whitelist are
preserved. No result-directory completion status changes. The full merged
accepted-package gate remains a separate obligation.
'''
    for path in ['docs/lean-status.md', 'docs/formalization.md']:
        old = git(path).decode()
        write(path, old + ('\n' if old.endswith('\n') else '\n\n') + prose)
    history = '''## 2026-11-19 — Four-input prime filtering

Registered 20 modules after the complete hosted source, literal-statement,
owned/raw-occurrence audit and stock-kernel gate passed. Ten canonical
finite checks now give an unconditional arithmetic filter for four inputs
nonzero modulo seven, with actual folded bounds and higher-residue
preservation relative to one of the multipliers 1 through 5.
The unrestricted six-speed runner theorem remains pending.
[Scope and original evidence](docs/verification/prime-filtering-four-exact-44601096014/README.md).

'''
    old_history = git('HISTORY.md').decode()
    assert old_history.startswith('# History\n\n')
    write('HISTORY.md', '# History\n\n' + history + old_history[len('# History\n\n'):])
    readme = '''# Four-input filtering: original complete hosted evidence

This directory preserves the original evidence from
[run 44601096014](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44601096014),
job `135832394504`, source `8d1933b7b568515fe5bf7e8b474fe22e284521e8`.
The unchanged receipt is [receipt.json](receipt.json); the artifact checks
and independent review are [authentication.json](authentication.json) and
[independent-hosted-authentication-review.json](independent-hosted-authentication-review.json).

Artifact `14570031426` has ZIP SHA-256
`35b10512afd9074fba2bb8d32e05f64e4219ed29d5169cf07aa7e54fd0508492`.
The original receipt SHA-256 is
`b1a3227b6ae4ebdad68c24553133ff781082593126f7b25ff86a4051700ceb10`.
All 128 archive members are recorded in [archive-members.json](archive-members.json).
Every textual source, control, literal contract, generated audit, inventory,
log and process profile keeps its original bytes. Compiled objects are
recorded by digest; they are not committed as binaries.

## The proved statement

For any four natural inputs nonzero modulo seven, and any positive natural
`M`, some `j + k*M`, with `1 <= j <= 5` and `0 <= k <= 6`, makes all four
quotient digits modulo seven avoid zero and six. Taking `M = 7^m` gives a
multiplier coprime to `7^(m+1)` and literal folded residues at least `7^m`.
Every input divisible by seven has the same full residue as after
multiplication by `j`. The correction does not preserve the original
higher residues without that `j` factor. A later seed must handle it.

The proof uses finite quotient sampling, residue symmetries, ten canonical
decision checks and exact natural division identities. All ten checks are
proved with kernel-checkable decision procedures. The arbitrary-input
endpoint has no remaining computational hypothesis. This is a component
of the known argument in Barajas and Serra,
[*The lonely runner with seven runners*](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v15i1r48/pdf),
Electronic Journal of Combinatorics 15 (2008), R48, DOI 10.37236/772.
The full six-speed runner theorem remains pending.

## Verification and registration

All 20 exact project modules were freshly compiled with strict warnings.
Four literal contracts and all seven required endpoints passed. The audit
covers 133 owned declarations, including 97 theorems and no private
declarations. Only `propext`, `Classical.choice` and `Quot.sound` occur.
The raw-occurrence helper scans complete private import data at trust
level zero and validates a closed graph of 5,101 nodes and 70,060 edges.
The 17 differing serialized theorem families indexed among all imports
are outside that reached graph; no reachable alternate body was omitted.
Each project module then passed as the sole stock-kernel replay target.

[registration.json](registration.json) lists the exact additions: 20
imports and replay/prebuild targets, plus seven theorem requirements.
Previous entries and their order, the verification bodies and the axiom
whitelist remain intact. The independent source/controller review preserves
the coordinated proof's contribution and exact statement scope. This
registration changes no Li requirement or result-directory completion flag.
The merged accepted-package gate remains a separate obligation.
'''
    write(EVIDENCE + '/README.md', readme)
    write(EVIDENCE + '/prepare_registration.py', Path(__file__).read_bytes())
    saved = {str(p.relative_to(OUT / EVIDENCE)): dict(bytes=p.stat().st_size, sha256=sha(p.read_bytes()))
        for p in sorted((OUT / EVIDENCE).rglob('*')) if p.is_file()}
    write(EVIDENCE + '/preservation.json', encoded(dict(original_source=SOURCE,
        original_artifact=14570031426, original_receipt_sha256=authentication['receipt_sha256'],
        preserved_files=saved)))
    files = [dict(path=str(p.relative_to(OUT)), sha256=sha(p.read_bytes()), bytes=p.stat().st_size)
        for p in sorted(OUT.rglob('*')) if p.is_file()]
    manifest = dict(base_commit=BASE, source_commit=SOURCE, evidence_prefix=EVIDENCE,
        preparation_script_sha256=sha(Path(__file__).read_bytes()), invariants=registration,
        files=files, counts=dict(new_modules=len(additions), new_required=len(endpoints),
        files=len(files), bytes=sum(f['bytes'] for f in files)))
    target = WORK / 'prime-filtering/four-registration-manifest.json'
    target.write_text(encoded(manifest))
    print(encoded(dict(manifest=str(target), manifest_sha256=sha(target.read_bytes()),
        counts=manifest['counts'], invariants=registration)))

if __name__ == '__main__':
    main()
