"""Generate proposal data; callers must validate each proposed bit inside Lean."""

from argparse import ArgumentParser
from hashlib import sha256
from pathlib import Path
import json
import sys

INDEX_COUNT = 1789
INDEX_MODULUS = 1861
FIELD_WIDTH = 11


def render():
    sys.set_int_max_str_digits(0)
    positions = [pow(2, index, INDEX_MODULUS) for index in range(INDEX_COUNT)]
    assert len(set(positions)) == INDEX_COUNT
    packed = sum(index << (FIELD_WIDTH * residue)
                 for index, residue in enumerate(positions))
    for index in range(INDEX_COUNT):
        mask = 1 << index
        lowbit = ((mask ^ (mask - 1)) + 1) // 2
        proposed = (packed >> (FIELD_WIDTH * (lowbit % INDEX_MODULUS))) & 2047
        assert proposed == index
    return 'import Init.Data.Nat.Bitwise\n\n/-! A finite bit-index proposal for masks below 2^1789. The caller must\ncheck the proposed bit against its actual mask. No theorem in this module\nasserts completeness or correctness of the table. -/\n\nnamespace Loneliness.FiveSpeedCertificate\n\n/-- The 11-bit field at index `2^t % 1861` contains the proposal `t`.\nThis literal is untrusted proposal data; every use is checked by the caller. -/\ndef packedBitIndexTable : Nat := ' + str(packed) + '\n\n/-- Propose a set-bit position with primitive arithmetic and a packed lookup.\nThe soundness of a consumer must not depend on this proposal being correct. -/\ndef proposedPackedFirstBit (mask : Nat) : Nat :=\n  let lowbit := ((mask ^^^ (mask - 1)) + 1) / 2\n  (packedBitIndexTable >>> (11 * (lowbit % 1861))) &&& 2047\n\nend Loneliness.FiveSpeedCertificate\n'


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    content = render()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(content)
    print(json.dumps({'file': str(args.output), 'bytes': len(content.encode()),
                      'sha256': sha256(content.encode()).hexdigest(),
                      'role': 'proposal data; completeness is not a proof premise'}))


if __name__ == '__main__':
    main()
