defmodule Mandel do

  def mandelbrot(width, height, x, y, k, depth) do
    trans = fn(w, h) ->
      Cmplx.new(x + k * (w - 1), y - k * (h - 1))
    end

    rows(width, height, trans, depth, [])
  end

  def rows(_, 0, _, _, image), do: image
  def rows(width, height, trans, depth, image) do
    row = row(width, height, trans, depth, [])
    rows(width, height - 1, trans, depth, [row | image])
  end

  def row(0, _, _, _, row), do: row
  def row(width, height, trans, depth, row) do
    c = trans.(width, height)
    mandel = Brot.mandelbrot(c, depth)
    color = Color.convert(mandel, depth)
    row = [color | row]
    row(width - 1, height, trans, depth, row)
  end

  def demo() do
    small(-2.6, 1.2, 1.2)
  end

  def small(x0, y0, xn) do
    width = 960
    height = 540
    depth = 64
    k = (xn - x0) / width
    image = Mandel.mandelbrot(width, height, x0, y0, k, depth)
    PPM.write("small.ppm", image)
  end
end
