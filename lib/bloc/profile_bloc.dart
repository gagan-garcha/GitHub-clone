

import 'package:flutter/widgets.dart';
import 'package:github_application/api/api_client.dart';
import 'package:github_application/models/user_details.dart';

class ProfileBlocProvider extends InheritedWidget {
  final ProfileBloc bloc;

  ProfileBlocProvider({Key key, Widget child})
      : bloc = ProfileBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ProfileBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ProfileBlocProvider)
    as ProfileBlocProvider)
        .bloc;
  }
}


class ProfileBloc {

  Future<UserDetails> getUserDetails(String url) async {
    UserDetails user = await ApiClient.getInstance.fetchDetails(url);
    return user;
  }

}