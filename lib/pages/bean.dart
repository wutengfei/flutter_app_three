class User {
  late int userId;
  late int id;
  late String title;
  late bool completed;

  int getUserId() {
    return userId;
  }

  void setUserId(int userId) {
    this.userId = userId;
  }

  int getId() {
    return id;
  }

  void setId(int id) {
    this.id = id;
  }

  String getTitle() {
    return title;
  }

  void setTitle(String title) {
    this.title = title;
  }

  bool isCompleted() {
    return completed;
  }

  void setCompleted(bool completed) {
    this.completed = completed;
  }
}
