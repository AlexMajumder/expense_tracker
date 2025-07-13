import '../models/network_response.dart';

abstract class ErrorMapper {
  NetworkResponse mapError(Exception e);
}
