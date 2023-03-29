import 'package:clean_architecture_example/main.dart';
import 'package:clean_architecture_example/src/config/router/app_router.dart';
import 'package:clean_architecture_example/src/core/components/text_form_field/custom_text_form_field.dart';
import 'package:clean_architecture_example/src/presentation/widget/post_list/post_list_bloc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post/post_bloc.dart';

class PostListView extends StatefulWidget {
  const PostListView({super.key});

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  @override
  void initState() {
    context.read<PostBloc>().add(const GetAllPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextFormField(
          isReadOnly: true,
          onTap: () => router.push(
            SearchRouter(),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: PostListBlocWidget(),
        ),
      ),
    );
  }
}
