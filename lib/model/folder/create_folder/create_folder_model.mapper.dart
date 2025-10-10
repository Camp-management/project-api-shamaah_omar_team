// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_folder_model.dart';

class CreateFolderModelMapper extends ClassMapperBase<CreateFolderModel> {
  CreateFolderModelMapper._();

  static CreateFolderModelMapper? _instance;
  static CreateFolderModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateFolderModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateFolderModel';

  static String _$name(CreateFolderModel v) => v.name;
  static const Field<CreateFolderModel, String> _f$name = Field('name', _$name);
  static String? _$desc(CreateFolderModel v) => v.desc;
  static const Field<CreateFolderModel, String> _f$desc = Field(
    'desc',
    _$desc,
    opt: true,
  );
  static String? _$color(CreateFolderModel v) => v.color;
  static const Field<CreateFolderModel, String> _f$color = Field(
    'color',
    _$color,
    opt: true,
  );

  @override
  final MappableFields<CreateFolderModel> fields = const {
    #name: _f$name,
    #desc: _f$desc,
    #color: _f$color,
  };

  static CreateFolderModel _instantiate(DecodingData data) {
    return CreateFolderModel(
      name: data.dec(_f$name),
      desc: data.dec(_f$desc),
      color: data.dec(_f$color),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CreateFolderModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateFolderModel>(map);
  }

  static CreateFolderModel fromJson(String json) {
    return ensureInitialized().decodeJson<CreateFolderModel>(json);
  }
}

mixin CreateFolderModelMappable {
  String toJson() {
    return CreateFolderModelMapper.ensureInitialized()
        .encodeJson<CreateFolderModel>(this as CreateFolderModel);
  }

  Map<String, dynamic> toMap() {
    return CreateFolderModelMapper.ensureInitialized()
        .encodeMap<CreateFolderModel>(this as CreateFolderModel);
  }

  CreateFolderModelCopyWith<
    CreateFolderModel,
    CreateFolderModel,
    CreateFolderModel
  >
  get copyWith =>
      _CreateFolderModelCopyWithImpl<CreateFolderModel, CreateFolderModel>(
        this as CreateFolderModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CreateFolderModelMapper.ensureInitialized().stringifyValue(
      this as CreateFolderModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return CreateFolderModelMapper.ensureInitialized().equalsValue(
      this as CreateFolderModel,
      other,
    );
  }

  @override
  int get hashCode {
    return CreateFolderModelMapper.ensureInitialized().hashValue(
      this as CreateFolderModel,
    );
  }
}

extension CreateFolderModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateFolderModel, $Out> {
  CreateFolderModelCopyWith<$R, CreateFolderModel, $Out>
  get $asCreateFolderModel => $base.as(
    (v, t, t2) => _CreateFolderModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CreateFolderModelCopyWith<
  $R,
  $In extends CreateFolderModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? desc, String? color});
  CreateFolderModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CreateFolderModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateFolderModel, $Out>
    implements CreateFolderModelCopyWith<$R, CreateFolderModel, $Out> {
  _CreateFolderModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateFolderModel> $mapper =
      CreateFolderModelMapper.ensureInitialized();
  @override
  $R call({String? name, Object? desc = $none, Object? color = $none}) =>
      $apply(
        FieldCopyWithData({
          if (name != null) #name: name,
          if (desc != $none) #desc: desc,
          if (color != $none) #color: color,
        }),
      );
  @override
  CreateFolderModel $make(CopyWithData data) => CreateFolderModel(
    name: data.get(#name, or: $value.name),
    desc: data.get(#desc, or: $value.desc),
    color: data.get(#color, or: $value.color),
  );

  @override
  CreateFolderModelCopyWith<$R2, CreateFolderModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CreateFolderModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

