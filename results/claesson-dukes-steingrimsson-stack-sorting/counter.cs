using System;
using System.Collections.Generic;

// PowerShell 7: Add-Type -Path ./counter.cs
// [CdsNearTopCounter]::Run()
// The three output columns are exposed generic count, free gaps, signed orders.
public sealed class CdsNearTopCounter
{
    private const int LowCount = 4;
    private const int HighCount = 7;
    private const int MarkCount = LowCount + HighCount;
    private const int GapCount = MarkCount + 1;
    private const int MaxExposed = 3 + 2 + 1;
    private const int HighOffset = LowCount + MaxExposed;

    private sealed class Trace
    {
        public readonly int[] Released = new int[4];
        public readonly int[] Extra = new int[4];
        public readonly bool[] MaxLast = new bool[4];
    }

    private struct Event
    {
        public int Bottom;
        public int Round;
        public int Mask;
        public int Zero;
        public int Limit;
    }

    private readonly Dictionary<int, Trace> traces = new Dictionary<int, Trace>();
    private readonly int[] tags = new int[MarkCount];
    private readonly int[] highPrefix = new int[GapCount];
    private readonly int[] highGap = new int[GapCount];
    private readonly Event[,] candidates = new Event[LowCount + 1, 4];
    private readonly int[] candidateCounts = new int[LowCount + 1];
    private readonly Event[] chosen = new Event[LowCount];
    private readonly int[] remaining = new int[LowCount];
    private readonly int[] lengths = new int[GapCount];
    private readonly int[] bitCount = new int[1 << GapCount];
    private readonly int[] bitIndex = new int[1 << GapCount];
    private readonly int[] genericOrder = new int[MaxExposed];
    private readonly int[] word = new int[MarkCount + MaxExposed];
    private readonly int[] current = new int[MarkCount + MaxExposed];
    private readonly int[] next = new int[MarkCount + MaxExposed];
    private readonly int[] stack = new int[MarkCount + MaxExposed];
    private readonly long[,] result = new long[MaxExposed + 1, GapCount + 1];
    private readonly long[] factorial = { 1, 1, 2, 6, 24, 120, 720 };
    private int orderCount;
    private int orderLimit;

    public static void Run(int orderLimit = 0)
    {
        var counter = new CdsNearTopCounter { orderLimit = orderLimit };
        for (int mask = 1; mask < counter.bitCount.Length; ++mask)
        {
            int lowBit = mask & -mask;
            counter.bitCount[mask] = counter.bitCount[mask ^ lowBit] + 1;
        }
        for (int i = 0; i < GapCount; ++i)
            counter.bitIndex[1 << i] = i;

        counter.GenerateMarks(0, 0);
        Console.WriteLine("marked orders: " + counter.orderCount);
        Console.WriteLine("exposed,free,signed_orders");
        for (int e = 0; e <= MaxExposed; ++e)
            for (int u = 0; u <= GapCount; ++u)
                if (counter.result[e, u] != 0)
                    Console.WriteLine(e + "," + u + "," + counter.result[e, u]);
    }

    private void GenerateMarks(int depth, int used)
    {
        if (orderLimit != 0 && orderCount >= orderLimit)
            return;
        if (depth == MarkCount)
        {
            ++orderCount;
            CountOrder();
            return;
        }

        for (int mark = 1; mark <= MarkCount; ++mark)
        {
            int bit = 1 << (mark - 1);
            if ((used & bit) != 0)
                continue;
            tags[depth] = mark;
            bool high = mark > LowCount;
            highGap[depth + 1] = highGap[depth] + (high ? 1 : 0);
            highPrefix[depth + 1] = high ? (highPrefix[depth] << 3) | (mark - LowCount)
                : highPrefix[depth];
            GenerateMarks(depth + 1, used | bit);
        }
    }

