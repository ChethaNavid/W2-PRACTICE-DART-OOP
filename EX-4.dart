enum Method { DELIVERY, PICKUP }

class Order {
  final String _productName;
  final int _amount;
  final double _price;
  final List<Method> _methods;

  String get getProductName => _productName;
  int get getAmount => _amount;
  List<Method> get getMethod => _methods;
  double get getPrice => _price;

  Order(this._productName, this._amount, this._price, this._methods);

  double computeTotalAmount() {
    double totalAmount = _amount * _price;
    if(getMethod.contains(Method.DELIVERY)) {
      totalAmount += 2;
    }
    return totalAmount;
  }

  @override
  String toString() {
    return "Product Name: $getProductName \nAmount: $getAmount \nPrice per unit: \$$getPrice \nMethod: ${_methods.map((m) => m.name).join(", ")} \nTotal Price: \$${computeTotalAmount()}\n";
  }
}

void main() {
  Order myOrder = Order("Beef", 3, 5, [Method.DELIVERY]);
  print(myOrder);
}