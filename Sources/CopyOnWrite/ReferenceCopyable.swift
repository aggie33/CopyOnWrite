/// A type that can be copied.
public protocol ReferenceCopyable: AnyObject {
    associatedtype Mutable: ReferenceCopyable where Mutable.Mutable == Mutable
    
    /// Makes a mutable copy of `self`.
    func mutableCopy() -> Mutable
}

/// An immutable-mutable pair of reference types.
public protocol PairReferenceCopyable: ReferenceCopyable where Mutable: PairReferenceCopyable, Mutable.Immutable == Immutable {
    /// The immutable version.
    associatedtype Immutable: PairReferenceCopyable where Immutable.Immutable == Immutable, Immutable.Mutable == Mutable
    
    /// Returns `self` casted as the immutable variety.
    var immutable: Immutable { get }
}
