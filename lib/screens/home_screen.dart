

import 'package:flutter/material.dart';
import 'package:github_application/bloc/list_cards_bloc.dart';
import 'package:github_application/models/users.dart';
import 'package:github_application/screens/cardView.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ListCardsBloc bloc;

  @override
  Widget build(BuildContext context) {

    bloc=ListCardsBlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(38.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
            child: TextFormField(
              onChanged: (text)=>bloc.onTextChange(text),
              autofocus: false,
              decoration: InputDecoration(
                filled: true,
                suffixIcon: IconButton(icon:Icon(Icons.close), onPressed: ()=>bloc.clearList()),
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                hintText: 'Enter Name',
                alignLabelWithHint: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: bloc.users,
          builder: (context,AsyncSnapshot<List<User>> snapshot) {

            if(snapshot.hasData && snapshot.data.isNotEmpty){
              return ListView.builder(
                itemBuilder:(context,index)=> CardView(snapshot.data[index]),
                itemCount: snapshot.data.length,
                addAutomaticKeepAlives: true,
              );
            }

            return Center(child: Text("No Data to display"),);
          }

      ),
    );
  }
}