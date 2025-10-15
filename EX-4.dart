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
  String toString() => 'Item ID: $_itemId, \nName: $_name, \nPrice: \$$_price\n';

}

class Order {
  final int _orderId;
  final String _customerName;
  final int _amount;
  final Item _items;
  final Status _status;

  int get orderId => _orderId;
  String get customerName => _customerName;
  Item get items => _items;
  int get amount => _amount;
  Status get status => _status;

  Order(
    this._orderId, 
    this._customerName,
    this._items, 
    this._amount,
    this._status
  );

  double computeTotalAmount() {
    double totalAmount = _amount * items._price;
    if(_status == Status.DELIVERY) {
      totalAmount += 2; // Delivery fee
    }
    return totalAmount;
  }

  @override
  String toString() {
    return "Order ID: $orderId \nCustomer: $customerName \nItem: ${items.name} \nAmount: $_amount \nStatus: ${_status.name} \nTotal Price: \$${computeTotalAmount()}\n";
  }
}

void main() {
  Item items = Item(1, "Laptop", 100);
  Order myOrder = Order(1, "Navid", items, 1, Status.DELIVERY);
  print(items);
  print(myOrder);
}