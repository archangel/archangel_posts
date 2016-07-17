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
    get "/", to: "posts#index", as: :posts, concerns: [:paginatable]

    # GET /blog/[YYYY]
    # GET /blog/[YYYY]/page/[PAGE]
    get "/:year", to: "posts#index",
                  as: :posts_year,
                  constraints: { year: /\d{4}/ },
                  concerns: [:paginatable]

    # GET /blog/[YYYY]/[MM]
    # GET /blog/[YYYY]/[MM]/page/[PAGE]
    get "/:year/:month", to: "posts#index",
                         as: :posts_year_month,
                         constraints: { year: /\d{4}/, month: /\d{2}/ },
                         concerns: [:paginatable]

    # GET /blog/[YYYY]/[MM]/[SLUG]
    get "/:year/:month/:slug", to: "posts#show",
                               as: :post,
                               constraints: { year: /\d{4}/, month: /\d{2}/ }
    # GET /blog/categories
    # GET /blog/categories/page/[PAGE]
    # GET /blog/categories/[SLUG]
    resources :categories, only: [:index, :show], concerns: [:paginatable]

    # GET /blog/tags
    # GET /blog/tags/page/[PAGE]
    # GET /blog/tags/[SLUG]
    resources :tags, only: [:index, :show], concerns: [:paginatable]
  end
end
