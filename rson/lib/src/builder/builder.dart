import 'package:build/build.dart';
import 'package:rson/src/builder/collector/rson_collector.dart';
import 'package:rson/src/builder/collector/rson_generic_usage_collector.dart';
import 'package:rson/src/builder/writer/rson_writer.dart';
import 'package:source_gen/source_gen.dart';

Builder collector(BuilderOptions options) => LibraryBuilder(
      RsonCollector(),
      generatedExtension: '.rson_cache.dart',
    );

Builder usageCollector(BuilderOptions options) => LibraryBuilder(
      RsonGenericUsageCollector(),
      generatedExtension: '.rson_usage_cache.dart',
    );

Builder writer(BuilderOptions options) => LibraryBuilder(
      RsonWriter(),
      generatedExtension: '.rson.g.dart',
    );
