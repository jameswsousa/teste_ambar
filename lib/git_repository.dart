class GitRepository {
  String name;
  String owner;
  String avatar;
  String url;

  GitRepository({
    this.avatar,
    this.name,
    this.owner,
    this.url,
  });

  factory GitRepository.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;

    return GitRepository(
      name: json['name'],
      owner: json['owner']['login'],
      avatar: json['owner']['avatar_url'],
      url: json['html_url'],
    );
  }
}
