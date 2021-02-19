import 'package:expense_movie_tracker/utils/app_colors.dart';
import 'package:expense_movie_tracker/utils/router.dart';
import 'package:expense_movie_tracker/viewmodels/movie_list_viewmodel.dart';
import 'package:expense_movie_tracker/views/add_expense_view.dart';
import 'package:expense_movie_tracker/views/menu_select_view.dart';
import 'package:expense_movie_tracker/views/view_expense_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:expense_movie_tracker/views/movie_list_view.dart';

import 'database/dao_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MovieListViewmodel()),
      ChangeNotifierProvider(create: (context) => DaoProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DaoProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      // themeMode: ThemeMode.dark,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.indigoAccent,

        primarySwatch: Colors.indigo,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) => Routers.generateRoute(settings, context),
      home: FutureBuilder(
        future: provider.setExpenseDao(),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
            // return Text("error");
          } else if (!snapshot.hasData) {
            return Scaffold(body: CircularProgressIndicator());
          }

          return MenuSelectView();
        },
      ),
    );
  }
}
