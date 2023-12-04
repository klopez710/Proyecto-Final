import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/shared/routes.dart';
import 'package:movieapp/widgets/format_box.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LOGIN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: CachedNetworkImage(
                      placeholder: (context, url) {
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorWidget: (context, url, error) {
                        return const Icon(
                          Icons.no_photography,
                          color: Colors.red,
                          size: 100,
                        );
                      },
                      width: 120,
                      imageUrl: "https://fakestoreapi.com/icons/logo.png"),
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        TextFieldForm(
                          controller: mailController,
                          icon: Icons.mail,
                          label: "Ingrese su usuario",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ingrese un correo valido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldForm(
                          controller: passwordController,
                          icon: Icons.password,
                          label: "Ingrese su contraseña",
                          passwordText: true,
                          viewButton: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Contraseña invalida';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    login(context);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.purple[400],
                      minimumSize: const Size(200, 50)),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    //* Crear ScaffoldMessenger y navigator para evitar usar el BuildContext dentro del proceso asíncrono -Gevawer
    final scaffold = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    //* Validación del formulario
    if (formKey.currentState!.validate()) {
      //* Creación de mapa usuario
      final Map<String, dynamic> user = {
        'username': mailController.text,
        'password': passwordController.text,
      };
      //* Creación de la respuesta de la API por método post
      final response = await http.post(
        Uri.parse('https://fakestoreapi.com/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user),
      );
      //* Comprobamos el estado de la respuesta
      if (response.statusCode == 200) {
        //* Éxito en la solicitud
        final responseData = jsonDecode(response.body);
        await box.write('token', responseData['token']);
        navigator.pushNamed(Routes.home.name);
      } else {
        //* Error en la solicitud
        scaffold.showSnackBar(
          const SnackBar(
            content: Text("Credenciales no válidas"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
