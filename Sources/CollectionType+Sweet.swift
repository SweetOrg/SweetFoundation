import Foundation

extension Collection where Index == Int {
    typealias InternalElement = Iterator.Element

    func enumeratedWithNext() -> [(Iterator.Element, Iterator.Element)] {
        let count: Int = self.count
        var enumeratedItems = [(InternalElement, InternalElement)]()

        for (index, item) in self.enumerated() {
            var nextItem: Iterator.Element? = .none
            let nextIndex = index + 1

            if nextIndex < count {
                nextItem = self[nextIndex]
                if let nextItem = nextItem {
                    enumeratedItems.append((item, nextItem))
                }
            }
        }

        return enumeratedItems
    }
}
