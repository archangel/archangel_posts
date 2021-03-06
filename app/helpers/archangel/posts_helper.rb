module Archangel
  module PostsHelper
    def author_link(post)
      link_to(post.author.name, "#")
    end

    def posted_at(post)
      post_date = post.published_at.strftime("%B %e, %Y at %l:%M %p")
      post_datetime = post.published_at.strftime("%FT%T%:z")

      content_tag(:time, post_date, pubdate: "", datetime: post_datetime)
    end

    def post_path(post)
      "blog/#{post.path}"
    end

    def post_url(post)
      post_path(post)
    end
  end
end
