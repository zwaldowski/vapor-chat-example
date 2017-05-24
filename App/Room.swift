import Vapor

class Room {
    var connections: [String: WebSocket] = [:]

    func bot(_ message: String) {
        send(name: "Bot", message: message)
    }

    func send(name: String, message: String) {
        let messageNode: [String: NodeRepresentable] = [
            "username": name,
            "message": message.truncated(to: 256)
        ]

        guard let json = try? JSON(node: messageNode) else {
            return
        }

        for (username, socket) in connections {
            guard username != name else {
                continue
            }

            try? socket.send(json)
        }
    }
}
