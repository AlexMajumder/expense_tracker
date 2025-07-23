import 'package:flutter/material.dart';
import 'bank_card_widget.dart';

class CardsWidget extends StatefulWidget {
  const CardsWidget({super.key});

  @override
  State<CardsWidget> createState() => _CardsWidgetState();
}

class _CardsWidgetState extends State<CardsWidget> {
  final TextEditingController _cardNameTEController = TextEditingController();
  final TextEditingController _cardNumberTEController = TextEditingController();
  final TextEditingController _cvcTEController = TextEditingController();
  final TextEditingController _cardExpireDateTEController =
      TextEditingController();
  final TextEditingController _cardZipTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BankCardWidget(),
          const SizedBox(height: 8),
          Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add your debit Card',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                'This card must be connected to a bank account under your name',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              TextFormField(
                controller: _cardNameTEController,
                decoration: const InputDecoration(
                  labelText: 'NAME ON CARD',
                  hintText: 'NAME ON CARD',
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _cardNumberTEController,
                      decoration: const InputDecoration(
                        labelText: 'DEBIT CARD NUMBER',
                        hintText: 'DEBIT CARD NUMBER',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _cvcTEController,
                      decoration: const InputDecoration(
                        labelText: 'CVC',
                        hintText: 'CVC',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _cardExpireDateTEController,
                      decoration: const InputDecoration(
                        labelText: 'EXPIRATION MM/YY',
                        hintText: 'EXPIRATION MM/YY',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _cardZipTEController,
                      decoration: const InputDecoration(
                        labelText: 'ZIP',
                        hintText: 'ZIP',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
