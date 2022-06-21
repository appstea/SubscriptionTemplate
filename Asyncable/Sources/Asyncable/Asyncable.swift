public protocol IAsyncable { }

public extension IAsyncable {
  var async: Async<Self> { .init(self) }
  static var async: Async<Self.Type> { .init(self) }
}

public struct Async<Base> {

  let base: Base
  static var base: Base.Type { Base.self }

  fileprivate init(_ base: Base) {
    self.base = base
  }

}
