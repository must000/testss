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
    bool statusRedEys = true;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyConstant.lightgreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "username : admin",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "password : password123",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *0.1
              ),
           
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                height: 350,
                margin: EdgeInsets.symmetric(horizontal: size * 0.1),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                         const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30),
                ),
              ),
                      TextFormField(
                        controller: usernameController,
                        decoration:
                            const InputDecoration(label: Text("Username")),
                      ),
                      TextFormField(
                        controller: passwordController,  obscureText: statusRedEys,
                        decoration:
                          InputDecoration(label: Text("Password"),suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEys = !statusRedEys;
                    });
                  },
                  icon: statusRedEys
                      ? const Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            Service().login(usernameController.text,
                                passwordController.text, context);
                          },
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                            primary: MyConstant.lightgreen,
                          ),
                        ),
                      ),
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
      ),
    );
  }
}
