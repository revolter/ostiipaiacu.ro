Jekyll::Hooks.register(:pages, :post_render) do |page|
    config = page.site.config

    feed_tags_config = config.dig('feed', 'tags') || {}
    config_feed_tags_path = feed_tags_config['path'] || ''
    config_feed_tags = feed_tags_config['only'] || []

    config_feed_tag_paths = config_feed_tags.map do |tag|
        "#{config_feed_tags_path}#{tag}.xml"
    end
    page_path = page.url

    is_feed_page = config_feed_tag_paths.include?(page_path)

    next unless is_feed_page

    title = config['title'] || config['name'] || ''
    regex_escaped_title = Regexp.escape(title)

    page_tag = File.basename(page.basename)

    Jekyll.logger.debug('Prefixing Title:', page.path)

    page.output = page.output.gsub(
        /(?<prefix><title[^>]*>)(?<suffix>#{regex_escaped_title}<\/title>)/,
        "\\k<prefix>#{page_tag}: \\k<suffix>"
    )
end
