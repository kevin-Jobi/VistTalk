import 'package:flutter_bloc/flutter_bloc.dart';
import 'message_event.dart';
import 'message_state.dart';
import '../../models/message_model.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(const MessageState()) {
    on<LoadMessages>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(const Duration(seconds: 2));
      final messages = [
        MessageModel(senderName: 'Shahad', time: '11:00 AM', messageCount: 2),
        MessageModel(senderName: 'Akhil', time: '11:00 AM', messageCount: 2),
        MessageModel(senderName: 'Najin', time: '11:00 AM', messageCount: 2),
      ];
      emit(state.copyWith(messages: messages, isLoading: false));
    });
  }
}
