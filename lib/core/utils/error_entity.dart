import 'package:equatable/equatable.dart';

class ErrorEntity extends Equatable {
  final int? code;
  final String? message;
  final dynamic error;

  const ErrorEntity({this.code, this.message, this.error});

  @override
  List<Object?> get props => [code, message, error];

  String get getMsg => message ?? error?.toString() ?? '';
}
