import 'package:expense_movie_tracker/custom_widgets/base_widget.dart';
import 'package:expense_movie_tracker/custom_widgets/custom_textField.dart';
import 'package:expense_movie_tracker/custom_widgets/full_button.dart';
import 'package:expense_movie_tracker/database/dao_provider.dart';
import 'package:expense_movie_tracker/database/expense.dart';
import 'package:expense_movie_tracker/utils/spacing.dart';
import 'package:expense_movie_tracker/utils/validation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddExpenseView extends BaseWidget with ValidationMixin {
  static const route = '/addExpenseView';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusScopeNode _node = FocusScopeNode();
  TextEditingController _itemController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  @override
  Widget doBuild(BuildContext context) {
    var provider = Provider.of<DaoProvider>(context);

    validateForm() {
      if (_formKey.currentState.validate()) {
        provider.expenseDao
            .insertExpense(new Expense(null, _itemController.text,
                double.parse(_amountController.text), _dateController.text))
            .then((value) => Navigator.pop(context));
      }
    }

    return Form(
      key: _formKey,
      child: FocusScope(
        node: _node,
        child: ListView(
          children: [
            Text("Add A New Expense",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            kSizedBoxH15,
            CustomTextField(
              fieldName: "Item",
              controller: _itemController,
              hintText: "E.g buying food",
              onValidate: validateIsEmpty,
              editingComplete: _node.nextFocus,
            ),
            CustomTextField(
              controller: _amountController,
              fieldName: "Amount Spent",
              hintText: "N100",
              inputType: TextInputType.number,
              onValidate: numberValidator,
            ),
            CustomTextField(
              fieldName: "Transaction Date",
              hintText: "",
              editingComplete: validateForm,
              onValidate: validateIsEmpty,
              onTap: () async {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                ).then((value) {
                  _dateController.text =
                      DateFormat.yMMMMd('en_US').format(value);
                  print(_dateController.text);
                  // _dateController.text = value.day.toString();
                });
              },
              controller: _dateController,
            ),
            kSizedBoxH15,
            FullButton(
              title: "Add Expense",
              onTap: () {
                validateForm();
              },
            )
          ],
        ),
      ),
    );
  }
}
