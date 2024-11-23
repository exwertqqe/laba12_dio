import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Dio _dio = Dio();

  // Валідація для введеного email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  Future<void> _resetPassword() async {
    const url = 'https://laba12dio.requestcatcher.com/resetpass'; // Заміни на свій API endpoint
    try {
      final response = await _dio.post(
        url,
        data: {
          'email': _emailController.text,
        },
      );

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return const AlertDialog(
              title: Text('Message'),
              content: Text("Reset password link has been sent to your email!"),
            );
          },
        );
      } else {
        _showErrorDialog('Password reset failed: ${response.statusCode}');
      }
    } catch (e) {
      _showErrorDialog('An error occurred: $e');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Логотип
                  Center(
                    child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                      width: 250,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Поле для введення логіна або електронної пошти з валідацією
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Username or Email',
                    ),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 24.0),

                  // Кнопка для запуску процедури відновлення паролю
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _resetPassword(); // викликаємо метод для відправки даних
                        }
                      },
                      child: const Text(
                        'Reset Password',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Кнопка для повернення на екран авторизації (з такою ж темою)
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900], // Такий самий колір фону, як у кнопки "Reset Password"
                      ),
                      child: const Text(
                        'Back to Sign In',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
