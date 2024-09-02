import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget{

  const ExpensesList({
    super.key, 
    required this.expenses,
    required this.onRemoved
    });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoved;

   @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20
      ),
      itemCount:expenses.length ,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.8),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) => onRemoved(expenses[index]),
        child: ExpenseItem(expenses[index])
      ,
      )
      );
  }

}