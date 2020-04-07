load 'elliptic.ijs'
load 'plot'

xs =: 0 4 4
ys =: 0 0 3

coeff =: (xs;ys) box_coeffs 15

T =: xs T ys

NB. tacit?
res_point =: 3 : '(T;coeff) reconstitute y'

offs =: xs offset ys

recombine =: dyad : 0
    'A C' =. x
    ((A&+)@(0&{) ; (C&+)@(1&{)) y
)


points =: |: res_point " 0 radians 140
plot_points =: offs recombine points
