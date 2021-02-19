import 'dart:async';

import 'package:expense_movie_tracker/database/expense.dart';
import 'package:expense_movie_tracker/database/expense_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'expense_database.g.dart';

@Database(version: 1, entities: [Expense])
abstract class AppDatabase extends FloorDatabase {
  ExpenseDao get expenseDao;
}
