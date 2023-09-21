

import Foundation

struct CharacterDetails: Codable {
	let id : Int?
	let name : String?
	let description : String?
	let modified : String?
	let thumbnail : ImageThumbnail?
	let resourceURI : String?
	let comics : RelatedItems?
	let series : RelatedItems?
	let stories : RelatedItems?
	let events : RelatedItems?
	let urls : [Urls]?
}
