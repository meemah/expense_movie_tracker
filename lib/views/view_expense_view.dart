import 'package:expense_movie_tracker/custom_widgets/base_widget.dart';
import 'package:expense_movie_tracker/database/dao_provider.dart';
import 'package:expense_movie_tracker/database/expense.dart';
import 'package:expense_movie_tracker/utils/app_colors.dart';
import 'package:expense_movie_tracker/utils/spacing.dart';
import 'package:expense_movie_tracker/views/add_expense_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'add_expense_view.dart';

class ViewExpenseView extends StatefulWidget {
  static const route = '/viewExpenseView';

  @override
  _ViewExpenseViewState createState() => _ViewExpenseViewState();
}

class _ViewExpenseViewState extends State<ViewExpenseView> {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<DaoProvider>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.pushNamed(context, AddExpenseView.route).then((value) {
                setState(() {});
              });
            }),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: ListView(
              shrinkWrap: true,
              children: [
                StreamBuilder<double>(
                    stream: _provider.expenseDao.calculateTotal(),
                    builder: (ctx, snapshot) {
                      if (snapshot.data == null) {
                        return Center(
                          child: Text(
                            "You Havent Added Any Expense",
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                        );
                      }
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            color: kColorYellowPrimary,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Total Expenses Amount",
                              style: TextStyle(fontSize: 18, color: kColorDark),
                            ),
                            Text(
                              "N" + snapshot.data.toStringAsFixed(2),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: kColorDark,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }),
                kSizedBoxH20,
                StreamBuilder<List<Expense>>(
                  initialData: [],
                  stream: _provider.expenseDao.findAllExpenses(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data.length == 0) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AddExpenseView.route);
                        },
                        child: Center(
                          child: Text("Add Expense"),
                        ),
                      );
                    }
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (ctx, index) {
                          Expense _expense = snapshot.data[index];
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text((index + 1).toString() + ".  ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _expense.expenseTitle.toUpperCase(),
                                        style: TextStyle(
                                            // color: Theme.of(context).primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      kSizedBoxH5,
                                      CustomItem(
                                        title: "Spent",
                                        value: "N" +
                                            _expense.amount
                                                .toStringAsFixed(2)
                                                .toString(),
                                      ),
                                      CustomItem(
                                          title: "Date",
                                          value: _expense.currentDate),
                                      Divider(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class CustomItem extends StatelessWidget {
  final String title;
  final String value;

  const CustomItem({Key key, this.title, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title + ": ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
