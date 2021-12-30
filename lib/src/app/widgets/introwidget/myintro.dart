import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

@immutable
class MyIntroData extends StatelessWidget {
  ///This is a builder for an intro screen
  ///
  ///
  /// title of your slide
  ///[String]
  final String title;

  ///description of your slide
  ///[String]
  final String description;

  ///image path for your slide
  ///[String]
  final String imageAsset;

  ///textStyle for your slide
  ///[TextStyle]
  final TextStyle textStyle;

  ///background color for your slide header
  ///[Color]
  final Color headerBgColor;

  ///padding for the your slide header
  ///[EdgeInsets]
  final EdgeInsets headerPadding;

  ///widget to use as the header part of your screen
  ///[Widget]
  final Widget header;

  int _pageIndex;

  MyIntroData({
    @required this.title,
    this.headerPadding = const EdgeInsets.all(12),
    @required this.description,
    this.header,
    this.headerBgColor = Colors.white,
    this.textStyle,
    this.imageAsset,
  })  : assert(title != null),
        assert(description != null),
        assert(title != null);

  set index(val) => this._pageIndex = val;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screenSize.height,
      child: Column(
        children: <Widget>[
          Container(
            height: screenSize.height * .666,
            // padding: headerPadding,
            // decoration: BoxDecoration(
            //   color: headerBgColor,
            // ),
            child: Center(
              child: imageAsset != null
                  ? Image.asset(
                      imageAsset,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: screenSize.height,
                    )
                  : this.header ??
                      Container(
                        child: Text(
                          "${this._pageIndex??1}",
                          style: TextStyle(
                              fontSize: 300, fontWeight: FontWeight.w900),
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}