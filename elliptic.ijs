NB. http://www.sci.utah.edu/~gerig/CS7960-S2010/handouts/Kuhl-Giardina-CGIP1982.pdf

dist =: 13 : '%: ((*: x) + (*: y))'

NB. helper adverb for successive difference, quotient
NB. https://rosettacode.org/wiki/Successive_prime_differences#J
sap =: 1 : '2 u ~/\ ]'

succ_diff =: - sap

delta_t =: [: succ_diff dist

t =: 13 : '+/\ | (x delta_t y)'

pi =: o. 1

sin =: 1 & o.
cos =: 2 & o.

tie_self =: ] , {.

coeff =: 4 : 0
    'xs ys' =. x
    n =: y
    K =. # xs
    T =: {: (tie_self xs) t (tie_self ys)
    delta_ts =. xs delta_t ys
    ts =. 0 , xs t ys
    outer_coeff =. T % (2 * (*: n) * (*: pi))
    delta_xs =. succ_diff xs
    delta_ys =. succ_diff ys
    u =. 4 : 'cos (2 * n * pi * x % T) - cos (2 * n * pi * y % T)'
    v =. 4 : 'sin (2 * n * pi * x % T) - sin (2 * n * pi * y % T)'
    cos_diffs =. u sap ts
    sin_diffs =. v sap ts
    dxs =. delta_xs % delta_ts
    dys =. delta_ys % delta_ts 
    a_n_sum =. +/ dxs * cos_diffs
    b_n_sum =. +/ dxs * sin_diffs 
    c_n_sum =. +/ dys * cos_diffs
    d_n_sum =. +/ dys * sin_diffs
    outer_coeff * (a_n_sum , b_n_sum , c_n_sum , ,: d_n_sum)
)

NB. first n coefficients (in a 4x_ array)
coeffs =: 4 : '|: (((x & coeff) " 0) (}. i.y))'

xs_pythagorean_triangle =: 0 4 4
ys_pythagorean_triangle =: 0 0 3
