#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <numeric>
#include <random>
#include <vector>

// Exact diagnostic for an auxiliary C24 route, not a finite-order theorem.
// For binary d-regular B, compare min_P per(B+P) with the minimum restricted
// to P disjoint from B. B is sampled without optimizing the permanent.
using U = std::uint64_t;

U permanent(const std::vector<int>& a, int n) {
  std::vector<U> dp(1u << n, 0);
  dp[0] = 1;
  for (unsigned mask = 1; mask < dp.size(); ++mask) {
    const int row = __builtin_popcount(mask) - 1;
    for (unsigned t = mask; t; t &= t - 1) {
      const int col = __builtin_ctz(t);
      dp[mask] += U(a[row*n+col]) * dp[mask ^ (1u << col)];
    }
  }
  return dp.back();
}

int main(int argc, char** argv) {
  const int n = argc > 1 ? std::atoi(argv[1]) : 7;
  const int d = argc > 2 ? std::atoi(argv[2]) : 3;
  const int runs = argc > 3 ? std::atoi(argv[3]) : 40;
  if (n < 3 || n > 9 || d < 1 || d >= n || runs < 1) return 2;
  std::mt19937 gen(20261121);
  std::vector<int> b(n*n, 0), p(n), allp, disjointp;
  for (int i=0;i<n;++i) for (int j=0;j<d;++j) b[i*n+(i+j)%n]=1;
  std::uint64_t permutations_tested=0;
  bool average_obstruction_reported=false;
  for (int rep=0;rep<runs;++rep) {
    // Reversible degree-preserving random switches; no score or acceptance
    // criterion based on the permanent is used.
    for (int t=0;t<100*n*n;++t) {
      int i=gen()%n, j=gen()%n, r=gen()%n, s=gen()%n;
      if(i==r||j==s||!b[i*n+j]||!b[r*n+s]||b[i*n+s]||b[r*n+j]) continue;
      b[i*n+j]=b[r*n+s]=0;
      b[i*n+s]=b[r*n+j]=1;
    }
    U all=UINT64_MAX, disjoint=UINT64_MAX, overlap=UINT64_MAX;
    U disjoint_sum=0,disjoint_count=0;
    std::vector<int> overlapp;
    std::iota(p.begin(),p.end(),0);
    do {
      auto a=b;
      bool clear=true;
      for(int i=0;i<n;++i) {
        clear=clear&&!b[i*n+p[i]];
        ++a[i*n+p[i]];
      }
      const U value=permanent(a,n);
      ++permutations_tested;
      if(value<all) {all=value;allp=p;}
      if(clear&&value<disjoint) {disjoint=value;disjointp=p;}
      if(clear) {disjoint_sum+=value;++disjoint_count;}
      if(!clear&&value<overlap) {overlap=value;overlapp=p;}
    } while(std::next_permutation(p.begin(),p.end()));
    if(!average_obstruction_reported && disjoint_sum>overlap*disjoint_count) {
      average_obstruction_reported=true;
      std::cout<<"UNIFORM_AVERAGING_OBSTRUCTION n "<<n<<" d "<<d
               <<" sample "<<rep<<" min_overlap "<<overlap
               <<" disjoint_sum "<<disjoint_sum<<" disjoint_count "<<disjoint_count
               <<" min_disjoint "<<disjoint<<'\n';
      for(int i=0;i<n;++i) {
        for(int j=0;j<n;++j) std::cout<<b[i*n+j]<<' ';
        std::cout<<'\n';
      }
      std::cout<<"best overlapping P: ";for(int j:overlapp)std::cout<<j<<' ';std::cout<<'\n';
    }
    if(all<disjoint) {
      std::cout<<"AUXILIARY_COUNTEREXAMPLE n "<<n<<" d "<<d
               <<" sample "<<rep<<" min_all "<<all
               <<" min_disjoint "<<disjoint<<'\n';
      for(int i=0;i<n;++i) {
        for(int j=0;j<n;++j) std::cout<<b[i*n+j]<<' ';
        std::cout<<'\n';
      }
      std::cout<<"best P: ";for(int j:allp)std::cout<<j<<' ';std::cout<<'\n';
      std::cout<<"best disjoint P: ";for(int j:disjointp)std::cout<<j<<' ';std::cout<<'\n';
      return 0;
    }
  }
  std::cout<<"No auxiliary counterexample in "<<runs<<" sampled supports; n "
           <<n<<" d "<<d<<" permutations tested "<<permutations_tested
           <<". This is not a proof.\n";
}
