# Jekyll Frontmatter Jsonify

## Use it

Take a look at [Jekyll's instructions for loading plugins](https://jekyllrb.com/docs/plugins/#installing-a-plugin).

```
gem install jekyll-frontmatter-jsonify
```

## The problem

The `jsonify` filter when applied to a collection will convert only the body of the collection item into a JSON array, and not the frontmatter.

For example, we have a collection with two items:

**_sample_collection/item1.md**

```
---
food: bacon
---

Sample Content from 'item1.md'
```

**_sample_collection/item2.md**

```
---
food: toast
---

Awesome content from 'item2.md'
```

### The `jsonify` filter

```
{{ site.sample_collection | jsonify }}
```

**Returns**

```
[ "Sample Content from 'item1.md'", "Awesome content from 'item2.md'" ]
```

## The solution

This plug-in introduces the `collection_jsonify` Liquid filter which will convert each collection item's frontmatter into a JSON array.

```
{{ site.sample_collection | collection_jsonify }}
```

**Returns**

```
[
  {
      "food": "bacon",
      // Jekyll default keys
      "draft": false,
      "categories": [],
      "ext": ".md"
  },
  {
      "food": "toast",
      // Jekyll default keys
      "draft": false,
      "categories": [],
      "ext": ".md"
  }
]
```

This filter takes a single boolean as a parameter (defaults to `false`) that will ignore Jekyll's default keys in the frontmatter and only return the custom data a collection item has in its frontmatter. In the above example, only the "food" key would be outputted if the parameter was set to true (i.e. ` | collection_jsonify: true`)

## License

MIT
