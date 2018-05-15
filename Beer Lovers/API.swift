//  This file was automatically generated and should not be edited.

import Apollo

public enum Status: RawRepresentable, Equatable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case available
  case closed
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "AVAILABLE": self = .available
      case "CLOSED": self = .closed
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .available: return "AVAILABLE"
      case .closed: return "CLOSED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Status, rhs: Status) -> Bool {
    switch (lhs, rhs) {
      case (.available, .available): return true
      case (.closed, .closed): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class PocSearchMethodQuery: GraphQLQuery {
  public static let operationString =
    "query pocSearchMethod($now: DateTime!, $algorithm: String!, $lat: String!, $long: String!) {\n  pocSearch(now: $now, algorithm: $algorithm, lat: $lat, long: $long) {\n    __typename\n    id\n    status\n    tradingName\n    officialName\n    deliveryTypes {\n      __typename\n      pocDeliveryTypeId\n      deliveryTypeId\n      price\n      title\n      subtitle\n      active\n    }\n    paymentMethods {\n      __typename\n      pocPaymentMethodId\n      paymentMethodId\n      active\n      title\n      subtitle\n    }\n    pocWorkDay {\n      __typename\n      weekDay\n      active\n      workingInterval {\n        __typename\n        openingTime\n        closingTime\n      }\n    }\n    address {\n      __typename\n      address1\n      address2\n      number\n      city\n      province\n      zip\n      coordinates\n    }\n    phone {\n      __typename\n      phoneNumber\n    }\n  }\n}"

  public var now: String
  public var algorithm: String
  public var lat: String
  public var long: String

  public init(now: String, algorithm: String, lat: String, long: String) {
    self.now = now
    self.algorithm = algorithm
    self.lat = lat
    self.long = long
  }

  public var variables: GraphQLMap? {
    return ["now": now, "algorithm": algorithm, "lat": lat, "long": long]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("pocSearch", arguments: ["now": GraphQLVariable("now"), "algorithm": GraphQLVariable("algorithm"), "lat": GraphQLVariable("lat"), "long": GraphQLVariable("long")], type: .list(.object(PocSearch.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(pocSearch: [PocSearch?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "pocSearch": pocSearch.flatMap { (value: [PocSearch?]) -> [Snapshot?] in value.map { (value: PocSearch?) -> Snapshot? in value.flatMap { (value: PocSearch) -> Snapshot in value.snapshot } } }])
    }

    public var pocSearch: [PocSearch?]? {
      get {
        return (snapshot["pocSearch"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [PocSearch?] in value.map { (value: Snapshot?) -> PocSearch? in value.flatMap { (value: Snapshot) -> PocSearch in PocSearch(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [PocSearch?]) -> [Snapshot?] in value.map { (value: PocSearch?) -> Snapshot? in value.flatMap { (value: PocSearch) -> Snapshot in value.snapshot } } }, forKey: "pocSearch")
      }
    }

    public struct PocSearch: GraphQLSelectionSet {
      public static let possibleTypes = ["POC"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("status", type: .nonNull(.scalar(Status.self))),
        GraphQLField("tradingName", type: .scalar(String.self)),
        GraphQLField("officialName", type: .scalar(String.self)),
        GraphQLField("deliveryTypes", type: .list(.object(DeliveryType.selections))),
        GraphQLField("paymentMethods", type: .list(.object(PaymentMethod.selections))),
        GraphQLField("pocWorkDay", type: .list(.object(PocWorkDay.selections))),
        GraphQLField("address", type: .object(Address.selections)),
        GraphQLField("phone", type: .object(Phone.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, status: Status, tradingName: String? = nil, officialName: String? = nil, deliveryTypes: [DeliveryType?]? = nil, paymentMethods: [PaymentMethod?]? = nil, pocWorkDay: [PocWorkDay?]? = nil, address: Address? = nil, phone: Phone? = nil) {
        self.init(snapshot: ["__typename": "POC", "id": id, "status": status, "tradingName": tradingName, "officialName": officialName, "deliveryTypes": deliveryTypes.flatMap { (value: [DeliveryType?]) -> [Snapshot?] in value.map { (value: DeliveryType?) -> Snapshot? in value.flatMap { (value: DeliveryType) -> Snapshot in value.snapshot } } }, "paymentMethods": paymentMethods.flatMap { (value: [PaymentMethod?]) -> [Snapshot?] in value.map { (value: PaymentMethod?) -> Snapshot? in value.flatMap { (value: PaymentMethod) -> Snapshot in value.snapshot } } }, "pocWorkDay": pocWorkDay.flatMap { (value: [PocWorkDay?]) -> [Snapshot?] in value.map { (value: PocWorkDay?) -> Snapshot? in value.flatMap { (value: PocWorkDay) -> Snapshot in value.snapshot } } }, "address": address.flatMap { (value: Address) -> Snapshot in value.snapshot }, "phone": phone.flatMap { (value: Phone) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var status: Status {
        get {
          return snapshot["status"]! as! Status
        }
        set {
          snapshot.updateValue(newValue, forKey: "status")
        }
      }

      public var tradingName: String? {
        get {
          return snapshot["tradingName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "tradingName")
        }
      }

      public var officialName: String? {
        get {
          return snapshot["officialName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "officialName")
        }
      }

      public var deliveryTypes: [DeliveryType?]? {
        get {
          return (snapshot["deliveryTypes"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [DeliveryType?] in value.map { (value: Snapshot?) -> DeliveryType? in value.flatMap { (value: Snapshot) -> DeliveryType in DeliveryType(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [DeliveryType?]) -> [Snapshot?] in value.map { (value: DeliveryType?) -> Snapshot? in value.flatMap { (value: DeliveryType) -> Snapshot in value.snapshot } } }, forKey: "deliveryTypes")
        }
      }

      public var paymentMethods: [PaymentMethod?]? {
        get {
          return (snapshot["paymentMethods"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [PaymentMethod?] in value.map { (value: Snapshot?) -> PaymentMethod? in value.flatMap { (value: Snapshot) -> PaymentMethod in PaymentMethod(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [PaymentMethod?]) -> [Snapshot?] in value.map { (value: PaymentMethod?) -> Snapshot? in value.flatMap { (value: PaymentMethod) -> Snapshot in value.snapshot } } }, forKey: "paymentMethods")
        }
      }

      public var pocWorkDay: [PocWorkDay?]? {
        get {
          return (snapshot["pocWorkDay"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [PocWorkDay?] in value.map { (value: Snapshot?) -> PocWorkDay? in value.flatMap { (value: Snapshot) -> PocWorkDay in PocWorkDay(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [PocWorkDay?]) -> [Snapshot?] in value.map { (value: PocWorkDay?) -> Snapshot? in value.flatMap { (value: PocWorkDay) -> Snapshot in value.snapshot } } }, forKey: "pocWorkDay")
        }
      }

      public var address: Address? {
        get {
          return (snapshot["address"] as? Snapshot).flatMap { Address(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "address")
        }
      }

      public var phone: Phone? {
        get {
          return (snapshot["phone"] as? Snapshot).flatMap { Phone(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "phone")
        }
      }

      public struct DeliveryType: GraphQLSelectionSet {
        public static let possibleTypes = ["POCDeliveryType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pocDeliveryTypeId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("deliveryTypeId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("price", type: .scalar(Double.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("subtitle", type: .scalar(String.self)),
          GraphQLField("active", type: .scalar(Bool.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(pocDeliveryTypeId: GraphQLID, deliveryTypeId: GraphQLID, price: Double? = nil, title: String? = nil, subtitle: String? = nil, active: Bool? = nil) {
          self.init(snapshot: ["__typename": "POCDeliveryType", "pocDeliveryTypeId": pocDeliveryTypeId, "deliveryTypeId": deliveryTypeId, "price": price, "title": title, "subtitle": subtitle, "active": active])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var pocDeliveryTypeId: GraphQLID {
          get {
            return snapshot["pocDeliveryTypeId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "pocDeliveryTypeId")
          }
        }

        public var deliveryTypeId: GraphQLID {
          get {
            return snapshot["deliveryTypeId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "deliveryTypeId")
          }
        }

        public var price: Double? {
          get {
            return snapshot["price"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "price")
          }
        }

        public var title: String? {
          get {
            return snapshot["title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var subtitle: String? {
          get {
            return snapshot["subtitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "subtitle")
          }
        }

        public var active: Bool? {
          get {
            return snapshot["active"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "active")
          }
        }
      }

      public struct PaymentMethod: GraphQLSelectionSet {
        public static let possibleTypes = ["POCPaymentMethod"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pocPaymentMethodId", type: .scalar(GraphQLID.self)),
          GraphQLField("paymentMethodId", type: .scalar(GraphQLID.self)),
          GraphQLField("active", type: .scalar(Bool.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("subtitle", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(pocPaymentMethodId: GraphQLID? = nil, paymentMethodId: GraphQLID? = nil, active: Bool? = nil, title: String? = nil, subtitle: String? = nil) {
          self.init(snapshot: ["__typename": "POCPaymentMethod", "pocPaymentMethodId": pocPaymentMethodId, "paymentMethodId": paymentMethodId, "active": active, "title": title, "subtitle": subtitle])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var pocPaymentMethodId: GraphQLID? {
          get {
            return snapshot["pocPaymentMethodId"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "pocPaymentMethodId")
          }
        }

        public var paymentMethodId: GraphQLID? {
          get {
            return snapshot["paymentMethodId"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "paymentMethodId")
          }
        }

        public var active: Bool? {
          get {
            return snapshot["active"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "active")
          }
        }

        public var title: String? {
          get {
            return snapshot["title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var subtitle: String? {
          get {
            return snapshot["subtitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "subtitle")
          }
        }
      }

      public struct PocWorkDay: GraphQLSelectionSet {
        public static let possibleTypes = ["POCWorkDay"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("weekDay", type: .scalar(Int.self)),
          GraphQLField("active", type: .scalar(Bool.self)),
          GraphQLField("workingInterval", type: .list(.object(WorkingInterval.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(weekDay: Int? = nil, active: Bool? = nil, workingInterval: [WorkingInterval?]? = nil) {
          self.init(snapshot: ["__typename": "POCWorkDay", "weekDay": weekDay, "active": active, "workingInterval": workingInterval.flatMap { (value: [WorkingInterval?]) -> [Snapshot?] in value.map { (value: WorkingInterval?) -> Snapshot? in value.flatMap { (value: WorkingInterval) -> Snapshot in value.snapshot } } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The day of the week
        public var weekDay: Int? {
          get {
            return snapshot["weekDay"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "weekDay")
          }
        }

        /// Sets if the Time is Active or Not
        public var active: Bool? {
          get {
            return snapshot["active"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "active")
          }
        }

        public var workingInterval: [WorkingInterval?]? {
          get {
            return (snapshot["workingInterval"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [WorkingInterval?] in value.map { (value: Snapshot?) -> WorkingInterval? in value.flatMap { (value: Snapshot) -> WorkingInterval in WorkingInterval(snapshot: value) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { (value: [WorkingInterval?]) -> [Snapshot?] in value.map { (value: WorkingInterval?) -> Snapshot? in value.flatMap { (value: WorkingInterval) -> Snapshot in value.snapshot } } }, forKey: "workingInterval")
          }
        }

        public struct WorkingInterval: GraphQLSelectionSet {
          public static let possibleTypes = ["POCWorkingInterval"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("openingTime", type: .nonNull(.scalar(String.self))),
            GraphQLField("closingTime", type: .nonNull(.scalar(String.self))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(openingTime: String, closingTime: String) {
            self.init(snapshot: ["__typename": "POCWorkingInterval", "openingTime": openingTime, "closingTime": closingTime])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var openingTime: String {
            get {
              return snapshot["openingTime"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "openingTime")
            }
          }

          public var closingTime: String {
            get {
              return snapshot["closingTime"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "closingTime")
            }
          }
        }
      }

      public struct Address: GraphQLSelectionSet {
        public static let possibleTypes = ["POCAddress"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("address1", type: .scalar(String.self)),
          GraphQLField("address2", type: .scalar(String.self)),
          GraphQLField("number", type: .scalar(String.self)),
          GraphQLField("city", type: .scalar(String.self)),
          GraphQLField("province", type: .scalar(String.self)),
          GraphQLField("zip", type: .scalar(String.self)),
          GraphQLField("coordinates", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(address1: String? = nil, address2: String? = nil, number: String? = nil, city: String? = nil, province: String? = nil, zip: String? = nil, coordinates: String? = nil) {
          self.init(snapshot: ["__typename": "POCAddress", "address1": address1, "address2": address2, "number": number, "city": city, "province": province, "zip": zip, "coordinates": coordinates])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var address1: String? {
          get {
            return snapshot["address1"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "address1")
          }
        }

        public var address2: String? {
          get {
            return snapshot["address2"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "address2")
          }
        }

        public var number: String? {
          get {
            return snapshot["number"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "number")
          }
        }

        public var city: String? {
          get {
            return snapshot["city"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "city")
          }
        }

        public var province: String? {
          get {
            return snapshot["province"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "province")
          }
        }

        public var zip: String? {
          get {
            return snapshot["zip"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "zip")
          }
        }

        /// POC Coordinates
        public var coordinates: String? {
          get {
            return snapshot["coordinates"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "coordinates")
          }
        }
      }

      public struct Phone: GraphQLSelectionSet {
        public static let possibleTypes = ["POCPhone"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("phoneNumber", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(phoneNumber: String? = nil) {
          self.init(snapshot: ["__typename": "POCPhone", "phoneNumber": phoneNumber])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var phoneNumber: String? {
          get {
            return snapshot["phoneNumber"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "phoneNumber")
          }
        }
      }
    }
  }
}

public final class PocCategorySearchQuery: GraphQLQuery {
  public static let operationString =
    "query pocCategorySearch($id: ID!, $search: String!, $categoryId: Int!) {\n  poc(id: $id) {\n    __typename\n    products(categoryId: $categoryId, search: $search) {\n      __typename\n      productVariants {\n        __typename\n        title\n        description\n        imageUrl\n        price\n      }\n    }\n  }\n}"

  public var id: GraphQLID
  public var search: String
  public var categoryId: Int

  public init(id: GraphQLID, search: String, categoryId: Int) {
    self.id = id
    self.search = search
    self.categoryId = categoryId
  }

  public var variables: GraphQLMap? {
    return ["id": id, "search": search, "categoryId": categoryId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("poc", arguments: ["id": GraphQLVariable("id")], type: .object(Poc.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(poc: Poc? = nil) {
      self.init(snapshot: ["__typename": "Query", "poc": poc.flatMap { (value: Poc) -> Snapshot in value.snapshot }])
    }

    public var poc: Poc? {
      get {
        return (snapshot["poc"] as? Snapshot).flatMap { Poc(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "poc")
      }
    }

    public struct Poc: GraphQLSelectionSet {
      public static let possibleTypes = ["POC"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("products", arguments: ["categoryId": GraphQLVariable("categoryId"), "search": GraphQLVariable("search")], type: .list(.object(Product.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(products: [Product?]? = nil) {
        self.init(snapshot: ["__typename": "POC", "products": products.flatMap { (value: [Product?]) -> [Snapshot?] in value.map { (value: Product?) -> Snapshot? in value.flatMap { (value: Product) -> Snapshot in value.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var products: [Product?]? {
        get {
          return (snapshot["products"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Product?] in value.map { (value: Snapshot?) -> Product? in value.flatMap { (value: Snapshot) -> Product in Product(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [Product?]) -> [Snapshot?] in value.map { (value: Product?) -> Snapshot? in value.flatMap { (value: Product) -> Snapshot in value.snapshot } } }, forKey: "products")
        }
      }

      public struct Product: GraphQLSelectionSet {
        public static let possibleTypes = ["Product"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("productVariants", type: .list(.object(ProductVariant.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(productVariants: [ProductVariant?]? = nil) {
          self.init(snapshot: ["__typename": "Product", "productVariants": productVariants.flatMap { (value: [ProductVariant?]) -> [Snapshot?] in value.map { (value: ProductVariant?) -> Snapshot? in value.flatMap { (value: ProductVariant) -> Snapshot in value.snapshot } } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var productVariants: [ProductVariant?]? {
          get {
            return (snapshot["productVariants"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [ProductVariant?] in value.map { (value: Snapshot?) -> ProductVariant? in value.flatMap { (value: Snapshot) -> ProductVariant in ProductVariant(snapshot: value) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { (value: [ProductVariant?]) -> [Snapshot?] in value.map { (value: ProductVariant?) -> Snapshot? in value.flatMap { (value: ProductVariant) -> Snapshot in value.snapshot } } }, forKey: "productVariants")
          }
        }

        public struct ProductVariant: GraphQLSelectionSet {
          public static let possibleTypes = ["ProductVariant"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("imageUrl", type: .scalar(String.self)),
            GraphQLField("price", type: .scalar(Double.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(title: String, description: String? = nil, imageUrl: String? = nil, price: Double? = nil) {
            self.init(snapshot: ["__typename": "ProductVariant", "title": title, "description": description, "imageUrl": imageUrl, "price": price])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var title: String {
            get {
              return snapshot["title"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var description: String? {
            get {
              return snapshot["description"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "description")
            }
          }

          public var imageUrl: String? {
            get {
              return snapshot["imageUrl"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "imageUrl")
            }
          }

          public var price: Double? {
            get {
              return snapshot["price"] as? Double
            }
            set {
              snapshot.updateValue(newValue, forKey: "price")
            }
          }
        }
      }
    }
  }
}

public final class AllCategoriesSearchQuery: GraphQLQuery {
  public static let operationString =
    "query allCategoriesSearch {\n  allCategory {\n    __typename\n    title\n    id\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allCategory", type: .list(.object(AllCategory.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allCategory: [AllCategory?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "allCategory": allCategory.flatMap { (value: [AllCategory?]) -> [Snapshot?] in value.map { (value: AllCategory?) -> Snapshot? in value.flatMap { (value: AllCategory) -> Snapshot in value.snapshot } } }])
    }

    public var allCategory: [AllCategory?]? {
      get {
        return (snapshot["allCategory"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [AllCategory?] in value.map { (value: Snapshot?) -> AllCategory? in value.flatMap { (value: Snapshot) -> AllCategory in AllCategory(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [AllCategory?]) -> [Snapshot?] in value.map { (value: AllCategory?) -> Snapshot? in value.flatMap { (value: AllCategory) -> Snapshot in value.snapshot } } }, forKey: "allCategory")
      }
    }

    public struct AllCategory: GraphQLSelectionSet {
      public static let possibleTypes = ["Category"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(title: String? = nil, id: GraphQLID? = nil) {
        self.init(snapshot: ["__typename": "Category", "title": title, "id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}