import 'package:analyzer/dart/element/element.dart';

import 'metadata_utils.dart';

class FieldUtils {
  static isMutable(FieldElement field) {
    return !field.isFinal && !field.isConst;
  }

  static List<FieldElement> getFieldListWithAnnotationType(
      List<FieldElement> fieldList, Type type) {
    return fieldList
        .where((field) => isMutable(field))
        .where((field) =>
            field.metadata.any((meta) => MetadataUtils.isType(meta, type)))
        .toList();
  }

  static List<FieldElement> getFieldListByGetterWithAnnotationType(
      List<FieldElement> fieldList, Type type) {
    return fieldList
        .where(
          (field) =>
              field.getter?.metadata
                  ?.any((meta) => MetadataUtils.isType(meta, type)) ??
              false,
        )
        .toList();
  }

  static List<FieldElement> getFieldListBySetterWithAnnotationType(
      List<FieldElement> fieldList, Type type) {
    return fieldList
        .where(
          (field) =>
              field.setter?.metadata
                  ?.any((meta) => MetadataUtils.isType(meta, type)) ??
              false,
        )
        .toList();
  }

  static List<FieldElement> getFieldListByGetterWithoutAnnotationType(
      List<FieldElement> fieldList, Type type) {
    return fieldList
        .where(
          (field) =>
              field.metadata
                  .every((meta) => !MetadataUtils.isType(meta, type)) ??
              false,
        )
        .where(
          (field) =>
              field.getter?.metadata
                  ?.every((meta) => !MetadataUtils.isType(meta, type)) ??
              false,
        )
        .toList();
  }

  static List<FieldElement> getFieldListBySetterWithoutAnnotationType(
      List<FieldElement> fieldList, Type type) {
    return fieldList
        .where(
          (field) =>
              field.metadata
                  .every((meta) => !MetadataUtils.isType(meta, type)) ??
              false,
        )
        .where(
          (field) =>
              field.setter?.metadata
                  ?.every((meta) => !MetadataUtils.isType(meta, type)) ??
              false,
        )
        .toList();
  }

  static ElementAnnotation getAnnotationByType(FieldElement field, Type type) {
    return field.metadata.firstWhere(
      (meta) => MetadataUtils.isType(meta, type),
      orElse: () => null,
    );
  }

  static ElementAnnotation getGetterAnnotationByType(
      FieldElement field, Type type) {
    return field.getter.metadata.firstWhere(
      (meta) => MetadataUtils.isType(meta, type),
      orElse: () => null,
    );
  }

  static ElementAnnotation getSetterAnnotationByType(
      FieldElement field, Type type) {
    return field.setter.metadata.firstWhere(
      (meta) => MetadataUtils.isType(meta, type),
      orElse: () => null,
    );
  }

  static bool hasAnnotationByType(FieldElement field, Type type) {
    return field.metadata.any((meta) => MetadataUtils.isType(meta, type));
  }
}
