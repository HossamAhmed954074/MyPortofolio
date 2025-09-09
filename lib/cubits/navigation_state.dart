part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial();
}

class NavigationChanged extends NavigationState {
  final int currentIndex;

  const NavigationChanged(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
