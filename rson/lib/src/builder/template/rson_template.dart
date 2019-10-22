const String rson_template = '''
import "package:rson/rson.dart";
{{# entities }}
import "{{{path}}}";
{{/ entities }}

void initializeRson() {
  RsonSerializerRegistry.load({
    {{# entities }}
    // {{{className}}}
    {{{className}}}: RsonSerializerObject(
      (Object entity) {
        Map<String, Object> json = {};
        {{# data}}
        {{# getters }}
        json['{{{serializedName}}}'] = Rson.toObject((entity as {{{className}}}).{{{name}}});
        {{/ getters }}
        {{/ data}}
        return json;
      },
      (Type type, Map json, [dynamic entity]) {
        entity ??= Rson.createInstance({{{className}}});
        (entity as {{{className}}}).rsonInitialize();
        {{# data}}
        {{# getters }}
        entity.{{{name}}} = Rson.fromJson0(json['{{{serializedName}}}'], type, entity.{{{name}}});
        {{/ getters }}
        {{/ data}}
        return entity;
      },
    ),
    {{/ entities }}
  });
  
  RsonGenericInstantiatorRegistry.load({
    {{# entities }}
    // {{{className}}}
    {{# genericTypeList }}
    t2s<{{{name}}}>(): () => {{{name}}}(),
    {{/ genericTypeList }}
    t2s<{{{className}}}>(): () => {{{className}}}(),
    {{/ entities }}
    {{# genericUsages }}
    t2s<{{{name}}}>(): () => {{{name}}}(),
    {{/ genericUsages }}
  });
  
  RsonStringTypeRegistry.load({
    {{# entities }}
    "{{{className}}}": {{{className}}},
    {{/ entities }}
  });
}

String t2s<T>() => T.toString();
''';
