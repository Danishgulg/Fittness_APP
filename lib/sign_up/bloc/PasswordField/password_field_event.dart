part of 'password_field_bloc.dart';

@immutable
sealed class PasswordFieldEvent {
  const PasswordFieldEvent();
}

@immutable 
class PassWordVisibilityEvent extends PasswordFieldEvent{
  const PassWordVisibilityEvent(this.isVisible);
  final bool isVisible;
}
