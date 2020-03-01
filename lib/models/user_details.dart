

import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails{

  @JsonKey(name: "avatar_url")
  String avatar;

  String name;

  String company;

  String location;

  String email;

  String bio;

  num followers;

  num following;

  @JsonKey(name: "created_at")
  DateTime createdAt;

  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  @JsonKey(name: "public_repos")
  num repos;

  @JsonKey(name: "public_gists")
  num gists;

  @JsonKey(name: "followers_url")
  String followersUrl;

  @JsonKey(name: "following_url")
  String followingUrl;


  UserDetails({this.avatar,this.name,this.following,this.followers,this.bio,this.company,this.createdAt,this.email,this.location,
              this.gists,this.repos,this.updatedAt,this.followersUrl,this.followingUrl});

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}