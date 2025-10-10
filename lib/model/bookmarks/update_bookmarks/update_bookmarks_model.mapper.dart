// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'update_bookmarks_model.dart';

class UpdateBookmarksModelMapper extends ClassMapperBase<UpdateBookmarksModel> {
  UpdateBookmarksModelMapper._();

  static UpdateBookmarksModelMapper? _instance;
  static UpdateBookmarksModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateBookmarksModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateBookmarksModel';

  static String _$id(UpdateBookmarksModel v) => v.id;
  static const Field<UpdateBookmarksModel, String> _f$id = Field('id', _$id);
  static String _$url(UpdateBookmarksModel v) => v.url;
  static const Field<UpdateBookmarksModel, String> _f$url = Field('url', _$url);
  static String _$desc(UpdateBookmarksModel v) => v.desc;
  static const Field<UpdateBookmarksModel, String> _f$desc = Field(
    'desc',
    _$desc,
  );
  static String _$content_type(UpdateBookmarksModel v) => v.content_type;
  static const Field<UpdateBookmarksModel, String> _f$content_type = Field(
    'content_type',
    _$content_type,
  );
  static bool _$is_ticked(UpdateBookmarksModel v) => v.is_ticked;
  static const Field<UpdateBookmarksModel, bool> _f$is_ticked = Field(
    'is_ticked',
    _$is_ticked,
  );
  static String _$folder_id(UpdateBookmarksModel v) => v.folder_id;
  static const Field<UpdateBookmarksModel, String> _f$folder_id = Field(
    'folder_id',
    _$folder_id,
  );

  @override
  final MappableFields<UpdateBookmarksModel> fields = const {
    #id: _f$id,
    #url: _f$url,
    #desc: _f$desc,
    #content_type: _f$content_type,
    #is_ticked: _f$is_ticked,
    #folder_id: _f$folder_id,
  };

  static UpdateBookmarksModel _instantiate(DecodingData data) {
    return UpdateBookmarksModel(
      id: data.dec(_f$id),
      url: data.dec(_f$url),
      desc: data.dec(_f$desc),
      content_type: data.dec(_f$content_type),
      is_ticked: data.dec(_f$is_ticked),
      folder_id: data.dec(_f$folder_id),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateBookmarksModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateBookmarksModel>(map);
  }

  static UpdateBookmarksModel fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateBookmarksModel>(json);
  }
}

mixin UpdateBookmarksModelMappable {
  String toJson() {
    return UpdateBookmarksModelMapper.ensureInitialized()
        .encodeJson<UpdateBookmarksModel>(this as UpdateBookmarksModel);
  }

  Map<String, dynamic> toMap() {
    return UpdateBookmarksModelMapper.ensureInitialized()
        .encodeMap<UpdateBookmarksModel>(this as UpdateBookmarksModel);
  }

  UpdateBookmarksModelCopyWith<
    UpdateBookmarksModel,
    UpdateBookmarksModel,
    UpdateBookmarksModel
  >
  get copyWith =>
      _UpdateBookmarksModelCopyWithImpl<
        UpdateBookmarksModel,
        UpdateBookmarksModel
      >(this as UpdateBookmarksModel, $identity, $identity);
  @override
  String toString() {
    return UpdateBookmarksModelMapper.ensureInitialized().stringifyValue(
      this as UpdateBookmarksModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return UpdateBookmarksModelMapper.ensureInitialized().equalsValue(
      this as UpdateBookmarksModel,
      other,
    );
  }

  @override
  int get hashCode {
    return UpdateBookmarksModelMapper.ensureInitialized().hashValue(
      this as UpdateBookmarksModel,
    );
  }
}

extension UpdateBookmarksModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateBookmarksModel, $Out> {
  UpdateBookmarksModelCopyWith<$R, UpdateBookmarksModel, $Out>
  get $asUpdateBookmarksModel => $base.as(
    (v, t, t2) => _UpdateBookmarksModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class UpdateBookmarksModelCopyWith<
  $R,
  $In extends UpdateBookmarksModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? url,
    String? desc,
    String? content_type,
    bool? is_ticked,
    String? folder_id,
  });
  UpdateBookmarksModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UpdateBookmarksModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateBookmarksModel, $Out>
    implements UpdateBookmarksModelCopyWith<$R, UpdateBookmarksModel, $Out> {
  _UpdateBookmarksModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateBookmarksModel> $mapper =
      UpdateBookmarksModelMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? url,
    String? desc,
    String? content_type,
    bool? is_ticked,
    String? folder_id,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (url != null) #url: url,
      if (desc != null) #desc: desc,
      if (content_type != null) #content_type: content_type,
      if (is_ticked != null) #is_ticked: is_ticked,
      if (folder_id != null) #folder_id: folder_id,
    }),
  );
  @override
  UpdateBookmarksModel $make(CopyWithData data) => UpdateBookmarksModel(
    id: data.get(#id, or: $value.id),
    url: data.get(#url, or: $value.url),
    desc: data.get(#desc, or: $value.desc),
    content_type: data.get(#content_type, or: $value.content_type),
    is_ticked: data.get(#is_ticked, or: $value.is_ticked),
    folder_id: data.get(#folder_id, or: $value.folder_id),
  );

  @override
  UpdateBookmarksModelCopyWith<$R2, UpdateBookmarksModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UpdateBookmarksModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

