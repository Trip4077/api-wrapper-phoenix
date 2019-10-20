defmodule GithubWeb.DatumView do
  use GithubWeb, :view
  alias GithubWeb.DatumView

  def render("index.json", %{data: data}) do
    %{data: render_many(data, DatumView, "details.html")}
  end

  def render("show.json", %{datum: datum}) do
    %{data: render_one(datum, DatumView, "details.html")}
  end

  def render("details.html", datum: datum) do
    %{
      avatar_url: datum["avatar_url"],
      bio: datum["bio"],
      email: datum["email"],
      company: datum["company"],
      blog: datum["blog"],
      followers: datum["followers"],
      following: datum["following"],
      login: datum["login"],
      name: datum["name"],
      starred_url: datum["starred_url"]
     }
  end
end
