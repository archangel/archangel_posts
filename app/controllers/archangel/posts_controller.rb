module Archangel
  class PostsController < ApplicationController
    before_action :set_post, except: [:index]

    helper Archangel::Admin::PostsHelper

    def index
      @posts = Archangel::Post.published

      @posts.in_year(params[:year]) if params[:year]
      @posts.in_month(params[:month]) if params[:month]

      @posts.page(params[:page]).per(per_page)

      respond_with @posts if stale?(etag: @posts)
    end

    def show
      respond_with @post if stale?(etag: @post, last_modified: @post.updated_at)
    end

    protected

    def set_post
      path = [
        params[:year],
        "%02d" % params[:month],
        params[:slug]
      ].join("/")

      @post = Archangel::Post.published.find_by!(path: path)
    end
  end
end
