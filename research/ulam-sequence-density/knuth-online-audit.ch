@x
int main (int argc,char*argv[]) {
@y
enum { audit_width=256 };
static unsigned int *audit_ranks;
static ullng audit_limit=10000000000ULL,audit_parent;
static ullng audit_fail[2],audit_worst_target[2],audit_worst_parent[2]={1,1},audit_worst_delta[2];
static ullng audit_prev=2,audit_misses=2,audit_last_miss=2,audit_adjacent;
static ullng audit_windows,audit_gap_total,audit_post_total;
static ullng audit_min_gap=1,audit_min_post=1,audit_min_target;
static int audit_complete,audit_pending_count;
static struct audit_gap {ullng start,length,before,deadline;} audit_pending[4096];

static ullng audit_prefix(ullng position) {
  ullng start=position-position mod audit_width;
  ullng result=audit_ranks[position/audit_width];
  for (ullng i=start;i<=position;i++) result+=ulamq(i)!=0;
  return result;
}

static void audit_selected(ullng u,ullng n) {
  ullng p=audit_parent,q=u-p;
  if (q<p) {p=q; q=u-p;}
  if (!p || p>=q || !ulamq(p) || !ulamq(q)) exit(6);
  if (p>=4096) {
    ullng ap=audit_prefix(p),aq=audit_prefix(q);
    long long delta=(long long)ap+(long long)aq-(long long)n;
    if (delta>0) for (int k=0;k<2 && p>=(4096ULL<<k);k++) {
      if ((__int128)delta*delta*audit_worst_parent[k]>
          (__int128)audit_worst_delta[k]*audit_worst_delta[k]*p) {
        audit_worst_parent[k]=p;
        audit_worst_delta[k]=delta;
        audit_worst_target[k]=u;
      }
      if ((__int128)delta*delta>4*p && ++audit_fail[k]<=10)
        fprintf(stderr,"audit failure "O"d: "O"llu = "O"llu + "O"llu, counts "O"llu "O"llu "O"llu, deficit "O"lld\n",
                k,u,p,q,ap,aq,n,delta);
    }
  }
  ullng length=u-audit_prev;
  if (length>=300) {
    if (audit_pending_count==4096) exit(7);
    audit_pending[audit_pending_count++]=(struct audit_gap){u,length,n-1,u+length-1};
  }
  audit_prev=u;
}

static void audit_position(ullng u,ullng n,int selected) {
  if (selected) audit_selected(u,n);
  for (int j=0;j<audit_pending_count;) {
    struct audit_gap gap=audit_pending[j];
    if (gap.deadline>u) {j++; continue;}
    ullng count=n-gap.before;
    audit_windows++;
    audit_gap_total+=gap.length;
    audit_post_total+=count;
    if (count*audit_min_gap<audit_min_post*gap.length) {
      audit_min_gap=gap.length;
      audit_min_post=count;
      audit_min_target=gap.start;
    }
    audit_pending[j]=audit_pending[--audit_pending_count];
  }
  if (misses!=audit_misses) {
    if (u>3 && u==audit_last_miss+1) audit_adjacent++;
    audit_misses=misses;
    audit_last_miss=u;
  }
  if (u mod 1000000000ULL==0 || u==audit_limit) {
    fprintf(stderr,"audit "O"llu terms "O"llu misses "O"llu adjacent "O"llu windows "O"llu\n",
            u,n,audit_misses-2,audit_adjacent,audit_windows);
    fprintf(stderr,"  response sum "O"llu/"O"llu, minimum "O"llu/"O"llu at "O"llu\n",
            audit_post_total,audit_gap_total,audit_min_post,audit_min_gap,audit_min_target);
    for (int k=0;k<2;k++)
      fprintf(stderr,"  p >= "O"llu failures "O"llu, maximum "O"llu/sqrt("O"llu) at "O"llu\n",
              4096ULL<<k,audit_fail[k],audit_worst_delta[k],audit_worst_parent[k],audit_worst_target[k]);
    fflush(stderr);
  }
}

int main (int argc,char*argv[]) {
@z

@x
  for (u=3;n<maxn;u++)
@y
  const char *audit_limit_env=getenv("ULAM_AUDIT_LIMIT");
  if (audit_limit_env) audit_limit=strtoull(audit_limit_env,0,10);
  if (audit_limit<3 || audit_limit>10000000000ULL) return 1;
  audit_ranks=calloc(audit_limit/audit_width+1,sizeof(*audit_ranks));
  if (!audit_ranks) return 2;
  for (u=3;n<maxn;u++)
@z

@x
finish_up: @<Print farewell messages@>;
@y
finish_up: @<Print farewell messages@>;
  free(audit_ranks);
  return audit_complete?0:3;
@z

@x
@<Decide whether |u| is an Ulam number or an Ulam miss or...@>=
{
  @<Compute |u|'s residue, |r|@>;
@y
@<Decide whether |u| is an Ulam number or an Ulam miss or...@>=
{
  if (u mod audit_width==0) audit_ranks[u/audit_width]=n;
  @<Compute |u|'s residue, |r|@>;
@z

@x
finish:@+@<Record |ulamness| in the |is_ulam| or |is_um| table@>;
}
@y
finish:@+@<Record |ulamness| in the |is_ulam| or |is_um| table@>;
  audit_position(u,n,ulamness);
  if (u==audit_limit) {audit_complete=1; break;}
}
@z

@x
      hits=1;
@y
      hits=1,audit_parent=up;
@z

@x
    hits=1,anchorx=x;
@y
    hits=1,anchorx=x,audit_parent=up;
@z

@x
    hits=1,anchorx=x;
@y
    hits=1,anchorx=x,audit_parent=up;
@z
