import 'package:my_thai_star_flutter/models/order.dart';
import 'package:my_thai_star_flutter/repositories/exchange_point.dart';

///Defines a mock [OrderService], that's meant for testing
class MockOrderService extends Service<Order, int> {
  static const int _dummyNumber = 404;

  ///Will always return a fixes booking id, no matter the input
  @override
  Future<int> post(Order input) async => _dummyNumber;
}
