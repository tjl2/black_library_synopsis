defmodule BlackLibrarySynopsisTest do
  use ExUnit.Case
  doctest BlackLibrarySynopsis

  test "greets the world" do
    assert BlackLibrarySynopsis.hello() == :world
  end
end
