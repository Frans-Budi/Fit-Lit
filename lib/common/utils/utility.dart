import 'dart:developer' as developer;
import 'dart:ui';

void cprint(dynamic data, {String? errorIn, String? event, String? warningIn}) {
  if (errorIn != null) {
    developer.log('[Error]', time: DateTime.now(), error: data, name: errorIn);
  } else if (data != null) {
    developer.log(
      data.toString(),
      time: DateTime.now(),
      name: warningIn ?? '',
    );
  }
}

Color hexToColor(String hex) {
  hex = hex.replaceAll("#", "");
  return Color(int.parse("0xFF$hex"));
}
