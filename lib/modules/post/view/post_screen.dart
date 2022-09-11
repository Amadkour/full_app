import 'package:api_project/modules/post/controller/post_cubit.dart';
import 'package:api_project/modules/post/view/new_post_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


final provider=FutureProvider((ref) {
  final databaseProvider = Provider<int>((ref) => 20);
  ref.watch(databaseProvider);



});


class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          PostCubit controller = context.read<PostCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text('Post Screen'),
              actions: [
                ///----------------insert post------------------///
                IconButton(onPressed: (){

                  Navigator.push (
                    context,
                    MaterialPageRoute (
                      builder: (BuildContext context) => const NewPostPage(),
                    ),
                  );

                }, icon: const Icon(CupertinoIcons.add)),
                ///----------------update post------------------///
              ],
            ),
            body:

            controller.posts.isEmpty?
            const Center(child:  Icon(CupertinoIcons.delete),) :
            ListView.separated(
              itemBuilder: (BuildContext context, int index)=>
                  Slidable(
                    // Specify a key if the Slidable is dismissible.
                    key: const ValueKey(0),

                    // The start action pane is the one at the left or the top side.
                    startActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: const ScrollMotion(),
                      // All actions are defined in the children parameter.
                      children:  [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (c){
                            controller.deletePost(index);
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (c){
                            Navigator.push (
                              context,
                              MaterialPageRoute (
                                builder: (BuildContext context) =>  NewPostPage(post: controller.posts[index],),
                              ),
                            );
                          },
                          backgroundColor: Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: CupertinoIcons.settings,
                          label: 'Edit',
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: const ScrollMotion(),
                      // All actions are defined in the children parameter.
                      children:  [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (c){
                            controller.deletePost(index);
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (c){

                          },
                          backgroundColor: Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: CupertinoIcons.settings,
                          label: 'update',
                        ),
                      ],
                    ),
                    // The end action pane is the one at the right or the bottom side.

                    // The child of the Slidable is what the user sees when the
                    // component is not dragged.
                    child:  Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.tealAccent),
                        child: Column(
                          children: [
                            Text(
                              controller.posts[index].title ?? 'post title',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(controller.posts[index].body ?? 'post body'),
                          ],
                        )),
                  ),


              itemCount: controller.posts.length,
              separatorBuilder: (BuildContext context, int index) =>
            const Divider(thickness: 1,)
              ,
            ),
          );
        },
      ),
    );
  }
}
