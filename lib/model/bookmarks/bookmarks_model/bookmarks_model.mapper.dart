// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bookmarks_model.dart';

class BookmarksModelMapper extends ClassMapperBase<BookmarksModel> {
  BookmarksModelMapper._();

  static BookmarksModelMapper? _instance;
  static BookmarksModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BookmarksModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BookmarksModel';

  static String _$user_id(BookmarksModel v) => v.user_id;
  static const Field<BookmarksModel, String> _f$user_id = Field(
    'user_id',
    _$user_id,
  );
  static String _$id(BookmarksModel v) => v.id;
  static const Field<BookmarksModel, String> _f$id = Field('id', _$id);
  static String _$created_at(BookmarksModel v) => v.created_at;
  static const Field<BookmarksModel, String> _f$created_at = Field(
    'created_at',
    _$created_at,
  );
  static String _$url(BookmarksModel v) => v.url;
  static const Field<BookmarksModel, String> _f$url = Field('url', _$url);
  static String _$desc(BookmarksModel v) => v.desc;
  static const Field<BookmarksModel, String> _f$desc = Field('desc', _$desc);
  static String _$content_type(BookmarksModel v) => v.content_type;
  static const Field<BookmarksModel, String> _f$content_type = Field(
    'content_type',
    _$content_type,
  );
  static bool _$is_ticked(BookmarksModel v) => v.is_ticked;
  static const Field<BookmarksModel, bool> _f$is_ticked = Field(
    'is_ticked',
    _$is_ticked,
  );
  static String _$folder_id(BookmarksModel v) => v.folder_id;
  static const Field<BookmarksModel, String> _f$folder_id = Field(
    'folder_id',
    _$folder_id,
  );

  @override
  final MappableFields<BookmarksModel> fields = const {
    #user_id: _f$user_id,
    #id: _f$id,
    #created_at: _f$created_at,
    #url: _f$url,
    #desc: _f$desc,
    #content_type: _f$content_type,
    #is_ticked: _f$is_ticked,
    #folder_id: _f$folder_id,
  };

  static BookmarksModel _instantiate(DecodingData data) {
    return BookmarksModel(
      user_id: data.dec(_f$user_id),
      id: data.dec(_f$id),
      created_at: data.dec(_f$created_at),
      url: data.dec(_f$url),
      desc: data.dec(_f$desc),
      content_type: data.dec(_f$content_type),
      is_ticked: data.dec(_f$is_ticked),
      folder_id: data.dec(_f$folder_id),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BookmarksModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BookmarksModel>(map);
  }

  static BookmarksModel fromJson(String json) {
    return ensureInitialized().decodeJson<BookmarksModel>(json);
  }
}

mixin BookmarksModelMappable {
  String toJson() {
    return BookmarksModelMapper.ensureInitialized().encodeJson<BookmarksModel>(
      this as BookmarksModel,
    );
  }

  Map<String, dynamic> toMap() {
    return BookmarksModelMapper.ensureInitialized().encodeMap<BookmarksModel>(
      this as BookmarksModel,
    );
  }

  BookmarksModelCopyWith<BookmarksModel, BookmarksModel, BookmarksModel>
  get copyWith => _BookmarksModelCopyWithImpl<BookmarksModel, BookmarksModel>(
    this as BookmarksModel,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return BookmarksModelMapper.ensureInitialized().stringifyValue(
      this as BookmarksModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return BookmarksModelMapper.ensureInitialized().equalsValue(
      this as BookmarksModel,
      other,
    );
  }

  @override
  int get hashCode {
    return BookmarksModelMapper.ensureInitialized().hashValue(
      this as BookmarksModel,
    );
  }
}

extension BookmarksModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BookmarksModel, $Out> {
  BookmarksModelCopyWith<$R, BookmarksModel, $Out> get $asBookmarksModel =>
      $base.as((v, t, t2) => _BookmarksModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BookmarksModelCopyWith<$R, $In extends BookmarksModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? user_id,
    String? id,
    String? created_at,
    String? url,
    String? desc,
    String? content_type,
    bool? is_ticked,
    String? folder_id,
  });
  BookmarksModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _BookmarksModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BookmarksModel, $Out>
    implements BookmarksModelCopyWith<$R, BookmarksModel, $Out> {
  _BookmarksModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BookmarksModel> $mapper =
      BookmarksModelMapper.ensureInitialized();
  @override
  $R call({
    String? user_id,
    String? id,
    String? created_at,
    String? url,
    String? desc,
    String? content_type,
    bool? is_ticked,
    String? folder_id,
  }) => $apply(
    FieldCopyWithData({
      if (user_id != null) #user_id: user_id,
      if (id != null) #id: id,
      if (created_at != null) #created_at: created_at,
      if (url != null) #url: url,
      if (desc != null) #desc: desc,
      if (content_type != null) #content_type: content_type,
      if (is_ticked != null) #is_ticked: is_ticked,
      if (folder_id != null) #folder_id: folder_id,
    }),
  );
  @override
  BookmarksModel $make(CopyWithData data) => BookmarksModel(
    user_id: data.get(#user_id, or: $value.user_id),
    id: data.get(#id, or: $value.id),
    created_at: data.get(#created_at, or: $value.created_at),
    url: data.get(#url, or: $value.url),
    desc: data.get(#desc, or: $value.desc),
    content_type: data.get(#content_type, or: $value.content_type),
    is_ticked: data.get(#is_ticked, or: $value.is_ticked),
    folder_id: data.get(#folder_id, or: $value.folder_id),
  );

  @override
  BookmarksModelCopyWith<$R2, BookmarksModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BookmarksModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

