import 'package:flutter/material.dart';
import 'package:untitled4/services/auth_service.dart';
import 'package:toast/toast.dart';
import 'package:untitled4/services/snack_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPasswordVisible = true;
  AuthService authService = AuthService();
  var snackBar = const SnackBar(content: Text("Successful"), backgroundColor: Colors.green);

  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              size: 150,
              color: Colors.blueGrey,
              shadows: [
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 50,
                    spreadRadius: 5,
                    offset: Offset(20, 20))
              ],
            ),
            const SizedBox(height: 40),
            TextField(
              controller: emailController,
              cursorColor: Colors.teal,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "name@example.com",
                labelText: "Email",
                prefixIcon: const Icon(Icons.mail),
                suffixIcon: emailController.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                    onPressed: () {
                      emailController.clear();
                    },
                    icon: const Icon(Icons.clear)),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              cursorColor: Colors.teal,
              textInputAction: TextInputAction.done,
              obscureText: isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Ob@m_A%228",
                labelText: "password",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: passwordController.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                    onPressed: () =>
                        setState(
                                () => isPasswordVisible = !isPasswordVisible),
                    icon: isPasswordVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        await authService.registerWithEmailAndPassword(
                            emailController.text, passwordController.text);
                        await authService.currentUser.isEmpty ? showHappySnack(context, "Good") : showSadSnack(context, "Bad");

                        }
                    },
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))))
          ],
        ),
      ),
    );
  }
}
