import 'package:dio/dio.dart';

import 'package:foli_client_mobile/web/resource/quote_resource.dart';
import 'package:foli_client_mobile/web/service/quote_service.dart';

class DioQuoteService implements QuoteService {
  final Dio _dio;

  DioQuoteService(this._dio);

  @override
  Future<List<QuoteResource>> getAllQuotes() async {
    try {
      var response = await _dio.get(
        '/quote/all',
        options: Options(headers: {"requiresAuthorization": true}),
      );

      return (response.data as List)
          .map((e) => QuoteResource.fromMap(e))
          .toList();
    } catch (e) {
      return List.empty();
    }
  }

  @override
  Future<QuoteResource?> postNewQuote(QuoteResource quoteResource) async {
    try {
      var response = await _dio.post(
        '/quote/new',
        data: quoteResource.toMap(),
        options: Options(headers: {"requiresAuthorization": true}),
      );

      return QuoteResource.fromMap(response.data);
    } catch (e) {
      // TODO implement error handling
      return null;
    }
  }
}
