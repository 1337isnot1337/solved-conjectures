// Read start-site rule masks for tiles 012, 013, 023, 0123.
// Print the words for which our local weights fail to certify abundance.
#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using Vector = std::array<int, 16>;
bool below(const Vector &a, const Vector &b, int width) {
  for (int i = 0; i < width; ++i)
    if (a[i] > b[i])
      return false;
  return true;
}
void retain(std::vector<Vector> &constraints, const Vector &row, int width) {
  for (const auto &c : constraints)
    if (below(c, row, width))
      return;
  std::erase_if(constraints,
                [&](const Vector &c) { return below(row, c, width); });
  constraints.push_back(row);
}
bool accepts(const Vector &weights, const std::vector<Vector> &rows,
             int width) {
  for (const auto &row : rows) {
    int score = 0;
    for (int j = 0; j < width; ++j)
      score += row[j] * weights[j];
    if (score < 0)
      return false;
  }
  return true;
}
bool certificate(const std::vector<int> &word, int width, Vector &weights) {
  int tiles[] = {7, 11, 13, 15};
  int inside = (1 << width) - 1;
  int cells = width + 6;
  std::vector<int> cover(1 << cells);
  for (int i = 0; i < (int)word.size(); ++i)
    for (int j = 0; j < 4; ++j)
      if (word[i] >> j & 1) {
        int t = tiles[j] << i;
        if (t & (inside << 3))
          cover[t] = t;
      }
  for (int b = 1; b < (1 << cells); b *= 2)
    for (int i = 0; i < (1 << cells); i += 2 * b)
      for (int j = 0; j < b; ++j)
        cover[i + j + b] |= cover[i + j];
  std::vector<Vector> rows;
  for (int e = 0; e < 64; ++e) {
    std::array<Vector, 64> sums{};
    int outside = (e & 7) | ((e >> 3) << (width + 3));
    for (int s = 0; s <= inside; ++s) {
      int actual = cover[outside | (s << 3)];
      if (((actual >> 3) & inside) != s)
        continue;
      int covered = (actual & 7) | ((actual >> (width + 3)) << 3);
      for (int j = 0; j < width; ++j)
        sums[covered][j] += ((s >> j & 1) * 2 - 1);
    }
    // Sum over covered boundary supersets of each required mask.
    for (int bit = 1; bit < 64; bit *= 2)
      if (e & bit) {
        int rest = e ^ bit;
        for (int m = rest;; m = (m - 1) & rest) {
          for (int j = 0; j < width; ++j)
            sums[m][j] += sums[m | bit][j];
          if (!m)
            break;
        }
      }
    for (int m = e;; m = (m - 1) & e) {
      retain(rows, sums[m], width);
      if (!m)
        break;
    }
  }
  for (int m = 1; m <= inside; ++m) {
    for (int j = 0; j < width; ++j)
      weights[j] = m >> j & 1;
    if (accepts(weights, rows, width))
      return true;
  }
  // Test additional small integer weights when the window is short.
  if (width <= 7)
    for (int m = 1; m < (1 << (2 * width)); ++m) {
      for (int j = 0; j < width; ++j)
        weights[j] = (m >> (2 * j)) & 3;
      if (accepts(weights, rows, width))
        return true;
    }
  return false;
}
int main(int argc, char **argv) {
  if (argc != 2)
    return 1;
  int width = std::atoi(argv[1]);
  if (width < 1 || width > 16)
    return 1;
  std::string line;
  while (std::getline(std::cin, line)) {
    std::istringstream input(line);
    std::vector<int> word;
    int a;
    while (input >> a)
      word.push_back(a);
    if ((int)word.size() != width + 3)
      return 2;
    Vector weights{};
    if (certificate(word, width, weights)) {
      std::cout << line << " :";
      for (int j = 0; j < width; ++j)
        std::cout << ' ' << weights[j];
      std::cout << '\n';
    } else
      std::cout << line << '\n';
  }
}
