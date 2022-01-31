
class Repository {
  const Repository({
    required this.id,
    required this.fullName,
    required this.htmlUrl,
    required this.description,
    required this.stargazersCount,
  });

  final int id;
  final String fullName;
  final String htmlUrl;
  final String description;
  final int stargazersCount;

  static Repository fromJson(dynamic json) {
    return Repository(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      htmlUrl: json['html_url'] as String,
      description: json['description'] != null
          ? json['description'] as String
          : 'No description',
      stargazersCount: json['stargazers_count'] as int,
    );
  }

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "full_name": fullName,
  //   //"html_url": htmlUrl,
  //   "description": description,
  //   "stargazers_count": stargazersCount,
  // };
  //
  // Future<List<dynamic>> getAllRepositories () async{
  //   final Database db = (await Database) as Database;
  //   var res = await db.query("Repository");
  //   List<dynamic> list = res.isNotEmpty ? res.map((c)=> Repository.fromJson()).toList():[];
  //   return list;
  // }
}