    // A shadow word keeps a single token for each original high-to-high gap.
    // Once a gap moves past the last high tag it stays there in the shadow.
    private static List<int> ShadowMap(List<int> word, bool remove, out int removed)
    {
        int maximum = 0;
        int position = -1;
        for (int i = 0; i < word.Count; ++i)
        {
            if (word[i] > maximum)
            {
                maximum = word[i];
                position = i;
            }
        }

        if (position == -1)
        {
            removed = 0;
            return word;
        }

        int discarded;
        var left = ShadowMap(word.GetRange(0, position), false, out discarded);
        var right = ShadowMap(word.GetRange(position + 1, word.Count - position - 1),
            remove, out removed);
        left.AddRange(right);
        if (remove)
            ++removed;
        else
            left.Add(maximum);
        return left;
    }

    private Trace GetTrace(int highKey, int count)
    {
        Trace trace;
        if (traces.TryGetValue(highKey, out trace))
            return trace;

        var shadow = new List<int>();
        shadow.Add(-1);
        for (int i = 0; i < count; ++i)
        {
            shadow.Add((highKey >> (3 * (count - i - 1))) & 7);
            shadow.Add(-i - 2);
        }

        trace = new Trace();
        int extra = 0;
        for (int r = 0; r <= 3; ++r)
        {
            int maximum = 0;
            int lastHigh = 0;
            int released = 0;
            for (int i = shadow.Count - 1; i >= 0; --i)
            {
                int item = shadow[i];
                if (item > 0)
                {
                    if (lastHigh == 0)
                        lastHigh = item;
                    maximum = Math.Max(maximum, item);
                }
                else if (lastHigh == 0)
                    released |= 1 << (-item - 1);
            }

            trace.Extra[r] = extra;
            trace.Released[r] = released;
            trace.MaxLast[r] = lastHigh != 0 && lastHigh == maximum;
            if (lastHigh == 0)
                break;

            int removed;
            shadow = ShadowMap(shadow, true, out removed);
            extra += removed - 1;
        }

        traces.Add(highKey, trace);
        return trace;
    }

    private void CountOrder()
    {
        Array.Clear(candidateCounts, 0, candidateCounts.Length);
        bool any = false;
        for (int end = MarkCount - 4; end < MarkCount; ++end)
        {
            int b = tags[end];
            if (b > LowCount)
                continue;

            int budget = LowCount - b;
            for (int i = end + 1; i < MarkCount; ++i)
                if (tags[i] > b)
                    --budget;
            if (budget < 0)
                continue;

            Trace trace = GetTrace(highPrefix[end], highGap[end]);
            for (int r = 0; r <= budget; ++r)
            {
                if (!trace.MaxLast[r] || trace.Extra[r] > budget)
                    continue;

                int released = trace.Released[r];
                int justReleased = released & ~(r == 0 ? 0 : trace.Released[r - 1]);
                int available = budget - trace.Extra[r];
                for (int i = 0; i < end; ++i)
                {
                    if (tags[i] <= b || tags[i] > LowCount)
                        continue;
                    int group = 1 << highGap[i];
                    if ((justReleased & group) != 0)
                    {
                        available = -1;
                        break;
                    }
                    if ((released & group) != 0)
                        --available;
                }
                if (available < 0)
                    continue;

                int mask = ((1 << GapCount) - 1) ^ ((1 << (end + 1)) - 1);
                int zero = 0;
                for (int i = 0; i <= end; ++i)
                {
                    int group = 1 << highGap[i];
                    if ((released & group) != 0)
                        mask |= 1 << i;
                    if ((justReleased & group) != 0)
                        zero |= 1 << i;
                }

                candidates[b, candidateCounts[b]++] = new Event {
                    Bottom = b, Round = r, Mask = mask, Zero = zero, Limit = available
                };
                any = true;
            }
        }
        if (any)
            ChooseEvents(1, 0, 0, 0, true);
    }

