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

offset =: 4 : 0
    delta_xs =. succ_diff tie_self x
    delta_ys =. succ_diff tie_self y
    delta_ts =. delta_xs dist delta_ys

    partial_xs =. +/\ delta_xs
    partial_ys =. +/\ delta_ys
    partial_ts =. +/\ delta_ts

    xi =. partial_xs - (delta_xs % delta_ts) * partial_ts
    delta =. partial_ys - (delta_ys % delta_ts) * partial_ts

    ts =. x t_step y
    delta_tsq =. succ_diff (ts ^ 2)

    T =. {: ts
    A =. (%&T) +/ (((delta_xs % 2 * delta_ts) * delta_tsq) + xi * delta_ts)
    C =. (%&T) +/ (((delta_ys % 2 * delta_ts) * delta_tsq) + delta * delta_ts)

    A;C
)

coeff =: 4 : 0
    'xs ys' =. x
    n =. y
    ts =. xs t_step ys
    NB. tie at both (so we have t0 and tK equally
    T =. {: ts
    outer_coeff =. T % (2 * (*: n) * (*: pi))
    delta =. succ_diff @: tie_self
    delta_xs =. delta xs
    delta_ys =. delta ys
    delta_ts =. delta_xs dist delta_ys

    scale_rad =. (*& (2*n*pi%T))

    cos_diff =. -&: (cos @ scale_rad)
    sin_diff =. -&: (sin @ scale_rad)

    cos_diffs =. cos_diff sap ts
    sin_diffs =. sin_diff sap ts

    dxs =. delta_xs % delta_ts
    dys =. delta_ys % delta_ts

    coalesce =. outer_coeff & * @: (+/)

    a_n_sum =. coalesce dxs * cos_diffs
    b_n_sum =. coalesce dxs * sin_diffs
    c_n_sum =. coalesce dys * cos_diffs
    d_n_sum =. coalesce dys * sin_diffs

    (a_n_sum , b_n_sum , c_n_sum ,: d_n_sum)
)

NB. first n coefficients (in a 4x_ array)
coeffs =: 4 : '|: (((x & coeff) " 0) (>: i.y))'
box_coeffs =: <"1 @ coeffs

xs_pythagorean_triangle =: 0 4 4
ys_pythagorean_triangle =: 0 0 3

NB. need X_n function
