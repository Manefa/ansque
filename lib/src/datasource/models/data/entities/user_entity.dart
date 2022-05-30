import 'package:objectbox/objectbox.dart';

@Entity()
class UserEntity {

  final String email;

  UserEntity({
    required this.email,
  });
}
