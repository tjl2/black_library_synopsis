defmodule BlackLibrarySynopsis do
  @moduledoc """
  Documentation for `BlackLibrarySynopsis`.
  """

  @doc """
  Generate a Black Library synopsis about a given prompt by using the OpenAI API.
  """
  def about(prompt) do
    {:ok, json_body} =
      Jason.encode(%{
        "model" => "text-davinci-003",
        "prompt" => "Write a synopsis for a Black Library novel about #{prompt}",
        "temperature" => 0.6,
        "max_tokens" => 250,
        "top_p" => 1,
        "frequency_penalty" => 1,
        "presence_penalty" => 1
      })

    case ChatGpt.post("completions", json_body, ChatGpt.headers(), recv_timeout: 10_000) do
      {:ok, response} ->
        {:ok, body} = Jason.decode(response.body)
        IO.puts(body |> Map.get("choices") |> List.first() |> Map.get("text"))

      {:error, error} ->
        IO.inspect(error)
    end
  end
end
