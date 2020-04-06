load 'elliptic.ijs'

xs =: 0 4 4
ys =: 0 0 3

coeff =: (xs;ys) box_coeffs 15

NB. tacit?
res_point =: 3 : '(12;coeff) reconstitute y'

points =: |: res_point " 0 radians 100
plot_points =: ((0 & {) ; (1 & {)) points
