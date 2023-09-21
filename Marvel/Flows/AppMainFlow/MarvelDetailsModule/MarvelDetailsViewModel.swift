//
//  MarvelDetailsViewModel.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-21.
//

import UIKit

enum SectionType {
    case comics
    case events
    case stories
    case series
}

final class MarvelDetailsViewModel {
    
    typealias Dependencies = HasUserDefaultsService
    private let dependencies: Dependencies

    private var character: CharacterDetails

    init(character: CharacterDetails, dependencies: Dependencies) {
        self.character = character
        self.dependencies = dependencies
    }

    var id: Int {
        character.id ?? 0
    }

    var copyrightText: String? {
        return dependencies.userDefaultsService.marvelCopyright
    }

    var availableSections: [SectionType] {
        var sections: [SectionType] = []
        if !firstThreeComics.isEmpty { sections.append(.comics) }
        if !firstThreeEvents.isEmpty { sections.append(.events) }
        if !firstThreeStories.isEmpty { sections.append(.stories) }
        if !firstThreeSeries.isEmpty { sections.append(.series) }
        return sections
    }

    var firstThreeComics: [Item] {
        Array(character.comics?.items?.prefixSafe(3) ?? [])
    }

    var firstThreeEvents: [Item] {
        Array(character.events?.items?.prefixSafe(3) ?? [])
    }

    var firstThreeStories: [Item] {
        Array(character.stories?.items?.prefixSafe(3) ?? [])
    }

    var firstThreeSeries: [Item] {
        Array(character.series?.items?.prefixSafe(3) ?? [])
    }

    func items(for section: SectionType) -> [Item] {
        switch section {
        case .comics: return firstThreeComics
        case .events: return firstThreeEvents
        case .stories: return firstThreeStories
        case .series: return firstThreeSeries
        }
    }

    func title(for section: SectionType) -> String {
        switch section {
        case .comics: return "COMICS"
        case .events: return "EVENTS"
        case .stories: return "STORIES"
        case .series: return "SERIES"
        }
    }
}
