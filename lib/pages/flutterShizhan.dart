import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              child: Text("open new route"),
              onPressed: () {
                //导航到新路由
                Navigator.of(context).pushNamed(
                  "new_page",
                  arguments: "hi",
                );
              },
            ),
            RandomWordsWidget(),
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

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    required this.text, // 接收一个text参数
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              Text(
                "Text",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text(
                  "ElevatedButton",
                  style: TextStyle(
                      color: Colors.red, backgroundColor: Colors.cyanAccent),
                ),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(color: Colors.blue),
                ),
              ])),
              DefaultTextStyle(
                //1.设置文本默认样式
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("DefaultTextStyle"),
                    Text("I am Jack"),
                    Text(
                      "I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.blue,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              TextButton(onPressed: () {}, child: Text("TextButton")),
              OutlinedButton(
                child: Text("OutlinedButton"),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                label: Text("OutlinedButton"),
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              Image.asset(
                'assets/m001.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
              Image(
                image: AssetImage("assets/m001.jpg"),
                height: 100,
                fit: BoxFit.fitHeight,
                color: Colors.blueAccent,
                colorBlendMode: BlendMode.darken,
              ),
              Image.network(
                "https://up.enterdesk.com/edpic/45/f0/71/45f07166bddcd586f364b249fcd802c0.jpg",
                width: 100.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextAndButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Text",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text(
                  "ElevatedButton",
                  style: TextStyle(
                      color: Colors.red, backgroundColor: Colors.cyanAccent),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurpleAccent)),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(color: Colors.blue),
                ),
              ])),
              DefaultTextStyle(
                //1.设置文本默认样式
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("DefaultTextStyle"),
                    Text("I am Jack"),
                    Text(
                      "I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.blue,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              TextButton(onPressed: () {}, child: Text("TextButton")),
              OutlinedButton(
                child: Text(
                  "OutlinedButton",
                  style: TextStyle(
                      color: Colors.white, backgroundColor: Colors.amber),
                ),
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green),
                ),
              ),
              OutlinedButton.icon(
                label: Text(
                  "OutlinedButton",
                  style: TextStyle(color: Colors.deepOrange),
                ),
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );

    //获取路由参数
    // var args = ModalRoute.of(context)?.settings.arguments;
    // return Center(
    //   child: ElevatedButton(
    //     onPressed: () async {
    //       // 打开`TipRoute`，并等待返回结果
    //       var result = await Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) {
    //             return TipRoute(
    //               // 路由参数
    //               text: "我是提示xxxx$args",
    //             );
    //           },
    //         ),
    //       );
    //       //输出`TipRoute`路由返回结果
    //       print("路由返回值: $result");
    //     },
    //     child: Text("打开提示页"),
    //   ),
    // );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    // var args=ModalRoute.of(context).settings.arguments;
    //...省略无关代码
    return Scaffold(
      appBar: AppBar(
        title: Text("MainPage"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // 打开`TipRoute`，并等待返回结果
                var result = await Navigator.of(context)
                    .pushNamed("TextAndButton", arguments: "打开路由时传递的参数");
                //输出`TipRoute`路由返回结果
                print("路由返回值: $result");
              },
              child: Text("text和Button"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "ImageTest");
                },
                child: Text("图片的使用")),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "SwitchAndCheckBoxTestRoute");
              },
              child: Text("checkBox和Switch"),
            )
          ],
        ),
      ),
    );
  }
}

class ImageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    // var args=ModalRoute.of(context).settings.arguments;
    //...省略无关代码
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageTest"),
      ),
      body: Column(children: [
        Image.asset(
          'assets/m001.jpg',
          height: 100,
          width: 100,
          fit: BoxFit.contain,
        ),
        Image(
          image: AssetImage("assets/m001.jpg"),
          height: 100,
          fit: BoxFit.fitHeight,
          color: Colors.cyanAccent,
          colorBlendMode: BlendMode.darken,
        ),
        Image.network(
          "https://up.enterdesk.com/edpic/45/f0/71/45f07166bddcd586f364b249fcd802c0.jpg",
          width: 150.0,
        ),
        Image(
          image: AssetImage("assets/m001.jpg"),
          width: 300,
          height: 60.0,
          repeat: ImageRepeat.repeatX,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(100, 10, 10, 10),
          child: Row(
            children: [
              Icon(Icons.accessible, color: Colors.amberAccent),
              Icon(Icons.error, color: Colors.red),
              Icon(Icons.fingerprint, color: Colors.green),
              Icon(Icons.photo_camera, color: Colors.grey),
              Icon(Icons.person, color: Colors.green),
            ],
          ),
        ),
      ]),
    );
  }
}
