import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Réinitialiser le mot de passe",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Image.asset(
                "assets/images/minecraft.jpg",
                width: 460,
                height: 215,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
                onSaved: (String? value) {
                  _username = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Le username ne doit pas être vide";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Réinitialiser le mot de passe"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    String message =
                        "Un email de réinitialisation a été envoyé à $_username@gmail.com";

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Réinitialisation du mot de passe"),
                          content: Text(message),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
