import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test_rudy/thems/constant.dart';
import 'package:test_rudy/viewmodel/provider.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  TextEditingController customerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.darkgreen,
        actions: [
          IconButton(
            onPressed: () {
              provider.clearCustomer();
            },
            icon: Icon(Icons.clear, color: Colors.red),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          behavior: HitTestBehavior.opaque,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: customerController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                            color: MyConstant.darkgreen),
                      ),
                      label: Text("customer name")),
                ),
              ),
              Container(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      if (customerController.text.isNotEmpty) {
                        provider.addCustomer(customerController.text);
                        customerController.text = "";
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: MyConstant.pink),
                    child: Text("ADD",
                        style: TextStyle(
                          color: Colors.black,
                        ))),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => provider.changeCustomer(index, context),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(provider.nameCustomer[index]),
                      trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            provider.deleteCustomer(index);
                          }),
                    ),
                  ),
                ),
                itemCount: provider.nameCustomer.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
