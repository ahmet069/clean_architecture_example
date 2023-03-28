// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    SearchRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SearchView(),
      );
    },
    PostRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const PostListView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRouter.name,
          path: '/',
        ),
        RouteConfig(
          SearchRouter.name,
          path: '/SearchView',
        ),
        RouteConfig(
          PostRouter.name,
          path: '/PostListView',
        ),
      ];
}

/// generated route for
/// [HomeView]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: '/',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [SearchView]
class SearchRouter extends PageRouteInfo<void> {
  const SearchRouter()
      : super(
          SearchRouter.name,
          path: '/SearchView',
        );

  static const String name = 'SearchRouter';
}

/// generated route for
/// [PostListView]
class PostRouter extends PageRouteInfo<void> {
  const PostRouter()
      : super(
          PostRouter.name,
          path: '/PostListView',
        );

  static const String name = 'PostRouter';
}
