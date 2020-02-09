-- | Upstream reference [here](http://www.sci.utah.edu/~gerig/CS7960-S2010/handouts/Kuhl-Giardina-CGIP1982.pdf)
module type elliptic_fourier = {

  type real

  type point = {x: real, y: real}

  type coeff = {a: real, b: real, c: real, d: real}

  -- | Extract the coefficients.
  --
  -- Performs no verification that the input is a polygon.
  val extract_coeff [K]: [K]point -> (n: i32) -> [n]coeff

  -- TODO: consider record with coeff. + center point? that way we can ensure K is the same.

  -- | Compute center point of the main ellipse.
  --
  -- Performs no verification that the input is a polygon.
  val center_point [K]: [K]point -> (n: i32) -> point

}

module mk_elliptic_fourier(M: real): (
  elliptic_fourier with real = M.t
  ) = {

  type real = M.t

  type point = {x: M.t, y: M.t}

  type coeff = {a: M.t, b: M.t, c: M.t, d: M.t}

  -- Δt² = Δx² + Δy²
  -- generate t from Δt and a scan
  -- T = t_K

  -- works b/c polygon
  local let delta_poly [K] (x: [K]M.t) : [K]M.t =
    let go i =
      -- range 1..K
      if i == K - 1
        then x[K-1] M.- x[0]
        else x[i+1] M.- x[i]

    in tabulate K go

  let extract_coeff [K] (xs: [K]point)(n) =
    let delta_x = delta_poly (map (\p -> p.x) xs)
    let delta_y = delta_poly (map (\p -> p.y) xs)
    let delta_t = map2 (\x y -> M.sqrt (x M.* x M.+ y M.* y)) delta_x delta_y
    let ts = scan (M.+) (M.from_fraction 0 1) delta_t
    let T = M.sum ts

    in
    tabulate n (\_ -> { a = M.from_fraction 0 1, b = M.from_fraction 0 1, c = M.from_fraction 0 1, d = M.from_fraction 0 1 })

  let center_point(xs)(n) =
    {x = M.from_fraction 0 1, y = M.from_fraction 0 1}

}
