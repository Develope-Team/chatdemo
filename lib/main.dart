import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(ChatDemo());
}

class ChatDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(
        title: 'Chat Demo',
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var text = 'This is Chat Demo';

  // Login
  void login(List<String> arguments) async {
    var url = 'https://dungweb.site/api/v1/login';

    //https://www.tutorialspoint.com/dart_programming/dart_programming_map.htm
    var body = {'username': 'test_01', 'password': '1'};
    // var body = new Map();
    // body['username'] = 'test_01';
    // body['test_01'] = '1';

    var resp = await http.post(url, body: body);
    if (resp.statusCode == HttpStatus.ok /*200*/) {
      var jsonResp = convert.jsonDecode(resp.body);
      print('Login Success!\n $jsonResp');
      setState(() {
        text = 'Welcome! Let try your app';
      });
    } else {
      print('Login request failed: (${resp.statusCode}) - ${resp.body}');
      setState(() {
        text = 'Login Failed :(((';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            SizedBox(
              height: 20,
            ),
            OutlineButton(
              onPressed: () {
                print('Logging in....');
                login(null);
              },
              child: Text('LOGIN'),
              color: Colors.blue,
              textColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
