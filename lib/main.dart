import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  List<User> users = [
    new User("Jane Done", "https://picsum.photos/200/200?image=0"),
    new User("John Done", "https://picsum.photos/200/200?image=1"),
    new User("Jane Hanson", "https://picsum.photos/200/200?image=2"),
    new User("Jordan Done", "https://picsum.photos/200/200?image=3"),
    new User("Random Done", "https://picsum.photos/200/200?image=4"),
    new User("Flutter Done", "https://picsum.photos/200/200?image=5"),
    new User("Jane Done", "https://picsum.photos/200/200?image=6")

  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Dismissible(
                onDismissed: (direction){
                  if(direction == DismissDirection.startToEnd){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Dismissed")));
                  }
                },
                key: Key(users[index].name),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Image.network(users[index].photoUrl),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(users[index].name, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                          )
                        ],
                      )
                  ),
                ),
              );
            },
          )
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class User{
  String name;
  String photoUrl;

  User(this.name, this.photoUrl);
}