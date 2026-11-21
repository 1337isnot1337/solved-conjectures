#define main grid_search_main
#include "search.cpp"
#undef main

int main(int argc,char**argv){
 const int bound=argc>1?std::atoi(argv[1]):5000;
 for(int x=0;x<256;x++)squares[x*x%256]=true;
 for(int x=0;x<64;x++)for(int y=0;y<64;y++)gaussian_squares[mod(x*x-y*y,64)][2*x*y%64]=true;
 const std::vector<int> exponents{3,4,5,7,9,11,13,17,19,23,29,31,37,41,43,47,53,59};
 U norm_limits[60]={0};
 const U limit=U(1000000000000000000ULL)*1000000000000000000ULL;
 for(int q:exponents){
  U lo=0,hi=U(2)*bound*bound+1;
  while(lo+1<hi){
   U m=(lo+hi)/2,v=1;bool fits=true;
   for(int j=0;j<q;j++){if(v>limit/m){fits=false;break;}v*=m;}
   if(fits)lo=m;else hi=m;
  }
  norm_limits[q]=lo;
 }
 uint64_t tested=0,hits=0;
 for(int a=1;a<=bound;a++)for(int b=0;b<=a;b++){
  G y0{a,b};if(norm(y0)<=1)continue;
  for(int q:exponents){
   if(norm(y0)>norm_limits[q])continue;
   for(int yu=0;yu<4;yu++){
    G y=rotate(y0,yu),yp=power(y,q);
    for(int zu=0;zu<4;zu++){
     G z=rotate({1,0},zu),x;tested++;
     if(!gaussian_square({z.a-yp.a,z.b-yp.b},x)||norm(x)<=1)continue;
     if(!coprime(x,y))std::abort();
     G xp=power(x,2);if(xp.a+yp.a!=z.a||xp.b+yp.b!=z.b)std::abort();
     // 101 is one modulo four, so z^101=z for each unit z.
     std::cout<<"{\"x\":"<<fmt(x)<<",\"y\":"<<fmt(y)<<",\"z\":"<<fmt(z)<<",\"exponents\":[2,"<<q<<",101]}"<<std::endl;
     hits++;
    }
   }
  }
 }
 std::cerr<<"unit_candidates="<<tested<<" raw_hits="<<hits<<" ymax="<<bound<<"\n";
 return 0;
}
