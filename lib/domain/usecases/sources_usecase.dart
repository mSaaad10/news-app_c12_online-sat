import 'package:news_app_c12_online_sat/domain/etities/source_entitiy.dart';
import 'package:news_app_c12_online_sat/domain/repository_contract/sources_repository.dart';
import 'package:news_app_c12_online_sat/result.dart';

class GetSourcesUseCase {
  SourcesRepository repository;

  GetSourcesUseCase({required this.repository});

  Future<Result<List<SourceEntity>>> execute(String categoryId) {
    return repository.getSources(categoryId);
  }
}
