defmodule BrotTest do
  use ExUnit.Case
  doctest Brot

  test "test of mandelbrot with threshold 1" do
    c = Cmplx.new(0.8, 0)
    m = 1
    assert Brot.mandelbrot(c, m) == 0
  end
end
