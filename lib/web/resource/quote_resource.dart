import 'dart:convert';

import 'package:foli_client_mobile/web/resource/customer_resource.dart';
import 'package:foli_client_mobile/web/resource/quote_item_resource.dart';

class QuoteResource {
  String projectName;
  CustomerResource customer;
  List<QuoteItemResource> quoteItems = [];

  QuoteResource(
    this.quoteItems, {
    required this.projectName,
    required this.customer,
  });

  String getProjectName() {
    return projectName;
  }

  void setProjectName(String projectName) {
    this.projectName = projectName;
  }

  CustomerResource getCustomer() {
    return customer;
  }

  void setCustomer(CustomerResource customer) {
    this.customer = customer;
  }

  List<QuoteItemResource> getQuoteItems() {
    return quoteItems;
  }

  void setQuoteItems(List<QuoteItemResource> quoteItems) {
    this.quoteItems = quoteItems;
  }

  Map<String, dynamic> toMap() {
    return {
      'projectName': projectName,
      'customer': customer.toMap(),
      'quoteItems': List<dynamic>.from(quoteItems.map((e) => e.toMap())),
    };
  }

  factory QuoteResource.fromMap(Map<String, dynamic> map) {
    return QuoteResource(
      List<QuoteItemResource>.from(
          map['quoteItems'].map((e) => QuoteItemResource.fromMap(e))),
      projectName: map['projectName'],
      customer: CustomerResource.fromMap(map['customer']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuoteResource.fromJson(String source) =>
      QuoteResource.fromMap(json.decode(source));
}
