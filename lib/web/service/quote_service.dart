import 'package:foli_client_mobile/web/resource/quote_resource.dart';

abstract class QuoteService {

  Future<QuoteResource?> postNewQuote(QuoteResource quoteResource);

  Future<List<QuoteResource>> getAllQuotes();

}
