import 'package:expense_movie_tracker/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FullButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Function onTap;
  final double width;
  final Color textColor;

  const FullButton(
      {Key key,
      this.title,
      this.buttonColor,
      this.onTap,
      this.width = double.infinity,
      this.textColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45.0,
      shape: RoundedRectangleBorder(
        // side: BorderSide.,
        borderRadius: BorderRadius.circular(6.0),
      ),
      minWidth: width,
      textColor: textColor,
      color: buttonColor == null ? Theme.of(context).primaryColor : buttonColor,
      child: Text(title),
      onPressed: onTap,
    );
  }
}
