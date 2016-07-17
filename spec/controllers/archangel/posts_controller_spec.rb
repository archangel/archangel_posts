require "rails_helper"

module Archangel
  RSpec.describe PostsController, type: :controller do
    describe "GET #show" do
      it "uses correct layout" do
        post = create(:post)

        archangel_get :show, params: {
          year: post.published_at.year,
          month: "%02d" % post.published_at.month,
          slug: post.slug
        }

        expect(response).to(
          render_template(layout: "archangel/layouts/application")
        )
      end

      it "assigns the requested post as @post" do
        post = create(:post)

        archangel_get :show, params: {
          year: post.published_at.year,
          month: "%02d" % post.published_at.month,
          slug: post.slug
        }

        expect(assigns(:post)).to eq(post)
      end
    end
  end
end
