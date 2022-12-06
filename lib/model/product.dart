class Product {
  final String id;
  final String title;
  final String description;
  final int price;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });
}

final List<Product> productList = [
  Product(
      id: '1', title: 'Office Table', description: "description", price: 12000),
  Product(
      id: '2',
      title: 'Wireless Headphone',
      description: "description",
      price: 1000),
  Product(
      id: '3', title: 'Leather Wallet', description: "description", price: 800),
  Product(
      id: '4', title: 'Gemei Trimmer', description: "description", price: 1400),
  Product(
      id: '5', title: 'Digital Watch', description: "description", price: 3000),
];
