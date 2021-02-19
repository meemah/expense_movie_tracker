import 'package:expense_movie_tracker/database/expense_dao.dart';
import 'package:expense_movie_tracker/database/expense_database.dart';
import 'package:flutter/cupertino.dart';

class DaoProvider with ChangeNotifier {
  ExpenseDao expenseDao;

  Future<AppDatabase> initDb() async {
    return $FloorAppDatabase.databaseBuilder('expense_database').build();
  }

  Future<ExpenseDao> setExpenseDao() async {
    return initDb().then((value) => expenseDao = value.expenseDao);
  }
}
