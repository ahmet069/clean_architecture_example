import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/post/post.dart';
import '../../bloc/post/post_bloc.dart';

class SearchPostWidget extends StatefulWidget {
  const SearchPostWidget({super.key});

  @override
  State<SearchPostWidget> createState() => _SearchPostWidgetState();
}

class _SearchPostWidgetState extends State<SearchPostWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostHasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              final item = state.data[index];
              final Color color = index % 2 == 0 ? Color(0xffffffff) : Color(0xffe3e3e3);
              return ListTile(
                tileColor: color,
                title: Text(item.title.toString()),
              );
            },
          );
        }
        if (state is PostError) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
