import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';
import 'package:flutter/services.dart';


var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(200, 170, 213, 216)
  );

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor:const Color.fromARGB(199, 131, 0, 253),
);

void main() {

// SystemChrome.setPreferredOrientations([
//   DeviceOrientation.portraitUp,
// ]).then((fn) {
  runApp(
     MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.background,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 18
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            color: kDarkColorScheme.onSecondaryContainer,
            fontSize: 16
          ),
          titleSmall: TextStyle(
          fontWeight: FontWeight.normal,
          color: kDarkColorScheme.onSecondaryContainer,
          fontSize: 14
          ),
        )
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: const Color.fromARGB(200, 170, 213, 216),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onTertiary,
          foregroundColor: kColorScheme.onPrimaryContainer,
          elevation: 10.0
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.background,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 18
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16
          ),
          titleSmall: TextStyle(
          fontWeight: FontWeight.normal,
          color: kColorScheme.onSecondaryContainer,
          fontSize: 14
          ),
        )
      ),
      home: const Expenses(),
    )
  );
}
// );


