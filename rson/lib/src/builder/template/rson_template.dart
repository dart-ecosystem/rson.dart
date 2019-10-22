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
      (Object e) {
        Map<String, Object> j = {};
        {{# data}}
        {{# getters }}
        j['{{{serializedName}}}'] = _to((e as {{{className}}}).{{{name}}});
        {{/ getters }}
        {{/ data}}
        return j;
      },
      (Type t, Map j, [dynamic e]) {
        e ??= _ci({{{className}}});
        {{# isGeneric }}
        _ii(e);
        {{/ isGeneric }}
        {{# data}}
        {{# setters }}
        {{#containsGeneric}}
        e.{{{name}}} = _fj0(j['{{{serializedName}}}'], null, e.{{{name}}});
        {{/containsGeneric}}
        {{^containsGeneric}}
        e.{{{name}}} = _fj0(j['{{{serializedName}}}'], _t<{{{type}}}>(), e.{{{name}}});
        {{/containsGeneric}}
        {{/ setters }}
        {{/ data}}
        return e;
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
    {{# isList }}
    _ts<{{{name}}}>(): () => {{{name}}}(),
    {{/ isList }}
    {{^ isList }}
    _ts<{{{name}}}>(): () => _Rson_{{{name}}}(),
    {{/ isList }}
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
var _ii= Rson.initializeInstance;
var _ci= Rson.createInstance;
var _to= Rson.toObject;

{{# entities }}
{{# isGeneric }}
$rson_generic_subclass_template
{{/ isGeneric }}
{{/ entities }}
''';
