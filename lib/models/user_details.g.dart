// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return UserDetails(
    avatar: json['avatar_url'] as String,
    name: json['name'] as String,
    following: json['following'] as num,
    followers: json['followers'] as num,
    bio: json['bio'] as String,
    company: json['company'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    email: json['email'] as String,
    location: json['location'] as String,
    gists: json['public_gists'] as num,
    repos: json['public_repos'] as num,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    followersUrl: json['followers_url'] as String,
    followingUrl: json['following_url'] as String,
  );
}

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatar,
      'name': instance.name,
      'company': instance.company,
      'location': instance.location,
      'email': instance.email,
      'bio': instance.bio,
      'followers': instance.followers,
      'following': instance.following,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'public_repos': instance.repos,
      'public_gists': instance.gists,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
    };
