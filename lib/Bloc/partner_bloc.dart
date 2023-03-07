import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc3/Model/Partner_Model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../Apical/Repository.dart';

part 'partner_event.dart';
part 'partner_state.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  final PartnerApi partner;
  PartnerBloc(this.partner) : super(PartnerLoadingState()) {
    on<PartnerEvent>((event, emit) async {
      emit(PartnerLoadingState());
      try {
        var apiCall = await partner.postApi();
        emit(PartnerLoadedState(apiCall!));
      } catch (e) {
        emit(PartnerErrorState(e.toString()));
      }
    });
  }
}
