import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        //product price
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: const Text(
            '\$ 100.0',
            style: TextStyle(fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        //product name
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'Brian',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        //list view
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://plus.unsplash.com/premium_photo-1701180529217-f2270f92f01f?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(width: 10),
              Image.network(
                'https://plus.unsplash.com/premium_photo-1701180529217-f2270f92f01f?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(width: 10),
              Image.network(
                'https://plus.unsplash.com/premium_photo-1701180529217-f2270f92f01f?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(width: 10),
              Image.network(
                'https://plus.unsplash.com/premium_photo-1701180529217-f2270f92f01f?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                height: 100,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(color: Colors.cyan[800]),
          ),
        )
      ],
    );
  }
}
