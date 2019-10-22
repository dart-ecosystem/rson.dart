import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:mustache/mustache.dart';
import 'package:rson/rson.dart';
import 'package:rson/src/annotation/ignore.dart';
import 'package:rson/src/builder/object/rson_serializable_object.dart';
import 'package:rson/src/builder/template/rson_template.dart';
import 'package:rson/src/builder/utils/cache_utils.dart';
import 'package:rson/src/builder/utils/field_utils.dart';
import 'package:source_gen/source_gen.dart';

class RsonWriter extends GeneratorForAnnotation<EnableRson> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final List<String> rsonCache = [];
    final List<String> rsonUsageCache = [];
    final rsonCacheAssetIds = await buildStep
        .findAssets(
          Glob("**/*.rson_cache.dart"),
        )
        .toList();
    final rsonUsageCacheAssetIds = await buildStep
        .findAssets(
          Glob("**/*.rson_usage_cache.dart"),
        )
        .toList();

    for (var assetId in rsonCacheAssetIds) {
      rsonCache.add((await buildStep.readAsString(assetId)).trim());
    }

    for (var assetId in rsonUsageCacheAssetIds) {
      rsonUsageCache.add((await buildStep.readAsString(assetId)).trim());
    }

    final decodedRsonCaches = rsonCache
        .map((e) => CacheUtils.decode(e))
        .map((e) => e.first)
        .map((e) => json.decode(e))
        .toList();

    final decodedRsonUsageCaches = rsonUsageCache
        .map((e) => CacheUtils.decode(e))
        .map((e) => e.first)
        .map((e) => json.decode(e))
        .fold<List>([], (prv, cur) => prv..addAll(cur))
        .map((e) => {"name": e})
        .toList();

    return Template(rson_template).renderString({
      "entities": decodedRsonCaches,
      "genericUsages": decodedRsonUsageCaches,
    });
  }
}

Uri assetToPackageUrl(Uri url) =>
    url.pathSegments.isNotEmpty && url.pathSegments[1] == 'lib'
        ? url.replace(
            scheme: 'package',
            pathSegments: [url.pathSegments.first]
              ..addAll(url.pathSegments.skip(2)))
        : url;
