import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_rudy/pages/homepage.dart';

class Service {
  

  
  login(String username, String password, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),
      ),
    );
    Dio().post("https://restful-booker.herokuapp.com/auth",
        data: {"username": username, "password": password}).then((value) {
      if (value.data["token"] != null) {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                apiresponse: value.data["token"],
              ),
            ),
            (route) => false);
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: const ListTile(
              title: Text("Username, password is invalid.",
                  style: TextStyle(color: Colors.black)),
            ),
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ],
          ),
        );
      }
    });
  }
}
