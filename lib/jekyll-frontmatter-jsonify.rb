module Jekyll
  module FrontMatterJsonify
    # Jekyll keys to always ignore
    KeysBlacklist = [
      'next', 'previous'
    ]

    # These are keys defined and created by Jekyll. They will be ignored if the user chooses to exclude them from the
    # JSON array
    JekyllKeys = [
      'path', 'id', 'output', 'content', 'to_s', 'relative_path',
      'url', 'collection', 'excerpt', 'draft', 'categories',
      'title', 'slug', 'ext', 'tags', 'date'
    ]

    def collection_jsonify(collection, ignore_jekyll_keys = false)
      collectionArray = []

      collection.each do |item|
        docDrop = Drops::DocumentDrop.new(item)
        results = {}

        docDrop.keys.each do |key|
          next if (ignore_jekyll_keys and JekyllKeys.include? key) or (KeysBlacklist.include? key)

          results[key] = docDrop[key]
        end

        collectionArray << results
      end

      collectionArray.to_json
    end
  end
end

Liquid::Template.register_filter(Jekyll::FrontMatterJsonify)
