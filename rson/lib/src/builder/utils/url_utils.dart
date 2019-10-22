abstract class UrlUtils {
  static Uri assetToPackageUrl(Uri url) =>
      url.pathSegments.isNotEmpty && url.pathSegments[1] == 'lib'
          ? url.replace(
              scheme: 'package',
              pathSegments: [url.pathSegments.first]
                ..addAll(url.pathSegments.skip(2)))
          : url;
}
