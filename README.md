# Parse SDK for Flutter (Under Development)

[ParseSDK](https://github.com/2shrestha22/parse_flutter) is a minimal SDK (unofficial) for [Parse](https://docs.parseplatform.org/).
As being minimal, ParseSDK provides results in JSON format. This SDK is under development and does not contains all the features you may need hence this SDK is not usable at this time.
You can know more about Object Format from the official [REST Guide](https://docs.parseplatform.org/rest/guide/).

# Getting Started

## Initialize

```dart
ParseClient.init(ParseOptions(
      serverUrl: 'https://YOUR.PARSE-SERVER.HERE/parse',
      appId: 'SECRET_APP_ID',
      masterKey: 'SECRET_MASTER_KEY'));
```
# Objects

## Object Format
For example, let’s say you’re tracking high scores for a game. A single object could contain:
```json
{
  "score": 1337,
  "playerName": "Sean Plott",
  "cheatMode": false
}
```

## Creating Objects
```dart
await ParseObject().create(
  className: 'GameScore',
  data: {"score": 1337, "playerName": "Sean Plott", "cheatMode": false},
);
```

## Retrieving Objects
```dart
await ParseObject().get(className: 'GameScore', objectId: 'Ed1nuqPvcm');
```
The response body is a JSON object containing all the user-provided fields, plus the createdAt, updatedAt, and objectId fields:

```json
{
  "score": 1337,
  "playerName": "Sean Plott",
  "cheatMode": false,
  "skills": [
    "pwnage",
    "flying"
  ],
  "createdAt": "2011-08-20T02:06:57.931Z",
  "updatedAt": "2011-08-20T02:06:57.931Z",
  "objectId": "Ed1nuqPvcm"
}
```
# Queries
## Basic Queries
To get objects from a class:
```dart
await ParseObject().query('GameScore').get();
```
The return value is a JSON object that contains a results field with a JSON array that lists the objects.
```json
{
  "results": [
    {
      "playerName": "Jang Min Chul",
      "updatedAt": "2011-08-19T02:24:17.787Z",
      "cheatMode": false,
      "createdAt": "2011-08-19T02:24:17.787Z",
      "objectId": "A22v5zRAgd",
      "score": 80075
    },
    {
      "playerName": "Sean Plott",
      "updatedAt": "2011-08-21T18:02:52.248Z",
      "cheatMode": false,
      "createdAt": "2011-08-20T02:06:57.931Z",
      "objectId": "Ed1nuqPvcm",
      "score": 73453
    }
  ]
}
```

## Query Constraints
```dart
await ParseObject()
        .query('Student')
        .where('totalMark', isLessThanOrEqualTo: '50', isNotEqualTo: '35')
        .orderByAscending('roll')
        .limit(20)
        .skip(10)
        .excludeKeys(['physics']).get();
```

Parse REST API Guide - https://docs.parseplatform.org/rest/guide/

Parse Homepage - https://docs.parseplatform.org/
