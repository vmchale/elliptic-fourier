module type elliptic_fourier = {

  type real

  type point = {x: real, y: real}

  type coeff = {a: real, b: real, c: real, d: real}

  val extract_coeff [n]: [n]point -> [n]coeff

  val center_point [n]: [n]point -> point

}

module mk_elliptic_fourier(M: real): (
  elliptic_fourier with real = M.t
  ) = {

  type real = M.t

  type point = {x: M.t, y: M.t}

  type coeff = {a: M.t, b: M.t, c: M.t, d: M.t}

}

-- type point = {x:f64, y:f64}
