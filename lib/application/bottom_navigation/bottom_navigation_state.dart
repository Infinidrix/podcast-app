part of 'bottom_navigation_bloc.dart';

@immutable
abstract class BottomNavigationState {}

class InitialBottomNavigationState extends BottomNavigationState {}

class UserNavigationState extends BottomNavigationState {}

class CreatorNavigationState extends BottomNavigationState {}
