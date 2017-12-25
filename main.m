clear;
load('karnet');
S=randwalk(A);
[ffbest,resuu]=GAnet(S,A);
Qmax=max(ffbest)
 