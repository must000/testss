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
        backgroundColor: MyConstant.darkorange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: customerController,
              decoration: const InputDecoration(label: Text("customer name")),
            ),
            ElevatedButton(
                onPressed: () {
                  if (customerController.text.isNotEmpty) {
                    provider.addCustomer(customerController.text);
                    customerController.text = "";
                  }
                },
                style: ElevatedButton.styleFrom(primary: MyConstant.orange),
                child: const Text("add")),
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
    );
  }
}
