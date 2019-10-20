defmodule Github do
  @moduledoc """
  Github keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @expected_fields ~w(
    "login" "id" "node_id" "avatar_url" "gravatar_id" "url" "html_url" "followers_url" "following_url" "gists_url" "starred_url" "subscriptions_url" "organizations_url" "repos_url" "events_url" "received_events_url" "type" "site_admin"
    "name" "company" "blog" "location" "email" "hireable" "bio" "public_repos" "public_gists" "followers" "following" "created_at" "updated_at"
  )


  def process_url(handle) do
    "https://api.github.com/users/#{handle}?client_id=baa07460a2faf7efd879&client_secret=6310922f03a518b3f2b33d64e1bf571700fd0fd8"
  end

  def process_url do
    "https://api.github.com/users?client_id=baa07460a2faf7efd879&client_secret=6310922f03a518b3f2b33d64e1bf571700fd0fd8"
  end

  def decode_body(res) do
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
end
