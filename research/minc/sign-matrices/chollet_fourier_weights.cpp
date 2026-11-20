#define main projection_probe_main
#include "chollet_fourier.cpp"
#undef main

// Boundary circulant PSD matrices with Fourier weights in {0,1,2}.
// Frequency shifts and multiplication by units give equivalent Gram matrices.
int main(int argc,char**argv){
    int lo=argc>1?std::stoi(argv[1]):7,hi=argc>2?std::stoi(argv[2]):11;
    const long double pi=acosl(-1.L);
    std::cout<<std::setprecision(21);
    for(int n=lo;n<=hi;++n){
        unsigned total=1;for(int j=1;j<n;++j)total*=3;
        unsigned bestcode=0,count=0;int bestrank=0;
        long double best=-1,bestpa=0,bestpr=0;
        for(unsigned tail=0;tail<total;++tail){
            std::vector<int>w(n);unsigned z=tail;int rank=0,sum=0,mx=0;
            for(int j=0;j<n-1;++j){w[j]=z%3;z/=3;rank+=(w[j]!=0);sum+=w[j];mx=std::max(mx,w[j]);}
            if(rank<5||mx<2)continue;
            unsigned code=tail;
            bool canon=true;
            for(int a=1;a<n&&canon;++a)if(std::gcd(a,n)==1)
                for(int b=0;b<n&&canon;++b){
                    unsigned other=0,power=1;
                    for(int j=0;j<n;++j){other+=power*w[(a*j+b)%n];power*=3;}
                    if(other<code)canon=false;
                }
            if(!canon)continue;
            std::vector<std::vector<C>>a(n,std::vector<C>(n));
            std::vector<std::vector<long double>>b(n,std::vector<long double>(n));
            for(int i=0;i<n;++i)for(int j=0;j<n;++j){
                if(i==j)a[i][j]=sum;
                else for(int s=0;s<n;++s)if(w[s]){
                    long double t=2*pi*s*(i-j)/n;
                    a[i][j]+=(long double)w[s]*C(cosl(t),sinl(t));
                }
                b[i][j]=std::norm(a[i][j]);
            }
            C p=permanent(a);long double q=permanent(b),ratio=q/(p.real()*p.real());
            ++count;
            if(ratio>best){best=ratio;bestcode=code;bestrank=rank;bestpa=p.real();bestpr=q;}
            if(ratio>1.00000001L)
                std::cout<<"CANDIDATE n="<<n<<" code="<<code<<" rank="<<rank<<" ratio="<<ratio<<"\n";
        }
        std::cout<<"n="<<n<<" classes="<<count<<" max_ratio="<<best<<" code="<<bestcode
                 <<" rank="<<bestrank<<" per_A="<<bestpa<<" per_abs2="<<bestpr<<"\n"<<std::flush;
    }
    return 0;
}
