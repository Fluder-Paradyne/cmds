### Get all the collecitons with this prefix
```js
const prefix = 'ticket';

const matchingCollections = db.getCollectionInfos({
    name: {
        $regex: '^' + prefix
    }
});

matchingCollections.forEach(collection => {
    print(collection.name);
});
```

### Get all the collecitons with this prefix, along with docs count
```js
var prefix = 'ticket';

db.getCollectionInfos({ name: { $regex: '^' + prefix } }).forEach(function (c) {
    var cnt = db.getCollection(c.name).countDocuments();
    print(c.name + ": " + cnt);
});
```

substring check
```js
const substring = '2';

const matchingCollections = db.getCollectionInfos({
    name: {
        $regex: substring
    }
});

matchingCollections.forEach(collection => {
    print(collection.name);
});

```
