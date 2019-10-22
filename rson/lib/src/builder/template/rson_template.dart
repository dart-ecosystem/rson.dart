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
        {{# isGeneric }}
        Rson.initializeInstance(entity);
        {{/ isGeneric }}
        {{# data}}
        {{# setters }}
        {{^containsGeneric}}
        entity.{{{name}}} = _fj0(json['{{{serializedName}}}'], _t<{{{type}}}>(), entity.{{{name}}});
        {{/containsGeneric}}
        {{/ setters }}
        {{/ data}}
        return entity;
      },
    ),
    {{/ entities }}
  });
  
  RsonGenericInstantiatorRegistry.load({
    // All Class
    {{# entities }}
    // {{{className}}}
    {{# isGeneric }}
    _ts<{{{className}}}>(): () => _Rson_{{{className}}}(),
    {{/ isGeneric }}
    {{^ isGeneric }}
    _ts<{{{className}}}>(): () => {{{className}}}(),
    {{/ isGeneric }}
    {{/ entities }}
    
    // All Field Types
    {{# entities }}
    {{# genericTypeList }}
    _ts<{{{name}}}>(): () => {{{name}}}(),
    {{/ genericTypeList }}
    {{/ entities }}
    
    // All Generic Usage
    {{# genericUsages }}
    {{# isGeneric }}
    _ts<{{{name}}}>(): () => _Rson_{{{name}}}(),
    {{/ isGeneric }}
    {{^ isGeneric }}
    _ts<{{{name}}}>(): () => {{{name}}}(),
    {{/ isGeneric }}
    {{/ genericUsages }}
  });
  
  RsonStringTypeRegistry.load({
    "int": int,
    "num": num,
    "double": double,
    "bool": bool,
    "String": String,
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

String _ts<T>() => T.toString();
Type _t<T>() => T;
var _fj0 = Rson.fromJson0;

{{# entities }}
{{# isGeneric }}
$rson_generic_subclass_template
{{/ isGeneric }}
{{/ entities }}
''';
