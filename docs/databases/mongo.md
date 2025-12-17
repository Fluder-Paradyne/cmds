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
