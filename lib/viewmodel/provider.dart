import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_rudy/pages/homepage.dart';

class MyProvider with ChangeNotifier {
  List<String> nameCustomer = ["consumer 1", "consumer 2", "consumer 3"];

  addCustomer(String name) {
    nameCustomer.add(name);
    notifyListeners();
  }

  changeCustomer(int index, BuildContext context) {
    TextEditingController text = TextEditingController();
    text.text = nameCustomer[index];
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          title: TextFormField(
            controller: text,
          ),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("cancel"),
              ),
              TextButton(
                onPressed: () {
                  nameCustomer[index] = text.text;
                  notifyListeners();
                  Navigator.pop(context);
                },
                child: const Text("confirm"),
              ),
            ],
          )
        ],
      ),
    );
  }

  deleteCustomer(int index) {
    nameCustomer.removeAt(index);
    notifyListeners();
  }

  clearCustomer(){
    nameCustomer.clear();
    notifyListeners();
  
  }
}
