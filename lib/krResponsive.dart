import 'package:flutter/material.dart';
import 'package:reponsiveapp/sizeinfo.dart';

class krResponsive extends StatelessWidget {
  final AppBar appbar;
  final Drawer drawer;
  final Widget Function(BuildContext context, SizeInfo sizeinfo) builder;

  krResponsive({@required this.builder, this.appbar, this.drawer});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    SizeInfo sizeinfo = SizeInfo(width, height, orientation);

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset:
              false, // it is used when keyboard open that time padding is not change
          appBar: appbar,
          drawer: drawer,
          body: Builder(
            builder: (context) {
              return builder(context, sizeinfo);
            },
          )),
    );
  }
}
