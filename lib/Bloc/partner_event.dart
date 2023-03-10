part of 'partner_bloc.dart';

abstract class PartnerEvent extends Equatable {
  const PartnerEvent();
}
class PartnerLoadEvent extends PartnerEvent{
  @override
  List<Object?> get props => [];
}
class PartnerclickEvent extends PartnerEvent{
  @override
  List<Object?> get props => [];
}
