import 'package:clean_architecture_example/main.dart';
import 'package:clean_architecture_example/src/config/router/app_router.dart';
import 'package:clean_architecture_example/src/presentation/widget/home/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/user_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<UserBloc>().add(const GetAllUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await router.push(PostRouter());
        },
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(143, 1, 0, 0),
        title: Text("Home View"),
      ),
      body: SafeArea(
        child: Center(
          child: UserList(),
        ),
      ),
    );
  }
}
