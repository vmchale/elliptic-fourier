# elliptic-fourier

Elliptic Fourier series in Futhark. This is used for
approximating/characterizing contours of polygons.

## Use

As an example, for the triangle with vertices `(0,0)`, `(4,0)`, `(4,3)`:

```j
   (0 4 4;0 0 3) coeffs 5
 _1.81942 _0.288765 _0.054038  _0.102588 _0.0390819
 0.283309 _0.026324 _0.054038   0.059229  _0.030786
_0.903161  0.106387 _0.108076 _0.0341959   0.031263
 _1.01282  0.342212 _0.108076   0.019743 0.00160555
   0 4 4 offset 0 0 3
┌───┬─┐
│2.5│1│
└───┴─┘
```

See [Kuhl and
Giardinia](http://www.sci.utah.edu/~gerig/CS7960-S2010/handouts/Kuhl-Giardina-CGIP1982.pdf)
for context.
