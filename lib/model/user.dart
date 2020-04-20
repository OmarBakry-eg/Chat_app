class User {
  final String fullName;
  final String email;
  User({this.email, this.fullName});

//  factory User.fromDocument(DocumentSnapshot doc) {
//    return User(
//      fullName: doc['fullname'],
//      email: doc['email'],
//    );
//  }
}
