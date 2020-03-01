

import 'package:flutter/material.dart';
import 'package:github_application/api/api_client.dart';
import 'package:github_application/models/user_details.dart';
import 'package:github_application/models/users.dart';

class FollowersScreen extends StatelessWidget {

  final UserDetails user;

  FollowersScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${user.name??""}"),
      ),
      body: FollowersView(user),
    );
  }
}

class FollowersView extends StatefulWidget {
  
  final UserDetails user;
  
  FollowersView(this.user);
  
  @override
  _FollowersViewState createState() => _FollowersViewState();
}

class _FollowersViewState extends State<FollowersView> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(      // Column
      children: <Widget>[
        Container(
          color: Colors.white,        // Tab Bar color change
          child: TabBar(           // TabBar
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorWeight: 2,
            indicatorColor: Colors.purple,
            tabs: <Widget>[
              Tab(text: "Followers",),
              Tab(text: "Following",),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: TabBarView(         // Tab Bar View
            physics: BouncingScrollPhysics(),
            controller: _tabController,
            children: <Widget>[FollowersTab(widget.user.followersUrl),FollowingTab(widget.user.followingUrl) ],
          ),
        ),
      ],
    );
  }
}

class FollowersTab extends StatelessWidget {
  
  final String followersUrl;

  FollowersTab(this.followersUrl);
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiClient.getInstance.fetchFollowers(followersUrl),
      builder: (context,AsyncSnapshot<List<User>> snapshot){
        if(snapshot.hasData && snapshot.data.isNotEmpty){
          return ListView.builder(
            itemBuilder:(context,index)=> FollowerCardView(snapshot.data[index]),
            itemCount: snapshot.data.length,
            addAutomaticKeepAlives: true,
          );
        }

        if(snapshot.hasData && snapshot.data.isEmpty){
          return Center(child:Text("No data"));
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class FollowingTab extends StatelessWidget {

  final String followingUrl;

  FollowingTab(this.followingUrl);
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiClient.getInstance.fetchFollowing(followingUrl),
      builder: (context,AsyncSnapshot<List<User>> snapshot){
        if(snapshot.hasData && snapshot.data.isNotEmpty){
          return ListView.builder(
            itemBuilder:(context,index)=> FollowerCardView(snapshot.data[index]),
            itemCount: snapshot.data.length,
            addAutomaticKeepAlives: true,
          );
        }

        if(snapshot.hasData && snapshot.data.isEmpty){
          return Center(child:Text("No data"));
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class FollowerCardView extends StatelessWidget {

  final User user;

  FollowerCardView(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
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


        ],
      ),
    );
  }
}




