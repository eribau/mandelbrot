defmodule Cmplx do
  @moduledoc """
  Functions for performing calculations on complex numbers
  """

  @typedoc """
  A simple representation of a complex number
  """
  @opaque cmplx :: {number(), number()}

  @doc """
  Creates a new complex number
  """
  @spec new(number(), number()) :: cmplx
  def new(real, imaginary) do
    {real, imaginary}
  end

  @doc """
  Adds two complex numbers together
  """
  @spec add(cmplx, cmplx) :: cmplx
  def add({ra, ia}, {rb, ib}) do
    {ra + rb, ia + ib}
  end

  @doc """
  Returns the square of a complex number
  """
  @spec sqr(cmplx) :: cmplx
  def sqr({r, i}) do
    {r*r - i*i, 2*r*i}
  end

  @doc """
  Returns the absolute value of a complex number
  """
  @spec abs(cmplx) :: number()
  def abs({r, i}) do
    :math.sqrt(r*r + i*i)
  end
end
