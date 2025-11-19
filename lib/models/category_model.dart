class Category {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? creationAt;
  final String? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }

  @override
  String toString() {
    return '''
Category:
  id: $id
  name: $name
  slug: $slug
  image: $image
  creationAt: $creationAt
  updatedAt: $updatedAt
''';
  }
}
