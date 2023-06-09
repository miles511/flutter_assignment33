class ProductFile{
  String product;
  final double amount;
  int quantity;
  late double total;

  ProductFile({
    required this.product,
    required this.amount,
    required this.quantity,
});

  // double calculateAmount() {
  //   total = (quantity * amount);
  //   return total;
  // }

}