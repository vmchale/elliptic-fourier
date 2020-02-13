NB. http://www.sci.utah.edu/~gerig/CS7960-S2010/handouts/Kuhl-Giardina-CGIP1982.pdf

dist =: 13 : '%: ((*: x) + (*: y))'

succ_diff =: 2 -~/\ ]

delta_t =: 13 : 'succ_diff (x dist y)'

T =: 13 : '+/ | (x delta_t y)'
