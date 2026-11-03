import 'package:jaspr/client.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.client.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultClientOptions);

  // Pages stay server-rendered; hydrate only components marked with @client.
  runApp(const ClientApp());
}
