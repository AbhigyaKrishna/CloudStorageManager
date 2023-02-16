import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../cloud_file.dart';

@immutable
class MediaFireFilesResponse {
	final int chunkSize;
	final String contentType;
	final int chunkNumber;
	final String folderkey;
	final List<MediaFireFile> files;
	final bool moreChunks;
	final int revision;

	const MediaFireFilesResponse({
		required this.chunkSize, 
		required this.contentType, 
		required this.chunkNumber, 
		required this.folderkey, 
		required this.files, 
		required this.moreChunks, 
		required this.revision, 
	});

	@override
	String toString() {
		return 'MediaFireFilesResponse(chunkSize: $chunkSize, contentType: $contentType, chunkNumber: $chunkNumber, folderkey: $folderkey, files: $files, moreChunks: $moreChunks, revision: $revision)';
	}

	factory MediaFireFilesResponse.fromMap(Map<String, dynamic> data) {
		return MediaFireFilesResponse(
			chunkSize: int.tryParse(data['chunk_size'] as String) ?? 0,
			contentType: data['content_type'] as String,
			chunkNumber: int.tryParse(data['chunk_number'] as String) ?? 0,
			folderkey: data['folderkey'] as String,
			files: (data['files'] as List<dynamic>)
						.map((e) => MediaFireFile.fromMap(e as Map<String, dynamic>))
						.toList(),
			moreChunks: data['more_chunks'] as String != "no",
			revision: int.tryParse(data['revision'] as String) ?? 0,
		);
	}



	Map<String, dynamic> toMap() => {
				'chunk_size': chunkSize,
				'content_type': contentType,
				'chunk_number': chunkNumber,
				'folderkey': folderkey,
				'files': files.map((e) => e.toMap()).toList(),
				'more_chunks': moreChunks,
				'revision': revision,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MediaFireFilesResponse].
	factory MediaFireFilesResponse.fromJson(String data) {
		return MediaFireFilesResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [MediaFireFilesResponse] to a JSON string.
	String toJson() => json.encode(toMap());

	MediaFireFilesResponse copyWith({
		int? chunkSize,
		String? contentType,
		int? chunkNumber,
		String? folderkey,
		List<MediaFireFile>? files,
		bool? moreChunks,
		int? revision,
	}) {
		return MediaFireFilesResponse(
			chunkSize: chunkSize ?? this.chunkSize,
			contentType: contentType ?? this.contentType,
			chunkNumber: chunkNumber ?? this.chunkNumber,
			folderkey: folderkey ?? this.folderkey,
			files: files ?? this.files,
			moreChunks: moreChunks ?? this.moreChunks,
			revision: revision ?? this.revision,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! MediaFireFilesResponse) return false;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			chunkSize.hashCode ^
			contentType.hashCode ^
			chunkNumber.hashCode ^
			folderkey.hashCode ^
			files.hashCode ^
			moreChunks.hashCode ^
			revision.hashCode;
}

@immutable
class MediaFireFile {
  final String quickkey;
  final String hash;
  final String filename;
  final String description;
  final int size;
  final String privacy;
  final String created;
  final bool passwordProtected;
  final String mimetype;
  final String filetype;
  final int view;
  final int edit;
  final int revision;
  final int flag;
  final int downloads;
  final int views;
  final String link;
  final String createdUtc;

  const MediaFireFile({
    required this.quickkey,
    required this.hash,
    required this.filename,
    required this.description,
    required this.size,
    required this.privacy,
    required this.created,
    required this.passwordProtected,
    required this.mimetype,
    required this.filetype,
    required this.view,
    required this.edit,
    required this.revision,
    required this.flag,
    required this.downloads,
    required this.views,
    required this.link,
    required this.createdUtc,
  });

  @override
  String toString() {
    return 'MediaFireFile(quickkey: $quickkey, hash: $hash, filename: $filename, description: $description, size: $size, privacy: $privacy, created: $created, passwordProtected: $passwordProtected, mimetype: $mimetype, filetype: $filetype, view: $view, edit: $edit, revision: $revision, flag: $flag, downloads: $downloads, views: $views, link: $link, createdUtc: $createdUtc)';
  }

  factory MediaFireFile.fromMap(Map<String, dynamic> data) => MediaFireFile(
        quickkey: data['quickkey'] as String,
        hash: data['hash'] as String,
        filename: data['filename'] as String,
        description: data['description'] as String,
        size: int.tryParse(data['size'] as String) ?? 0,
        privacy: data['privacy'] as String,
        created: data['created'] as String,
        passwordProtected: data['password_protected'] as String != "no",
        mimetype: data['mimetype'] as String,
        filetype: data['filetype'] as String,
        view: int.tryParse(data['view'] as String) ?? 0,
        edit: int.tryParse(data['edit'] as String) ?? 0,
        revision: int.tryParse(data['revision'] as String) ?? 0,
        flag: int.tryParse(data['flag'] as String) ?? 0,
        downloads: int.tryParse(data['downloads'] as String) ?? 0,
        views: int.tryParse(data['views'] as String) ?? 0,
        link: data['links']['normal_download'] as String,
        createdUtc: data['created_utc'] as String,
      );

  Map<String, dynamic> toMap() => {
        'quickkey': quickkey,
        'hash': hash,
        'filename': filename,
        'description': description,
        'size': size,
        'privacy': privacy,
        'created': created,
        'password_protected': passwordProtected,
        'mimetype': mimetype,
        'filetype': filetype,
        'view': view,
        'edit': edit,
        'revision': revision,
        'flag': flag,
        'downloads': downloads,
        'views': views,
        'links': {'normal_download': link},
        'created_utc': createdUtc,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [File].
  factory MediaFireFile.fromJson(String data) {
    return MediaFireFile.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [File] to a JSON string.
  String toJson() => json.encode(toMap());

  MediaFireFile copyWith({
    String? quickkey,
    String? hash,
    String? filename,
    String? description,
    int? size,
    String? privacy,
    String? created,
    bool? passwordProtected,
    String? mimetype,
    String? filetype,
    int? view,
    int? edit,
    int? revision,
    int? flag,
    int? downloads,
    int? views,
    String? link,
    String? createdUtc,
  }) {
    return MediaFireFile(
      quickkey: quickkey ?? this.quickkey,
      hash: hash ?? this.hash,
      filename: filename ?? this.filename,
      description: description ?? this.description,
      size: size ?? this.size,
      privacy: privacy ?? this.privacy,
      created: created ?? this.created,
      passwordProtected: passwordProtected ?? this.passwordProtected,
      mimetype: mimetype ?? this.mimetype,
      filetype: filetype ?? this.filetype,
      view: view ?? this.view,
      edit: edit ?? this.edit,
      revision: revision ?? this.revision,
      flag: flag ?? this.flag,
      downloads: downloads ?? this.downloads,
      views: views ?? this.views,
      link: link ?? this.link,
      createdUtc: createdUtc ?? this.createdUtc,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MediaFireFile) return false;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      quickkey.hashCode ^
      hash.hashCode ^
      filename.hashCode ^
      description.hashCode ^
      size.hashCode ^
      privacy.hashCode ^
      created.hashCode ^
      passwordProtected.hashCode ^
      mimetype.hashCode ^
      filetype.hashCode ^
      view.hashCode ^
      edit.hashCode ^
      revision.hashCode ^
      flag.hashCode ^
      downloads.hashCode ^
      views.hashCode ^
      link.hashCode ^
      createdUtc.hashCode;
  
  CloudFile toCloudFile() => CloudFile(
    name: filename,
    hash: hash,
    url: link,
    type: filename.split(".").last,
    size: size
  );

}
