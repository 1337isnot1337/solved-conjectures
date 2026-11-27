// Labeled, unsorted, bottom-up recurrence independent of the Python certificate.
// Build: c++ -O2 -std=c++17 check_independent.cpp -o check-slice
#include <algorithm>
#include <cstdlib>
#include <iostream>
#include <vector>
constexpr int N=181;
std::vector<unsigned char> tab(9*N*N);
unsigned char& at(int a,int b,int x,int y){return tab[((a*3+b)*N+x)*N+y];}
int clip(int n,int b){return n<b?n:b+(n-b)%7;}
bool pred(int a,int b,int x,int y){
    int m=std::min(x,y),d=std::abs(x-y);
    m=clip(m,19);d=clip(d,6);
    return at(a,b,m,m+d);
}
void demand(bool condition){if(!condition){std::cerr<<"FAIL\n";std::exit(1);}}
int main(){
    std::vector<std::vector<int>> moves(N);
    for(int h=1;h<N;h++){
       if(h==1||h==2||h==4)moves[h].push_back(0);
       for(int r:{1,3,4})if(h>r)moves[h].push_back(h-r);
    }
    for(int a=0;a<=2;a++)for(int b=0;b<=2;b++)for(int x=0;x<N;x++)for(int y=0;y<N;y++){
        if(a+b+x+y==0)continue;
        bool P=true;
        for(int t:moves[a])P &= !at(t,b,x,y);
        for(int t:moves[b])P &= !at(a,t,x,y);
        for(int t:moves[x])P &= !at(a,b,t,y);
        for(int t:moves[y])P &= !at(a,b,x,t);
        at(a,b,x,y)=P;
    }
    int raw=0,representatives=0;
    for(int a=0;a<=2;a++)for(int b=0;b<=2;b++)for(int x=0;x<N;x++)for(int y=0;y<N;y++){
        demand(pred(a,b,x,y)==at(a,b,x,y));++raw;
    }
    for(int a=0;a<=2;a++)for(int b=a;b<=2;b++)for(int m=0;m<30;m++)for(int d=0;d<17;d++){
        int x=m,y=m+d;bool P=a+b+x+y>0;
        for(int t:moves[a])P &= !pred(t,b,x,y);
        for(int t:moves[b])P &= !pred(a,t,x,y);
        for(int t:moves[x])P &= !pred(a,b,t,y);
        for(int t:moves[y])P &= !pred(a,b,x,t);
        demand(P==pred(a,b,x,y));++representatives;
    }
    std::cout<<raw<<" direct labeled states and "<<representatives<<" transfer representatives.\n";
}
