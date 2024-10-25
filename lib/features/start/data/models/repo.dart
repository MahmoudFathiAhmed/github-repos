class Repo {
  int? id;
  String? name;
  String? fullName;
  bool? private;
  Owner? owner;
  String? url;
  String? branchesUrl;
  String? createdAt;
  String? updatedAt;
  String? visibility;
  int? forks;
  String? defaultBranch;

  Repo(
      {this.id,
      this.name,
      this.fullName,
      this.private,
      this.owner,
      this.url,
      this.branchesUrl,
      this.createdAt,
      this.updatedAt,
      this.visibility,
      this.forks,
      this.defaultBranch});

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;

    url = json['url'];
    branchesUrl = json['branches_url'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    visibility = json['visibility'];
    forks = json['forks'];
    defaultBranch = json['default_branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['full_name'] = fullName;
    data['private'] = private;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['url'] = url;
    data['branches_url'] = branchesUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['visibility'] = visibility;
    data['forks'] = forks;
    data['default_branch'] = defaultBranch;
    return data;
  }
}

class Owner {
  String? login;
  int? id;
  String? avatarUrl;
  String? url;

  Owner({this.login, this.id, this.avatarUrl, this.url});

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['avatar_url'] = avatarUrl;
    data['url'] = url;
    return data;
  }
}
