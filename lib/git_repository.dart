class GitRepository {
  String name;
  String owner;
  String avatar;
  String repUrl;

  GitRepository({
    this.avatar,
    this.name,
    this.owner,
    this.repUrl,
  });

  factory GitRepository.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return null;

    return GitRepository(
      name: json['name'],
      owner: json['owner']['login'],
      avatar: json['owner']['avatar_url'],
      repUrl: json['html_url'],
    );
  }
}
