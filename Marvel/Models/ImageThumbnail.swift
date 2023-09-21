
import Foundation

struct ImageThumbnail: Codable {
	let path: String?
	let extensionString: String?

	enum CodingKeys: String, CodingKey {
		case path = "path"
		case extensionString = "extension"
	}
}
