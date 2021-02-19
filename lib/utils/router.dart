import 'package:expense_movie_tracker/views/add_expense_view.dart';
import 'package:expense_movie_tracker/views/movie_list_view.dart';
import 'package:expense_movie_tracker/views/view_expense_view.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(
      RouteSettings settings, BuildContext context) {
    Widget routeWidget;
    final args = settings.arguments;
    switch (settings.name) {
      case AddExpenseView.route:
        routeWidget = AddExpenseView();
        break;
      case ViewExpenseView.route:
        routeWidget = ViewExpenseView();
        break;
      case MovieListView.route:
        routeWidget = MovieListView();
        break;

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
        break;
    }
    return _createRoute(
        child: routeWidget); //MaterialPageRoute(builder: (_) => routeWidget);
  }

  static Route _createRoute({child: Widget, settings}) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
