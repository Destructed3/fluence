Amber::Server.instance.config do |app|
  pipeline :web do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    # plug Amber::Pipe::Params.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Flash.new
    plug Amber::Pipe::Session.new
    # plug Amber::Pipe::CSRF.new
  end

  # All static content will run these transformations
  pipeline :static do
    plug HTTP::StaticFileHandler.new("public", true)
    plug HTTP::CompressHandler.new
  end

  routes :static do
    # Each route is defined as follow
    # verb resource : String, controller : Symbol, action : Symbol
    get "/*", StaticController, :index
  end

  routes :web do
    get "/", HomeController, :index

    get "/sitemap", PagesController, :sitemap
    get "/pages", PagesController, :index
    get "/pages/search", PagesController, :search
    get "/pages/*path", PagesController, :show
    post "/pages/*path", PagesController, :update

    post "/admin/pages/*path", PagesController, :admin

    get "/users/login", UsersController, :login
    post "/users/login", UsersController, :login_validates
    get "/users/register", UsersController, :register
    post "/users/register", UsersController, :register_validates

    get "/admin/users", UsersController, :admin
    post "/admin/users/delete", UsersController, :admin_delete
    post "/admin/users", UsersController, :admin_register
  end
end
