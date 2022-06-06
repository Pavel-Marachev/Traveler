import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:traveler/business_logic/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:traveler/main.dart';

void main() {
  group('authorization enter test', () {
    testWidgets('Email enter test', (tester) async {
      await tester.pumpWidget(MyApp());
      await tester.tap(find.byTooltip('Log out'));
      await tester.pump();
      expect(find.text('Login'), findsOneWidget);
      // var txtForm = await find.byKey(Key('emailKey'));
      // print(txtForm);
      //await tester.enterText(txtForm, 'df@s');
    });
  });

  group('NavigationBloc', () {
    late NavigationBloc navigationBloc;

    setUp(() {
      navigationBloc = NavigationBloc();
    });

    test('initial state is StateHomePage', () {
      expect(navigationBloc.state, StateHomePage());
    });

    testWidgets('tab bar buttons tap-test', (tester) async {
      await tester.pumpWidget(const MyApp());
      tester.tap(find.textContaining("Места"));
      tester.tap(find.textContaining("Главная"));
      tester.tap(find.textContaining("Планирование"));
    });

    blocTest(
      "tap on tab 'places'",
      build: () => navigationBloc,
      act: (NavigationBloc bloc) => bloc.add(PressedOnPlacesListPage()),
      expect: () => [StatePlacesListPage()],
    );

    blocTest(
      "tap on tab 'main page'",
      build: () => navigationBloc,
      act: (NavigationBloc bloc) => bloc.add(PressedOnHomePage()),
      expect: () => [StateHomePage()],
    );

    blocTest(
      "tap on tab 'planning'",
      build: () => navigationBloc,
      act: (NavigationBloc bloc) => bloc.add(PressedOnAddRoutePage()),
      expect: () => [StateAddRoutePage()],
    );

    tearDown(() {
      navigationBloc.close();
    });
  });
}
