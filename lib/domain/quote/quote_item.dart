class QuoteItem {
  String item;
  String quantity;

  QuoteItem(
    this.item,
    this.quantity,
  );

  factory QuoteItem.empty() {
    return QuoteItem('', '');
  }
}
