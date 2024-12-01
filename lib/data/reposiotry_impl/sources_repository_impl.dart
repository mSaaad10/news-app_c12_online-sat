import 'package:news_app_c12_online_sat/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sat/data/data_source_contract/sources_datasource.dart';
import 'package:news_app_c12_online_sat/domain/etities/source_entitiy.dart';
import 'package:news_app_c12_online_sat/domain/repository_contract/sources_repository.dart';
import 'package:news_app_c12_online_sat/result.dart';

class SourcesRepositoryImpl extends SourcesRepository {
  SourcesDataSource dataSource;

  SourcesRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<SourceEntity>>> getSources(String categoryId) async {
    var result = await dataSource.getSources(categoryId);
    switch (result) {
      case Success<List<Source>>():
        {
          return Success(
              data: result.data
                  .map((source) => source.toSourceEntity())
                  .toList());
        }
      // TODO: Handle this case.
      case ServerError<List<Source>>():
        {
          return ServerError(code: result.code, message: result.message);
        }
      case Error<List<Source>>():
        {
          return Error(exception: result.exception);
        }
    }
  }
}
