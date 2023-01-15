import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = false; //维护单选开关状态
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("checkBox和switch"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text("switch"),
            Switch(
                value: _switchSelected,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value;
                  });
                }),
            Text("checkbox"),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.pink,
                  // fillColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                  value: isChecked,
                  activeColor: Colors.indigo,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Checkbox(
                  checkColor: Colors.pink,
                  // fillColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                  value: isChecked2,
                  activeColor: Colors.indigo,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked2 = value!;
                    });
                  },
                ),
                Checkbox(
                  // checkColor: Colors.pink,
                  fillColor: MaterialStateProperty.all(Colors.indigoAccent),
                  value: isChecked3,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked3 = value!;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant SwitchAndCheckBoxTestRoute oldWidget) {
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
}
