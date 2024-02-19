import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/features/account/widgets/account_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              onPressed: () {},
              text: 'Your Orders',
            ),
            AccountButton(
              onPressed: () {},
              text: 'Turn Seller',
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              onPressed: () {},
              text: 'Log Out',
            ),
            AccountButton(
              onPressed: () {},
              text: 'Your Wish List',
            ),
          ],
        ),
      ],
    );
  }
}
