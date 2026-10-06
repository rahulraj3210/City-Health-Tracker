import '../models/models.dart';

/// Data source for the city's blocks and houses. The cubit depends on this
/// interface only, so the backend can be swapped or mocked in tests.
abstract interface class CityHealthService {
  /// Live stream of every block with its houses attached. Emits again
  /// whenever any block or house changes.
  ///
  /// Errors are surfaced as [CityHealthServiceException].
  Stream<List<CityBlock>> watchCity();

  /// Replaces one house's [status]; the server stamps `updatedAt`. The change
  /// also arrives through [watchCity], so callers need not refresh.
  ///
  /// Throws [CityHealthServiceException] on failure.
  Future<void> updateHouseStatus({
    required String blockId,
    required String houseId,
    required HealthStatus status,
  });
}

class CityHealthServiceException implements Exception {
  const CityHealthServiceException(this.message, {this.cause});

  /// User-presentable description of what went wrong.
  final String message;
  final Object? cause;

  @override
  String toString() => 'CityHealthServiceException: $message';
}
