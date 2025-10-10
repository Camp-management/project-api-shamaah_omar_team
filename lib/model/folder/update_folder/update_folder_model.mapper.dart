// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'update_folder_model.dart';

class UpdateFolderModelMapper extends ClassMapperBase<UpdateFolderModel> {
  UpdateFolderModelMapper._();

  static UpdateFolderModelMapper? _instance;
  static UpdateFolderModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateFolderModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateFolderModel';

  static String _$id(UpdateFolderModel v) => v.id;
  static const Field<UpdateFolderModel, String> _f$id = Field('id', _$id);
  static String _$name(UpdateFolderModel v) => v.name;
  static const Field<UpdateFolderModel, String> _f$name = Field('name', _$name);
  static String? _$desc(UpdateFolderModel v) => v.desc;
  static const Field<UpdateFolderModel, String> _f$desc = Field(
    'desc',
    _$desc,
    opt: true,
  );
  static String? _$color(UpdateFolderModel v) => v.color;
  static const Field<UpdateFolderModel, String> _f$color = Field(
    'color',
    _$color,
    opt: true,
  );

  @override
  final MappableFields<UpdateFolderModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #desc: _f$desc,
    #color: _f$color,
  };

  static UpdateFolderModel _instantiate(DecodingData data) {
    return UpdateFolderModel(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      desc: data.dec(_f$desc),
      color: data.dec(_f$color),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateFolderModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateFolderModel>(map);
  }

  static UpdateFolderModel fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateFolderModel>(json);
  }
}

mixin UpdateFolderModelMappable {
  String toJson() {
    return UpdateFolderModelMapper.ensureInitialized()
        .encodeJson<UpdateFolderModel>(this as UpdateFolderModel);
  }

  Map<String, dynamic> toMap() {
    return UpdateFolderModelMapper.ensureInitialized()
        .encodeMap<UpdateFolderModel>(this as UpdateFolderModel);
  }

  UpdateFolderModelCopyWith<
    UpdateFolderModel,
    UpdateFolderModel,
    UpdateFolderModel
  >
  get copyWith =>
      _UpdateFolderModelCopyWithImpl<UpdateFolderModel, UpdateFolderModel>(
        this as UpdateFolderModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UpdateFolderModelMapper.ensureInitialized().stringifyValue(
      this as UpdateFolderModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return UpdateFolderModelMapper.ensureInitialized().equalsValue(
      this as UpdateFolderModel,
      other,
    );
  }

  @override
  int get hashCode {
    return UpdateFolderModelMapper.ensureInitialized().hashValue(
      this as UpdateFolderModel,
    );
  }
}

extension UpdateFolderModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateFolderModel, $Out> {
  UpdateFolderModelCopyWith<$R, UpdateFolderModel, $Out>
  get $asUpdateFolderModel => $base.as(
    (v, t, t2) => _UpdateFolderModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class UpdateFolderModelCopyWith<
  $R,
  $In extends UpdateFolderModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, String? desc, String? color});
  UpdateFolderModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UpdateFolderModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateFolderModel, $Out>
    implements UpdateFolderModelCopyWith<$R, UpdateFolderModel, $Out> {
  _UpdateFolderModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateFolderModel> $mapper =
      UpdateFolderModelMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? name,
    Object? desc = $none,
    Object? color = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (desc != $none) #desc: desc,
      if (color != $none) #color: color,
    }),
  );
  @override
  UpdateFolderModel $make(CopyWithData data) => UpdateFolderModel(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    desc: data.get(#desc, or: $value.desc),
    color: data.get(#color, or: $value.color),
  );

  @override
  UpdateFolderModelCopyWith<$R2, UpdateFolderModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UpdateFolderModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

