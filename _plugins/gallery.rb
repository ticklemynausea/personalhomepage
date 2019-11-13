module Jekyll
  class GalleryPlugin < Liquid::Tag
    attr_reader :context

    def render(context)
      @context = context

      items, title = if gallery.is_a?(Hash)
        [gallery["items"], gallery["title"]]
      else
        [gallery, nil]
      end

      <<~HTML
        <div class="gallery">
          #{if title then "<h3>#{title}</h3>" else nil end}
          #{render_items(items)}
        </div>
      HTML
    end

    def render_items(items)
      items.map do |item|
        <<~HTML
          <div class="gallery__item">
            <h4>
              #{item["title"]}
            </h4>
            <p>
              #{gallery_item(item)}
            </p>
          </div>
        HTML
      end.join
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