    // Inclusion-exclusion over witness values. The absorption rounds for a fixed
    // value are disjoint, so at most one event per value is chosen.
    private void ChooseEvents(int b, int count, int mask, int zero, bool allInitial)
    {
        if (b > LowCount)
        {
            if (count == 0)
                return;
            for (int i = 0; i < count; ++i)
                remaining[i] = chosen[i].Limit;
            ChooseLengths(mask & ~zero, count, 0, GapCount - bitCount[mask], allInitial);
            return;
        }

        ChooseEvents(b + 1, count, mask, zero, allInitial);
        for (int i = 0; i < candidateCounts[b]; ++i)
        {
            Event e = candidates[b, i];
            chosen[count] = e;
            ChooseEvents(b + 1, count + 1, mask | e.Mask, zero | e.Zero,
                allInitial && e.Round == 0);
        }
    }

    private void ChooseLengths(int undecided, int count, int exposed, int free, bool allInitial)
    {
        if (undecided == 0)
        {
            long accepted = allInitial ? factorial[exposed] : ChooseOrder(0, 0, exposed, count);
            result[exposed, free] += (count % 2 == 1) ? accepted : -accepted;
            return;
        }

        int bit = undecided & -undecided;
        int index = bitIndex[bit];
        undecided ^= bit;

        int limit = MaxExposed - exposed;
        for (int i = 0; i < count; ++i)
            if ((chosen[i].Mask & bit) != 0)
                limit = Math.Min(limit, remaining[i]);

        ChooseLengths(undecided, count, exposed, free, allInitial);
        for (int size = 1; size <= limit; ++size)
        {
            lengths[index] = size;
            for (int i = 0; i < count; ++i)
                if ((chosen[i].Mask & bit) != 0)
                    --remaining[i];
            ChooseLengths(undecided, count, exposed + size, free, allInitial);
        }
        lengths[index] = 0;
        for (int i = 0; i < count; ++i)
            if ((chosen[i].Mask & bit) != 0)
                remaining[i] += limit;
    }

    private long ChooseOrder(int depth, int used, int exposed, int count)
    {
        if (depth == exposed)
        {
            int length = 0;
            int generic = 0;
            for (int i = 0; i < GapCount; ++i)
            {
                for (int j = 0; j < lengths[i]; ++j)
                    word[length++] = genericOrder[generic++];
                if (i < MarkCount)
                {
                    int mark = tags[i];
                    word[length++] = mark <= LowCount ? mark : mark - LowCount + HighOffset;
                }
            }

            for (int i = 0; i < count; ++i)
                if (chosen[i].Round != 0 && !TestEvent(chosen[i], length))
                    return 0;
            return 1;
        }

        long accepted = 0;
        for (int rank = 0; rank < exposed; ++rank)
        {
            int bit = 1 << rank;
            if ((used & bit) != 0)
                continue;
            genericOrder[depth] = LowCount + rank + 1;
            accepted += ChooseOrder(depth + 1, used | bit, exposed, count);
        }
        return accepted;
    }

    // A pass without flushing the stack outputs exactly p(X).
    private bool TestEvent(Event e, int length)
    {
        int size = 0;
        int i = 0;
        for (; word[i] != e.Bottom; ++i)
            if (word[i] > e.Bottom)
                current[size++] = word[i];
        int excess = 0;
        for (++i; i < length; ++i)
            if (word[i] > e.Bottom)
                ++excess;

        int[] input = current;
        int[] output = next;
        for (int r = 0; r <= e.Round; ++r)
        {
            int height = 0;
            int emitted = 0;
            for (int j = 0; j < size; ++j)
            {
                int value = input[j];
                while (height > 0 && stack[height - 1] < value)
                    output[emitted++] = stack[--height];
                stack[height++] = value;
            }
            if (height == 1)
                return r == e.Round && excess <= LowCount - e.Bottom;
            if (height == 0)
                return false;
            excess += height - 1;
            if (excess > LowCount - e.Bottom)
                return false;

            size = emitted;
            int[] oldInput = input;
            input = output;
            output = oldInput;
        }
        return false;
    }
}
