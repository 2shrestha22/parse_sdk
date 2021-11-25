import 'parse_client.dart';

abstract class Service {
  const Service(this.client);
  final ParseClient client;
}
