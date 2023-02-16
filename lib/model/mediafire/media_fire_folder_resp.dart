import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'media_fire_cloud_file.dart';

@immutable
class MediaFireFolderResponse {
	final int chunkSize;
	final String contentType;
	final int chunkNumber;
	final String folderkey;
	final List<MediaFireFolder> folders;
	final bool moreChunks;
	final int revision;

	const MediaFireFolderResponse({
		required this.chunkSize, 
		required this.contentType, 
		required this.chunkNumber, 
		required this.folderkey, 
		required this.folders, 
		required this.moreChunks, 
		required this.revision, 
	});

	@override
	String toString() {
		return 'MediaFireFolderResponse(chunkSize: $chunkSize, contentType: $contentType, chunkNumber: $chunkNumber, folderkey: $folderkey, folders: $folders, moreChunks: $moreChunks, revision: $revision)';
	}

	factory MediaFireFolderResponse.fromMap(Map<String, dynamic> data) {
		return MediaFireFolderResponse(
			chunkSize: int.tryParse(data['chunk_size'] as String) ?? 0,
			contentType: data['content_type'] as String,
			chunkNumber: int.tryParse(data['chunk_number'] as String) ?? 0,
			folderkey: data['folderkey'] as String,
			folders: (data['folders'] as List<dynamic>)
						.map((e) => MediaFireFolder.fromMap(e as Map<String, dynamic>))
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
				'folders': folders.map((e) => e.toMap()).toList(),
				'more_chunks': moreChunks,
				'revision': revision,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MediaFireFolderResponse].
	factory MediaFireFolderResponse.fromJson(String data) {
		return MediaFireFolderResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [MediaFireFolderResponse] to a JSON string.
	String toJson() => json.encode(toMap());

	MediaFireFolderResponse copyWith({
		int? chunkSize,
		String? contentType,
		int? chunkNumber,
		String? folderkey,
		List<MediaFireFolder>? folders,
		bool? moreChunks,
		int? revision,
	}) {
		return MediaFireFolderResponse(
			chunkSize: chunkSize ?? this.chunkSize,
			contentType: contentType ?? this.contentType,
			chunkNumber: chunkNumber ?? this.chunkNumber,
			folderkey: folderkey ?? this.folderkey,
			folders: folders ?? this.folders,
			moreChunks: moreChunks ?? this.moreChunks,
			revision: revision ?? this.revision,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! MediaFireFolderResponse) return false;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			chunkSize.hashCode ^
			contentType.hashCode ^
			chunkNumber.hashCode ^
			folderkey.hashCode ^
			folders.hashCode ^
			moreChunks.hashCode ^
			revision.hashCode;
}

@immutable
class MediaFireFolder {
  final String folderkey;
  final String name;
  final String description;
  final String tags;
  final String privacy;
  final String created;
  final int revision;
  final int flag;
  final int fileCount;
  final int folderCount;
  final bool dropboxEnabled;
  final int totalFolders;
  final int totalFiles;
  final int totalSize;
  final String createdUtc;

  const MediaFireFolder({
    required this.folderkey,
    required this.name,
    required this.description,
    required this.tags,
    required this.privacy,
    required this.created,
    required this.revision,
    required this.flag,
    required this.fileCount,
    required this.folderCount,
    required this.dropboxEnabled,
    required this.totalFolders,
    required this.totalFiles,
    required this.totalSize,
    required this.createdUtc,
  });

  @override
  String toString() {
    return 'Folder(folderkey: $folderkey, name: $name, description: $description, tags: $tags, privacy: $privacy, created: $created, revision: $revision, flag: $flag, fileCount: $fileCount, folderCount: $folderCount, dropboxEnabled: $dropboxEnabled, totalFolders: $totalFolders, totalFiles: $totalFiles, totalSize: $totalSize, createdUtc: $createdUtc)';
  }

  factory MediaFireFolder.fromMap(Map<String, dynamic> data) => MediaFireFolder(
        folderkey: data['folderkey'] as String,
        name: data['name'] as String,
        description: data['description'] as String,
        tags: data['tags'] as String,
        privacy: data['privacy'] as String,
        created: data['created'] as String,
        revision: int.tryParse(data['revision'] as String) ?? 0,
        flag: int.tryParse(data['flag'] as String) ?? 0,
        fileCount: int.tryParse(data['file_count'] as String) ?? 0,
        folderCount: int.tryParse(data['folder_count'] as String) ?? 0,
        dropboxEnabled: data['dropbox_enabled'] as String != "no",
        totalFolders: int.tryParse(data['total_folders'] as String) ?? 0,
        totalFiles: int.tryParse(data['total_files'] as String) ?? 0,
        totalSize: int.tryParse(data['total_size'] as String) ?? 0,
        createdUtc: data['created_utc'] as String,
      );

  Map<String, dynamic> toMap() => {
        'folderkey': folderkey,
        'name': name,
        'description': description,
        'tags': tags,
        'privacy': privacy,
        'created': created,
        'revision': revision,
        'flag': flag,
        'file_count': fileCount,
        'folder_count': folderCount,
        'dropbox_enabled': dropboxEnabled,
        'total_folders': totalFolders,
        'total_files': totalFiles,
        'total_size': totalSize,
        'created_utc': createdUtc,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Folder].
  factory MediaFireFolder.fromJson(String data) {
    return MediaFireFolder.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Folder] to a JSON string.
  String toJson() => json.encode(toMap());

  MediaFireFolder copyWith({
    String? folderkey,
    String? name,
    String? description,
    String? tags,
    String? privacy,
    String? created,
    int? revision,
    int? flag,
    int? fileCount,
    int? folderCount,
    bool? dropboxEnabled,
    int? totalFolders,
    int? totalFiles,
    int? totalSize,
    String? createdUtc,
  }) {
    return MediaFireFolder(
      folderkey: folderkey ?? this.folderkey,
      name: name ?? this.name,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      privacy: privacy ?? this.privacy,
      created: created ?? this.created,
      revision: revision ?? this.revision,
      flag: flag ?? this.flag,
      fileCount: fileCount ?? this.fileCount,
      folderCount: folderCount ?? this.folderCount,
      dropboxEnabled: dropboxEnabled ?? this.dropboxEnabled,
      totalFolders: totalFolders ?? this.totalFolders,
      totalFiles: totalFiles ?? this.totalFiles,
      totalSize: totalSize ?? this.totalSize,
      createdUtc: createdUtc ?? this.createdUtc,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MediaFireFolder) return false;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      folderkey.hashCode ^
      name.hashCode ^
      description.hashCode ^
      tags.hashCode ^
      privacy.hashCode ^
      created.hashCode ^
      revision.hashCode ^
      flag.hashCode ^
      fileCount.hashCode ^
      folderCount.hashCode ^
      dropboxEnabled.hashCode ^
      totalFolders.hashCode ^
      totalFiles.hashCode ^
      totalSize.hashCode ^
      createdUtc.hashCode;

  MediaFireCloudFolder toCloudFolder() => MediaFireCloudFolder(
      folderkey,
      name: name,
      folderCount: folderCount,
      fileCount: fileCount,
      size: totalSize
  );
}