enum Status { DELIVERY, PICKUP }

class Item {
  final int _itemId;
  final String _name;
  final double _price;

  Item(this._itemId, this._name, this._price);

  int get itemId => _itemId;
  String get name => _name;
  double get price => _price;

  @override
  String toString() => 'Name: $_name, \nPrice: \$$_price\n';

}

class Order {
  final int _orderId;
  final String _customerName;
  final List<int> _quatities;
  final List<Item> _items;
  final Status _status;

  int get orderId => _orderId;
  String get customerName => _customerName;
  List<Item> get items => _items;
  Status get status => _status;

  Order(
    this._orderId, 
    this._customerName,
    this._items, 
    this._quatities,
    this._status
  );

  double computeTotalAmount() {
    double totalAmount = 0;
    for(int i = 0; i < _items.length; i++) {
      totalAmount += _quatities[i] * _items[i].price;
    }
    if(_status == Status.DELIVERY) {
      totalAmount += 2; // Delivery fee
    }
    return totalAmount;
  }

  @override
  String toString() {
    final itemDetails = List.generate(
      _items.length,
      (i) => '${_items[i].name} x${_quatities[i]} (\$${_items[i].price})',
    ).join(', ');
    return "Order ID: $orderId \nCustomer: $customerName \nItem: $itemDetails \nStatus: ${_status.name} \nTotal Price: \$${computeTotalAmount()}\n";
  }
}

void main() {
  Item laptop = Item(1, "Laptop", 100);
  Item mouse = Item(2, "Mouse", 30);
  Order myOrder = Order(1, "Navid", [laptop, mouse], [1, 2], Status.DELIVERY);
  print(myOrder);
}