"""Replay three standard deals from first principles, counting first return."""
from collections import deque


RANK = (
    (15, 7, 16, 8, 1, 22, 17, 9),
    (10, 2, 23, 18, 11, 19, 12, 3),
    (4, 20, 13, 5, 21, 14, 6),
)
SEAT = (
    (1, 2, 14, 3, 4, 15, 5, 6),
    (16, 17, 7, 8, 21, 9, 18),
    (10, 22, 11, 19, 20, 12, 13),
)
CLOCKWISE = (
    (35, 1, 2, 36, 24, 3, 25, 4, 5, 43, 37, 6, 38, 7, 8),
    (26, 9, 10, 44, 11, 39, 40, 27, 12, 41, 13, 28, 29, 14, 15),
    (16, 30, 31, 17, 18, 32, 19, 20, 33, 21, 22, 42, 23, 34),
)


def replay(start, policy, word, period):
    n = sum(map(len, start))
    assert sorted(card for pile in start for card in pile) == list(range(1, n+1))
    assert all(len(pile) == (n+2-i)//3 for i, pile in enumerate(start))
    piles = [deque(pile) for pile in start]
    minimum = min(map(len, piles))
    for turn in range(1, period+1):
        cards = [pile.popleft() for pile in piles]
        winner = cards.index(max(cards))
        assert winner == word[(turn-1) % len(word)]
        if policy == 'rank':
            take = sorted(cards, reverse=True)
        elif policy == 'seat':
            take = [cards[winner]] + [c for i, c in enumerate(cards) if i != winner]
        elif policy == 'clockwise':
            take = cards[winner:] + cards[:winner]
        else:
            raise ValueError(policy)
        piles[winner].extend(take)
        minimum = min(minimum, *map(len, piles))
        assert minimum > 0
        assert (tuple(map(tuple, piles)) == start) == (turn == period)
    print(f'{policy}: {n} cards, first return {period}, minimum pile size {minimum}')


if __name__ == '__main__':
    replay(RANK, 'rank', (0, 2, 1, 1, 2, 0), 90)
    replay(SEAT, 'seat', (1, 2, 0, 2, 1, 0), 180)
    replay(CLOCKWISE, 'clockwise', (0, 2, 2, 1, 0, 1, 1, 1, 2, 0, 0, 2), 19320)
