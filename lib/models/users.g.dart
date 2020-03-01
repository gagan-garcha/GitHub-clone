// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) {
  return UsersResponse(
    totalCount: json['total_count'] as num,
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsersResponseToJson(UsersResponse instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'items': instance.items,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    avatar: json['avatar_url'] as String,
    followers: json['followers_url'] as String,
    following: json['following_url'] as String,
    id: json['id'] as num,
    name: json['login'] as String,
    score: json['score'] as num,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.name,
      'avatar_url': instance.avatar,
      'followers_url': instance.followers,
      'following_url': instance.following,
      'id': instance.id,
      'score': instance.score,
      'url': instance.url,
    };
