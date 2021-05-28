# flutter_titled_container

Display a title on top of the Container.

The widget works best with a child container : Container

You can set the following properties :

- title           - The text to display 
- titleColor      - The color (foreground) fors title, default is black
- fontSize        - The font size for title, default is 14.0
- backgroundColor - The background color for title, default is white
- textAlign       - The alignment for text. i.e. Lef, Center or Right

See the screenshot

![](https://github.com/johandb/flutter_titled_container/blob/main/supplement/app.png)
![](https://github.com/johandb/flutter_titled_container/blob/main/supplement/app-r.png)
![](https://github.com/johandb/flutter_titled_container/blob/main/supplement/app-l.png)

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
