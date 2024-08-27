//
//  MusicListView.swift
//  GameOfThronesMusicPlayer
//
//  Created by Alex Murphy on 02.08.2024.
//

import UIKit

protocol MusicListViewDelegate: AnyObject {
	func allSongsListView(_ musicListView: MusicListView, didSelectSong song: Song)
}

final class MusicListView: UIView, MusicListViewViewModelDelegate {

	public weak var delegate: MusicListViewDelegate?
	public let viewModel = MusicListViewModel()

	private lazy var musicListTableView: UITableView = {
		let table = UITableView()
		table.alpha = 0
		table.isHidden = true
		table.translatesAutoresizingMaskIntoConstraints = false
		table.register(MusicTableViewCell.self, forCellReuseIdentifier: MusicTableViewCell.cellIdentifier)
		return table
	}()

	// MARK: - Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .clear
		addSubviews(musicListTableView)
		addConstraints()
		viewModel.delegate = self
		viewModel.configureSongs()
		setUpTableView()
	}

	required init?(coder: NSCoder) {
		fatalError("Unsupported")
	}

	private func setUpTableView() {
		musicListTableView.delegate = viewModel
		musicListTableView.dataSource = viewModel
	}

	private func addConstraints() {
		NSLayoutConstraint.activate([
			musicListTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			musicListTableView.leftAnchor.constraint(equalTo: leftAnchor),
			musicListTableView.rightAnchor.constraint(equalTo: rightAnchor),
			musicListTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
		])
	}
}

extension MusicListView: MusicListViewDelegate {
	func allSongsListView(_ musicListView: MusicListView, didSelectSong song: Song) {
		delegate?.allSongsListView(self, didSelectSong: song)
	}

	func didLoadAllSongs() {
		musicListTableView.isHidden = false
		musicListTableView.reloadData()
		UIView.animate(withDuration: 0.4, delay: 0, options: .layoutSubviews) {
			self.musicListTableView.alpha = 1
		}
	}

	func didSelectSong(_ song: Song) {
		delegate?.allSongsListView(self, didSelectSong: song)
	}
}
