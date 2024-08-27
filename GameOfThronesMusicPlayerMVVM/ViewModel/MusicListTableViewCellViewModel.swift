//
//  MusicListTableViewCellViewModel.swift
//  GameOfThronesMusicPlayer
//
//  Created by Alex Murphy on 02.08.2024.
//

import Foundation

final class MusicListTableViewCellViewModel: Hashable, Equatable {

	var coverImage: String
	var name: String
	var artistName: String

	init(_ song: Song) {
		self.coverImage = song.imageName
		self.name = song.name
		self.artistName = song.artistName
	}

	// MARK: - Hashable
	func hash(into hasher: inout Hasher) {
		hasher.combine(coverImage)
		hasher.combine(name)
		hasher.combine(artistName)
	}

	static func == (lhs: MusicListTableViewCellViewModel, rhs: MusicListTableViewCellViewModel) -> Bool {
		return lhs.hashValue == rhs.hashValue
	}
}
