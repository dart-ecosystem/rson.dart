const String rson_generic_subclass_template = '''
class _Rson_{{{className}}}{{{genericString}}} extends {{{className}}}{{{genericString}}} {
  rsonInitialize() {
    {{# data }}
      {{# setters }}
        {{# containsGeneric }}
          {{# containsRawGeneric }}
    this.{{{name}}} = Rson.createInstance({{{type}}});
          {{/ containsRawGeneric }}
          {{^ containsRawGeneric }}
            {{# containsNoneListGeneric }}
    this.{{{name}}} = _Rson_{{{type}}}();
            {{/ containsNoneListGeneric }}
            {{^ containsNoneListGeneric }}
    this.{{{name}}} = {{{type}}}();
            {{/ containsNoneListGeneric }}
          {{/ containsRawGeneric }}
        {{/ containsGeneric }}
      {{/ setters }}
    {{/ data }}
  }
}
''';
