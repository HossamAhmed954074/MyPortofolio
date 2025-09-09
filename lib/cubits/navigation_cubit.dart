import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial());

  void navigateToSection(int index) {
    emit(NavigationChanged(index));
  }

  void resetNavigation() {
    emit(const NavigationInitial());
  }
}
