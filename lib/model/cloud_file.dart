import 'package:flutter/foundation.dart';

class CloudElement {
  final String name;
  final int size;

  const CloudElement({
    required this.name,
    required this.size,
  });
}

@immutable
class CloudFile implements CloudElement {
  @override
  final String name;
  final String hash;
  final String url;
  final String type;
  @override
  final int size;

  const CloudFile({
    required this.name,
    required this.hash,
    required this.url,
    required this.type,
    required this.size,
  });
}

class CloudFolder implements CloudElement {
  @override
  final String name;
  final int folderCount;
  final int fileCount;
  @override
  final int size;
  final List<CloudElement> _content = [];

  bool loaded = false;

  CloudFolder({
    required this.name,
    required this.folderCount,
    required this.fileCount,
    required this.size,
  });

  Future<void> load(
      Future<Iterable<CloudElement>> Function(CloudFolder) fn) async {
    if (loaded) return;

    loaded = true;
    var value = await fn(this);
    _content.addAll(value);
  }

  Future<Iterable<CloudFolder>> get folders => Future.value(_content.whereType<CloudFolder>());

  Future<Iterable<CloudFile>> get files => Future.value(_content.whereType<CloudFile>());

  Future<Iterable<CloudElement>> get children => Future.value(List.of(_content, growable: false));

  Iterable<CloudElement> get contentRaw => List.of(_content, growable: false);
}
