@x
  for (u=3;n<maxn;u++)
@y
  FILE *audit=fopen("knuth-members1b-packed.bin","wb");
  if (!audit) return 1;
  ullng audit_word=6; /* bit zero is empty and both seeds are selected */
  ullng audit_misses=2,audit_last_miss=2,audit_adjacent=0;
  for (u=3;n<maxn;u++)
@z

@x
finish:@+@<Record |ulamness| in the |is_ulam| or |is_um| table@>;
}
@y
finish:@+@<Record |ulamness| in the |is_ulam| or |is_um| table@>;
  if (ulamness) audit_word|=1ULL<<(u mod 64);
  if (misses!=audit_misses) {
    if (u>3 && u==audit_last_miss+1) audit_adjacent++;
    audit_misses=misses;
    audit_last_miss=u;
  }
  if (u mod 64==63 || u==1000000000ULL) {
    if (fwrite(&audit_word,sizeof(audit_word),1,audit)!=1) return 2;
    audit_word=0;
  }
  if (u==4118 || u==569370981 || u==569375099 ||
      u==581858079 || u==581862197 || u==1000000000ULL)
    fprintf(stderr,"audit "O"llu "O"llu "O"d\n",u,n,ulamness);
  if (u==1000000000ULL) {
    fprintf(stderr,"audit misses at least 3: "O"llu, adjacent pairs: "O"llu\n",
            audit_misses-2,audit_adjacent);
    if (fclose(audit)) return 3;
    break;
  }
}
@z
