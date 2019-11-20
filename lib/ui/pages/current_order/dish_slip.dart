import 'package:flutter/material.dart';
import 'package:my_thai_star_flutter/models/dish.dart';
import 'package:my_thai_star_flutter/ui/ui_helper.dart';

class DishSlip extends StatelessWidget {
  static const double textDistance = 3;
  final Dish dish;

  const DishSlip({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UiHelper.standart_padding),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {},
          ),
          _Content(dish: dish, textDistance: textDistance),
          _Amount(),
          Text(
            "${dish.price} €",
            style: Theme.of(context)
                .textTheme
                .subtitle
                .copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _Amount extends StatelessWidget {
  const _Amount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {},
        ),
        Text(
          "1",
          style: Theme.of(context)
              .textTheme
              .subtitle
              .copyWith(color: Colors.grey),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key key,
    @required this.dish,
    @required this.textDistance,
  }) : super(key: key);

  final Dish dish;
  final double textDistance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            dish.name,
            style: Theme.of(context)
                .textTheme
                .subtitle
                .copyWith(color: Colors.black),
          ),
          SizedBox(height: textDistance),
          Text(
            "${dish.extras}".replaceAll(RegExp(r"[\[\]]"), ""),
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: textDistance),
          Text(
            "Add Comment",
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ],
      ),
    );
  }
}