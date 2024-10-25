class Branch {
  String? name;
  bool? protected;

  Branch({this.name, this.protected});

  Branch.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['protected'] = protected;
    return data;
  }
}
