import 'package:flutter/material.dart';
import 'widgets/sing_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // визначаємо тему для додатку
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity, // адаптація щільності

        // Стиль для полів вводу
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color.fromRGBO(236, 236, 236, 1),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12), // Підлаштування відступів
        ),

        // Стиль для кнопки
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            backgroundColor: Colors.blue[900], // Колір фону кнопки
          ),
        ),

        // Стиль для тексту заголовків та інших елементів
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
        ),

        // Загальний стиль для карток, контейнерів, контейнерів із відступами тощо
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      home: const SignInScreen(),
    );
  }
}
