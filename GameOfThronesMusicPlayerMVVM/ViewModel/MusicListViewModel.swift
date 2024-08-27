//
//  MusicListViewModel.swift
//  GameOfThronesMusicPlayer
//
//  Created by Alex Murphy on 02.08.2024.
//

import UIKit

protocol MusicListViewViewModelDelegate: AnyObject {
	func didLoadAllSongs()
	func didSelectSong(_ song: Song)
}

final class MusicListViewModel: NSObject {

	public weak var delegate: MusicListViewViewModelDelegate?

	private var songs: [Song] = [] {
		didSet {
			for song in songs {
				let viewModel = MusicListTableViewCellViewModel(song)
				if !cellViewModels.contains(viewModel) {
					cellViewModels.append(viewModel)
					DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
						self.delegate?.didLoadAllSongs()
					}
				}
			}
		}
	}

	private var cellViewModels: [MusicListTableViewCellViewModel] = []

	func numberOfSections() -> Int {
		1
	}

	func numberOfRows(_ section: Int) -> Int {
		songs.count
	}

	func configureSongs() {
		songs.append(Song(name: "Main Title",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones1",
						  trackName: "MainTitle"))
		songs.append(Song(name: "The Red Woman",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones6",
						  trackName: "TheRedWoman"))
		songs.append(Song(name: "Light Of The Seven",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones6",
						  trackName: "LightoftheSeven"))
		songs.append(Song(name: "Mhysa",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones3",
						  trackName: "Mhysa"))
		songs.append(Song(name: "Khaleesi",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones6",
						  trackName: "Khaleesi"))
		songs.append(Song(name: "House of Black and White",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones5",
						  trackName: "HouseofBlackandWhite"))
		songs.append(Song(name: "A Raven From Kings Landing",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones1",
						  trackName: "ARavenFromKingsLanding"))
		songs.append(Song(name: "Winter Is Here",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones7",
						  trackName: "WinterIsHere"))
		songs.append(Song(name: "Mother Of Dragons",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones2",
						  trackName: "WinterIsHere"))
		songs.append(Song(name: "FINALE",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones1",
						  trackName: "Finale"))
		songs.append(Song(name: "Blood of the Dragon",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones5",
						  trackName: "BloodOfTheDragon"))
		songs.append(Song(name: "Dance of the Dragons",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones5",
						  trackName: "DanceOfDragons"))
		songs.append(Song(name: "The Old Gods And The New",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones2",
						  trackName: "TheOldGodsAndTheNew"))
		songs.append(Song(name: "Warrior Of Light",
						  albumName: "Game Of Thrones OST",
						  artistName: "Ramin Djawadi",
						  imageName: "gameofthrones2",
						  trackName: "WarriorOfLight"))
	}
}

extension MusicListViewModel: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		cellViewModels.count

	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: MusicTableViewCell.cellIdentifier,
			for: indexPath) as? MusicTableViewCell else {
			return UITableViewCell()
		}

		cell.configure(with: cellViewModels[indexPath.row])
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		100
	}

	// MARK: - Function where transition calls
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		// MARK: - Present the player
		let position = indexPath.row
//		print(position)
		let song = songs[position]
//
		delegate?.didSelectSong(song)


	}
}
