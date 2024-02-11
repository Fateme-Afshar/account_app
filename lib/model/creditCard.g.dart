// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditCard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditCardAdapter extends TypeAdapter<CreditCard> {
  @override
  final int typeId = 0;

  @override
  CreditCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditCard(
      id: fields[0] as num?,
      transactionId: fields[1] as num?,
      name: fields[2] as String?,
      cardNumber: fields[3] as String,
      dateExpire: fields[4] as String?,
      bankName: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CreditCard obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.transactionId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.cardNumber)
      ..writeByte(4)
      ..write(obj.dateExpire)
      ..writeByte(5)
      ..write(obj.bankName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
