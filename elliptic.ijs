NB. http://www.sci.utah.edu/~gerig/CS7960-S2010/handouts/Kuhl-Giardina-CGIP1982.pdf

dist =: 13 : '%: ((*: x) + (*: y))'

NB. make this into an adverb?
succ_diff =: 2 -~/\ ]

delta_t =: [: succ_diff dist

t =: 13 : '+/\ | (x delta_t y)'

T =: [: {: t

pi =: o. 1

sin =: 1 & o.
cos =: 2 & o.

tie_self =: ] , {.

xs_pythagorean_triangle =: 0 4 4
ys_pythagorean_triangle =: 0 0 3

NB. $ 1 2 3  ---> 3 # 1 2 3 ---> 3
