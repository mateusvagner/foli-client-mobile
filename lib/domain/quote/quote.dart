import 'package:foli_client_mobile/domain/quote/quote_item.dart';

class Quote {
  String projectName;
  String client;
  List<QuoteItem> quoteItems;

  Quote(this.quoteItems, {required this.projectName, required this.client});
}
