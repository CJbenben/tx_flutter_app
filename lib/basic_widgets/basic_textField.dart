import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class BasicTextField extends StatefulWidget {
  const BasicTextField({Key key}) : super(key: key);
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<BasicTextField> {
  final myController = TextEditingController();
  String _errorText;
  bool isShow = true;

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  _isShowActionButton() {
    if (isShow) {
      return FloatingActionButton(
        child: new Text('button'),
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
              );
            },
          );
        },
      );
    } else {
      return new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 18),
        child: new Text(
          '按钮隐藏了',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      children: <Widget>[
        new TextField(
          controller: myController,
          maxLines: 1,
          style: TextStyle(
            fontSize: 15,
          ),
          // 是否获取焦点
          autofocus: true,
          decoration: InputDecoration(
//            labelText: '左上角',
            hintText: 'This is ios placeholder',
            errorText: _errorText,
          ),
          onSubmitted: (String text) {
            setState(() {
              if (!isEmail(text)) {
                _errorText = 'Error: This is not an email';
              } else {
                _errorText = null;
              }
            });
          },
        ),
        new Container(
          child: _isShowActionButton(),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new MaterialButton(
              color: Colors.greenAccent,
              child: new Text(
                'showWedget',
              ),
              onPressed: () {
                _showWedget();
              },
            ),
            new MaterialButton(
              color: Colors.greenAccent,
              child: new Text(
                'hiddenWedget',
              ),
              onPressed: () {
                _hiddenWedget();
              },
            ),
          ],
        ),
      ],
    );
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(emailRegexp);
    return regExp.hasMatch(em);
  }

  _showWedget() {
    Toast.show('show', context);
//    _isShow();
    setState(() {
      isShow = true;
    });
  }

  _hiddenWedget() {
    Toast.show('hidden', context);
//    _isShow();
    setState(() {
      isShow = false;
    });
  }
}
