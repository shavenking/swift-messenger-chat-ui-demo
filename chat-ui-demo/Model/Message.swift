import Foundation

class Message {
    var from: Int
    var to: Int
    var text: String
    
    init(from: Int, to: Int, text: String) {
        self.from = from
        self.to = to
        self.text = text
    }
}
