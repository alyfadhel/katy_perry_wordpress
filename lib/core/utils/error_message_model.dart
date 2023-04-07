import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable
{
  final bool status;
  final String message;
  final int code;

 const ErrorMessageModel({
   required this.status,
   required this.message,
   required this.code,
 });

  @override
  List<Object?> get props => [
    status,
    message,
    code,
  ];

}