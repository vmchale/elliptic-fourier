load 'elliptic.ijs'
load 'plot'

xs =: 0 4 4
ys =: 0 0 3

NB. First 15 coefficients of a_n etc.
coeff =: (xs;ys) box_coeffs 15

T =: xs T ys

offs =: xs offset ys

points =: T circularize coeff
plot_points =: offs plot_ef points
