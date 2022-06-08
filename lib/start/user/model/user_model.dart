class User {
  final String firstName;
  final String lastName;
  final String profilePicture;
  final List<String>? productList;

  User(this.firstName, this.lastName, this.profilePicture, this.productList);

  String get getFullName => firstName + lastName;
}
