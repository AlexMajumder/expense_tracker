import 'package:flutter/material.dart';
import '../../../../app/assets_path.dart';
import '../../../../app/app_colors.dart'; // import your app color class

class AccountsWidget extends StatefulWidget {
  const AccountsWidget({super.key});

  @override
  State<AccountsWidget> createState() => _AccountsWidgetState();
}

class _AccountsWidgetState extends State<AccountsWidget> {
  String selectedOption = "Bank";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 12,
        children: [
          _buildOptionTile(
            icon: Icons.account_balance,
            title: "Bank Link",
            subtitle: "Connect your bank account to deposit & fund",
            isSelected: selectedOption == "Bank",
            onTap: () {
              setState(() {
                selectedOption = "Bank";
              });
            },
            usePaypalIcon: false,
          ),
          _buildOptionTile(
            icon: Icons.account_balance_wallet_outlined,
            title: "Paypal",
            subtitle: "Connect you paypal account",
            isSelected: selectedOption == "Paypal",
            onTap: () {
              setState(() {
                selectedOption = "Paypal";
              });
            },
            usePaypalIcon: true,
          ),
          SizedBox(height: 100),
          ElevatedButton(onPressed: (){}, child: Text('Next',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))
        ],
      ),
    );
  }
}

Widget _buildOptionTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required bool isSelected,
  required VoidCallback onTap,
  bool usePaypalIcon = false,
}) {
  final Color activeColor = AppColors.themeColor;
  final Color inactiveColor = Colors.grey;
  final Color color = isSelected ? activeColor : inactiveColor;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? activeColor.withValues(alpha: .1) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? activeColor : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          usePaypalIcon
              ? Image.asset(
            AssetsPath.paypalLogo,
            width: 30,
            color: color,
          )
              : Icon(icon, color: color, size: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color:color),
                ),
              ],
            ),
          ),
          if (isSelected) Icon(Icons.check_circle, color: color),
        ],
      ),
    ),
  );
}
