import 'package:quiver/core.dart';

export 'param_to_do.dart';
export 'response_general.dart';
export 'response_list_to_do.dart';
export 'response_to_do.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
