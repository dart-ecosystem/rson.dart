import 'package:rson/src/builder/template/rson_generic_subclass_template.dart';

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
        Rson.initializeInstance(entity);
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
    {{# isGeneric }}
    t2s<{{{className}}}>(): () => _Rson_{{{className}}}(),
    {{/ isGeneric }}
    {{^ isGeneric }}
    t2s<{{{className}}}>(): () => {{{className}}}(),
    {{/ isGeneric }}
    {{/ entities }}
    // All Generic Usage
    {{# genericUsages }}
    {{# isGeneric }}
    t2s<{{{name}}}>(): () => _Rson_{{{name}}}(),
    {{/ isGeneric }}
    {{^ isGeneric }}
    t2s<{{{name}}}>(): () => {{{name}}}(),
    {{/ isGeneric }}
    {{/ genericUsages }}
  });
  
  RsonStringTypeRegistry.load({
    {{# entities }}
    "{{{className}}}": {{{className}}},
    {{/ entities }}
    {{# entities }}
    {{# isGeneric }}
    "_Rson_{{{className}}}": {{{className}}},
    {{/ isGeneric }}
    {{/ entities }}
  });
}

String t2s<T>() => T.toString();

{{# entities }}
{{# isGeneric }}
$rson_generic_subclass_template
{{/ isGeneric }}
{{/ entities }}
''';
