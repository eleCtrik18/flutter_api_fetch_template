# HTTP TEMPLATE

Applications frequently need to perform POST and GET and other HTTP requests.
Flutter provides an http package that supports making HTTP requests.

In this Project I have created a template to work with GET,POST and DELETE HTTP Requests also used Quicktype to create Model classes

About JSON responses:

1: If you response looks something like this,
[
    {
      key1: value1,
      key2: value2,
      key3: value3,
    },
    {
      key1: value1,
      key2: value2,
      key3: value3,
    }
] 

Then, we use data[0]["name"], not data[0].name Unless we cast to an object that has the name property, we cannot use data[0].name

We cast like this data = json.decode(response.body)

2: But if your response looks something like this,

{
    dataKey: [
      {
        key1: value1,
        key2: value2,
        key3: value3,
      } 
    ] 
}

Here  json.decode will return a Map, not a List

therefore we do:

return <ModelClassname>.fromJson(jsonDecode(response.body));


