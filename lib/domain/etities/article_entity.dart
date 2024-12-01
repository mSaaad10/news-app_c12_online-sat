import 'package:news_app_c12_online_sat/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sat/domain/etities/source_entitiy.dart';

class ArticleEntity {
  final SourceEntity? source;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity(
      {this.source,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
}
