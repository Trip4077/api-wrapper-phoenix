defmodule GithubWeb.StarredController do
    use GithubWeb, :controller
    alias Github.User
    
    action_fallback GithubWeb.FallbackController

    def index(conn, _params) do
        data = User.list_starred("trip4077")
   
        render(conn, "index.json", data: data)
    end

    def show(conn, %{"id" => id}) do
        data = User.list_starred(id)
       IO.inspect data
        render(conn, "starred.html", data: data)
    end
end