# Jekyll Frontmatter Jsonify

The problem with the `jsonify` filter on a collection is that it will convert only the body of the collection item into
a JSON array but not the frontmatter.

```
{{ site.sample_collection | jsonify }}
```

This plug-in introduces the `collection_jsonify` Liquid filter which will convert all of the data of the collection item
into a JSON array; this array contains all of the frontmatter and data such as `output` or `content`.

```
{{ site.sample_collection | collection_jsonify }}
```

## License

MIT