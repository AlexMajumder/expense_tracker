import 'package:expense_tracker/features/wallet/presentation/widgets/accounts_widget.dart';
import 'package:expense_tracker/shared/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/header_widget.dart';
import '../widgets/cards_widget.dart';

class ConnectWalletPage extends StatefulWidget {
  const ConnectWalletPage({super.key});

  @override
  State<ConnectWalletPage> createState() => _ConnectWalletPageState();
}

class _ConnectWalletPageState extends State<ConnectWalletPage> {

  final List<Widget> _widgets = [
    CardsWidget(),
    AccountsWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        title: 'Connect Wallet',
        actionIcon: Icons.notifications,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(top: 0, left: 0, right: 0, child: HeaderWidget()),
          Positioned(
            top: 155,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: DefaultTabController(
                length: _widgets.length,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F6F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          labelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 0,
                          indicatorColor: Colors.transparent,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                          ),
                          tabs:  [
                            Tab( child: Text('Cards'),),
                            Tab(text: 'Accounts'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: TabBarView(
                      children: _widgets,
                    ),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
