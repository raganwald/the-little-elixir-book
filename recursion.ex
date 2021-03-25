defmodule Recursion do

  def foldl(_, [], seed), do: seed
  def foldl(f, [head | tail], seed), do: foldl(f, tail, f.(seed, head))
  def foldl(f, seed), do: fn(list) -> foldl(f, list, seed) end

  def foldl(f), do: fn([head | tail]) -> foldl(f, tail, head) end

  def foldr(_, [], seed), do: seed
  def foldr(f, [head | tail], seed), do: f.(head, foldr(f, tail, seed))
  def foldr(f, seed), do: fn(list) -> foldr(f, list, seed) end

  def _foldr(_, [only]), do: only
  def _foldr(f, [head | tail]), do: f.(head, _foldr(f, tail))

  def foldr(f), do: fn(list) -> _foldr(f, list) end

  def reverse([]), do: []
  def reverse(list), do: foldl(fn(tail, head) -> [head | tail] end, list, [])

  def flatten([]), do: []
  def flatten([ head | tail]), do: flatten(head) ++ flatten(tail)
  def flatten(something), do: [something]
end
