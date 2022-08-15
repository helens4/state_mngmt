import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Todo extends Equatable {
  String? id;
  final String desc;
  final bool completed;

  Todo({this.id, required this.desc, this.completed = false}){
    id = id ?? uuid.v4();
  }

  @override
  List<Object?> get props => [id, desc, completed];

  @override
  bool get stringify => true;
}

enum Filter {
  all,
  active,
  completed
}


