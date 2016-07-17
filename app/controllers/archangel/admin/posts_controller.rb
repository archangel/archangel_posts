module Archangel
  module Admin
    class PostsController < AdminController
      before_action :set_post, only: [:show, :new, :edit, :update, :destroy]

      helper Archangel::Admin::PostsHelper

      def index
        @posts = Archangel::Post.page(params[:page]).per(per_page)

        authorize @posts

        respond_with @posts
      end

      def show
        respond_with @post
      end

      def new
        respond_with @post
      end

      def edit
        respond_with @post
      end

      def create
        @post = Archangel::Post.new(post_params)

        authorize @post

        @post.save

        respond_with @post, location: -> { admin_posts_path }
      end

      def update
        @post.update(post_params)

        respond_with @post, location: -> { admin_posts_path }
      end

      def destroy
        @post.destroy

        respond_with @post, location: -> { admin_posts_path }
      end

      protected

      def permitted_attributes
        [
          :author_id, :content, :excerpt, :feature, :meta_description,
          :meta_keywords, :published_at, :remove_feature, :slug, :title,
          category_ids: [],
          tag_ids: []
        ]
      end

      def post_params
        params.require(:post).permit(permitted_attributes)
      end

      def set_post
        if action_name.to_sym == :new
          @post = Archangel::Post.new
        else
          @post = Archangel::Post.find_by!(id: params[:id])
        end

        authorize @post
      end
    end
  end
end
