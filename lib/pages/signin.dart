import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S'authentifier"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Image.asset("assets/images/minecraft.jpg",
                  width: 460, height: 215),
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
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Mot de passe",
                ),
                onSaved: (String? value) {
                  _password = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Le mot de passe ne doit pas être vide";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Here you can handle login logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Authentification réussie")),
                    );
                  }
                },
                child: const Text("S'authentifier"),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: const Text("Créer un compte"),
                onPressed: () {
                  // navigate to signup if needed
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Mot de passe oublié ?"),
                  SizedBox(width: 10),
                  Text("Cliquez ici", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
