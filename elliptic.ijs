NB. http://www.sci.utah.edu/~gerig/CS7960-S2010/handouts/Kuhl-Giardina-CGIP1982.pdf

dist =: %: @: + &: *:

NB. helper adverb for successive difference, quotient
NB. https://rosettacode.org/wiki/Successive_prime_differences#J
sap =: 1 : '2 u ~/\ ]'

succ_diff =: - sap

delta_t =: dist &: succ_diff

t =: dyad : '+/\ | (x delta_t y)'
pi =: o. 1

sin =: 1 & o.
cos =: 2 & o.

tie_self =: ] , {.

t_step =: t &: (0, tie_self)

NB. for debugging lol
print_debug =: monad : 'y (1!:2) 2'

coeff =: 4 : 0
    'xs ys' =. x
    n =: y
    K =. # xs
    NB. correct?
    ts =. xs t_step ys
    NB. tie at both (so we have t0 and tK equally
    T =: {: ts
    outer_coeff =. T % (2 * (*: n) * (*: pi))
    delta_xs =. succ_diff tie_self xs
    delta_ys =. succ_diff tie_self ys
    delta_ts =. delta_xs dist delta_ys

    u =. 4 : 'cos (2 * n * pi * x % T) - cos (2 * n * pi * y % T)'
    v =. 4 : 'sin (2 * n * pi * x % T) - sin (2 * n * pi * y % T)'

    cos_diffs =. u sap ts
    sin_diffs =. v sap ts
    dxs =. delta_xs % delta_ts
    dys =. delta_ys % delta_ts
    coalesce =. (outer_coeff & *) @: +/

    a_n_sum =. coalesce dxs * cos_diffs
    b_n_sum =. coalesce dxs * sin_diffs
    c_n_sum =. coalesce dys * cos_diffs
    d_n_sum =. coalesce dys * sin_diffs

    NB. I feel like there's a better way to do this
    (a_n_sum , b_n_sum , c_n_sum ,: d_n_sum)
)

NB. first n coefficients (in a 4x_ array)
coeffs =: 4 : '|: (((x & coeff) " 0) (}. i.(y+1)))'
box_coeffs =: <"1 @ coeffs

xs_pythagorean_triangle =: 0 4 4
ys_pythagorean_triangle =: 0 0 3
