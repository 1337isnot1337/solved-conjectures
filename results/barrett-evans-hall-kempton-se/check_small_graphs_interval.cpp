// Check x+y-2 max(x,y)/n > 1 on each connected graph with connected complement.
// Input: graph6 representatives from nauty geng -cq n (orders 5 through 10).
// Every accepted inequality has a dyadic lower-bound witness, checked by
// outward-rounded interval Schur elimination (not by an eigensolver).
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <limits>
using Bits=unsigned;
constexpr int MAX=10, D=256;
struct I { double l,u; };
I out(double a,double b) {
    const double inf=std::numeric_limits<double>::infinity();
    return {std::nextafter(a,-inf),std::nextafter(b,inf)};
}
I sub(I a,I b) { return out(a.l-b.u,a.u-b.l); }
I mul(I a,I b) {
    if(a.l==a.u && a.l==0) return {0,0};
    if(b.l==b.u && b.l==0) return {0,0};
    double a0=a.l*b.l,a1=a.l*b.u,a2=a.u*b.l,a3=a.u*b.u;
    return out(std::min({a0,a1,a2,a3}),std::max({a0,a1,a2,a3}));
}
I divpos(I a,I b) {
    return out(a.l/(a.l>=0?b.u:b.l),a.u/(a.u>=0?b.l:b.u));
}
bool connected(const Bits *g, int n) {
    Bits todo=1,seen=1;
    while(todo) {
        int v=__builtin_ctz(todo); todo &= todo-1;
        Bits add=g[v]&~seen; seen|=add; todo|=add;
    }
    return seen==(1u<<n)-1;
}
struct L {
    int n,deg[MAX]; Bits m[MAX];
    void build(const Bits* g,int order) {
        n=order;
        for(int i=0;i<n;i++) {m[i]=g[i];deg[i]=__builtin_popcount(g[i]);}
    };
    int entry(int i,int j,int t) const {
        return (i==j ? D*n*deg[i]-(n-1)*t :
            t-(((m[i]>>j)&1u) ? D*n:0));
    }
    bool fast(int t) const {
        double a[MAX][MAX];
        for(int i=0;i<n-1;i++) for(int j=i;j<n-1;j++) a[i][j]=entry(i,j,t);
        for(int k=0;k<n-1;k++){
            double p=a[k][k]; if(p<=0) return false;
            if(k==n-2) break;
            double pinv=1/p;
            for(int i=k+1;i<n-1;i++){
                double u=a[k][i]*pinv;
                for(int j=i;j<n-1;j++) a[i][j]-=u*a[k][j];
            }
        } return true;
    }
    bool cert(int t) const {
        I a[MAX][MAX];
        for(int i=0;i<n-1;i++) for(int j=i;j<n-1;j++){
            double z=entry(i,j,t); a[i][j]={z,z};
        }
        for(int k=0;k<n-1;k++){
            I p=a[k][k]; if(!(p.l>0)) return false;
            if(k==n-2) break;
            for(int i=k+1;i<n-1;i++){
                const I u=divpos(a[k][i],p);
                for(int j=i;j<n-1;j++) a[i][j]=sub(a[i][j],mul(u,a[k][j]));
            }
        } return true;
    }
};
bool prove(const L& a,const L& b){
    const int n=a.n;
    // Binary search is only a witness finder: cert rechecks both values.
    int lo=0,hi=D+1;
    while(hi-lo>1){
        int mid=(lo+hi)/2;
        if(a.fast(mid)) lo=mid; else hi=mid;
    }
    for(int x=lo;x>=std::max(1,lo-3);--x){
        if(!a.cert(x)) continue;
        const int y=(2*(n-1)*x<=n*D) ? (n*(D-x))/(n-2)+1 :
                                               (n*D-(n-2)*x)/n+1;
        if(n*(x+y)-2*std::max(x,y)<=n*D) std::abort();
        if(b.cert(y)) return true;
    }
    return false;
}
int main(int argc,char** argv){
    int n=argc==2 ? std::atoi(argv[1]):0; if(n<5 || n>10) return 2;
    unsigned long long count=0,both=0,failed=0;
    char s[128];
    while(std::fgets(s,sizeof s,stdin)){
        if((int)std::strlen(s)!=2+(n*(n-1)/2+5)/6 || s[0]!=63+n) return 2;
        Bits g[MAX]={}, h[MAX]={};
        for(int j=1,k=0;j<n;j++) for(int i=0;i<j;i++,k++)
            if((s[1+k/6]-63)>>(5-k%6)&1) {g[i]|=1u<<j;g[j]|=1u<<i;}
        ++count;
        if(!connected(g,n)) return 2;
        for(int i=0;i<n;i++) h[i]=((1u<<n)-1)^(g[i]|1u<<i);
        if(!connected(h,n)) continue;
        ++both;
        L a,b; a.build(g,n); b.build(h,n);
        if(!prove(a,b) && !prove(b,a)){
            std::printf("uncertified %s",s); ++failed;
        }
    }
    std::printf("n=%d connected=%llu both=%llu uncertified=%llu\n",n,count,both,failed);
    return failed ? 1:0;
}
