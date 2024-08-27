//
//  MusicTableViewCell.swift
//  GameOfThronesMusicPlayer
//
//  Created by Sergei Anisimov on 12.06.2024.
//

import UIKit

final class MusicTableViewCell: UITableViewCell {

	static let cellIdentifier = "MusicTableViewCell"

	private let coverImage: UIImageView = {
		let cover = UIImageView()
		cover.clipsToBounds = true
		cover.layer.cornerRadius = 8
		cover.contentMode = .scaleAspectFill
		cover.translatesAutoresizingMaskIntoConstraints = false
		return cover
	}()

	private let songLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
//		label.font = .systemFont(ofSize: 15, weight: .regular)
		label.font = .GameOfThrones.basic.size(of: 14)
		label.textColor = .secondaryLabel
		return label
	}()

	private let artistLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
//		label.font = .systemFont(ofSize: 15, weight: .light)
		label.font = .GameOfThrones.basic.size(of: 10)
		label.textColor = .secondaryLabel
		return label
	}()

	private var labelStackView = UIStackView()

	override init(style: MusicTableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setUpView()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		coverImage.image = nil
		songLabel.text = nil
		artistLabel.text = nil
	}

//	override func layoutSubviews() {
//		super.layoutSubviews()
//	}


	private func setUpView() {
		labelStackView = UIStackView(arrangedSubviews: [songLabel, artistLabel])
		labelStackView.axis = .vertical
		labelStackView.spacing = 20
		labelStackView.translatesAutoresizingMaskIntoConstraints = false

		addSubviews(coverImage, labelStackView)
		addConstraints()
	}

	private func addConstraints() {
		NSLayoutConstraint.activate([
			coverImage.centerYAnchor.constraint(equalTo: centerYAnchor),
			coverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			coverImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
			coverImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),

			labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
			labelStackView.leadingAnchor.constraint(equalTo: coverImage.trailingAnchor, constant: 10),
			labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
		])
	}

	func configure(with viewModel: MusicListTableViewCellViewModel) {
		coverImage.image = UIImage(named: viewModel.coverImage)
		songLabel.text = viewModel.name
		artistLabel.text = viewModel.artistName
	}
}
