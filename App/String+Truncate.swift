import Foundation

extension String {
    func truncated(to max: Int) -> String {
        return String(characters.prefix(max))
    }
}
