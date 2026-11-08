module Jekyll
  # Generates one page per tag at /blog/tags/<tag>.html listing the posts
  # with that tag, rendered with the blog layout.
  class TagPage < Page
    def initialize(site, tag, posts)
      @site = site
      @base = site.source
      @dir = "blog/tags"
      @name = "#{Utils.slugify(tag)}.html"

      process(@name)
      self.content = ""
      self.data = {
        "layout" => "blog",
        "title" => "Posts tagged ##{tag}",
        "description" => "Posts by #{site.config["author"]} tagged ##{tag}.",
        "posts" => posts,
      }
    end
  end

  class TagPagesGenerator < Generator
    safe true

    def generate(site)
      site.tags.each do |tag, posts|
        site.pages << TagPage.new(site, tag, posts.sort_by(&:date).reverse)
      end
    end
  end
end
