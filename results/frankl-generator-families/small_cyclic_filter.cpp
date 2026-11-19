// Untrusted producer of local weights for literal cycles of length 7--10.
// All tile positions are reduced modulo n before unions are counted.
// The output must be replayed independently and checked in Lean.
#include <algorithm>
#include <array>
#include <bit>
#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using Row = std::array<int, 8>;

bool below(const Row &a, const Row &b, int width) {
  for (int i = 0; i < width; ++i)
    if (a[i] > b[i]) return false;
  return true;
}

void retain(std::vector<Row> &rows, const Row &r, int width) {
  for (const auto &q : rows) if (below(q, r, width)) return;
  std::erase_if(rows, [&](const Row &q) { return below(r, q, width); });
  rows.push_back(r);
}

int expand(int x, const std::vector<int> &positions) {
  int result = 0;
  for (int j = 0; j < static_cast<int>(positions.size()); ++j)
    if ((x >> j) & 1) result |= 1 << positions[j];
  return result;
}

int compress(int x, const std::vector<int> &positions) {
  int result = 0;
  for (int j = 0; j < static_cast<int>(positions.size()); ++j)
    if ((x >> positions[j]) & 1) result |= 1 << j;
  return result;
}

bool certificate(const std::vector<int> &word, int n, int width, Row &weights) {
  const int tiles[] = {7, 11, 13, 15};
  std::vector<int> core, boundary;
  for (int j = 0; j < width; ++j) core.push_back((3 + j) % n);
  const int core_mask = expand((1 << width) - 1, core);
  for (int j = 0; j < n; ++j)
    if (!((core_mask >> j) & 1)) boundary.push_back(j);
  const int boundary_count = 1 << boundary.size();
  std::vector<int> cover(1 << n);
  for (int p = 0; p < static_cast<int>(word.size()); ++p)
    for (int j = 0; j < 4; ++j)
      if ((word[p] >> j) & 1) {
        int g = 0;
        for (int q = 0; q < 4; ++q)
          if ((tiles[j] >> q) & 1) g |= 1 << ((p + q) % n);
        if (g & core_mask) cover[g] = g;
      }
  for (int bit = 1; bit < (1 << n); bit *= 2)
    for (int base = 0; base < (1 << n); base += 2 * bit)
      for (int j = 0; j < bit; ++j) cover[base + bit + j] |= cover[base + j];

  std::vector<Row> constraints;
  for (int e = 0; e < boundary_count; ++e) {
    std::vector<Row> sums(boundary_count);
    for (int s = 0; s < (1 << width); ++s) {
      const int actual = cover[expand(s, core) | expand(e, boundary)];
      if (compress(actual, core) != s) continue;
      const int outside = compress(actual, boundary);
      for (int j = 0; j < width; ++j) sums[outside][j] += 2 * ((s >> j) & 1) - 1;
    }
    for (int bit = 1; bit < boundary_count; bit *= 2)
      if (e & bit) {
        const int rest = e ^ bit;
        for (int m = rest;; m = (m - 1) & rest) {
          for (int j = 0; j < width; ++j) sums[m][j] += sums[m | bit][j];
          if (m == 0) break;
        }
      }
    for (int m = e;; m = (m - 1) & e) {
      retain(constraints, sums[m], width);
      if (m == 0) break;
    }
  }
  auto accepts = [&]() {
    for (const auto &r : constraints) {
      int value = 0;
      for (int j = 0; j < width; ++j) value += r[j] * weights[j];
      if (value < 0) return false;
    }
    return true;
  };
  for (int code = 1; code < (1 << width); ++code) {
    for (int j = 0; j < width; ++j) weights[j] = (code >> j) & 1;
    if (accepts()) return true;
  }
  for (int code = 1; code < (1 << (2 * width)); ++code) {
    for (int j = 0; j < width; ++j) weights[j] = (code >> (2 * j)) & 3;
    if (accepts()) return true;
  }
  return false;
}

int main(int argc, char **argv) {
  if (argc != 3) return 1;
  const int n = std::atoi(argv[1]), width = std::atoi(argv[2]);
  if (n < 7 || n > 10 || width < 4 || width > 5) return 2;
  std::string line;
  while (std::getline(std::cin, line)) {
    std::istringstream input(line);
    std::vector<int> word;
    for (int letter; input >> letter;) {
      if (letter < 0 || letter > 15) return 3;
      word.push_back(letter);
    }
    if (static_cast<int>(word.size()) != width + 3) return 4;
    bool consistent = true;
    for (int j = n; j < static_cast<int>(word.size()); ++j)
      if (word[j] != word[j - n]) consistent = false;
    std::cout << line;
    if (!consistent) {
      std::cout << " : impossible\n";
      continue;
    }
    Row weights{};
    if (certificate(word, n, width, weights)) {
      std::cout << " :";
      for (int j = 0; j < width; ++j) std::cout << ' ' << weights[j];
    }
    std::cout << '\n';
  }
}
