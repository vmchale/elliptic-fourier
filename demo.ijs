load 'elliptic-fourier.ijs'

xs =: 0 4 4
ys =: 0 0 3

coeff_arr =: (xs;ys) coeffs 15
coeff =: (xs;ys) box_coeffs 15
perimeter =: xs T ys
offs =: xs offset ys

points =: perimeter circularize coeff
plot_points =: offs plot_ef points
