module Archangel
  class PostsController < ApplicationController
    before_action :set_post, only: [:show]

    helper Archangel::Admin::PostsHelper

    def index
      @posts = Archangel::Post.published.page(params[:page]).per(per_page)

      @posts.in_year(params[:year]) if params[:year]
      @posts.in_month(params[:month]) if params[:month]

      respond_with @posts
    end

    def tag
      @posts = Archangel::Post.published
                              .with_tag(params[:slug])
                              .page(params[:page])
                              .per(per_page)

      respond_with @posts
    end

    def category
      @posts = Archangel::Post.published
                              .with_category(params[:slug])
                              .page(params[:page])
                              .per(per_page)

      respond_with @posts
    end

    def show
      respond_with @post
    end

    protected

    def set_post
      path = [
        params[:year],
        params[:month],
        params[:slug]
      ].join("/")

      @post = Archangel::Post.published.find_by!(path: path)
    end
  end
end
