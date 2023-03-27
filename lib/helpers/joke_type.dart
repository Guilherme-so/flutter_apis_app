class JokeType {
  JokeType(
      {this.categories,
      this.createdAt,
      this.iconUrl,
      this.id,
      this.updatedAt,
      this.url,
      this.value});

  List<String>? categories;
  String? createdAt;
  String? iconUrl;
  String? id;
  String? updatedAt;
  String? url;
  String? value;

  JokeType.fromJson(Map<String, dynamic> json) {
    categories = json['categories'].cast<String>();
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
    value = json['value'];
  }
}
