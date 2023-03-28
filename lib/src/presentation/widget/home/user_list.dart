import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/user_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state is UserInitial) CircularProgressIndicator(), // work just when firs request
            if (state is UserHasData) // if we have data
              SingleChildScrollView(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.data.length,
                  itemBuilder: ((context, index) {
                    final item = state.data[index];
                    return ListTile(
                      leading: Text(item.id.toString()),
                      title: Text(item.name as String),
                      subtitle: Text(item.email as String),
                    );
                  }),
                ),
              )
          ],
        );
      },
    );
  }
}
