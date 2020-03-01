
import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class UsersResponse{

  @JsonKey(name: "total_count")
  num totalCount;

  List<User> items;

  UsersResponse({this.totalCount,this.items});
  factory UsersResponse.fromJson(Map<String, dynamic> json) => _$UsersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);

}


@JsonSerializable()
class User{

  @JsonKey(name: "login")
  String name;

  @JsonKey(name: "avatar_url")
  String avatar;

  @JsonKey(name: "followers_url")
  String followers;

  @JsonKey(name: "following_url")
  String following;

  num id;

  num score;

  String url;

  User({this.avatar,this.followers,this.following,this.id,this.name,this.score,this.url});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}