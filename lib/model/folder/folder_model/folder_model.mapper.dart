// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'folder_model.dart';

class FolderModelMapper extends ClassMapperBase<FolderModel> {
  FolderModelMapper._();

  static FolderModelMapper? _instance;
  static FolderModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FolderModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FolderModel';

  static String? _$id(FolderModel v) => v.id;
  static const Field<FolderModel, String> _f$id = Field('id', _$id, opt: true);
  static String _$name(FolderModel v) => v.name;
  static const Field<FolderModel, String> _f$name = Field('name', _$name);
  static String? _$desc(FolderModel v) => v.desc;
  static const Field<FolderModel, String> _f$desc = Field(
    'desc',
    _$desc,
    opt: true,
  );
  static String? _$color(FolderModel v) => v.color;
  static const Field<FolderModel, String> _f$color = Field(
    'color',
    _$color,
    opt: true,
  );
  static String? _$parent_folder(FolderModel v) => v.parent_folder;
  static const Field<FolderModel, String> _f$parent_folder = Field(
    'parent_folder',
    _$parent_folder,
    opt: true,
  );
  static String? _$user_id(FolderModel v) => v.user_id;
  static const Field<FolderModel, String> _f$user_id = Field(
    'user_id',
    _$user_id,
    opt: true,
  );
  static String? _$created_at(FolderModel v) => v.created_at;
  static const Field<FolderModel, String> _f$created_at = Field(
    'created_at',
    _$created_at,
    opt: true,
  );

  @override
  final MappableFields<FolderModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #desc: _f$desc,
    #color: _f$color,
    #parent_folder: _f$parent_folder,
    #user_id: _f$user_id,
    #created_at: _f$created_at,
  };

  static FolderModel _instantiate(DecodingData data) {
    return FolderModel(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      desc: data.dec(_f$desc),
      color: data.dec(_f$color),
      parent_folder: data.dec(_f$parent_folder),
      user_id: data.dec(_f$user_id),
      created_at: data.dec(_f$created_at),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FolderModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FolderModel>(map);
  }

  static FolderModel fromJson(String json) {
    return ensureInitialized().decodeJson<FolderModel>(json);
  }
}

mixin FolderModelMappable {
  String toJson() {
    return FolderModelMapper.ensureInitialized().encodeJson<FolderModel>(
      this as FolderModel,
    );
  }

  Map<String, dynamic> toMap() {
    return FolderModelMapper.ensureInitialized().encodeMap<FolderModel>(
      this as FolderModel,
    );
  }

  FolderModelCopyWith<FolderModel, FolderModel, FolderModel> get copyWith =>
      _FolderModelCopyWithImpl<FolderModel, FolderModel>(
        this as FolderModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FolderModelMapper.ensureInitialized().stringifyValue(
      this as FolderModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return FolderModelMapper.ensureInitialized().equalsValue(
      this as FolderModel,
      other,
    );
  }

  @override
  int get hashCode {
    return FolderModelMapper.ensureInitialized().hashValue(this as FolderModel);
  }
}

extension FolderModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FolderModel, $Out> {
  FolderModelCopyWith<$R, FolderModel, $Out> get $asFolderModel =>
      $base.as((v, t, t2) => _FolderModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FolderModelCopyWith<$R, $In extends FolderModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? name,
    String? desc,
    String? color,
    String? parent_folder,
    String? user_id,
    String? created_at,
  });
  FolderModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FolderModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FolderModel, $Out>
    implements FolderModelCopyWith<$R, FolderModel, $Out> {
  _FolderModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FolderModel> $mapper =
      FolderModelMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    String? name,
    Object? desc = $none,
    Object? color = $none,
    Object? parent_folder = $none,
    Object? user_id = $none,
    Object? created_at = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != null) #name: name,
      if (desc != $none) #desc: desc,
      if (color != $none) #color: color,
      if (parent_folder != $none) #parent_folder: parent_folder,
      if (user_id != $none) #user_id: user_id,
      if (created_at != $none) #created_at: created_at,
    }),
  );
  @override
  FolderModel $make(CopyWithData data) => FolderModel(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    desc: data.get(#desc, or: $value.desc),
    color: data.get(#color, or: $value.color),
    parent_folder: data.get(#parent_folder, or: $value.parent_folder),
    user_id: data.get(#user_id, or: $value.user_id),
    created_at: data.get(#created_at, or: $value.created_at),
  );

  @override
  FolderModelCopyWith<$R2, FolderModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FolderModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

