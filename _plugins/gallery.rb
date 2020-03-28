module Jekyll
  class GalleryPlugin < Liquid::Tag
    attr_reader :context

    def render(context)
      @context = context

      items, title, classnames = if gallery.is_a?(Hash)
        [gallery["items"], gallery["title"], gallery["classnames"]]
      else
        [gallery, nil, nil]
      end

      classnamess = ["gallery"].concat(classnames || ["grid-1"]).join(" ")

      <<~HTML
        <div class="#{classnamess}">
          #{if title then "<div class=\"gallery--title\"><h3>#{title}</h3></div>" else nil end}
          #{render_items(items)}
        </div>
      HTML
    end

    def render_items(items)
      content = items.map do |item|
        title = "<h4> #{item["title"]}</h4>" if item["title"]

        <<~HTML
          <div class="gallery--item">
            #{title}
            #{gallery_item(item)}
          </div>
        HTML
      end.join

      <<~HTML
        <div class="gallery--content">
          #{content}
        </div>
      HTML
    end

    private

    def gallery
      context["page"]["gallery"][@markup.strip]
    end

    def gallery_item(item)
      url = "/#{post_url}/#{item["file"]}"

      case item["type"]
      when "audio"
        <<~HTML
          <audio controls src="#{url}"></audio>
        HTML
      when "image"
      else
        <<~HTML
          <a href="#{url}">
            <img src="#{url}" alt="#{item["title"]}" />
          </a>
        HTML
      end
    end

    def post_url
      @post_url ||= "assets/images/#{slug}"
    end

    def slug
      context["page"]["id"].sub(/^\//, "").gsub(/\//, "-")
    end
  end
end

Liquid::Template.register_tag("gallery", Jekyll::GalleryPlugin)
