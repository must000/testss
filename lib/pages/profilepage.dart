import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_rudy/thems/constant.dart';

class ProfilePage extends StatefulWidget {
  String apiresponse;
  ProfilePage({Key? key, required this.apiresponse}) : super(key: key);

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState(apiresponse: apiresponse);
}

class _ProfilePageState extends State<ProfilePage> {
  String apiresponse;
  _ProfilePageState({required this.apiresponse});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyConstant.lightgreen,
        appBar: AppBar(
          backgroundColor: MyConstant.darkgreen,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80, bottom: 40),
                child: Center(
                  child: Icon(
                    Icons.account_circle,
                    size: 100,
                  ),
                ),
              ),
              Text(
                "token is $apiresponse",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ));
  }
}
