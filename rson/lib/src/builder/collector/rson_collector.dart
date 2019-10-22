import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:rson/rson.dart';
import 'package:rson/src/annotation/ignore.dart';
import 'package:rson/src/builder/object/rson_generic_type_object.dart';
import 'package:rson/src/builder/object/rson_serializable_object.dart';
import 'package:rson/src/builder/utils/cache_utils.dart';
import 'package:rson/src/builder/utils/field_utils.dart';
import 'package:rson/src/builder/utils/url_utils.dart';
import 'package:source_gen/source_gen.dart';

class RsonCollector extends GeneratorForAnnotation<Serializable> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is ClassElement) {
      // basic
      String path =
          UrlUtils.assetToPackageUrl(buildStep.inputId.uri).toString();
      String className = element.name;
      List<RsonGenericTypeObject> genericTypeList = [];
      bool isGenericClass = element.typeParameters.isNotEmpty;

      // all fields
      List<FieldElement> fields = element.fields;

      // all none-ignored getter fields
      List<FieldElement> serializableGetterFields =
          FieldUtils.getFieldListByGetterWithoutAnnotationType(fields, Ignore);
      List<FieldElement> serializableSetterFields =
          FieldUtils.getFieldListBySetterWithoutAnnotationType(fields, Ignore);

      //
      var rsonSerializableClass = RsonSerializableClass();

      // parse getter
      for (FieldElement field in serializableGetterFields) {
        String type = field.type.displayName;
        String name = field.displayName;
        String serializedName = name;
        if (FieldUtils.getAnnotationByType(field, SerializedName) != null) {
          serializedName = ConstantReader(
            FieldUtils.getAnnotationByType(field, SerializedName)
                .computeConstantValue(),
          ).peek("name").stringValue;
        }
        var rsonSerializableField = RsonSerializableField(
          type: type,
          name: name,
          serializedName: serializedName,
        );
        rsonSerializableClass.getters.add(rsonSerializableField);
      }

      // parse setter
      for (FieldElement field in serializableSetterFields) {
        String type = field.type.displayName;
        String name = field.displayName;
        String serializedName = name;
        if (FieldUtils.getAnnotationByType(field, SerializedName) != null) {
          serializedName = ConstantReader(
            FieldUtils.getAnnotationByType(field, SerializedName)
                .computeConstantValue(),
          ).peek("name").stringValue;
        }
        var rsonSerializableField = RsonSerializableField(
          type: type,
          name: name,
          serializedName: serializedName,
        );
        rsonSerializableClass.setters.add(rsonSerializableField);

        // check is generic
        if (type.contains("<") &&
            element.typeParameters.every(
              (e) => !TypeUtils.separateAllTypeString(type).contains(e.name),
            )) {
          genericTypeList.add(RsonGenericTypeObject(type));
        }
      }

      return CacheUtils.encode(
        json.encode(
          RsonSerializableFile(
            path: path,
            className: className,
            genericTypeList: genericTypeList,
            data: rsonSerializableClass,
          ),
        ),
      );
    }
  }
}