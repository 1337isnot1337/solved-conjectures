// Verify the strict dandelion lower bound for no-double-leaf pairs of orders 4 to 10.
// Input: graph6 representatives from nauty geng -cq n (orders 4 through 10).
// Every accepted inequality has a dyadic lower-bound witness, checked by
// exact integer interval Schur elimination (not by an eigensolver).
#include "dandelion_schur.hpp"

int main(int argc,char** argv){
    int n=argc==2 ? std::atoi(argv[1]):0; if(n<4 || n>10) return 2;
    unsigned long long count=0,both=0,restricted=0,failed=0;
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
        if(*std::min_element(a.deg,a.deg+n)==1 && *std::min_element(b.deg,b.deg+n)==1) continue;
        ++restricted;
        if(!prove(a,b) && !prove(b,a)){
            std::printf("uncertified %s",s); ++failed;
        }
    }
    std::printf("n=%d connected=%llu both=%llu no_double_leaf=%llu uncertified=%llu\n",n,count,both,restricted,failed);
    return failed ? 1:0;
}
