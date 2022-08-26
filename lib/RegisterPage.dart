import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ApiCall.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final key1 = GlobalKey<FormState>();
  TextEditingController econ = TextEditingController();
  TextEditingController pcon = TextEditingController();
  RegisterUser reg1 = Get.put(RegisterUser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Register Page"),
      ),
      body: Form(
        key: key1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: econ,
              toolbarOptions:
              ToolbarOptions(copy: true, cut: true, paste: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Email",
              ),
              validator: (value) {
                if (!RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value!)) {
                  return 'Enter Valid Email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: pcon,
              toolbarOptions:
                  ToolbarOptions(copy: true, cut: true, paste: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Email",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Valid Password';
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (key1.currentState!.validate()) {
                    reg1.GetLogin(econ.text.toString(), pcon.text.toString());
                  }
                },
                child: Text('Register'))
          ],
        ),
      ),
    );
  }
}
