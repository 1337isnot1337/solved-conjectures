#define main search_main
#include "search_integrality.cpp"
#undef main
#include <functional>

bool obstruction(std::vector<int>&a,int n,U &per,int &good,int &bad){
 per=permanent(a,n);good=0;bad=0;
 for(int i=0;i<n;i++)for(int k=i+1;k<n;k++)for(int j=0;j<n;j++)for(int l=0;l<n;l++){
  if(j==l||!a[i*n+j]||!a[k*n+l])continue;
  int dc=2-a[i*n+j]-a[k*n+l]+a[i*n+l]+a[k*n+j];
  if(dc>=0)continue;
  a[i*n+j]--;a[k*n+l]--;a[i*n+l]++;a[k*n+j]++;
  U p=permanent(a,n);
  a[i*n+j]++;a[k*n+l]++;a[i*n+l]--;a[k*n+j]--;
  if(p<=per){good++;return false;}else bad++;
 }
 return true;
}
int main(int argc,char**argv){
 int n=argc>1?atoi(argv[1]):6,k=argc>2?atoi(argv[2]):3,trials=argc>3?atoi(argv[3]):10000;
 bool near=argc>4?atoi(argv[4]):false;
 std::mt19937 rng(20261120);std::vector<int>p(n);std::iota(p.begin(),p.end(),0);
 int checked=0;
 for(int t=0;t<trials;t++){
  std::vector<int>a(n*n,0);
  if(!near){
   for(int z=0;z<k;z++){std::shuffle(p.begin(),p.end(),rng);for(int i=0;i<n;i++)a[i*n+p[i]]++;}
  }else{
   for(int i=0;i<n;i++)for(int z=0;z<k;z++)a[i*n+(i+z)%n]=1;
   for(int z=0;z<100*n;z++){
    int i=rng()%n,r=rng()%n,j=rng()%n,s=rng()%n;
    if(i==r||j==s||!a[i*n+j]||!a[r*n+s]||a[i*n+s]||a[r*n+j])continue;
    a[i*n+j]--;a[r*n+s]--;a[i*n+s]++;a[r*n+j]++;
   }
   bool done=false;
   for(int z=0;z<1000&&!done;z++){
    int i=rng()%n,r=rng()%n,j=rng()%n,s=rng()%n;
    if(i==r||j==s||!a[i*n+j]||!a[r*n+s]||a[i*n+s]+a[r*n+j]!=1)continue;
    a[i*n+j]--;a[r*n+s]--;a[i*n+s]++;a[r*n+j]++;done=true;
   }
  }
  if(!collisions(a))continue;
  U per;int good,bad;checked++;
  if(obstruction(a,n,per,good,bad)){
   std::cout<<"obstruction n "<<n<<" k "<<k<<" per "<<per<<" collision "<<collisions(a)<<" improving-collision swaps "<<bad<<" trial "<<t<<'\n';print(a,n);return 0;
  }
 }
 std::cout<<"none checked "<<checked<<'\n';
}
