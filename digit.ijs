load 'tables/csv'
load 'elliptic-fourier.ijs'

contour_table =: readcsv 'digit.csv'
'xs ys' =: |: > makenum each (1 2 & {) " 1 }. contour_table

NB. untie self
xs =: }: xs
ys =: }: ys

coeff_arr =: (xs;ys) coeffs 15
coeff =: (xs;ys) box_coeffs 15
perimeter =: xs T ys
offs =: xs offset ys

points =: perimeter circularize coeff
plot_points =: offs plot_ef points
