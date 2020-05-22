import 'package:apphttpdiana/http_services.dart';
import 'package:apphttpdiana/post_model.dart';
import 'package:flutter/material.dart';
import 'package:apphttpdiana/post_detail.dart';

import 'http_services.dart';
import 'post_model.dart';


class PostsPage extends StatelessWidget{

  final HttpsService httpsService=HttpsService();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Diana García App-http",style: TextStyle(color: Colors.brown),),
      ),
      body: FutureBuilder(future: httpsService.getPosts(),
          builder:(BuildContext context, AsyncSnapshot<List<Post>> snapshot){
            if(snapshot.hasData){
              List<Post> posts = snapshot.data;

              return ListView(
                children: posts
                    .map((Post post) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/img/jira.jpg"),
                  ),
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=>PostDetail(
                        post: post,
                      ),
                    ),
                  ),
                ),)
                    .toList(),
              );
            }
            return Center(child: CircularProgressIndicator());
          }
      ),

    );
  }

}
