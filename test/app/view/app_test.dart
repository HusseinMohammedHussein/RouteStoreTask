import 'package:flutter_test/flutter_test.dart';
import 'package:route_store_task/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const ProductsProductsApp());
    });
  });
}
