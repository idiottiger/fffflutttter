import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'listview_page.dart';
import 'tab_page.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => FirstPage(),
      '/sec': (context) => SecondPage(),
    },
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAGE_1'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sec');
          },
          child: Text('PAGE_1'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAGE_2'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('PAGE_2'),
        ),
      ),
    );
  }
}

class EditPage extends StatefulWidget {
  @override
  EditPageState createState() {
    return EditPageState();
  }
}

class EditPageState extends State<EditPage> {
  String text = "";

  @override
  void initState() {
    super.initState();
    this.requestGetJson().then((ret) {
      print("rsp: content ${ret}");
    });
  }

  Future<String> requestGetJson() async {
    var rsp = await http.get('https://swapi.co/api/people',
        headers: {"Accept": "application/json"});

    if (rsp != null) {
      return rsp.body;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.all_inclusive),
        title: Text('Hello Flutter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.access_time),
            tooltip: 'time',
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.access_alarm),
            tooltip: 'alarm',
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.ac_unit),
            tooltip: 'unit',
            onPressed: null,
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'plz input somthing'),
                onSubmitted: (String content) {
                  setState(() {
                    this.text += (content + "\n");
                  });
                },
              ),
              Text(this.text),
              Container(
                height: 100,
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          image: DecorationImage(
                              image: AssetImage('imgs/t1.png'),
                              fit: BoxFit.scaleDown),
                          border: Border.all(
                            color: Colors.black,
                            width: 9.0,
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      color: Colors.red,
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 80,
                      color: Colors.yellow,
                    )),
                    Container(
                      width: 20,
                      margin: EdgeInsets.only(left: 10),
                      color: Colors.teal,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.red,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.all_inclusive),
          title: Text('Hello Flutter'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.access_time),
              tooltip: 'time',
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.access_alarm),
              tooltip: 'alarm',
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.ac_unit),
              tooltip: 'unit',
              onPressed: null,
            ),
          ],
        ),
        body: ListViewPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: null,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
