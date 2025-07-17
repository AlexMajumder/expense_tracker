import 'package:expense_tracker/shared/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../../shared/widgets/header_widget.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final TextEditingController _expenseNameTEController =
  TextEditingController();
  final TextEditingController _expenseAmountTEController =
  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(title: 'Add Expense', actionIcon: Icons.more_horiz),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(top: 0, left: 0, right: 0, child: HeaderWidget()),
          Positioned(
            top: 155,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    'NAME',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _expenseNameTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Expense Name',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Expense Name';
                      }
                      return null;
                    },
                  ),
                  Text(
                    'AMOUNT',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _expenseAmountTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: AppColors.themeColor,fontWeight: FontWeight.w600,fontSize: 16),
                    decoration:  InputDecoration(
                        fillColor: Colors.white,
                        hintText: '0.00',
                        prefix: Text('\$',style: TextStyle(
                            color: AppColors.themeColor,fontWeight: FontWeight.w600,fontSize: 16
                        ),),
                        suffix: Text('Clear',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.themeColor,
                        ),)
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Expense Amount';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }

  @override
  void dispose() {
    _expenseNameTEController.dispose();
    _expenseAmountTEController.dispose();
    super.dispose();
  }
}
