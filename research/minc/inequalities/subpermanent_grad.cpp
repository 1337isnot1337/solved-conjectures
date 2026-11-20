#include <algorithm>
#include <cstdint>
#include <vector>

// Rook-polynomial dynamic program and reverse derivative. No network access.
extern "C" void subpermanent_grad(int n, int k, const double *a,
                                   double *value, double *gradient) {
  const std::size_t size = 1ULL << n;
  std::vector<double> dp((n + 1) * size), back((n + 1) * size);
  std::vector<int> counts(size);
  for (std::size_t mask = 0; mask < size; ++mask)
    counts[mask] = __builtin_popcountll(mask);
  dp[0] = 1;
  for (int row = 0; row < n; ++row) {
    for (std::size_t mask = 0; mask < size; ++mask) {
      if (counts[mask] > std::min(row, k)) continue;
      const double current = dp[row * size + mask];
      dp[(row + 1) * size + mask] += current;
      if (counts[mask] == k) continue;
      for (int col = 0; col < n; ++col) {
        if (!(mask & (1ULL << col)))
          dp[(row + 1) * size + (mask | (1ULL << col))] +=
              current * a[row * n + col];
      }
    }
  }
  *value = 0;
  std::fill(gradient, gradient + n * n, 0.0);
  for (std::size_t mask = 0; mask < size; ++mask) {
    if (counts[mask] != k) continue;
    *value += dp[n * size + mask];
    back[n * size + mask] = 1;
  }
  for (int row = n - 1; row >= 0; --row) {
    for (std::size_t mask = 0; mask < size; ++mask) {
      if (counts[mask] > std::min(row, k)) continue;
      back[row * size + mask] += back[(row + 1) * size + mask];
      if (counts[mask] == k) continue;
      for (int col = 0; col < n; ++col) {
        if (mask & (1ULL << col)) continue;
        const double b = back[(row + 1) * size + (mask | (1ULL << col))];
        gradient[row * n + col] += b * dp[row * size + mask];
        back[row * size + mask] += b * a[row * n + col];
      }
    }
  }
}
