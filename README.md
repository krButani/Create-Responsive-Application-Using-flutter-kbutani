# Create Responsive Application - flutter


### Create Responsive Main Widget


```
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

```

### Create Main Application

```
import 'package:flutter/material.dart';
import 'package:reponsiveapp/krResponsivefull.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext mcontext) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("App Working"),
            ),
            body: krResponsivefull(builder: (context, constraints) {
              final _scaffoldKey = GlobalKey<ScaffoldState>();
              return Container(
                  child: Center(
                child: MaterialButton(
                  onPressed: () {
                    print("workingk");
                    SnackBar snackBar = SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Hello This is Snackbar'),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  color: Colors.red,
                  child: Text(
                    "Press Me",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ));
            })));
    /* return krResponsive(
      appbar: AppBar(
        title: Text("kr Responsive Application"),
      ),
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(constraints.width / 0.27),
          child: Center(
            child: MaterialButton(
              onPressed: () {
                SnackBar snackBar = SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Hello This is Snackbar'),
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
              color: Colors.red,
              child: Text(
                "Press Me",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    ); */
  }
}

```