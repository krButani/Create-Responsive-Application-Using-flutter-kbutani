import 'package:flutter/material.dart';
import 'package:reponsiveapp/sizeinfo.dart';

class krResponsivefull extends StatelessWidget {
  final Widget Function(BuildContext context, SizeInfo sizeinfo) builder;

  krResponsivefull({@required this.builder});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    SizeInfo sizeinfo = SizeInfo(width, height, orientation);

    return Builder(
      builder: (context) {
        return builder(context, sizeinfo);
      },
    );
  }
}
