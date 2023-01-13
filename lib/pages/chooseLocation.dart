// ignore_for_file: deprecated_member_use
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int count = 0;
  late String httpResponse="";
  void getData() async {
    String name = await Future.delayed(Duration(seconds: 3), () {
    //await 是等待被他修饰的方法执行完才继续往下走
    return '5秒后打印';
  });
    // Future.delayed(Duration(seconds: 2), () {
    //   print('2秒后打印');
    // });
    // print('直接打印');
    // print(name);
    var url = Uri.https("jsonplaceholder.typicode.com", "/todos/5");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      print(jsonResponse["id"]);
      print('response-body:'+response.body);
      httpResponse=response.body;

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('initStatus');

  }

  @override
  Widget build(BuildContext context) {
    print('build');
    var args=ModalRoute.of(context)?.settings.arguments;
    print(args);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("location"),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: (Colors.white),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "this is chooseLocation",
                style:
                    TextStyle(color: Colors.red, backgroundColor: Colors.teal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "this is chooseLocation",
                style:
                    TextStyle(color: Colors.red, backgroundColor: Colors.teal),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  count += 1;
                  tiaoZhuan();
                });
              },
              child: Text('counter id $count'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  void tiaoZhuan() {
    Navigator.pushNamed(context, "loading",arguments: httpResponse);
  }
}
