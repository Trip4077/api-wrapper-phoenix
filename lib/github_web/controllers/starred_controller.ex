defmodule GithubWeb.StarredController do
    use GithubWeb, :controller
    alias Github.User
    
    action_fallback GithubWeb.FallbackController

    def index(conn, _params) do
        # Grab the list of starred repos from my account
        data = User.list_starred("trip4077")
   
        render(conn, "index.json", data: data)
    end

    def show(conn, %{"id" => id}) do
        # Grab the list of starred repos from the id (github username) passed in from the route
        data = User.list_starred(id)
    
        render(conn, "starred.html", data: data)
    end
end