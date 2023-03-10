import 'package:bloc/bloc.dart';
import 'package:bloc3/Model/Partner_Model.dart';
import 'package:equatable/equatable.dart';

import '../Apical/Repository.dart';

part 'partner_event.dart';
part 'partner_state.dart';


class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  PartnerApi partner;
  PartnerBloc(this.partner) : super(PartnerLoadingState()) {
    on<PartnerLoadEvent>((event, emit) async {
      emit(PartnerLoadingState());
      try {
        var apiCall = await partner.PartnerApiii();
        emit(PartnerLoadedState(apiCall!));
      } catch (e) {
        emit(PartnerErrorState(e.toString()));
      }
    });
  }
}
