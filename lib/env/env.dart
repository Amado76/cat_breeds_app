import 'package:envied/envied.dart';

part 'env.g.dart';

// Es necessario utilizar el comando dart run build_runner build para generar el archivo env.g.dart
@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: 'THE_CAT_API_KEY', obfuscate: true)
  static final String theCatApiKey = _Env.theCatApiKey;
}
