
import 'package:flutter/widgets.dart';
import 'package:github_application/api/api_client.dart';
import 'package:github_application/models/users.dart';
import 'package:rxdart/rxdart.dart';

class ListCardsBlocProvider extends InheritedWidget {
  final ListCardsBloc bloc;

  ListCardsBlocProvider({Key key, Widget child})
      : bloc = ListCardsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ListCardsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ListCardsBlocProvider)
    as ListCardsBlocProvider)
        .bloc;
  }
}

class ListCardsBloc{

  final _userList = BehaviorSubject<List<User>>();


  Stream<List<User>> get users=>_userList.stream;


  void onTextChange(String value){
    if(value.trim().toLowerCase().length>1)
      ApiClient.getInstance.getUserCards(value.trim().toLowerCase()).then((UsersResponse data){
        _userList.add(data.items);
      });
  }

  void clearList(){
    _userList.add(null);
  }


  void dispose(){
    _userList.close();
  }

}

