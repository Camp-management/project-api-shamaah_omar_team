// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_input.dart';

class AuthInputMapper extends ClassMapperBase<AuthInput> {
  AuthInputMapper._();

  static AuthInputMapper? _instance;
  static AuthInputMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthInputMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AuthInput';

  static String _$email(AuthInput v) => v.email;
  static const Field<AuthInput, String> _f$email = Field('email', _$email);
  static String _$password(AuthInput v) => v.password;
  static const Field<AuthInput, String> _f$password = Field(
    'password',
    _$password,
  );

  @override
  final MappableFields<AuthInput> fields = const {
    #email: _f$email,
    #password: _f$password,
  };

  static AuthInput _instantiate(DecodingData data) {
    return AuthInput(
      email: data.dec(_f$email),
      password: data.dec(_f$password),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AuthInput fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthInput>(map);
  }

  static AuthInput fromJson(String json) {
    return ensureInitialized().decodeJson<AuthInput>(json);
  }
}

mixin AuthInputMappable {
  String toJson() {
    return AuthInputMapper.ensureInitialized().encodeJson<AuthInput>(
      this as AuthInput,
    );
  }

  Map<String, dynamic> toMap() {
    return AuthInputMapper.ensureInitialized().encodeMap<AuthInput>(
      this as AuthInput,
    );
  }

  AuthInputCopyWith<AuthInput, AuthInput, AuthInput> get copyWith =>
      _AuthInputCopyWithImpl<AuthInput, AuthInput>(
        this as AuthInput,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AuthInputMapper.ensureInitialized().stringifyValue(
      this as AuthInput,
    );
  }

  @override
  bool operator ==(Object other) {
    return AuthInputMapper.ensureInitialized().equalsValue(
      this as AuthInput,
      other,
    );
  }

  @override
  int get hashCode {
    return AuthInputMapper.ensureInitialized().hashValue(this as AuthInput);
  }
}

extension AuthInputValueCopy<$R, $Out> on ObjectCopyWith<$R, AuthInput, $Out> {
  AuthInputCopyWith<$R, AuthInput, $Out> get $asAuthInput =>
      $base.as((v, t, t2) => _AuthInputCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthInputCopyWith<$R, $In extends AuthInput, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? email, String? password});
  AuthInputCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthInputCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthInput, $Out>
    implements AuthInputCopyWith<$R, AuthInput, $Out> {
  _AuthInputCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthInput> $mapper =
      AuthInputMapper.ensureInitialized();
  @override
  $R call({String? email, String? password}) => $apply(
    FieldCopyWithData({
      if (email != null) #email: email,
      if (password != null) #password: password,
    }),
  );
  @override
  AuthInput $make(CopyWithData data) => AuthInput(
    email: data.get(#email, or: $value.email),
    password: data.get(#password, or: $value.password),
  );

  @override
  AuthInputCopyWith<$R2, AuthInput, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthInputCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

