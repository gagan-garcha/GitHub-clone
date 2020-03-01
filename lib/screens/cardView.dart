import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_application/models/users.dart';
import 'package:github_application/screens/profile_screen.dart';

import '../bloc/profile_bloc.dart';
import '../util.dart';

class CardView extends StatelessWidget {

  final User user;

  CardView(this.user);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).push(createRoute(ProfileBlocProvider(child: ProfilePage(user.url)))),
      child: Container(
        height: 70.0,
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 60.0,
              width: 60.0,
              child: Image.network(user.avatar,fit: BoxFit.contain,
                loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null ?
                      loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),

            Spacer(flex: 1,),

            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${user.name}'),
                Text('Id: ${user.id}'),
              ],
            ),

            Spacer(flex: 3,),

            Padding(
              padding: const EdgeInsets.only( top:  25.0),
              child: Text('Score: ${user.score}'),),

            Spacer(flex: 2,),

            Padding(
              padding:  const EdgeInsets.symmetric(vertical: 20.0,horizontal: 0.0),
              child: Icon(Icons.arrow_forward_ios),
            ),

          ],
        ),
      ),
    );
  }
}

