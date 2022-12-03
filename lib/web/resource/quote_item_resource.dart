import 'dart:convert';

class QuoteItemResource {
  String item;
  String quantity;

  QuoteItemResource({
    required this.item,
    required this.quantity,
  });

  String getItem() {
    return item;
  }

  void setItem(String item) {
    this.item = item;
  }

  Map<String, dynamic> toMap() {
    return {
      'item': item,
      'quantity': quantity,
    };
  }

  factory QuoteItemResource.fromMap(Map<String, dynamic> map) {
    return QuoteItemResource(
      item: map['item'] ?? '',
      quantity: map['quantity'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuoteItemResource.fromJson(String source) =>
      QuoteItemResource.fromMap(json.decode(source));

  factory QuoteItemResource.empty() {
    return QuoteItemResource(
      item: '',
      quantity: '',
    );
  }
}
