part of 'package:traveler/business_logic/blocs/navigation_bloc/navigation_bloc.dart';

@immutable
abstract class NavigationState with EquatableMixin {}

class StateHomePage extends NavigationState {
  @override
  List<Object?> get props => [];
}

class StatePlacesListPage extends NavigationState {
  @override
  List<Object?> get props => [];
}

class StateAddRoutePage extends NavigationState {
  @override
  List<Object?> get props => [];
}
