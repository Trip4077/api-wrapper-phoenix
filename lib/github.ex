defmodule Github do
  @moduledoc """
  Github keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @expected_fields ~w(
    "name" "full_name" "owner" "html_url" "url" "description" 
  )


  def process_url(handle) do
    "https://api.github.com/users/#{handle}?client_id=baa07460a2faf7efd879&client_secret=6310922f03a518b3f2b33d64e1bf571700fd0fd8"
  end

  def process_url do
    "https://api.github.com/users?client_id=baa07460a2faf7efd879&client_secret=6310922f03a518b3f2b33d64e1bf571700fd0fd8"
  end

  def decode_body(res) do
    IO.inspect res
    Poison.decode! res.body
  end

  def fetch_user_info(handle) do
    Github.process_url(handle)
    |> HTTPoison.get!
    |> Github.decode_body
  end

  def fetch_user_info do
    Github.process_url
    |> HTTPoison.get!
    |> Github.decode_body
  end

  def fetch_starred_repos(handle) do
    response = HTTPoison.get! "https://api.github.com/users/#{handle}/starred?client_id=baa07460a2faf7efd879&client_secret=6310922f03a518b3f2b33d64e1bf571700fd0fd8"

    Poison.decode! response.body
  end  
  
  def fetch_starred_repos do
    HTTPoison.get! "https://api.github.com/users/Trip4077/starred?client_id=baa07460a2faf7efd879&client_secret=6310922f03a518b3f2b33d64e1bf571700fd0fd8"
    |> Github.decode_body
  end
end
