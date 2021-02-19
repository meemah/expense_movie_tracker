import 'package:floor/floor.dart';

@entity
class Expense {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String expenseTitle;
  final double amount;

  final String currentDate;

  Expense(this.id, this.expenseTitle, this.amount, this.currentDate);
}
