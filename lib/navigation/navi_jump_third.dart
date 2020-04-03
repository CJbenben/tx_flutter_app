import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ThirdPage extends StatefulWidget {
  final String title;
  final String phone;
  ThirdPage({this.title, this.phone});
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final myController = TextEditingController();
  String _inputText;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: <Widget>[
          new TextField(
            controller: TextEditingController.fromValue(
                TextEditingValue(text: widget.phone)),
            maxLines: 1,
            style: TextStyle(
              fontSize: 15,
            ),
            keyboardType: TextInputType.phone,
            autofocus: true,
            decoration: InputDecoration(
//              labelText: '左上角',
              hintText: 'This is ios placeholder with userphone!',
            ),
            // 编辑完成
            onSubmitted: (String text) {
              _inputText = text;
              Toast.show(text, context);
            },
            onChanged: (String text) {
              _inputText = text;
              Toast.show(text, context);
            },
          ),
          new MaterialButton(
            color: Colors.yellow,
            minWidth: 200,
            child: Text(
              'back last vc with return',
            ),
            onPressed: () {
              if (_inputText == null && widget.phone != null) {
                _inputText = widget.phone;
              }
              var dict = {
                'inputText': _inputText,
              };
              Navigator.of(context).pop(dict);
            },
          ),
        ],
      ),
    );
  }

//  _addSubViews(){
//
//  }
}
