defmodule Metex.Coordinator do

  def loop(accumulated_results \\ [], number_of_results_expected) do
    receive do
      {:ok, result} ->
        updated_results = [result|accumulated_results] #cons

        if number_of_results_expected == Enum.count(updated_results) do
          IO.puts(updated_results |> Enum.sort |> Enum.join(", "))
        else
          loop(updated_results, number_of_results_expected)
        end
      _ ->
        loop(accumulated_results, accumulated_results)
    end
  end

end