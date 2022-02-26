abstract class Result<T> {
  factory r
}

class Success<T> implements Result<T> {
  final T data;
  Success(this.data);
}

class Error<T> implements Result<T> {
  final String message;
  Error(this.message);
}
