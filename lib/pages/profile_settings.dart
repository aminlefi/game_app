import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _currentPassword;
  String? _newPassword;
  String? _address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Paramètres du profil",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            // Image header
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Image.asset(
                "assets/images/minecraft.jpg",
                width: 460,
                height: 215,
              ),
            ),

            // Current password
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Mot de passe actuel",
                ),
                onSaved: (String? value) {
                  _currentPassword = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Le mot de passe ne doit pas être vide";
                  }
                  return null;
                },
              ),
            ),

            // New password
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nouveau mot de passe",
                ),
                onSaved: (String? value) {
                  _newPassword = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Le mot de passe ne doit pas être vide";
                  }
                  return null;
                },
              ),
            ),

            // Address
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Adresse de facturation",
                ),
                onSaved: (String? value) {
                  _address = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "L'adresse email ne doit pas être vide";
                  }
                  return null;
                },
              ),
            ),

            // Save button
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Enregistrer"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    String message =
                        "Mot de passe actuel: $_currentPassword\nNouveau mot de passe: $_newPassword\nAdresse: $_address";

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Informations enregistrées"),
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
