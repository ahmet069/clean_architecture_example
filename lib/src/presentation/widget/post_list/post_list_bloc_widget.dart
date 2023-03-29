import 'package:clean_architecture_example/src/presentation/bloc/post/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListBlocWidget extends StatefulWidget {
  const PostListBlocWidget({super.key});

  @override
  State<PostListBlocWidget> createState() => _PostListBlocWidgetState();
}

class _PostListBlocWidgetState extends State<PostListBlocWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is PostHasData) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: state.data.length,
          itemBuilder: ((context, index) {
            final item = state.data[index];
            return ListTile(
              leading: Text(item.id.toString()),
              title: Text(item.title as String),
              subtitle: Text(item.body as String),
            );
          }),
        );
      } else {
        return Center(
          child: Text("data"),
        );
      }
    });
  }
}
