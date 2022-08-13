# ch05 DB and Active Record



Info on the table and types of the model/table in question:

```
irb(main):012:0> Article.column_names
=> ["id", "title", "body", "published_at", "created_at", "updated_at"]

irb(main):013:0> Article
=> Article(id: integer, title: string, body: text, published_at: datetime, created_at: datetime, updated_at: datetime)

irb(main):003:0> Article.methods.size
=> 773
```



```
article = Article.new

a.title
```

