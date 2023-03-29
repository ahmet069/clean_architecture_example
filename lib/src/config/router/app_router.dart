import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_example/src/presentation/view/home_view.dart';
import 'package:clean_architecture_example/src/presentation/view/post_list_view.dart';
import 'package:clean_architecture_example/src/presentation/view/search_view.dart';
import 'package:flutter/cupertino.dart';

part 'app_router.gr.dart';

/// `AppRouter` is a class that extends `_$AppRouter`
/// and is used to generate a `Router` object
@AdaptiveAutoRouter(
  // * for names
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'HomeRouter',
      page: HomeView,
      initial: true,
    ),
    CustomRoute(
      path: '/SearchView',
      name: 'SearchRouter',
      page: SearchView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    AutoRoute(
      page: PostListView,
      path: '/PostListView',
      name: 'PostRouter',
    ),
  ],
)

/// `AppRouter` is a class that extends `_`
/// and is used to generate a `Router` object
class AppRouter extends _$AppRouter {}
