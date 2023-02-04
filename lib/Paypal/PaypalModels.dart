import 'dart:convert';

PaypalOderModel paypalOderModelFromJson(String str) => PaypalOderModel.fromJson(json.decode(str));

String paypalOderModelToJson(PaypalOderModel data) => json.encode(data.toJson());

class PaypalOderModel {
    PaypalOderModel({
        this.intent,
        this.purchaseUnits,
        this.applicationContext,
    });

    String? intent;
    List<PurchaseUnit>? purchaseUnits;
    ApplicationContext? applicationContext;

    factory PaypalOderModel.fromJson(Map<String, dynamic> json) => PaypalOderModel(
        intent: json["intent"],
        purchaseUnits: json["purchase_units"] == null ? [] : List<PurchaseUnit>.from(json["purchase_units"]!.map((x) => PurchaseUnit.fromJson(x))),
        applicationContext: json["application_context"] == null ? null : ApplicationContext.fromJson(json["application_context"]),
    );

    Map<String, dynamic> toJson() => {
        "intent": intent,
        "purchase_units": purchaseUnits == null ? [] : List<dynamic>.from(purchaseUnits!.map((x) => x.toJson())),
        "application_context": applicationContext?.toJson(),
    };
}

class ApplicationContext {
    ApplicationContext({
        this.returnUrl,
        this.cancelUrl,
    });

    String? returnUrl;
    String? cancelUrl;

    factory ApplicationContext.fromJson(Map<String, dynamic> json) => ApplicationContext(
        returnUrl: json["return_url"],
        cancelUrl: json["cancel_url"],
    );

    Map<String, dynamic> toJson() => {
        "return_url": returnUrl,
        "cancel_url": cancelUrl,
    };
}

class PurchaseUnit {
    PurchaseUnit({
        this.items,
        this.amount,
    });

    List<Item>? items;
    Amount? amount;

    factory PurchaseUnit.fromJson(Map<String, dynamic> json) => PurchaseUnit(
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        amount: json["amount"] == null ? null : Amount.fromJson(json["amount"]),
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "amount": amount?.toJson(),
    };
}

class Amount {
    Amount({
        this.currencyCode,
        this.value,
        this.breakdown,
    });

    String? currencyCode;
    String? value;
    Breakdown? breakdown;

    factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        currencyCode: json["currency_code"],
        value: json["value"],
        breakdown: json["breakdown"] == null ? null : Breakdown.fromJson(json["breakdown"]),
    );

    Map<String, dynamic> toJson() => {
        "currency_code": currencyCode,
        "value": value,
        "breakdown": breakdown?.toJson(),
    };
}

class Breakdown {
    Breakdown({
        this.itemTotal,
    });

    UnitAmount? itemTotal;

    factory Breakdown.fromJson(Map<String, dynamic> json) => Breakdown(
        itemTotal: json["item_total"] == null ? null : UnitAmount.fromJson(json["item_total"]),
    );

    Map<String, dynamic> toJson() => {
        "item_total": itemTotal?.toJson(),
    };
}

class UnitAmount {
    UnitAmount({
        this.currencyCode,
        this.value,
    });

    String? currencyCode;
    String? value;

    factory UnitAmount.fromJson(Map<String, dynamic> json) => UnitAmount(
        currencyCode: json["currency_code"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "currency_code": currencyCode,
        "value": value,
    };
}

class Item {
    Item({
        this.name,
        this.description,
        this.quantity,
        this.unitAmount,
    });

    String? name;
    String? description;
    String? quantity;
    UnitAmount? unitAmount;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        description: json["description"],
        quantity: json["quantity"],
        unitAmount: json["unit_amount"] == null ? null : UnitAmount.fromJson(json["unit_amount"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "quantity": quantity,
        "unit_amount": unitAmount?.toJson(),
    };
}
