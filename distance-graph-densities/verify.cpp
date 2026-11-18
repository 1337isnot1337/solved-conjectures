// Finite calculations for the difference sets {1,k,k+s}, s = 5 or 7.
#include <algorithm>
#include <array>
#include <bit>
#include <cstdlib>
#include <iostream>
#include <map>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>

namespace {
using State = std::array<int, 3>;
using Cost = std::array<int, 2>;

void require(bool condition, const char *message) {
  if (!condition)
    throw std::runtime_error(message);
}

struct Transition {
  int destination;
  int column;
  Cost cost;
};

// Each word stores consecutive bits, oldest first (most significant bit).
// Digit i of a column is the bit in row i, starting with the lower-numbered
// row.
struct Strip {
  int rows, width, word_mask, capacity;
  std::vector<State> states;
  std::map<State, int> index;
  std::vector<std::vector<Transition>> outgoing;

  Strip(int row_count, int gap)
      : rows(row_count), width(gap), word_mask((1 << gap) - 1),
        capacity((gap + 1) / 2) {
    std::vector<int> words;
    for (int w = 0; w <= word_mask; ++w)
      if ((w & (w << 1)) == 0)
        words.push_back(w);

    for (int x : words)
      for (int y : words)
        for (int z : words) {
          if ((x & y) || (y & z) || (rows == 2 && z != 0))
            continue;
          State state{x, y, z};
          index.emplace(state, static_cast<int>(states.size()));
          states.push_back(state);
        }
    outgoing.resize(states.size());
    for (int i = 0; i < static_cast<int>(states.size()); ++i)
      for (int column = 0; column < (1 << rows); ++column)
        add_transition(i, column);
  }

  void add_transition(int i, int column) {
    if (column & (column << 1))
      return; // Difference k in the new column.
    const auto &old = states[i];
    State next = old;
    Cost cost{};
    for (int row = 0; row < rows; ++row) {
      int bit = (column >> row) & 1;
      if (old[row] & bit)
        return; // Difference 1.
      if (row > 0 && (old[row - 1] >> (width - 1)) && bit)
        return; // Difference k+width.
      next[row] = ((old[row] << 1) & word_mask) | bit;
    }
    for (int row = 0; row + 1 < rows; ++row) {
      int lower = (column >> row) & 1;
      int upper = (column >> (row + 1)) & 1;
      int e = capacity - std::popcount(static_cast<unsigned>(old[row])) -
              lower - upper;
      int f = capacity - std::popcount(static_cast<unsigned>(old[row + 1])) -
              upper - (old[row] >> (width - 1));
      require(e >= 0 && f >= 0, "negative cycle deficit");
      cost[row] = e + f;
    }
    outgoing[i].push_back({index.at(next), column, cost});
  }
};

void check_zero_runs(const Strip &graph) {
  const auto count = graph.states.size();
  require(count == (graph.width == 5 ? 99u : 577u),
          "wrong two-row state count");
  std::vector<bool> reachable(count, true), extendible(count, true);
  for (int length = 0; length < graph.capacity; ++length) {
    std::vector<bool> next(count), previous(count);
    for (size_t s = 0; s < count; ++s)
      for (auto e : graph.outgoing[s]) {
        if (e.cost[0] != 0)
          continue;
        if (reachable[s])
          next[e.destination] = true;
        if (extendible[e.destination])
          previous[s] = true;
      }
    reachable.swap(next);
    extendible.swap(previous);
  }
  std::vector<int> middle;
  for (size_t s = 0; s < count; ++s)
    if (reachable[s] && extendible[s])
      middle.push_back(static_cast<int>(s));
  require(middle.size() == static_cast<size_t>(graph.width + 2),
          "wrong number of middle states");
  int s = middle.front();
  for (int step = 1; step <= graph.width + 2; ++step) {
    std::vector<int> successors;
    for (auto e : graph.outgoing[s])
      if (e.cost[0] == 0 &&
          std::binary_search(middle.begin(), middle.end(), e.destination))
        successors.push_back(e.destination);
    require(successors.size() == 1, "zero-cost successor is not unique");
    s = successors.front();
    require((s == middle.front()) == (step == graph.width + 2),
            "wrong zero cycle length");
  }
}

struct PrefixTest {
  const Strip &strip;
  const Strip &two_rows;
  int k, period, budget, extra;

