part of 'register_bloc.dart';

class RegisterState {
  final bool isLoading;
  final bool isSuccess;
  final String? imageName;

  RegisterState(
      {required this.isLoading, required this.isSuccess, this.imageName});

  RegisterState.initial()
      : isLoading = false,
        imageName = '',
        isSuccess = false;

  RegisterState copyWith(
      {bool? isLoading, bool? isSuccess, final String? imageName}) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      imageName: imageName ?? this.imageName,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
