import 'package:clean_architecture_example/src/presentation/bloc/bloc/user_bloc.dart';
import 'package:clean_architecture_example/src/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => di.injector<UserBloc>()),
    ], child: MaterialApp(home: HomeView()));
  }
}

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
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
