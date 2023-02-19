// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelClass {
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  ModelClass({
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  ModelClass copyWith({
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return ModelClass(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory ModelClass.fromMap(Map<String, dynamic> map) {
    return ModelClass(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      thumbnailUrl:
          map['thumbnailUrl'] != null ? map['thumbnailUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelClass.fromJson(String source) =>
      ModelClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelClass(id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(covariant ModelClass other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.url == url &&
        other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ url.hashCode ^ thumbnailUrl.hashCode;
  }
}