  bool finish(int state, int pos, int cost, int remembered) const {
    if (pos == extra)
      return true;
    int required = (remembered >> (extra - 1 - pos)) & 1;
    for (auto e : two_rows.outgoing[state]) {
      if ((e.column & 1) != required)
        continue;
      int next_cost = cost + e.cost[0];
      if (period * next_cost >= budget * (period - extra + pos + 1))
        continue;
      if (finish(e.destination, pos + 1, next_cost, remembered))
        return true;
    }
    return false;
  }

  bool from(int start, int first_bound) const {
    const bool three = strip.rows == 3;
    const int states = static_cast<int>(strip.states.size());
    const int memory_count = 1 << extra;
    // Key: first row-pair cost, remembered upper bits, current state.
    // Value: least last row-pair cost attainable for this key.
    std::unordered_map<int, int> paths{{start, 0}}, next;
    for (int i = 0; i < k; ++i) {
      if (paths.empty())
        return false;
      const int first_limit =
          three ? std::min(first_bound, (budget * (i + 1) - 1) / period) : 0;
      const int last_limit =
          (budget * ((three ? k : 0) + i + 1) - 1) / period - first_bound;
      next.clear();
      for (auto [key, last_cost] : paths) {
        int state = key % states;
        int remembered = (key / states) % memory_count;
        int first_cost = (key / states) / memory_count;
        for (auto e : strip.outgoing[state]) {
          int lo = first_cost + (three ? e.cost[0] : 0);
          int hi = last_cost + e.cost[strip.rows - 2];
          if (lo > first_limit || hi > last_limit)
            continue;
          int bits = remembered;
          if (i < extra)
            bits = 2 * bits + ((e.column >> (strip.rows - 1)) & 1);
          int new_key = (lo * memory_count + bits) * states + e.destination;
          auto [it, added] = next.emplace(new_key, hi);
          if (!added)
            it->second = std::min(it->second, hi);
        }
      }
      paths.swap(next);
    }
    const auto &initial = strip.states[start];
    for (auto [key, last_cost] : paths) {
      auto end = strip.states[key % states];
      if (end[0] != initial[1] || (three && end[1] != initial[2]))
        continue;
      State last_pair{end[strip.rows - 2], end[strip.rows - 1], 0};
      int bits = (key / states) % memory_count;
      if (finish(two_rows.index.at(last_pair), 0, first_bound + last_cost,
                 bits))
        return true;
    }
    return false;
  }

  bool feasible() const {
    int largest = strip.rows == 3 ? (budget * k - 1) / period : 0;
    for (int bound = 0; bound <= largest; ++bound)
      for (int start = 0; start < static_cast<int>(strip.states.size());
           ++start)
        if (from(start, bound))
          return true;
    return false;
  }
};
void check_family(int gap, int cutoff, const std::vector<int> &loss,
                  const std::vector<int> &exceptions, int expected_cases) {
  Strip two(2, gap), three(3, gap);
  check_zero_runs(two);
  int checked = 0;
  for (int k = gap + 1; k <= cutoff; ++k) {
    int residue = k % (gap + 2);
    if (residue == 1 ||
        std::find(exceptions.begin(), exceptions.end(), k) != exceptions.end())
      continue;
    bool long_strip = residue == 3;
    int extra = long_strip ? gap : gap + 1;
    int period = (long_strip ? 2 : 1) * k + extra;
    PrefixTest test{long_strip ? three : two, two,  k, period,
                    2 * loss.at(residue),     extra};
    if (test.feasible())
      throw std::runtime_error("unexpected path at k=" + std::to_string(k));
    if (k <= 20) {
      ++test.budget;
      require(test.feasible(), "relaxed control unexpectedly rejected");
    }
    ++checked;
  }
  require(checked == expected_cases, "wrong number of parameter cases");
  std::cout << "Gap " << gap << ": verified the zero-cost cycle, " << checked
            << " strict prefix exclusions, and the relaxed positive controls."
            << std::endl;
}
} // namespace

int main() {
  check_family(5, 1600, {4, 0, 3, 5, 2, 5, 1}, {7, 12}, 1365);
  check_family(7, 4000, {5, 0, 4, 7, 3, 7, 2, 6, 1},
               {9, 11, 14, 16, 18, 23, 25, 32}, 3541);
}
