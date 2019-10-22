import 'dart:convert';

import 'package:build/build.dart';
import 'package:rson/rson.dart';
import 'package:rson/src/builder/utils/cache_utils.dart';
import 'package:source_gen/source_gen.dart';

class RsonGenericUsageCollector extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    var exp = RegExp(r"Rson.fromJson<([<>\w\s]+)>");
    String content = await buildStep.readAsString(buildStep.inputId);
    List<String> lines = content.split("\n");
    List<String> typeUsages = [];

    // read lines
    for (var line in lines) {
      // fast check
      if (line.contains("Rson.fromJson")) {
        // read exact type usage from the code
        List<RegExpMatch> matches = exp.allMatches(line).toList();
        matches.map((e) => e.group(1)).where(TypeUtils.isGenericString).fold(
          [],
          (prev, curr) => prev..addAll(TypeUtils.getAllDescendantTypes(curr)),
        ).forEach(typeUsages.add);
      }
    }

    return CacheUtils.encode(
      json.encode(typeUsages),
    );
  }
}
