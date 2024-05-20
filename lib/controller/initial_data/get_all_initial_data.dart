import 'package:flutter/material.dart';
import 'package:social_media_app/constants/fetch_data/types/get_enum.dart';
import 'package:social_media_app/constants/fetch_data/types/post_enum.dart';
import 'package:social_media_app/repository/authentication_repo.dart';
import 'package:social_media_app/repository/fetch_data_repo.dart';

class GetAllInitialData {
  BuildContext context;

  GetAllInitialData(this.context);

  dynamic getAllConversations() async {
    dynamic res =
        await fetchDataRepo.fetchData(context, RequestGet.getAllConversations, {
      'idToken': authRepo.idToken,
    });
    print(res);
    return res;
  }

  dynamic getConversationMessages(String conversationId) async {
    dynamic res =
        await fetchDataRepo.fetchData(context, RequestGet.getConversationMessages, {
      'conversationIs' : conversationId,
      'idToken': authRepo.idToken,
    });
    print(res);
    return res;
  }

  dynamic getUnsentMessages() async {
    dynamic res =
        await fetchDataRepo.fetchData(context, RequestGet.getUnsentMessages, {
      'idToken': authRepo.idToken,
    });
    print(res);
    return res;
  }

  dynamic getAllMessages() async {
    dynamic res =
        await fetchDataRepo.fetchData(context, RequestGet.getAllMessages, {
      'idToken': authRepo.idToken,
    });
    print(res);
    return res;
  }
}


