// Finite calculations used in the proof for the differences {1,k,k+5}.
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
constexpr int width = 5;
constexpr int word_mask = (1 << width) - 1;
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

// Each word stores five consecutive bits, oldest first (most significant bit).
// Digit i of a column is the bit in row i, starting with the lower-numbered
// row.
struct Strip {
  int rows;
  std::vector<State> states;
  std::map<State, int> index;
  std::vector<std::vector<Transition>> outgoing;

  explicit Strip(int row_count) : rows(row_count) {
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
        return; // Difference k+5.
      next[row] = ((old[row] << 1) & word_mask) | bit;
    }
    for (int row = 0; row + 1 < rows; ++row) {
      int lower = (column >> row) & 1;
      int upper = (column >> (row + 1)) & 1;
      int e =
          3 - std::popcount(static_cast<unsigned>(old[row])) - lower - upper;
      int f = 3 - std::popcount(static_cast<unsigned>(old[row + 1])) - upper -
              (old[row] >> (width - 1));
      require(e >= 0 && f >= 0, "negative cycle deficit");
      cost[row] = e + f;
    }
    outgoing[i].push_back({index.at(next), column, cost});
  }
};

void check_zero_runs(const Strip &graph) {
  const auto count = graph.states.size();
  require(count == 99, "wrong two-row state count");
  std::vector<bool> reachable(count, true), extendible(count, true);
  for (int length = 0; length < 3; ++length) {
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
  require(middle.size() == 7, "wrong number of middle states");
  int s = middle.front();
  for (int step = 1; step <= 7; ++step) {
    std::vector<int> successors;
    for (auto e : graph.outgoing[s])
      if (e.cost[0] == 0 &&
          std::binary_search(middle.begin(), middle.end(), e.destination))
        successors.push_back(e.destination);
    require(successors.size() == 1, "zero-cost successor is not unique");
    s = successors.front();
    require((s == middle.front()) == (step == 7), "wrong zero cycle length");
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
} // namespace

int main() {
  Strip two(2), three(3);
  require(three.states.size() == 827, "wrong three-row state count");
  check_zero_runs(two);
  constexpr std::array<int, 7> loss{4, 0, 3, 5, 2, 5, 1};
  int checked = 0;
  for (int k = 6; k <= 1600; ++k) {
    int residue = k % 7;
    if (residue == 1 || k == 7 || k == 12)
      continue;
    bool long_strip = residue == 3;
    int extra = long_strip ? 5 : 6;
    int period = (long_strip ? 2 : 1) * k + extra;
    PrefixTest test{long_strip ? three : two, two,  k, period,
                    2 * loss[residue],        extra};
    if (test.feasible())
      throw std::runtime_error("unexpected path at k=" + std::to_string(k));
    if (k <= 20) {
      ++test.budget;
      require(test.feasible(), "relaxed control unexpectedly rejected");
    }
    ++checked;
  }
  require(checked == 1365, "wrong number of parameter cases");
  std::cout
      << "Verified the seven-state cycle, " << checked
      << " strict prefix exclusions, and the relaxed positive controls.\n";
}
