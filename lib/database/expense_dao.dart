import 'package:expense_movie_tracker/database/expense.dart';
import 'package:floor/floor.dart';

@dao
abstract class ExpenseDao {
  @Query('SELECT * FROM Expense')
  Stream<List<Expense>> findAllExpenses();

  @insert
  Future<void> insertExpense(Expense expense);

  @Query('SELECT SUM(amount) FROM Expense')
  Stream<double> calculateTotal();
}
