import 'package:mvvm_architecture/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.complete() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "status : ${status} \n data : ${data} \n message :${message}";
  }
}
