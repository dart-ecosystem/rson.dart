import 'package:meta/meta.dart';
import 'package:rson/rson.dart';

@sealed
abstract class TypeUtils {
  static isPrimitive(Object instance) {
    return instance is int ||
        instance is num ||
        instance is double ||
        instance is String ||
        instance == null ||
        instance is bool;
  }

  static bool isTypePrimitive(Type type) {
    return type == int ||
        type == num ||
        type == double ||
        type == String ||
        type == Null ||
        type == bool;
  }

  static bool isTypeGeneric(Type type) {
    return type.toString().replaceAll("<dynamic>", "").contains("<");
  }

  static bool isGenericString(String typeString) {
    return typeString.replaceAll("<dynamic>", "").contains("<");
  }

  static bool isTypeList(Type type) {
    return type == List || type.toString().startsWith("List<");
  }

  static bool isListString(String typeString) {
    return typeString == 'List' || typeString.startsWith("List<");
  }

  static Type getSubtype(Type type) {
    String subtypeName = getSecondLevelTypeStrings(type.toString()).first;
    return RsonStringTypeRegistry.get(subtypeName);
  }

  static String getFirstLevelTypeString(String typeString) {
    return typeString.split("<").first;
  }

  static List<String> getSecondLevelTypeStrings(String typeString) {
    int firstLeftArrowIndex = typeString.indexOf("<");
    // no generic type found
    if (firstLeftArrowIndex == -1) {
      return [];
    }

    String cleanTypeString = typeString
        .substring(0, typeString.length - 1)
        .substring(firstLeftArrowIndex + 1)
        .replaceAll(" ", "");

    List<int> separatorIndexes = [];
    int leftArrowCount = 0;
    int rightArrowCount = 0;

    for (int i = 0; i < cleanTypeString.length; i++) {
      switch (cleanTypeString[i]) {
        case "<":
          leftArrowCount++;
          continue;
        case ">":
          rightArrowCount++;
          continue;
        case ",":
          // please notice: left arrow always has one more than right one
          if (leftArrowCount == rightArrowCount) {
            separatorIndexes.add(i);
          }
          continue;
      }
    }

    List<String> outputStringList = [];
    int lastIndex = separatorIndexes.fold(0, (int prev, int curr) {
      outputStringList.add(cleanTypeString.substring(prev, curr));
      return curr + 1;
    });
    outputStringList.add(cleanTypeString.substring(lastIndex));

    return outputStringList;
  }

  static List<String> separateAllTypeString(String typeString) {
    var exp = RegExp(r"(\b\w+\b)");
    List<RegExpMatch> matches = exp.allMatches(typeString).toList();
    return matches.map((e) => e.group(0)).toList();
  }

  static List<String> getAllDescendantTypes(
    String typeString, [
    Set<String> types,
  ]) {
    types ??= {};
    if (isGenericString(typeString)) {
      types.add(typeString);
    }

    getSecondLevelTypeStrings(typeString)
        .forEach((e) => getAllDescendantTypes(e, types));

    return types.toList();
  }
}
