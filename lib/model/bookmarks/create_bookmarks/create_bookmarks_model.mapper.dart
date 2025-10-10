// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'create_bookmarks_model.dart';

class CreateBookmarksModelMapper extends ClassMapperBase<CreateBookmarksModel> {
  CreateBookmarksModelMapper._();

  static CreateBookmarksModelMapper? _instance;
  static CreateBookmarksModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateBookmarksModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateBookmarksModel';

  static String _$url(CreateBookmarksModel v) => v.url;
  static const Field<CreateBookmarksModel, String> _f$url = Field('url', _$url);
  static String _$desc(CreateBookmarksModel v) => v.desc;
  static const Field<CreateBookmarksModel, String> _f$desc = Field(
    'desc',
    _$desc,
  );
  static String _$content_type(CreateBookmarksModel v) => v.content_type;
  static const Field<CreateBookmarksModel, String> _f$content_type = Field(
    'content_type',
    _$content_type,
  );
  static bool _$is_ticked(CreateBookmarksModel v) => v.is_ticked;
  static const Field<CreateBookmarksModel, bool> _f$is_ticked = Field(
    'is_ticked',
    _$is_ticked,
  );
  static String _$folder_id(CreateBookmarksModel v) => v.folder_id;
  static const Field<CreateBookmarksModel, String> _f$folder_id = Field(
    'folder_id',
    _$folder_id,
  );

  @override
  final MappableFields<CreateBookmarksModel> fields = const {
    #url: _f$url,
    #desc: _f$desc,
    #content_type: _f$content_type,
    #is_ticked: _f$is_ticked,
    #folder_id: _f$folder_id,
  };

  static CreateBookmarksModel _instantiate(DecodingData data) {
    return CreateBookmarksModel(
      url: data.dec(_f$url),
      desc: data.dec(_f$desc),
      content_type: data.dec(_f$content_type),
      is_ticked: data.dec(_f$is_ticked),
      folder_id: data.dec(_f$folder_id),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CreateBookmarksModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateBookmarksModel>(map);
  }

  static CreateBookmarksModel fromJson(String json) {
    return ensureInitialized().decodeJson<CreateBookmarksModel>(json);
  }
}

mixin CreateBookmarksModelMappable {
  String toJson() {
    return CreateBookmarksModelMapper.ensureInitialized()
        .encodeJson<CreateBookmarksModel>(this as CreateBookmarksModel);
  }

  Map<String, dynamic> toMap() {
    return CreateBookmarksModelMapper.ensureInitialized()
        .encodeMap<CreateBookmarksModel>(this as CreateBookmarksModel);
  }

  CreateBookmarksModelCopyWith<
    CreateBookmarksModel,
    CreateBookmarksModel,
    CreateBookmarksModel
  >
  get copyWith =>
      _CreateBookmarksModelCopyWithImpl<
        CreateBookmarksModel,
        CreateBookmarksModel
      >(this as CreateBookmarksModel, $identity, $identity);
  @override
  String toString() {
    return CreateBookmarksModelMapper.ensureInitialized().stringifyValue(
      this as CreateBookmarksModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return CreateBookmarksModelMapper.ensureInitialized().equalsValue(
      this as CreateBookmarksModel,
      other,
    );
  }

  @override
  int get hashCode {
    return CreateBookmarksModelMapper.ensureInitialized().hashValue(
      this as CreateBookmarksModel,
    );
  }
}

extension CreateBookmarksModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateBookmarksModel, $Out> {
  CreateBookmarksModelCopyWith<$R, CreateBookmarksModel, $Out>
  get $asCreateBookmarksModel => $base.as(
    (v, t, t2) => _CreateBookmarksModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CreateBookmarksModelCopyWith<
  $R,
  $In extends CreateBookmarksModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? url,
    String? desc,
    String? content_type,
    bool? is_ticked,
    String? folder_id,
  });
  CreateBookmarksModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CreateBookmarksModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateBookmarksModel, $Out>
    implements CreateBookmarksModelCopyWith<$R, CreateBookmarksModel, $Out> {
  _CreateBookmarksModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateBookmarksModel> $mapper =
      CreateBookmarksModelMapper.ensureInitialized();
  @override
  $R call({
    String? url,
    String? desc,
    String? content_type,
    bool? is_ticked,
    String? folder_id,
  }) => $apply(
    FieldCopyWithData({
      if (url != null) #url: url,
      if (desc != null) #desc: desc,
      if (content_type != null) #content_type: content_type,
      if (is_ticked != null) #is_ticked: is_ticked,
      if (folder_id != null) #folder_id: folder_id,
    }),
  );
  @override
  CreateBookmarksModel $make(CopyWithData data) => CreateBookmarksModel(
    url: data.get(#url, or: $value.url),
    desc: data.get(#desc, or: $value.desc),
    content_type: data.get(#content_type, or: $value.content_type),
    is_ticked: data.get(#is_ticked, or: $value.is_ticked),
    folder_id: data.get(#folder_id, or: $value.folder_id),
  );

  @override
  CreateBookmarksModelCopyWith<$R2, CreateBookmarksModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CreateBookmarksModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

