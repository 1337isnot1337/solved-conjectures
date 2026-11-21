// Discovery-only structured tests of the standard-representation quadratic
// conjecture. No hill climbing and no fixed-order theorem is claimed.
#include <algorithm>
#include <cmath>
#include <complex>
#include <iomanip>
#include <iostream>
#include <numeric>
#include <vector>
using C=std::complex<long double>;

int main(int argc,char**argv){
    int lo=argc>1?std::stoi(argv[1]):7,hi=argc>2?std::stoi(argv[2]):11;
    const long double pi=acosl(-1.L);
    std::cout<<std::setprecision(21);
    for(int n=lo;n<=hi;++n){
        unsigned total=1;for(int j=1;j<n;++j)total*=3;
        unsigned bestcode=0,count=0;int bestrank=0;
        long double best=-1;
        for(unsigned tail=0;tail<total;++tail){
            std::vector<int>w(n);unsigned z=tail;int rank=0,sum=0,mx=0;
            for(int j=0;j<n-1;++j){w[j]=z%3;z/=3;rank+=(w[j]!=0);sum+=w[j];mx=std::max(mx,w[j]);}
            if(rank<2||mx<2)continue;
            bool canon=true;
            for(int a=1;a<n&&canon;++a)if(std::gcd(a,n)==1)
                for(int b=0;b<n&&canon;++b){
                    unsigned other=0,power=1;
                    for(int j=0;j<n;++j){other+=power*w[(a*j+b)%n];power*=3;}
                    if(other<tail)canon=false;
                }
            if(!canon)continue;
            std::vector<std::vector<C>>a(n,std::vector<C>(n));
            for(int i=0;i<n;++i)for(int j=0;j<n;++j){
                if(i==j)a[i][j]=sum;
                else for(int s=0;s<n;++s)if(w[s]){
                    long double t=2*pi*s*(i-j)/n;
                    a[i][j]+=(long double)w[s]*C(cosl(t),sinl(t));
                }
            }
            const unsigned full=(1u<<n)-1;
            std::vector<C>back(1u<<n);back[full]=1;
            for(int mask=(int)full-1;mask>=0;--mask){
                int i=__builtin_popcount((unsigned)mask);
                for(int j=0;j<n;++j)if(!(mask&(1u<<j)))
                    back[mask]+=a[i][j]*back[mask|(1u<<j)];
            }
            long double p=back[0].real(),q=0;
            for(int j=0;j<n;++j)q+=std::norm(a[0][j]*back[1u<<j]);
            long double row_ratio=q/(p*p);
            long double irreducible_ratio=(n*row_ratio-1)/(n-1);
            ++count;
            if(irreducible_ratio>best){best=irreducible_ratio;bestcode=tail;bestrank=rank;}
            if(irreducible_ratio>1.00000001L)
                std::cout<<"CANDIDATE n="<<n<<" code="<<tail<<" rank="<<rank<<" ratio="<<irreducible_ratio<<"\n";
        }
        std::cout<<"n="<<n<<" classes="<<count<<" max_standard_quadratic_ratio="<<best
                 <<" code="<<bestcode<<" rank="<<bestrank<<"\n"<<std::flush;
    }
}
