## Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_titled_container/flutter_titled_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Titled Container'),
      ),
      body: Center(
        child: TitledContainer(
          titleColor: Colors.blue,
          title: 'Container Title',
          textAlign: TextAlignTitledContainer.Center,
          fontSize: 16.0,
          backgroundColor: Colors.white,
          child: Container(
            width: 250.0,
            height: 200.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Center(
              child: Text(
                'Some text',
                style: TextStyle(fontSize: 28.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

```
