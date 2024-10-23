import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object?> get props => [];
}

class UpdateUserProfile extends UserProfileEvent {
  final Map<String, dynamic> bodyRequest;
  final Uint8List? image;

  const UpdateUserProfile({required this.bodyRequest,  this.image});

  @override
  List<Object?> get props => [bodyRequest, image];
}
