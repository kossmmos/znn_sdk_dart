import 'package:znn_sdk_dart/src/model/primitives.dart';

class StakeList {
  BigInt totalAmount;
  BigInt totalWeightedAmount;
  int count;
  List<StakeEntry> list;

  StakeList(
      {required this.totalAmount,
      required this.totalWeightedAmount,
      required this.count,
      required this.list});

  StakeList.fromJson(Map<String, dynamic> json)
      : totalAmount = BigInt.parse(json['totalAmount']),
        totalWeightedAmount = BigInt.parse(json['totalWeightedAmount']),
        count = json['count'],
        list = (json['list'] as List)
            .map((entry) => StakeEntry.fromJson(entry))
            .toList();

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['totalAmount'] = totalAmount.toString();
    data['totalWeightedAmount'] = totalWeightedAmount.toString();
    data['count'] = count;
    data['list'] = list.map((entry) => entry.toJson()).toList();

    return data;
  }
}

class StakeEntry {
  final BigInt amount;
  final BigInt weightedAmount;
  final int startTimestamp;
  final int expirationTimestamp;
  final Address address;
  final Hash id;

  StakeEntry(
      {required this.amount,
      required this.weightedAmount,
      required this.startTimestamp,
      required this.expirationTimestamp,
      required this.address,
      required this.id});

  factory StakeEntry.fromJson(Map<String, dynamic> json) => StakeEntry(
      amount: BigInt.parse(json['amount']),
      weightedAmount: BigInt.parse(json['weightedAmount']),
      startTimestamp: json['startTimestamp'],
      expirationTimestamp: json['expirationTimestamp'],
      address: Address.parse(json['address']),
      id: Hash.parse(json['id']));

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount.toString();
    data['weightedAmount'] = weightedAmount.toString();
    data['startTimestamp'] = startTimestamp;
    data['expirationTimestamp'] = expirationTimestamp;
    data['address'] = address.toString();
    data['hash'] = id.toString();

    return data;
  }
}
