// Independent replay for literal cyclic boundary certificates.
// Enumerates distinct local unions, independently of the cover-zeta producer.
// This is an audit aid; only the Lean checker and its kernel proof are trusted.
#include <array>
#include <bit>
#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using Bits = std::array<unsigned long long, 12>;

int compress(int value, const std::vector<int> &positions) {
  int result = 0;
  for (int j = 0; j < static_cast<int>(positions.size()); ++j)
    if ((value >> positions[j]) & 1) result |= 1 << j;
  return result;
}

int main(int argc, char **argv) {
  if (argc != 3) return 1;
  const int n = std::atoi(argv[1]), width = std::atoi(argv[2]);
  if (n < 7 || n > 10 || width < 4 || width > 5) return 2;
  std::vector<int> core, boundary;
  int core_mask = 0;
  for (int j = 0; j < width; ++j) {
    core.push_back((3 + j) % n);
    core_mask |= 1 << core.back();
  }
  for (int j = 0; j < n; ++j)
    if (!((core_mask >> j) & 1)) boundary.push_back(j);
  const int boundary_count = 1 << boundary.size();
  int ternary_count = 1;
  for (size_t j = 0; j < boundary.size(); ++j) ternary_count *= 3;
  std::vector<Bits> admissible(boundary_count);
  for (int t = 0; t < boundary_count; ++t)
    for (int code = 0; code < ternary_count; ++code) {
      int digits = code;
      bool ok = true;
      for (size_t j = 0; j < boundary.size(); ++j) {
        const int digit = digits % 3;
        digits /= 3;
        if ((digit == 0 && ((t >> j) & 1)) ||
            (digit == 2 && !((t >> j) & 1))) ok = false;
      }
      if (ok) admissible[t][code / 64] |= 1ULL << (code % 64);
    }

  int verified = 0, failed = 0;
  std::string line;
  while (std::getline(std::cin, line)) {
    std::istringstream input(line);
    std::vector<int> unions{0}, letters;
    std::vector<bool> seen(1 << n, false);
    seen[0] = true;
    const int tiles[] = {7, 11, 13, 15};
    for (int p = 0; p < width + 3; ++p) {
      int letter;
      if (!(input >> letter) || letter < 0 || letter > 15) return 3;
      letters.push_back(letter);
      for (int j = 0; j < 4; ++j)
        if ((letter >> j) & 1) {
          int generator = 0;
          for (int bit = 0; bit < 4; ++bit)
            if ((tiles[j] >> bit) & 1) generator |= 1 << ((p + bit) % n);
          if (!(generator & core_mask)) continue;
          const auto initial = unions.size();
          for (size_t i = 0; i < initial; ++i) {
            const int next = unions[i] | generator;
            if (!seen[next]) {
              seen[next] = true;
              unions.push_back(next);
            }
          }
        }
    }
    for (int j = n; j < width + 3; ++j)
      if (letters[j] != letters[j - n]) return 8;
    char separator;
    if (!(input >> separator) || separator != ':') return 4;
    std::vector<int> weights(width);
    int total = 0;
    for (int &v : weights) {
      if (!(input >> v) || v < 0 || v > 3) return 5;
      total += v;
    }
    if (total == 0) return 6;
    std::vector<Bits> possible(1 << width);
    for (const int u : unions) {
      const int inside = compress(u, core), outside = compress(u, boundary);
      for (size_t k = 0; k < possible[inside].size(); ++k)
        possible[inside][k] |= admissible[outside][k];
    }
    std::array<int, 729> balances{};
    for (int inside = 0; inside < (1 << width); ++inside) {
      int value = -total;
      for (int j = 0; j < width; ++j)
        if ((inside >> j) & 1) value += 2 * weights[j];
      for (size_t k = 0; k < possible[inside].size(); ++k)
        for (auto bits = possible[inside][k]; bits; bits &= bits - 1)
          balances[64 * k + std::countr_zero(bits)] += value;
    }
    bool valid = true;
    for (int j = 0; j < ternary_count; ++j)
      if (balances[j] < 0) valid = false;
    if (valid) ++verified;
    else {
      ++failed;
      std::cout << line << '\n';
    }
  }
  std::cerr << "verified=" << verified << " failed=" << failed << '\n';
  return failed ? 7 : 0;
}
