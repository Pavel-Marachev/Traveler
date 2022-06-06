import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'package:traveler/business_logic/blocs/navigation_bloc/navigation_event.dart';
part 'package:traveler/business_logic/blocs/navigation_bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(StateHomePage()) {
    on<AppStarted>((event, emit) => emit(StateHomePage()));
    on<PressedOnHomePage>((event, emit) => emit(StateHomePage()));
    on<PressedOnPlacesListPage>((event, emit) => emit(StatePlacesListPage()));
    on<PressedOnAddRoutePage>((event, emit) => emit(StateAddRoutePage()));
  }
}
