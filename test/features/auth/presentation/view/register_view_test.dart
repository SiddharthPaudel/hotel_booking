import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view/register_view.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:hotel_booking/features/auth/presentation/view_model/signup/register_state.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState> implements RegisterBloc {}

void main() {
  late MockRegisterBloc mockRegisterBloc;

  setUp(() {
    mockRegisterBloc = MockRegisterBloc();
    when(() => mockRegisterBloc.state).thenReturn(RegisterState(
      isLoading: false,
      isImageLoading: false,
      isImageSuccess: false,
      isSuccess: false,
      imageName: null,
    ));
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: BlocProvider<RegisterBloc>.value(
        value: mockRegisterBloc,
        child: const RegisterView(),
      ),
    );
  }

    testWidgets('Should render RegisterView correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle(); // Ensures full rendering

 // Ensure text matches exactly
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });

 
  testWidgets('Should navigate to login when "Already have an account? Login" is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.text('Already have an account? Login'));
    await tester.pumpAndSettle();

    expect(find.byType(RegisterView), findsNothing);
  });
}
