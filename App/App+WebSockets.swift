import Vapor

extension WebSocket {
    func send(_ json: JSON) throws {
        try send(json.makeBytes().makeString())
    }
}
