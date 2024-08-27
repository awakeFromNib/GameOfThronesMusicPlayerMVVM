//
//  PlayerViewViewModel.swift
//  GameOfThronesMusicPlayer
//
//  Created by Alex Murphy on 17.08.2024.
//

import Foundation

class PlayerViewViewModel {
	let name: String
//	let albumName: String
	let artistName: String
	let imageName: String
	let trackName: String

	init(song: Song) {
		self.name = song.name
//		let albumName: String
		self.artistName = song.artistName
		self.imageName = song.imageName
		self.trackName = song.trackName
	}
}
