import 'package:news_app_c12_online_sat/domain/etities/source_entitiy.dart';
import 'package:news_app_c12_online_sat/result.dart';

abstract class SourcesRepository {
  Future<Result<List<SourceEntity>>> getSources(String categoryId);
}
