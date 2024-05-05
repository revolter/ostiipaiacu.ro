module Jekyll
    class TagFeedsMetaTag < Liquid::Tag
        include Jekyll::Filters::URLFilters

        def render(context)
            @context = context

            config = context.registers[:site].config

            config_title  = config['title'] || config['name'] || ''

            feed_tags_config = config.dig('feed', 'tags') || {}
            config_feed_tags_path = feed_tags_config['path'] || ''
            config_feed_tags = feed_tags_config['only'] || []

            return config_feed_tags
                .map do |config_feed_tag|
                    attributes = {
                        type: 'application/atom+xml',
                        rel: 'alternate',
                        href: absolute_url("#{config_feed_tags_path}#{config_feed_tag}.xml"),
                        title: "#{config_feed_tag}: #{config_title}"
                    }

                    attributes_string = attributes
                        .map { |key, value| "#{key}=#{value.encode(xml: :attr)}" }
                        .join(' ')

                    "<link #{attributes_string} />"
                end
                .join("\n")
        end
    end
end

Liquid::Template.register_tag('tag_feeds_meta', Jekyll::TagFeedsMetaTag)
