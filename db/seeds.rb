# ruby encoding: utf-8

unless Archangel::Post.published.first
  Archangel::Post.create(title: "First Post",
                         slug: "first-post",
                         author_id: Archangel::User.first.id,
                         excerpt: "This is an excerpt of the first post.",
                         content: "This is the body of the very first post.",
                         published_at: Time.current)
end
