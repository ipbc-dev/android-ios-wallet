import 'package:flutter/foundation.dart';
import 'package:cake_wallet/src/domain/exchange/trade.dart';

abstract class ExchangeTradeState {}

class ExchangeTradeStateInitial extends ExchangeTradeState {}

class TradeIsCreating extends ExchangeTradeState {}

class TradeIsCreatedSuccessfully extends ExchangeTradeState {
  TradeIsCreatedSuccessfully({@required this.trade});

  final Trade trade;
}

class TradeIsCreatedFailure extends ExchangeTradeState {
  TradeIsCreatedFailure({@required this.error});

  final String error;
}