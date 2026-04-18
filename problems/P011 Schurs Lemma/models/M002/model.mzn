%% schurs numbers
%%
%% determine if balls labelled 1..balls
%% can be placed in 1..boxes with no box containing a triple {x,y,z} where x+y=z
%%
% The model originates from CSPLib problem 015
% NOTE THAT this model does not implement the actual Schur's number theorem, as the original theorem allows for x=y but
% this model assumes that x<y.
% Modified by Rafał Stachowiak 2025
% === CHANGES MADE ===:
% - Removed custom output.
% - Added a comment about the invalidity of this model w.r.t. the original statement of the Schur's number theorem.


int: boxes; %% number of boxes
int: balls; %% number of balls

array[1..balls] of var 1..boxes: box;

constraint forall(i in 1..balls-1, j in i+1 .. balls - i)(
    box[i] != box[j] \/
    box[i] != box[i+j] \/
    box[j] != box[i+j]);

solve satisfy;
