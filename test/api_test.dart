import 'package:happycamper/happycamper.dart';

Future<void> main() async {
  print("A");
  HappyCamper hc = HappyCamper();
  print("B");
  await hc.initialize();
  print("C");
  print(await hc.getTags("rock"));
}
