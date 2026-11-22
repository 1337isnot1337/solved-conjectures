/* Referee-2 independent search for perfect sequencings of K_n - F, n=2m+1:
   cyclic order of all N edges with every m cyclically consecutive edges pairwise disjoint
   (equivalently: two edges at cyclic distance 1..m-1 are disjoint).
   Rotation fixed by placing a chosen edge (default: the LAST edge in lex order) at position 0;
   candidates are tried in reverse lex order.  No pruning except the definition itself
   (the wrap-around constraint is checked against positions 0..m-2 when filling the last m-1 slots).
   usage: pseq n a1 b1 a2 b2 ...  */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
static int n,m,N,A[256],B[256],seq[256],used[256];
static long long nodes=0,found=0;
static int lastpos[64]; /* last position (in the linear prefix) at which vertex occurs, or -1000000 */
static int firstpos[64];
static void rec(int d){
  nodes++;
  if(d==N){ found++; if(found<=3){for(int i=0;i<N;i++)printf("%d-%d ",A[seq[i]],B[seq[i]]);printf("\n");} return; }
  for(int e=N-1;e>=0;e--){
    if(used[e])continue;
    int a=A[e],b=B[e];
    if(d-lastpos[a]<m||d-lastpos[b]<m)continue;           /* conflict with previous m-1 positions */
    /* wrap: positions 0..(d+m-1-N) are within distance m-1 forward cyclically */
    if(firstpos[a]>=0 && firstpos[a]+N-d<m)continue;
    if(firstpos[b]>=0 && firstpos[b]+N-d<m)continue;
    int la=lastpos[a],lb=lastpos[b],fa=firstpos[a],fb=firstpos[b];
    used[e]=1;seq[d]=e;lastpos[a]=d;lastpos[b]=d;if(fa<0)firstpos[a]=d;if(fb<0)firstpos[b]=d;
    rec(d+1);
    used[e]=0;lastpos[a]=la;lastpos[b]=lb;firstpos[a]=fa;firstpos[b]=fb;
  }
}
int main(int argc,char**argv){
  n=atoi(argv[1]);m=(n-1)/2;int t=0,R[64][2];
  for(int i=2;i+1<argc;i+=2){R[t][0]=atoi(argv[i]);R[t][1]=atoi(argv[i+1]);t++;}
  N=0;for(int a=0;a<n;a++)for(int b=a+1;b<n;b++){int s=0;for(int i=0;i<t;i++)if((R[i][0]==a&&R[i][1]==b)||(R[i][0]==b&&R[i][1]==a))s=1;if(!s){A[N]=a;B[N]=b;N++;}}
  for(int v=0;v<n;v++){lastpos[v]=-1000000;firstpos[v]=-1;}
  int e0=N-1; used[e0]=1;seq[0]=e0;lastpos[A[e0]]=lastpos[B[e0]]=0;firstpos[A[e0]]=firstpos[B[e0]]=0;
  clock_t c=clock(); rec(1);
  printf("n=%d m=%d t=%d N=%d fixed=%d-%d found=%lld nodes=%lld time=%.1fs\n",n,m,t,N,A[e0],B[e0],found,nodes,(double)(clock()-c)/CLOCKS_PER_SEC);
  return 0;
}
