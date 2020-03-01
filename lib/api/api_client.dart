
import 'dart:convert';

import 'package:github_application/api/api_endpoints.dart';
import 'package:github_application/models/user_details.dart';
import 'package:github_application/models/users.dart';
import 'package:http/http.dart';

import 'network_util.dart';

class ApiClient {
  static ApiClient _instance;
  final NetworkUtil _network =  NetworkUtil();

  ApiClient._internal();



  static init() {
    if (_instance == null) {
      _instance = ApiClient._internal();
    }
  }


  static ApiClient get getInstance {
    if (_instance == null) {
      throw  StateError("ApiClient is not Initialized!!");
    }
    return _instance;
  }

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }

  Future<UsersResponse> getUserCards(String name) async {
    Response response = await _network.get(ApiEndPoints.baseUrl +ApiEndPoints.users+"q=$name&page=1",_getHeaders());
    return UsersResponse.fromJson(jsonDecode(response.body));
  }

  Future<UserDetails> fetchDetails(String url) async {
    if(url== null || url.isEmpty) return null;
    Response response = await _network.get(url,_getHeaders());
    return UserDetails.fromJson(jsonDecode(response.body));
  }

  Future<List<User>> fetchFollowers(String url) async {

    List<User> _user=[];

    if(url.contains("{")){
      List<String> _splitString=url.split("{");
      Response response = await _network.get(_splitString[0],_getHeaders());
      _user=(json.decode(response.body) as List<dynamic>)
          .map<User>((data) => User.fromJson(data))
          .toList();
    }else{
      Response response = await _network.get(url,_getHeaders());
      _user=(json.decode(response.body) as List<dynamic>)
          .map((data) => User.fromJson(data))
          .toList();
    }
    return _user;
  }

  Future<List<User>> fetchFollowing(String url) async {

    List<User> _user=[];

    if(url.contains("{")){
      List<String> _splitString=url.split("{");
      Response response = await _network.get(_splitString[0],_getHeaders());
      _user=(json.decode(response.body) as List<dynamic>)
          .map<User>((data) => User.fromJson(data))
          .toList();
    }else{
      Response response = await _network.get(url,_getHeaders());
      _user=(json.decode(response.body) as List<dynamic>)
          .map((data) => User.fromJson(data))
          .toList();
    }
    return _user;
  }
}