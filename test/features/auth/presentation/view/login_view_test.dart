import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/features/auth/presentation/view/login_view.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/login/login_bloc.dart';

import 'login.mock.dart'; // Ensure this file exists with MockLoginBloc

void main() {
  late MockLoginBloc mockLoginBloc;

  setUp(() {
    mockLoginBloc = MockLoginBloc();
  });

  Widget createTestWidget() {
    return BlocProvider<LoginBloc>.value(
      value: mockLoginBloc,
      child: MaterialApp(
        home: LoginView(),
      ),
    );
  }

 testWidgets('Should have a title in Login Screen', (WidgetTester tester) async {
  await tester.pumpWidget(createTestWidget());

  // Print all text widgets again (for debugging)
  final textWidgets = find.byType(Text);
  for (var widget in tester.widgetList(textWidgets)) {
    debugPrint('Found text: ${(widget as Text).data}');
  }

  // Update the expected title based on actual UI
  Finder titleFinder = find.text('Login'); // Change this to match your UI

  // Check if the title exists
  expect(titleFinder, findsOneWidget);
});



  testWidgets('Should find email and password text fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Find the email text field by key
    Finder emailField = find.byKey(const ValueKey('email'));
    expect(emailField, findsOneWidget);

    // Find the password text field by key
    Finder passwordField = find.byKey(const ValueKey('password'));
    expect(passwordField, findsOneWidget);
  });

  testWidgets('Should find login and register buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle(); // Ensure UI is fully rendered

    // Debugging output to check widget tree
    debugPrint('Widgets in tree:');
    for (var widget in tester.allWidgets) {
      debugPrint(widget.toString());
    }

    // Find the Login button
    Finder loginButton = find.widgetWithText(ElevatedButton, 'Login');
    expect(loginButton, findsOneWidget, reason: 'Login button is missing!');

    // Find the Register button using text search
    Finder registerButton = find.text("Don't have an account? Sign Up");
    expect(registerButton, findsOneWidget,
        reason: 'Register button is missing!');
  });




}
