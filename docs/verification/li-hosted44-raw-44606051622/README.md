# Li44 hosted raw-occurrence verification evidence

The [run 44606051622, job 135849912826](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44606051622/job/135849912826)
passed against the exact 44 compiled objects from the original Li44 source
gate. The literal-contract recheck took 2.757 seconds; the raw audit took
77.718 seconds. It covers 1,247 owned declarations/serialized occurrences,
17,647 reachable dependency nodes and 316,338 edges. It indexed 22 differing
theorem bodies globally; none was reachable from those owned roots. No
additional variant alias check was therefore required or reported. The
trust-zero checked-kernel negative control was rejected. The only axioms
were `propext`, `Classical.choice`, and `Quot.sound`.

The exact original receipt, generated audit and literal source, verifier
controls, process profiles, baseline authentication, and independent reviews
are preserved as UTF-8 files. Forty-four proof sources are stored once in the
[baseline evidence](../li-exact-44599210697/README.md); the manifest maps their
original raw-artifact names to those identical copies. The 44 binary proof
objects remain available in the original hosted artifacts and are bound by
their original hashes. The supplement retained, and did not repeat, the
original 44 source compilations and 44 stock-kernel replays.

The full declaration inventory and raw audit log are stored as deterministic
gzip followed by base64. Their exact original, compressed, and encoded hashes
and sizes are in `manifest.json`. The gzip header has timestamp zero and no
filename. These files decode to the original bytes; they are not summaries.

From the repository root, verify and decode them with:

```sh
python3 - <<'PY'
from pathlib import Path
import base64, gzip, hashlib, json
root = Path('docs/verification/li-hosted44-raw-44606051622')
manifest = json.loads((root / 'manifest.json').read_text())
sha = lambda data: hashlib.sha256(data).hexdigest()
for name, record in manifest['compressed_original_members'].items():
    encoded = Path(record['stored_path']).read_bytes()
    assert len(encoded) == record['stored_bytes']
    assert sha(encoded) == record['stored_sha256']
    compressed = base64.decodebytes(encoded)
    assert len(compressed) == record['gzip_bytes']
    assert sha(compressed) == record['gzip_sha256']
    original = gzip.decompress(compressed)
    assert len(original) == record['bytes']
    assert sha(original) == record['sha256']
    target = Path('restored-li44-raw') / name
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(original)
    print(name, record['sha256'])
PY
```

The raw artifact is `14569498196`; its archive SHA-256 is
`7ea288555021d503775aa3886fc59edc65ae9a096ca26bb9add7e9950b1e1489`.
Backup artifact `14569584489` retains the exact original baseline ZIP;
its SHA-256 is
`dfbb03a7571256df786f9c28f45b306cb924f89403ba403d81063072e6f1eb2f`.
The six-member backup's five text files are preserved under `baseline-backup/`.
The omitted member is the original binary ZIP itself, whose hash and public
artifact identity are recorded. All original receipt bytes are unchanged.

The authentication scripts and review scripts are historical execution
records with their original workspace paths. The supported reproduction
commands are in [the Lean scope document](../../../results/li-coefficient-sign/LEAN.md).
