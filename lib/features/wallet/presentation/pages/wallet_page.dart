import 'package:expense_tracker/shared/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../../shared/widgets/header_widget.dart';
import '../widgets/add_option_bottom_sheet_widget.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(title: 'Wallet', actionIcon: Icons.notifications),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '\$0.00',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildWalletOptionItem(
                        title: 'Add',
                        iconData: Icons.add,
                        onTap: _onTapAddButton,
                      ),
                      _buildWalletOptionItem(
                        title: 'Pay',
                        iconData: Icons.qr_code,
                        onTap: _onTapPayButton,
                      ),
                      _buildWalletOptionItem(
                        title: 'Send',
                        iconData: Icons.send,
                        rotateDegrees: -45,
                        onTap: _onTapSendButton,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletOptionItem({
    required String title,
    required IconData iconData,
    double? rotateDegrees,
    required VoidCallback? onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.themeColor, width: 1),
            ),
            child: Transform.rotate(
              angle: rotateDegrees ?? 0 * 3.1415927 / 180,
              child: Icon(iconData, color: AppColors.themeColor, size: 30),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  _onTapAddButton() {
    AddOptionBottomSheedWidget(context);
  }

  _onTapPayButton() {
    AddOptionBottomSheedWidget(context);
  }

  _onTapSendButton() {
    AddOptionBottomSheedWidget(context);
  }
}
