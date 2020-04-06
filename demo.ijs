load 'elliptic.ijs'

xs =: 0 4 4
ys =: 0 0 3

'a_n b_n c_n d_n' =: (xs;ys) box_coeffs 15

res_point =: 3 : '(12;a_n;b_n;c_n;d_n) reconstitute y'

points =: |: res_point " 0 radians 100
plot_points =: ((0 & {) ; (1 & {)) points
