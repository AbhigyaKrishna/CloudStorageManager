import 'package:cloud_storage_manager/controller/api_service.dart';
import 'package:cloud_storage_manager/ext/list_function.dart';
import 'package:cloud_storage_manager/model/cloud_file.dart';

class MediaFireCloudFolder extends CloudFolder {
  String id;
  int sizeCache = -1;

  MediaFireCloudFolder(this.id,
      {required super.name,
      required super.folderCount,
      required super.fileCount,
      required super.size});

  Future<void> _ensureLoad() => super.load((value) => mediaFireService.getContent(folderKey: id));

  @override
  Future<Iterable<CloudFolder>> get folders async {
    await _ensureLoad();
    return super.folders;
  }

  @override
  Future<Iterable<CloudFile>> get files async {
    await _ensureLoad();
    return super.files;
  }

  @override
  Future<Iterable<CloudElement>> get children async {
    await _ensureLoad();
    return super.children;
  }
}

class RootMediaFireCloudFolder extends MediaFireCloudFolder {
  RootMediaFireCloudFolder(String id,
      {required String name, required int folderCount, required int fileCount})
      : super(id,
            name: name,
            folderCount: folderCount,
            fileCount: fileCount,
            size: 0);

  @override
  int get size {
    if (sizeCache > -1) return sizeCache;
    if (!super.loaded) return 0;
    int size = super.contentRaw.map((e) => e.size).sum();
    if (size != 0) {
      sizeCache = size;
    }
    return size;
  }

}
