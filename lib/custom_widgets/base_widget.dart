import 'package:expense_movie_tracker/utils/spacing.dart';
import 'package:flutter/material.dart';

abstract class BaseWidget extends StatelessWidget {
  const BaseWidget({Key key, this.title}) : super(key: key);

  Widget doBuild(BuildContext context);
  final String title;
  // final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // title
      appBar: title != null
          ? AppBar(
              textTheme: TextTheme(),
              title: Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 16
                    // fontFamily:
                    ),
              ),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  AppBar().preferredSize.height,
              child: Padding(
                padding: EdgeInsets.all(pagePadding),
                child: doBuild(context),
              ),
            )),
      ),
    );
  }
}
