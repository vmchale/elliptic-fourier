from sklearn.datasets import load_digits

from skimage import measure

digits = load_digits()

first = digits.images[0].reshape((8, 8))

contours = measure.find_contours(first, 0.8)
print(contours)
print(contours[0].shape)
