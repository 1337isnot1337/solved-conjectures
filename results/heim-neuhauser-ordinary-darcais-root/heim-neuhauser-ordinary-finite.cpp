#include <gmpxx.h>
#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <stdexcept>
#include <vector>

// Exact finite bridge for ordinary D'Arcais polynomials (g=σ_1).
// This does not use floating point or presume sign positivity.
using Poly = std::vector<mpz_class>;

static mpz_class pack(const Poly& a, size_t stride) {
    std::vector<uint64_t> w(a.size()*stride,0);
    for (size_t j=0;j<a.size();++j) {
        size_t got;
        mpz_export(w.data()+j*stride,&got,-1,sizeof(uint64_t),0,0,a[j].get_mpz_t());
        if (got>stride) throw std::runtime_error("coefficient outside reserved bin");
    }
    mpz_class out;
    mpz_import(out.get_mpz_t(),w.size(),-1,sizeof(uint64_t),0,0,w.data());
    return out;
}

static bool turan_certificate(const Poly& a,const Poly& b,const Poly& c,unsigned n) {
    // Need every digit of (n+1) b^2 − n a c nonnegative and its constant >0.
    // Largest constituent coefficient < 2^maxbits.  A polynomial product
    // sums at most n+2 terms and then scales by at most n+1.
    size_t maxbits=0;
    for (auto* p : {&a,&b,&c})
        for (const auto& z : *p) maxbits=std::max(maxbits,mpz_sizeinbase(z.get_mpz_t(),2));
    size_t shift=0;
    for (auto i=n+2; i; i >>= 1) ++shift;
    size_t stride=(2*maxbits+2*shift+63)/64;
    auto ai=pack(a,stride), bi=pack(b,stride), ci=pack(c,stride);
    mpz_class left=(n+1)*bi*bi, right=n*ai*ci;
    std::vector<uint64_t> L((2*n+1)*stride,0),R(L.size(),0);
    if (mpz_sizeinbase(left.get_mpz_t(),2)>64*L.size() ||
        mpz_sizeinbase(right.get_mpz_t(),2)>64*R.size())
        throw std::runtime_error("packed product overflow");
    size_t got=0;
    mpz_export(L.data(),&got,-1,sizeof(uint64_t),0,0,left.get_mpz_t());
    if (got>L.size()) throw std::runtime_error("unpacked product overflow");
    mpz_export(R.data(),&got,-1,sizeof(uint64_t),0,0,right.get_mpz_t());
    if (got>R.size()) throw std::runtime_error("unpacked product overflow");
    for (unsigned j=0;j<=2*n;++j) {
        int v=0;
        for (auto k=(j+1)*stride;k>j*stride;--k)
            if (L[k-1]!=R[k-1]) {v=L[k-1]>R[k-1]?1:-1;break;}
        if (v<0 || (j==0 && v==0)) {
            std::cerr << "Failed at n=" << n << ", degree="<<j<<", comparison="<<v<<"\n";
            return false;
        }
    }
    return true;
}

int main(int argc,char**argv) {
    unsigned N=argc>1?unsigned(std::stoul(argv[1])):500;
    if (N<151 || N>5000) throw std::runtime_error("unexpected cutoff");
    std::vector<unsigned> g(N+2,0);
    for (unsigned d=1;d<=N+1;++d)
        for (unsigned k=d;k<=N+1;k+=d) g[k]+=d;
    std::vector<Poly> B(N+2);
    B[0]={1};
    for (unsigned n=1;n<=N+1;++n) {
        Poly tmp(n);
        mpz_class fall=1;
        for (unsigned k=1;k<=n;++k) {
            mpz_class scale=fall*g[k];
            for (unsigned j=0;j<=n-k;++j)
                mpz_addmul(tmp[j].get_mpz_t(),scale.get_mpz_t(),B[n-k][j].get_mpz_t());
            fall*=n-k;
        }
        B[n].resize(n+1);
        B[n][0]=tmp[0];
        for (unsigned j=1;j<n;++j) B[n][j]=tmp[j-1]+tmp[j];
        B[n][n]=tmp[n-1];
        if (n>26 && !turan_certificate(B[n-2],B[n-1],B[n],n-1)) return 1;
    }
    std::cout << "Certified all ordinary Turan polynomials for n=26,...,"<<N<<" at x>=1.\n";
}
