import 'models/product.dart';
import 'models/product_cart.dart';

List<Product> product = [
  new Product(
      'Bag', 'assets/images/products/bag1.jpeg', 150, 10, 0, 8, 'Bag store'),
  new Product('HandMade', 'assets/images/products/bag2.jpeg', 150, 10, 1, 8,
      'Bag store'),
  new Product('HandMade dress', 'assets/images/products/dress1.jpeg', 150, 10,
      2, 8, 'Dressing store'),
  new Product('Red dress', 'assets/images/products/dress2.jpeg', 150, 10, 3, 8,
      'Dressing store'),
  new Product('Ring', 'assets/images/products/accessory1.jpeg', 150, 10, 4, 8,
      'Valleria store'),
  new Product('Ring', 'assets/images/products/accessory2.jpeg', 150, 10, 5, 8,
      'Valleria store'),
];

List<ProductCart> productOnCart = [
  new ProductCart('Bag', 'assets/images/products/bag1.jpeg', 'xxx', 10, 0,
      'black', 'Bag store'),
  new ProductCart('HandMade dress', 'assets/images/products/dress1.jpeg', 'x',
      10, 2, 'red', 'Dressing store'),
  new ProductCart('Ring', 'assets/images/products/accessory1.jpeg', 'M', 10, 4,
      'white', 'Valleria store')
];
