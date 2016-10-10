Archangel::Engine.routes.draw do
  # Pagination
  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection, as: ""
  end

  namespace :admin, path: Archangel.configuration.admin_path do
    # GET /admin/posts
    # GET /admin/posts/page/[PAGE]
    # GET /admin/posts
    # POST /admin/posts
    # GET /admin/posts/new
    # GET /admin/posts/[ID]/edit
    # GET /admin/posts/[ID]
    # PATCH /admin/posts/[ID]
    # PUT /admin/posts/[ID]
    # DELETE /admin/posts/[ID]
    resources :posts, concerns: [:paginatable]
  end

  # scope Archangel.configuration.posts_path do
  scope "blog" do
    # GET /blog
    # GET /blog/page/[PAGE]
    get "/(page/:page)", to: "posts#index", as: :posts

    # GET /blog/[YYYY]
    # GET /blog/[YYYY]/page/[PAGE]
    get "/:year(/page/:page)", to: "posts#index",
                  as: :posts_year,
                  constraints: { year: /\d{4}/ }

    # GET /blog/[YYYY]/[MM]
    # GET /blog/[YYYY]/[MM]/page/[PAGE]
    get "/:year/:month(/page/:page)", to: "posts#index",
                         as: :posts_year_month,
                         constraints: { year: /\d{4}/, month: /\d{2}/ }

    # GET /blog/[YYYY]/[MM]/[SLUG]
    get "/:year/:month/:slug", to: "posts#show",
                               as: :post,
                               constraints: { year: /\d{4}/, month: /\d{2}/ }

     # GET /blog/category/[SLUG]
     # GET /blog/category/[SLUG]/page/[PAGE]
     get "/category/:slug(/page/:page)", to: "posts#category",
                                             as: :posts_category

     # GET /blog/tag/[SLUG]
     # GET /blog/tag/[SLUG]/page/[PAGE]
     get "/tag/:slug(/page/:page)", to: "posts#tag", as: :posts_tag
  end
end
