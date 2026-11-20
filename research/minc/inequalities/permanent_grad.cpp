#include <complex>
#include <vector>
#include <cstdint>
using C=std::complex<double>;
extern "C" void permanent_grad(int n, const double* ar, const double* ai, double* value, double* gr, double* gi){
 size_t sz=1ULL<<n; std::vector<C> dp(sz),back(sz); dp[0]=1.;
 for(size_t mask=1;mask<sz;++mask){int r=__builtin_popcountll(mask)-1;for(int j=0;j<n;++j)if(mask&(1ULL<<j))dp[mask]+=C(ar[r*n+j],ai[r*n+j])*dp[mask^(1ULL<<j)];}
 value[0]=dp[sz-1].real();value[1]=dp[sz-1].imag();back[sz-1]=1.;std::vector<C> g(n*n);
 for(size_t mask=sz-1;mask;--mask){int r=__builtin_popcountll(mask)-1;for(int j=0;j<n;++j)if(mask&(1ULL<<j)){size_t prev=mask^(1ULL<<j);g[r*n+j]+=back[mask]*dp[prev];back[prev]+=back[mask]*C(ar[r*n+j],ai[r*n+j]);}}
 for(int ij=0;ij<n*n;++ij){gr[ij]=g[ij].real();gi[ij]=g[ij].imag();}
}
