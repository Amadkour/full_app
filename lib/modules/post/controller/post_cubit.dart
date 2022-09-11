import 'package:api_project/modules/post/provider/API/post_api.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../provider/model/post_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  List<PostModel> posts = [];
  final PostModel? post;
  PostCubit({this.post,}) : super(PostInitial()) {
    config();
    ///------------update
    if(post!=null){
      titleTextController.text=post!.title??'';
      bodyTextController.text=post!.body??'';
    }
  }

  config() async {
    PostAPI postAPI = PostAPI();
    posts = await postAPI.getPosts();
    emit(PostInitial());
  }

  insertPost(BuildContext context) async {
    print('-------------insert new post------------');
    PostAPI postAPI = PostAPI();
    await postAPI.insertPosts(title:titleTextController.text,body:bodyTextController.text );
    Navigator.pop(context);
  }

  updatePost() {
    print('-------------update post------------');
    PostAPI postAPI = PostAPI();
    // postAPI.updatePosts();
    emit(PostInitial());
  }

  deletePost(int index) {
    print('-------------delete post------------');
    PostAPI postAPI = PostAPI();
    postAPI.deletePost(id:posts[index].id!);
    posts.removeAt(index);
    emit(PostInitial());
  }


  ///---------------text field controllers---------///

TextEditingController titleTextController=TextEditingController();
TextEditingController bodyTextController=TextEditingController();




}
