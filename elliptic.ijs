NB. http://www.sci.utah.edu/~gerig/CS7960-S2010/handouts/Kuhl-Giardina-CGIP1982.pdf

dist =: %: @: + &: *:

NB. https://rosettacode.org/wiki/Successive_prime_differences#J
sap =: 1 : '2 u ~/\ ]'

succ_diff =: - sap

delta_t =: dist &: succ_diff

t =: dyad : '+/\ | (x delta_t y)'
pi =: o. 1

det =: -/ .*

sin =: 1 & o.
cos =: 2 & o.

tie_self =: ] , {.

t_step =: t &: (0, tie_self)

NB. perimeter of a polygon (period in our case)
T =: {: @: t_step

NB. left argument an array containing the x coordinates, right argument an array containing the y coordinates
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

NB. left argument (T;coeffs) where coeffs is the result of box_coeffs and T is the period (perimeter)
reconstitute =: dyad : 0
    'T a_n b_n c_n d_n' =. x
    rot =. 2 * y * pi % T
    N =. #a_n
    ix =. >:i.N
    coss =. cos (rot * ix)
    sins =. sin (rot * ix)
    X_n =. (+/ (a_n * coss)) + (+/ (b_n * sins))
    Y_n =. (+/ (c_n * coss)) + (+/ (d_n * sins))
    X_n,Y_n
)

NB. missing a factor of two somewhere?
radians =: 3 : 0
    coeff =. 4 * pi % y
    coeff * (i.y)
)

NB. left argument T right arugment result of box_coeffs
circularize =: dyad : '|: ((x;y) & reconstitute) " 0 radians 140'

NB. helper function to plot results of circularize
NB. Left argument (A,C) offset
plot_ef =: dyad : 0
    'A C' =. x
    ((A&+)@(0&{) ; (C&+)@(1&{)) y
)

NB. Invariants of Lin and Hwang, see https://www.sciencedirect.com/science/article/abs/pii/003132038790080X
NB. monads taking results of coeffs (a 4xN array) as an argument
J =: det " 1 @ |:
I =: (+/ @: *:) " 1 @ |:

NB. first n coefficients (in a 4x_ array)
NB. left argument: (xs;ys) where xs, ys arrays containing coordinates, right argument n (the number of fourier coefficients to retunr)
coeffs =: 4 : '{. |: (((x & coeff) " 0) (>: i.y))'
box_coeffs =: <"1 @ coeffs
