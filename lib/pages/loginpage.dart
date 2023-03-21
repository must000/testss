import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_rudy/service/login.dart';
import 'package:test_rudy/thems/constant.dart';
import 'package:test_rudy/viewmodel/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyConstant.orange,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("username : admin",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("password : password123",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                children: [
                      Text("Login",style: TextStyle(fontSize: 30),),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    height: 400,
                    margin: EdgeInsets.symmetric(horizontal: size * 0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: usernameController,
                            decoration:
                                const InputDecoration(label: Text("Username")),
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration:
                                const InputDecoration(label: Text("Password")),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Service().login(usernameController.text,
                                    passwordController.text, context);
                              },
                              child: const Text("Login")),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Forget Password"))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
