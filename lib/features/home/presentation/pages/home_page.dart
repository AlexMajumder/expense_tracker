import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/shared/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text(
              'Good afternoon,',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Alex Majumder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,

                child: HeaderWidget(),

            ),
        Positioned(
          top: 155,
            left: 0,
            right: 0,
            child: _buildBalanceSummeryCard()),
          ],
      ),
    );
  }

  Widget _buildBalanceSummeryCard() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.themeColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 2,
                        children: [
                          Text(
                            'Total Balance',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_up, color: Colors.white),
                        ],
                      ),
                      Icon(Icons.more_horiz, color: Colors.white),
                    ],
                  ),
                  Text(
                    '\$0.00',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBalanceCardFlow(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    flow: 'Income',
                    icon: Icons.arrow_downward,
                  ),
                  _buildBalanceCardFlow(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    flow: 'Expenses',
                    icon: Icons.arrow_upward,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCardFlow({
    required CrossAxisAlignment crossAxisAlignment,
    required String flow,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      spacing: 4,
      children: [
        Row(
          spacing: 4,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .5),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            Text(
              flow,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          '\$0.00',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
