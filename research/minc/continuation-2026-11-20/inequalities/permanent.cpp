#include <complex>
#include <vector>
#include <cstdint>
using C = std::complex<double>;
template <class T> T pg(const T* A, int n, T* grad) {
 const int z = 1<<n; std::vector<T> f(z,T(0)), b(z,T(0)); f[0]=T(1);
 for(int s=1;s<z;++s){ int i=__builtin_popcount((unsigned)s)-1;
  for(int bits=s;bits;bits&=bits-1){int j=__builtin_ctz((unsigned)bits); f[s]+=A[i*n+j]*f[s^(1<<j)];}}
 if(grad){for(int i=0;i<n*n;++i)grad[i]=T(0); b[z-1]=T(1);
  for(int s=z-1;s>0;--s){int i=__builtin_popcount((unsigned)s)-1;
   for(int bits=s;bits;bits&=bits-1){int j=__builtin_ctz((unsigned)bits),q=s^(1<<j);
    grad[i*n+j]+=b[s]*f[q]; b[q]+=b[s]*A[i*n+j];}}}
 return f[z-1];
}
extern "C" double permanent_real(const double* A,int n,double* grad){return pg(A,n,grad);}
extern "C" void permanent_complex(const C* A,int n,C* out,C* grad){*out=pg(A,n,grad);}
