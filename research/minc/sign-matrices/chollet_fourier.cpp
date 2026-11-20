#include <algorithm>
#include <cmath>
#include <complex>
#include <cstdint>
#include <iomanip>
#include <iostream>
#include <numeric>
#include <vector>

// Exploratory evaluation only. No floating-point result is a proof.
// A support S gives C_ij=sum_{s in S} exp(2*pi*i*s*(i-j)/n).
// C is the Gram matrix of Fourier rows, hence PSD of rank |S| exactly.
using C = std::complex<long double>;

template<class T> T permanent(const std::vector<std::vector<T>>& a) {
    int n=a.size(); std::vector<T> dp(1u<<n); dp[0]=T(1);
    for(unsigned mask=1;mask<(1u<<n);++mask){
        int row=__builtin_popcount(mask)-1;
        unsigned x=mask;
        while(x){unsigned bit=x&-x;int j=__builtin_ctz(bit);dp[mask]+=a[row][j]*dp[mask^bit];x^=bit;}
    }
    return dp.back();
}

unsigned affine_image(unsigned mask,int n,int a,int b){
    unsigned out=0;
    for(int j=0;j<n;++j)if(mask&(1u<<j))out|=1u<<((a*j+b)%n);
    return out;
}

bool canonical(unsigned mask,int n){
    for(int a=1;a<n;++a)if(std::gcd(a,n)==1)
        for(int b=0;b<n;++b)if(affine_image(mask,n,a,b)<mask)return false;
    return true;
}

int main(int argc,char**argv){
    int lo=argc>1?std::stoi(argv[1]):7,hi=argc>2?std::stoi(argv[2]):12;
    const long double pi=acosl(-1.L);
    std::cout<<std::setprecision(21);
    for(int n=lo;n<=hi;++n){
        unsigned bestmask=0; long double best=-1,pa=0,pr=0,imagmax=0;
        unsigned count=0;
        for(unsigned mask=1;mask<(1u<<n)-1;++mask){
            int rank=__builtin_popcount(mask);
            if(rank<5||!canonical(mask,n))continue;
            std::vector<std::vector<C>> a(n,std::vector<C>(n));
            std::vector<std::vector<long double>> b(n,std::vector<long double>(n));
            for(int i=0;i<n;++i)for(int j=0;j<n;++j){
                if(i==j)a[i][j]=rank;
                else for(int s=0;s<n;++s)if(mask&(1u<<s)){
                    long double t=2*pi*s*(i-j)/n;
                    a[i][j]+=C(cosl(t),sinl(t));
                }
                b[i][j]=std::norm(a[i][j]);
            }
            C p=permanent(a);long double q=permanent(b),ratio=q/(p.real()*p.real());
            imagmax=std::max(imagmax,fabsl(p.imag())/(1+fabsl(p.real())));
            ++count;
            if(ratio>best){best=ratio;bestmask=mask;pa=p.real();pr=q;}
            if(ratio>1.00000001L)
                std::cout<<"CANDIDATE n="<<n<<" mask="<<mask<<" rank="<<rank<<" ratio="<<ratio<<"\n";
        }
        std::cout<<"n="<<n<<" classes="<<count<<" max_ratio="<<best<<" mask="<<bestmask
                 <<" rank="<<__builtin_popcount(bestmask)<<" per_A="<<pa<<" per_abs2="<<pr
                 <<" max_relative_imag="<<imagmax<<"\n"<<std::flush;
    }
    return 0;
}
