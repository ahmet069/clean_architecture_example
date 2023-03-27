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
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(child: Text('Hello World!')),
            if (state is UserInitial) CircularProgressIndicator(),
            if (state is UserHasData)
              Column(children: state.data.map((e) => Text(e.address.toString())).toList())
          ]);
        },
      ),
    );
  }
}
