const String rson_generic_subclass_template = '''
class _Rson_{{{className}}}<{{{genericString}}}> extends {{{className}}}<{{{genericString}}}> {
  rsonInitialize() {
    {{# data }}
    {{# setters }}
    {{# containsGeneric }}
    {{# containsRawGeneric }}
    this.data = Rson.createInstance({{{type}}});
    {{/ containsRawGeneric }}
    {{^ containsRawGeneric }}
    {{# containsNoneListGeneric }}
    this.data = _Rson_{{{type}}}();
    {{/ containsNoneListGeneric }}
    {{^ containsNoneListGeneric }}
    this.data = {{{type}}}();
    {{/ containsNoneListGeneric }}
    {{/ containsRawGeneric }}
    {{/ containsGeneric }}
    {{/ setters }}
    {{/ data }}
  }
}
''';
