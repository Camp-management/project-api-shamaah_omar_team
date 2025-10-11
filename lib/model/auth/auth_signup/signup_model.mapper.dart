// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'signup_model.dart';

class SignupModelMapper extends ClassMapperBase<SignupModel> {
  SignupModelMapper._();

  static SignupModelMapper? _instance;
  static SignupModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignupModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SignupModel';

  @override
  final MappableFields<SignupModel> fields = const {};

  static SignupModel _instantiate(DecodingData data) {
    return SignupModel();
  }

  @override
  final Function instantiate = _instantiate;

  static SignupModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignupModel>(map);
  }

  static SignupModel fromJson(String json) {
    return ensureInitialized().decodeJson<SignupModel>(json);
  }
}

mixin SignupModelMappable {
  String toJson() {
    return SignupModelMapper.ensureInitialized().encodeJson<SignupModel>(
      this as SignupModel,
    );
  }

  Map<String, dynamic> toMap() {
    return SignupModelMapper.ensureInitialized().encodeMap<SignupModel>(
      this as SignupModel,
    );
  }

  SignupModelCopyWith<SignupModel, SignupModel, SignupModel> get copyWith =>
      _SignupModelCopyWithImpl<SignupModel, SignupModel>(
        this as SignupModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SignupModelMapper.ensureInitialized().stringifyValue(
      this as SignupModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SignupModelMapper.ensureInitialized().equalsValue(
      this as SignupModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SignupModelMapper.ensureInitialized().hashValue(this as SignupModel);
  }
}

extension SignupModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SignupModel, $Out> {
  SignupModelCopyWith<$R, SignupModel, $Out> get $asSignupModel =>
      $base.as((v, t, t2) => _SignupModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SignupModelCopyWith<$R, $In extends SignupModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SignupModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SignupModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SignupModel, $Out>
    implements SignupModelCopyWith<$R, SignupModel, $Out> {
  _SignupModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignupModel> $mapper =
      SignupModelMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  SignupModel $make(CopyWithData data) => SignupModel();

  @override
  SignupModelCopyWith<$R2, SignupModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SignupModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

