class ApiResponse<T> {
  ApiResponseStatus status = ApiResponseStatus.none;
  T? data;
  String? message;

  ApiResponse.none() : status = ApiResponseStatus.none;
  ApiResponse.loading() : status = ApiResponseStatus.loading;
  ApiResponse.sucess(this.data) : status = ApiResponseStatus.success;
  ApiResponse.error(this.message) : status = ApiResponseStatus.error;

  bool get isNone => status == ApiResponseStatus.none;
  bool get isLoading => status == ApiResponseStatus.loading;
  bool get isSuccess => status == ApiResponseStatus.success;
  bool get isError => status == ApiResponseStatus.error;
}

enum ApiResponseStatus { none, loading, success, error }
