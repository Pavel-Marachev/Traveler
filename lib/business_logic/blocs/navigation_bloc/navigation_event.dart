part of 'package:traveler/business_logic/blocs/navigation_bloc/navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class AppStarted extends NavigationEvent {}

class PressedOnHomePage extends NavigationEvent {}

class PressedOnPlacesListPage extends NavigationEvent {}

class PressedOnAddRoutePage extends NavigationEvent {}