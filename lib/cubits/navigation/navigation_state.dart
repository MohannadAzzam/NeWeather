part of 'navigation_cubit.dart';

sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}

final class NavigationChanged extends NavigationState {
  int index = 0;
  NavigationChanged(this.index);
}
