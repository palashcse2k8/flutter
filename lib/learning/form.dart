import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        endDrawer: const Drawer(
          backgroundColor: Colors.blue,
          child: Text("endDrawer"),
        ),
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildName(),
              const SizedBox(height: 10,),
              buildButton()
            ],
          ),
        ));
  }

  Widget buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your first name.';
          }
        },

        // autofocus: true,
        controller: controller,
        decoration: const InputDecoration(
            // errorText: "error text",
            // prefixText: "+88 ",
            // suffixText: "suffix text",
            hintText: "Enter Your User Name",
            labelText: "User Name",
            helperText: "Enter Your User Name",
            counterText: "counter text",
            contentPadding: EdgeInsets.all(8),
            constraints: BoxConstraints(
              // maxWidth: 300,
              maxHeight: 100,
            ),
            icon: Icon(Icons.account_box),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)))),
        onChanged: (value) {
          debugPrint(value);
        },
      ),
    );
  }

  Widget buildButton() {
    return ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {}
          // text in form is valid
        },
        child: const Text("Submit"));
  }
}
