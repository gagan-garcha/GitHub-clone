
import 'package:flutter/material.dart';
import 'package:github_application/models/user_details.dart';
import 'package:github_application/screens/following_screen.dart';

import '../bloc/profile_bloc.dart';
import '../util.dart';

class ProfilePage extends StatelessWidget {

  final String url;

  ProfilePage(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),centerTitle: true,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5.0),
        child: Profile(url),) ,
    );
  }
}

class Profile extends StatelessWidget {

  final String url;

  Profile(this.url);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProfileBlocProvider.of(context).getUserDetails(url),
      builder: (context,AsyncSnapshot<UserDetails> snapshot) {
        if(snapshot.hasData) {
          return GestureDetector(
            onTap: ()=>Navigator.of(context).push(createRoute(FollowersScreen(snapshot.data))),
            child: Card(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    padding: EdgeInsets.all(5.0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: Colors.grey[300].withOpacity(0.5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 80.0,
                          backgroundImage:
                          NetworkImage(snapshot.data.avatar),
                          backgroundColor: Colors.transparent,
                        ),
                        Text("${snapshot.data.name??"N/A"}"),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.location_on),
                            Text("${snapshot.data.location??"N/A"}"),
                          ],
                        ),
                        Text("${snapshot.data.followers} Follwers | ${snapshot.data.following} Following")
                      ],
                    ),
                  ),
                  Container(
                    height: 250.0,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextView("Bio:", "${snapshot.data.bio??"N/A"}"),
                        TextView("Public Repositeries:", "${snapshot.data.repos}"),
                        TextView("Public Gists", "${snapshot.data.gists}"),
                        TextView("Update at:", "${snapshot.data.updatedAt}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Center(child: CircularProgressIndicator(),);
      }
    );
  }
}

class TextView extends StatelessWidget {

  final String header;
  final String text;

  TextView(this.header,this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("$header"),
          Text("$text"),
        ],
      ),
    );
  }
}


