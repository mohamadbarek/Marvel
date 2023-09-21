
import Foundation

struct MarvelAPIResponse: Codable {
	let code: Int?
	let status: String?
	let copyright: String?
	let attributionText: String?
	let attributionHTML: String?
	let etag: String?
	let data: MarvelData?
}
