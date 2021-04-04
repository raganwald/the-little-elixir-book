defmodule Pingpong do

  def play do
    pingyi = spawn(Pingpong.Player, :loop, ["ping"])
    dave_pong = spawn(Pingpong.Player, :loop, ["pong"])

    send pingyi, {:serve, pingyi, dave_pong}
  end

end