defmodule Brot do
  import Cmplx

  @spec mandelbrot(Cmplx.cmplx, integer()) :: integer()
  def mandelbrot(c, m) do
    z0 = Cmplx.new(0, 0)
    i = 0
    test(i, z0, c, m)
  end

  @spec test(integer(), Cmplx.cmplx, Cmplx.cmplx, integer()) :: integer()
  def test(m, _, _, m) do 0 end
  def test(i, z, c, m) do
    if Cmplx.abs(z) >= 2 do
      i
    else
      zn = Cmplx.add(Cmplx.sqr(z), c)
      test(i+1, zn, c, m)
    end
  end
end
