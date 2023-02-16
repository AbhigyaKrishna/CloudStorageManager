import 'dart:convert';

import 'package:cloud_storage_manager/ext/list_function.dart';
import 'package:cloud_storage_manager/model/mediafire/media_fire_cloud_file.dart';
import 'package:cloud_storage_manager/model/mediafire/media_fire_folder_resp.dart';
import 'package:http/http.dart' as http;

import '../model/cloud_file.dart';
import '../model/mediafire/media_fire_files_response.dart';
import 'api_service.dart';

class MediaFireApiService implements ApiService {
  static const Map<String, String> _headers = {
    "accept": "application/json",
    "accept-encoding": "gzip, deflate, br",
    "accept-language": "en-US,en;q=0.9",
    "content-type": "application/x-www-form-urlencoded",
    "origin": "https://app.mediafire.com",
    "referer": "https://app.mediafire.com/",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-site",
    "user-agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36",
  };

  final String _sessionToken;

  late final MediaFireCloudFolder _root;

  MediaFireApiService(this._sessionToken);

  @override
  Future<void> load() async {
    final elements = await getContent();

    int folderCount = 0;
    int fileCount = 0;
    for (final element in elements) {
      if (element is MediaFireCloudFolder) {
        folderCount++;
      } else if (element is CloudFile) {
        fileCount++;
      }
    }
    _root = RootMediaFireCloudFolder("myfiles",
        name: "root", folderCount: folderCount, fileCount: fileCount);
    _root.load((e) => Future.value(elements));
  }

  // Future<Iterable<CloudElement>> listFiles({String path = "/"}) {
  //   final pathElements = path.split("/");
  //   CloudFolder folder = _root;
  //   for (final element in pathElements) {
  //     if (element.isEmpty) continue;
  //     CloudElement? temp = folder.children.firstWhereOrNull((e) => e.name == element);
  //     if (temp == null) {
  //       throw FileNotFoundException("Current directory `$element` not found in `$path`");
  //     } else if (temp is CloudFile) {
  //       throw FileNotFoundException("Current directory `$element` is a file in `$path`");
  //     } else {
  //       folder = temp as CloudFolder;
  //     }
  //   }
  //   return folder.load((e) => getContent(folderKey: (e as MediaFireCloudFolder).id)).then((value) => folder.children);
  // }

  Future<Iterable<CloudElement>> getContent({String folderKey = "myfiles"}) => Future.wait([
        getFolders(folderKey: folderKey),
        getFiles(folderKey: folderKey),
    ]).then((value) => value.flatten());

  Future<Iterable<CloudFile>> getFiles({String folderKey = "myfiles"}) => http
      .post(
          Uri.parse("https://www.mediafire.com/api/1.5/folder/get_content.php"),
          body:
              "session_token=$_sessionToken&response_format=json&folder_key=$folderKey&content_type=files&chunk=1&chunk_size=100&details=yes&order_direction=asc&order_by=name&filter",
          headers: _headers)
      .then((value) => MediaFireFilesResponse.fromMap(
              json.decode(value.body)["response"]["folder_content"])
          .files
          .map((e) => e.toCloudFile()));

  Future<Iterable<MediaFireCloudFolder>> getFolders(
          {String folderKey = "myfiles"}) =>
      http
          .post(
              Uri.parse(
                  "https://www.mediafire.com/api/1.5/folder/get_content.php"),
              body:
                  "session_token=$_sessionToken&response_format=json&folder_key=$folderKey&content_type=folders&chunk=1&chunk_size=100&details=yes&order_direction=asc&order_by=name&filter",
              headers: _headers)
          .then((value) => MediaFireFolderResponse.fromMap(
                  json.decode(value.body)["response"]["folder_content"])
              .folders
              .map((e) => e.toCloudFolder()));
}
