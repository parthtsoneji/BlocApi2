part of 'partner_bloc.dart';


abstract class PartnerState extends Equatable {
  const PartnerState();
}

class PartnerLoadingState extends PartnerState {
  @override
  List<Object> get props => [];
}

class PartnerLoadedState extends PartnerState{

  final PostsApi loaded;

  PartnerLoadedState(this.loaded);
  @override
  List<Object?> get props => [loaded];

}

class PartnerErrorState extends PartnerState{
  final String error;

  PartnerErrorState(this.error);
  @override
  List<Object?> get props => [error];

}