import numpy as np
import pyefd

triangle = np.array([[0,0],[4,0],[4,3]]) # [[0,4,4],[0,0,3]])
print(triangle.shape)
offset = pyefd.calculate_dc_coefficients(triangle)
print(offset)
