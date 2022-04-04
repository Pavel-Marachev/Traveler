part of 'package:traveler/business_logic/blocs/navigation_bloc/navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class StateHomePage extends NavigationState {}

class StatePlacesListPage extends NavigationState {}

class StateAddRoutePage extends NavigationState {}
