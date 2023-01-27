import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:srminhaeiro/models/api_response.model.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/controller/card.list.controller.dart';
import 'package:srminhaeiro/ui/pages/homepage/sonhos/model/card_sonho_model.dart';

class SonhosRepository {
  bool isLoading = true;

  CardListController modelcontroller = CardListController();

  Future<ApiResponse<CardSonhoModel>> cloudFirestoreAdd(
      CardSonhoModel model) async {
    try {
      var userCredential = FirebaseAuth.instance.currentUser;

      if (userCredential != null) {
        var docRef = await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.uid)
            .collection("DreamCard")
            .add(model.toMap());
        model.uid = docRef.id;

        return ApiResponse.sucess(model);
      } else {
        return ApiResponse.error("Ops! Deu errado!");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return ApiResponse.error("Ops! Deu errado!");
    }
  }

  Future<ApiResponse<List<CardSonhoModel>>> cloudFirestoreGetAll() async {
    try {
      var userCredential = FirebaseAuth.instance.currentUser;
      if (userCredential != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.uid)
            .collection("DreamCard")
            .get();

        for (var doc in querySnapshot.docs) {
          CardSonhoModel model =
              CardSonhoModel.fromFirestore(doc.data() as Map<String, dynamic>);
          model.uid = doc.id;
          modelcontroller.sonhoCardList.add(model);
        }

        return ApiResponse.sucess(modelcontroller.sonhoCardList);
      } else {
        return ApiResponse.error("Eita! Deu errado!");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return ApiResponse.error("Eita! Deu errado!");
    }
  }

  Future<ApiResponse<bool>> cloudFirestoneUpdate(
      int index, CardSonhoModel model) async {
    try {
      isLoading = true;
      var userCredential = FirebaseAuth.instance.currentUser;
      if (userCredential != null) {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.uid)
            .collection("DreamCard")
            .doc(model.uid)
            .update(model.toMap());

        modelcontroller.sonhoCardList[index] = model.copyWith(
            model.nomeSonho,
            model.valorTotal,
            model.valorAtual,
            model.adicionarValor,
            model.date);

        return ApiResponse.sucess(true);
      } else {
        isLoading = false;
        return ApiResponse.error("Eita! Deu errado!");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return ApiResponse.error("Eita! Deu errado!");
    }
  }

  Future<ApiResponse<bool>> cloudFirestoneDelete(CardSonhoModel model) async {
    try {
      isLoading = true;
      var userCredential = FirebaseAuth.instance.currentUser;
      if (userCredential != null) {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.uid)
            .collection("DreamCard")
            .doc(model.uid)
            .delete();

        modelcontroller.sonhoCardList
            .removeWhere((element) => element == model);

        return ApiResponse.sucess(true);
      } else {
        isLoading = false;
        return ApiResponse.error("Eita! Deu errado!");
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return ApiResponse.error("Eita! Deu errado!");
    }
  }
}
