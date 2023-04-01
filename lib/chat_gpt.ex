defmodule ChatGpt do
  use HTTPoison.Base

  @openai_endpoint "https://api.openai.com/v1/"
  @headers [
    {"Authorization", "Bearer #{System.get_env("OPENAI_API_KEY")}"},
    {"Content-Type", "application/json"}
  ]

  def process_request_url(url) do
    @openai_endpoint <> url
  end

  def headers, do: @headers
end
