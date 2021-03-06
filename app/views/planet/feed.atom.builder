atom_feed do |feed|
  feed.title(t 'pages.planet.headline')
  feed.updated(@entries.first.updated_at)

  @entries.each do |entry|
    feed.entry(entry, :url => entry.url) do |feeditem|
      feeditem.title(entry.title)

      feeditem.author do |author|
        author.name entry.author
      end

      feeditem.content(entry.sanitized_body, :type => 'html')
    end
  end
end
