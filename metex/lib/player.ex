defmodule Pingpong.Player do
  def loop(sound_effect) do
    receive do
      {:serve, server, returner} ->
        IO.puts(sound_effect)
        send returner, {:ball, returner, server}
      {:ball, receiver, sender} ->
        IO.puts(sound_effect)
        send sender, {:ball, sender, receiver}
      :wat ->
        IO.puts("Sorry, old chap.")
      _ ->
        :wat
    end
    loop(sound_effect)
  end
end