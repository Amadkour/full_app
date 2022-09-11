import 'package:api_project/modules/post/controller/post_cubit.dart';
import 'package:api_project/modules/post/provider/model/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({Key? key, this.post}) : super(key: key);
  final PostModel? post;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(post: post),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          PostCubit controller = context.read<PostCubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text(post != null ? 'update Post' : 'New Post'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: [
                    ///-----------------title
                    TextFormField(
                      minLines: 1,
                      maxLines: 1,
                      controller: controller.titleTextController,
                      decoration: InputDecoration(
                        hintText: 'Type Your Post Title',
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.red, width: 2, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(25)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),

                    ///-----------------body
                    TextFormField(
                      minLines: 5,
                      maxLines: 10,
                      autovalidateMode: AutovalidateMode.always,
                      controller: controller.bodyTextController,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-5a-fA-X]'))],
                      validator: (String? t) {
                        if (t!.length < 10) {
                          return 'ggg';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Type Your Post Body',
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 2, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 2, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const Spacer(
                      flex: 10,
                    ),

                    ///----------------button
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration:
                            BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            post != null ? 'Update Post' : 'Insert Post',
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        controller.insertPost(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
