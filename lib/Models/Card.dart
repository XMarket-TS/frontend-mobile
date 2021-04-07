import 'package:flutter/material.dart';

class Card{
  int _cardId;
  int _userId;
  String _bank;
  String _cardNumber;
  int _expirationYear;
  int _expirationMonth;
  int _cvc;
  String _creationDate;
  int _status;


  Card(
      this._cardId,
      this._userId,
      this._bank,
      this._cardNumber,
      this._expirationYear,
      this._expirationMonth,
      this._cvc,
      this._creationDate,
      this._status);

  int get cardId => _cardId;

  set cardId(int value) {
    _cardId = value;
  }


  String get bank => _bank;

  set bank(String value) {
    _bank = value;
  }


  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  String get cardNumber => _cardNumber;

  set cardNumber(String value) {
    _cardNumber = value;
  }

  int get expirationYear => _expirationYear;

  set expirationYear(int value) {
    _expirationYear = value;
  }

  int get expirationMonth => _expirationMonth;

  set expirationMonth(int value) {
    _expirationMonth = value;
  }

  int get cvc => _cvc;

  set cvc(int value) {
    _cvc = value;
  }

  String get creationDate => _creationDate;

  set creationDate(String value) {
    _creationDate = value;
  }

  int get status => _status;

  set status(int value) {
    _status = value;
  }
}