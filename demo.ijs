load 'elliptic.ijs'
load 'plot'

xs =: 0 4 4
ys =: 0 0 3

coeff =: (xs;ys) box_coeffs 15

T =: xs T ys

offs =: xs offset ys

points =: T circularize coeff
plot_points =: offs plot_ef points
