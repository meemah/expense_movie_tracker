import 'package:expense_movie_tracker/custom_widgets/base_widget.dart';
import 'package:expense_movie_tracker/utils/app_colors.dart';
import 'package:expense_movie_tracker/views/movie_list_view.dart';
import 'package:expense_movie_tracker/views/view_expense_view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:expense_movie_tracker/utils/spacing.dart';

class MenuSelectView extends BaseWidget {
  @override
  Widget doBuild(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Hello,"),
      Text(
        "What Will You Like To Do?",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      kSizedBoxH15,
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ViewExpenseView.route);
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.amberAccent),
          child: Row(children: [
            Image.asset(
              "images/expenses.png",
              height: 150,
            ),
            kSizedBoxW5,
            Expanded(
              child: Text(
                "Manage Your Expenses",
                style: TextStyle(fontSize: 16),
              ),
            )
          ]),
        ),
      ),
      kSizedBoxH15,
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MovieListView.route);
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(color: Colors.indigoAccent),
          child: Row(children: [
            Image.asset(
              "images/clapperboard.png",
              height: 150,
            ),
            kSizedBoxW5,
            Expanded(
              child: Text("View list of Studio Ghibil movies",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )),
            )
          ]),
        ),
      ),
    ]);
  }
}
