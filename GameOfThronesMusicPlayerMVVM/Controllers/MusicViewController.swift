//
//  MusicViewController.swift
//  GameOfThronesMusicPlayer
//
//  Created by Sergei Anisimov on 12.06.2024.
//

import UIKit

final class MusicViewController: UIViewController, MusicListViewDelegate {

	private let musicListView = MusicListView()

	override func viewDidLoad() {
		super.viewDidLoad()

		setupNavigationBar()
		setUpView()
	}

	//	// MARK: - Setup Navigation Bar
	public func setupNavigationBar() {
		title = "Music"
		navigationController?.navigationBar.prefersLargeTitles = false
		let navBarAppearance = UINavigationBarAppearance()
		navBarAppearance.backgroundColor = .clear
		navigationController?.navigationBar.standardAppearance = navBarAppearance
		navigationController?.navigationBar.standardAppearance = navBarAppearance
		navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
		//		let editingItem = UIBarButtonItem(title: tableView.isEditing ? "Done" : "Edit", style: .plain, target: self, action: #selector(moveRows))
		//		editingItem.tintColor = .label
		//		navigationItem.rightBarButtonItems = [editingItem]
	}

	//	@objc
	//	private func moveRows() {
	//		tableView.setEditing(!tableView.isEditing, animated: true)
	//		setupNavigationBar()
	//		tableView.reloadData()
	//	}

	private func setUpView() {
		view.backgroundColor = .systemBackground
		musicListView.delegate = self
		view.addSubview(musicListView)
		NSLayoutConstraint.activate([
			musicListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			musicListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			musicListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
			musicListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}

	// MARK: - MusicListViewDelegate
//	func allSongsListView(_ musicListView: MusicListView, didSelectSong song: Song) {
//		let viewModel = PlayerViewViewModel(song: song)
//
//		let songVC = PlayerViewController(viewModel: viewModel)
//		
//
//		songVC.navigationItem.largeTitleDisplayMode = .never
//		navigationController?.pushViewController(songVC, animated: true)
//	}

	func allSongsListView(_ musicListView: MusicListView, didSelectSong song: Song) {
		let viewModel = PlayerViewViewModel(song: song)
		let songVC = PlayerViewController(viewModel: viewModel)
//		let position = position
		songVC.navigationItem.largeTitleDisplayMode = .never
		navigationController?.pushViewController(songVC, animated: true)
	}
}


