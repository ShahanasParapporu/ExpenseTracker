import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget{

  const Expenses({super.key});

 @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

}


class _ExpensesState extends State<Expenses>{

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course', 
      amount: 19.99, 
      date: DateTime.now(), 
      category: Category.work),
    Expense(
      title: 'Cinema', 
      amount: 16.69, 
      date: DateTime.now(), 
      category: Category.leisure),  
  ];

  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){

    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration:const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo', 
          onPressed: (){
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
          }
        ),
      )
    );
  }


  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => NewExpense(onAddExpense: _addExpense,),);
  }



  @override
  Widget build(BuildContext context) {

    Widget mainContent = Center(child: const Text('No Expense, Try adding some'),);
    final width = MediaQuery.of(context).size.width;

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
         onRemoved: _removeExpense,);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expenses'),
        actions: [
          IconButton(
            onPressed:_openAddExpenseOverlay, 
            icon: const Icon(Icons.add))
        ],
        // backgroundColor: const Color.fromARGB(200, 170, 213, 216),
      ),
      body:width<600?Column(
        children: [
        //  const Text("Chart"),
        Chart(expenses: _registeredExpenses),
         Expanded(child:mainContent )
      ],
      ):Row(
        children: [
          Expanded(
            child: Chart(expenses: _registeredExpenses),
            ),
          Expanded(child: mainContent)
        ],
      ),
    );
  }

}