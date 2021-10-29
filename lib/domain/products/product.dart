class Product {
  final String id;
  final String image;
  final String title;
  final double price;
  final int stock;


  Product(this.id, this.image, this.title, this.price, this.stock);

  // factory Product.fromJson(Map<String, dynamic> parsedJson) {
  //   return new Product(
  //       name: parsedJson['name'],
  //       age: parsedJson['age'] ?? "");
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": this.id,
  //     "image": this.image,
  //     "title": this.title,
  //
  //   };
  // }
}
