"""Connected cubic bipartite realizations of an explicit interval of integers."""

PACKET = [
    {0, 3, 4}, {0, 1, 2}, {0, 2, 5}, {2, 3, 6},
    {1, 4, 6}, {3, 4, 5}, {1, 5, 6},
]
CUBE = [set(range(4)) - {i} for i in range(4)]


def circulant(n):
    last = 2 if n == 5 else 3
    return [{i, (i+1) % n, (i+last) % n} for i in range(n)]


def splice(rows, marked, ports, block, deleted, inputs, next_row=None, outputs=()):
    """Delete one black and one white vertex and pair their listed neighbors."""
    assert set(ports) == rows[marked]
    assert set(inputs) == {i for i, row in enumerate(block) if deleted in row}
    n = len(rows)
    combined = [set(row) for i, row in enumerate(rows) if i != marked]
    for row in block:
        combined.append({n+j-int(j > deleted) for j in row if j != deleted})
    for col, idx in zip(ports, inputs):
        combined[n-1+idx].add(col)
    if next_row is None:
        return combined
    new_ports = [
        ports[inputs.index(next_row)] if j == deleted else n+j-int(j > deleted)
        for j in outputs
    ]
    return combined, n-1+next_row, new_ports


def parameters(n):
    if n < 9:
        raise ValueError("the construction starts at order nine")
    steps, remainder = divmod(n-9, 6)
    cube, index = divmod(remainder, 3)
    start, end = [(5, 5), (6, 5), (6, 6)][index]
    return steps, cube, start, end


def interval(n):
    """Endpoints in increasing order, included."""
    steps, cube, start, end = parameters(n)
    total, second = (13, 4) if start == 5 else (17, 5)
    if cube:
        second = 3*second + 1
        total *= 3
    for _ in range(steps):
        second = 2*second + 2*total
        total *= 8
    span = (1 << steps) - 1
    if end == 5:
        low = 4*total + second
        return low, low + span
    high = 6*total - second
    return high - span, high


def graph(n, value):
    """Return binary row neighbor sets whose permanent equals value."""
    steps, cube, start, end = parameters(n)
    low, high = interval(n)
    if not low <= value <= high:
        raise ValueError("value outside the constructed interval")
    offset = value-low if end == 5 else high-value
    rows, marked = circulant(start), 0
    ports = [1, 0, 2] if start == 5 else [0, 1, 3]
    if cube:
        rows, marked, ports = splice(rows, marked, ports, CUBE, 3, [1, 2, 0], 0, [2, 1, 3])
    for bit in reversed(range(steps)):
        inputs, outputs = [3, 4, 6], [2, 0, 5]
        if not (offset >> bit) & 1:
            inputs[0], inputs[1] = inputs[1], inputs[0]
            outputs[0], outputs[1] = outputs[1], outputs[0]
        rows, marked, ports = splice(rows, marked, ports, PACKET, 6, inputs, 2, outputs)
    last = 2 if end == 5 else 3
    return splice(rows, marked, ports, circulant(end), 0, [0, end-1, end-last])
