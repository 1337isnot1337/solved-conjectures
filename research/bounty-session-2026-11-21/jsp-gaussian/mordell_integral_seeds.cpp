#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <vector>
using I=__int128_t;
I powi(I a,int k){I out=1;while(k--)out*=a;return out;}
bool square(I n,long long& y){if(n<0)return false;y=(long long)sqrtl((long double)n);while((I)y*y<n)++y;while((I)y*y>n)--y;return (I)y*y==n;}
int main(int argc,char**argv){
 int bmax=argc>1?atoi(argv[1]):99,xmax=argc>2?atoi(argv[2]):100000;
 bool squares[64]{};for(int t=0;t<64;++t)squares[t*t%64]=true;
 for(int b=3;b<=bmax;b+=2)for(int t:{1,3,5})for(int sign:{-1,1}){
  long long d=(long long)(8*sign*powi(b,t));
  int xmin=-int(ceill(cbrtl(fabsl((long double)d))))-1;
  std::cout<<"{\"b\":"<<b<<",\"t\":"<<t<<",\"sign\":"<<sign<<",\"d\":"<<d<<",\"points\":[";
  bool first=true;for(int x=xmin;x<=xmax;++x){I n=(I)x*x*x+d;if(n<0||!squares[(int)(n%64)])continue;long long y;if(!square(n,y))continue;
   if(!first)std::cout<<",";first=false;std::cout<<"["<<x<<","<<y<<"]";
  }
  std::cout<<"]}\n"<<std::flush;
 }
}
