// Independently replay witnesses by taking all local generator unions.
#include <array>
#include <bit>
#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using Bits =
    std::array<unsigned long long, 12>; // 729 ternary boundary assignments.
int main(int argc, char **argv) {
  if (argc != 2)
    return 1;
  int w = std::atoi(argv[1]);
  if (w != 4 && w != 5)
    return 2;
  int core = (1 << w) - 1;
  std::array<Bits, 64> admissible{};
  for (int t = 0; t < 64; t++)
    for (int code = 0; code < 729; code++) {
      int digits = code;
      bool ok = true;
      for (int j = 0; j < 6; j++) {
        int digit = digits % 3;
        digits /= 3;
        if ((digit == 0 && (t >> j & 1)) || (digit == 2 && !(t >> j & 1)))
          ok = false;
      }
      if (ok)
        admissible[t][code / 64] |= 1ULL << (code % 64);
    }
  int verified = 0;
  std::string line;
  while (std::getline(std::cin, line)) {
    std::istringstream in(line);
    std::vector<int> unions{0};
    std::vector<bool> seen(1 << (w + 6), false);
    seen[0] = true;
    const std::array<std::vector<int>, 4> offsets{
        {{0, 1, 2}, {0, 1, 3}, {0, 2, 3}, {0, 1, 2, 3}}};
    for (int p = 0; p < w + 3; p++) {
      int letter;
      if (!(in >> letter) || letter < 0 || letter > 15)
        return 3;
      for (int j = 0; j < 4; j++)
        if (letter >> j & 1) {
          int g = 0;
          for (auto v : offsets[j])
            g |= 1 << (p + v);
          if (!(g & (core << 3)))
            continue;
          auto initial = unions.size();
          for (size_t i = 0; i < initial; i++) {
            int h = unions[i] | g;
            if (!seen[h]) {
              seen[h] = true;
              unions.push_back(h);
            }
          }
        }
    }
    char separator;
    if (!(in >> separator) || separator != ':')
      return 4;
    std::vector<int> weights(w);
    int total = 0;
    for (int &v : weights) {
      if (!(in >> v) || v < 0 || v > 3)
        return 5;
      total += v;
    }
    if (total == 0)
      return 6;
    std::vector<Bits> possible(core + 1);
    for (int u : unions) {
      int s = (u >> 3) & core, t = (u & 7) | ((u >> (w + 3)) << 3);
      for (int k = 0; k < 12; k++)
        possible[s][k] |= admissible[t][k];
    }
    std::array<int, 729> balances{};
    for (int s = 0; s <= core; s++) {
      int value = -total;
      for (int j = 0; j < w; j++)
        if (s >> j & 1)
          value += 2 * weights[j];
      for (int k = 0; k < 12; k++)
        for (auto b = possible[s][k]; b; b &= b - 1)
          balances[64 * k + std::countr_zero(b)] += value;
    }
    for (int v : balances)
      if (v < 0) {
        std::cerr << line << '\n';
        return 7;
      }
    verified++;
  }
  std::cout << verified;
}
