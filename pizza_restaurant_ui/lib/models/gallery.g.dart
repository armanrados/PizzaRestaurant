// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gallery _$GalleryFromJson(Map<String, dynamic> json) => Gallery(
      json['galleryID'] as int?,
      json['description'] as String?,
      json['image'] as String?,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      json['userID'] as int?,
    );

Map<String, dynamic> _$GalleryToJson(Gallery instance) => <String, dynamic>{
      'galleryID': instance.galleryID,
      'description': instance.description,
      'image': instance.image,
      'user': instance.user,
      'userID': instance.userID,
    };
