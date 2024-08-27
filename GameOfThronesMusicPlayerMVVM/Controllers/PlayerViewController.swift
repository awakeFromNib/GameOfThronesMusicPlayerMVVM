//
//  PlayerViewController.swift
//  GameOfThronesMusicPlayer
//
//  Created by Sergei Anisimov on 12.06.2024.
//

import AVFoundation
import UIKit

class PlayerViewController: UIViewController {

	private let viewModel: PlayerViewViewModel

	/*private*/ let playerView: PlayerView

	init(viewModel: PlayerViewViewModel/*, playerView: PlayerView*/) {
		self.viewModel = viewModel
		self.playerView = PlayerView(frame: .zero, viewModel: viewModel)
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
//		player?.play()

		view.backgroundColor = .systemBackground
		view.addSubview(playerView)
		addConstraints()
	}

	private func addConstraints() {
		NSLayoutConstraint.activate([
			playerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			playerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			playerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
			playerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		if playerView.holder.subviews.count == 0 {
			playerView.configure()
		}
	}


//	// MARK: - Configure
//	func configure() {
//		// MARK: - set up player
//		let song = songs[position]
//		let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
//		do {
//			try AVAudioSession.sharedInstance().setMode(.default)
//			try AVAudioSession.sharedInstance().setCategory(.playback)
//			try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
//
//			guard let urlString = urlString else { return }
//			player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
//
//			guard let player = player else { return }
//			player.play()
//
//			player.delegate = self
//
//			// MARK: - track timer
//			if timer == nil {
//				timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
//				trackSlider.value = 0.0
//				trackSlider.maximumValue = Float(player.duration)
//				trackSlider.thumbTintColor = .systemBackground
//			}
//		}
//		catch {
//			print("Error occurred")
//		}
//
//		// MARK: - Set up user interface elements
//		// album cover
//		albumImageView.frame = CGRect(x: 10,
//									  y: 10,
//									  width: holder.frame.size.width-20,
//									  height: holder.frame.size.width-20)
//		albumImageView.image = UIImage(named: song.imageName)
//		holder.addSubview(albumImageView)
//
//		// MARK: - Labels: Song name, album, artist
//		songNameLabel.frame = CGRect(x: 10,
//									 y: albumImageView.frame.size.height + 10,
//									 width: holder.frame.size.width-20,
//									 height: 70)
//
//		artistNameLabel.frame = CGRect(x: 10,
//									   y: albumImageView.frame.size.height + 10 + 30,
//									   width: holder.frame.size.width-20,
//									   height: 80)
//
//		songNameLabel.text = song.trackName
//		artistNameLabel.text = song.artistName
//
//		holder.addSubview(songNameLabel)
//		holder.addSubview(artistNameLabel)
//		holder.addSubviews(leftTimeLabel)
//
//		// MARK: - Player controls
//		let nextButton = UIButton()
//		let backButton = UIButton()
//
//		// MARK: - Frame
//		let yPosition = artistNameLabel.frame.origin.y + 100 + 50
//		let size: CGFloat = 30
//
//		playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
//									   y: yPosition,
//									   width: size,
//									   height: size)
//
//		nextButton.frame = CGRect(x: holder.frame.size.width - size - 100,
//								  y: yPosition,
//								  width: size,
//								  height: size)
//
//		backButton.frame = CGRect(x: 100,
//								  y: yPosition,
//								  width: size,
//								  height: size)
//
//		// MARK: - Add actions
//		playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
//		nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
//		backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
//
//		// MARK: - Styling
//		playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
//		backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
//		nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
//
//		playPauseButton.tintColor = .label
//		backButton.tintColor = .label
//		nextButton.tintColor = .label
//
//		holder.addSubview(playPauseButton)
//		holder.addSubview(nextButton)
//		holder.addSubview(backButton)
//
//
//		// MARK: - Volume slider
//		let volumeSlider = UISlider(frame: CGRect(x: 20,
//												  y: holder.frame.size.height-100,
//												  width: holder.frame.size.width-40,
//												  height: 50))
//		
//		let volumeSliderCurrentThumbImage: UIImage = {
//			var thumbImage = UIImage()
//			thumbImage = UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))!.withTintColor(.systemGray3, renderingMode: .alwaysOriginal)
//			return thumbImage
//		}()
//
//		volumeSlider.setThumbImage(volumeSliderCurrentThumbImage, for: .normal)
//		volumeSlider.minimumValueImage = UIImage(systemName: "speaker.1.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.systemGray3, renderingMode: .alwaysOriginal)
//		volumeSlider.maximumValueImage = UIImage(systemName: "speaker.3.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.systemGray3, renderingMode: .alwaysOriginal)
//		volumeSlider.minimumTrackTintColor = .darkGray
//		volumeSlider.minimumValue = 0.0
//		volumeSlider.maximumValue = 1.0
//		volumeSlider.value = 1.0
//		volumeSlider.addTarget(self, action: #selector(didSlideVolumeSlider(_:)), for: .valueChanged)
//		holder.addSubview(volumeSlider)
//
//		//MARK: - Track slider
//		trackSlider.frame = CGRect(x: 20,
//								   y: holder.frame.size.height-350,
//								   width: holder.frame.size.width-40,
//								   height: 140)
//
//		let trackSliderCurrentThumbImage: UIImage = {
//			var thumbImage = UIImage()
//			thumbImage = UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))!.withTintColor(.systemGray3, renderingMode: .alwaysOriginal)
//			return thumbImage
//		}()
//
//		trackSlider.setThumbImage(trackSliderCurrentThumbImage, for: .normal)
//		trackSlider.minimumTrackTintColor = .darkGray
//		trackSlider.value = 0.0
//		trackSlider.maximumValue = Float(player!.duration)
//		trackSlider.value = Float(player!.currentTime)
//		trackSlider.addTarget(self, action: #selector(trackSliderAction), for: .valueChanged)
//		holder.addSubview(trackSlider)
//
//		// MARK: - Left Timer Label
//		leftTimeLabel.frame = CGRect(x: 20,
//									 y: holder.frame.size.height-265,
//									 width: 50,
//									 height: 20)
//		// MARK: -  Configure end
//	}

//	private func formattedTime() -> String {
//		let minutes = Int(Double(player!.currentTime)) / 60
//		let seconds = Int(Double(player!.currentTime)) % 60
//		return String(format: "%02d:%02d", minutes, seconds)
//	}

//	@objc
//	private func updateProgress() {
//		trackSlider.value = Float(player!.currentTime)
//
//		leftTimeLabel.text = formattedTime()
//	}

//	@objc func didTapBackButton() {
//		if position > 0 {
//			position = position - 1
//			player?.stop()
//			for subview in holder.subviews {
//				subview.removeFromSuperview()
//			}
//			configure()
//		}
//	} // end

//	@objc func didTapNextButton() {
//		if position < (songs.count - 1) {
//			position = position + 1
//			player?.stop()
//			for subview in holder.subviews {
//				subview.removeFromSuperview()
//			}
//			configure()
//		}
//	}

//	@objc func didTapPlayPauseButton() {
//		if player?.isPlaying == true {
//			// pause
//			player?.stop()
//			// show play button
//			playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
//
//			// shrink image
//			shrinkImage()
//		}
//		else {
//			// play
//			player?.play()
//			playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
//
//			// increase image size
//			expandImage()
//		}
//	} // func end

//	private func shrinkImage() {
//		UIView.animate(withDuration: 0.2, animations: {
//			self.albumImageView.frame = CGRect(x: 30,
//											   y: 30,
//											   width: self.holder.frame.size.width-60,
//											   height: self.holder.frame.size.width-60)
//		})
//	}
//
//	private func expandImage() {
//		UIView.animate(withDuration: 0.2, animations: {
//			self.albumImageView.frame = CGRect(x: 10,
//											   y: 10,
//											   width: self.holder.frame.size.width-20,
//											   height: self.holder.frame.size.width-20)
//		})
//	}

//	@objc func didSlideVolumeSlider(_ slider: UISlider) {
//		let value = slider.value
//		player?.volume = value
//	}

	// MARK: - Track Slider Action
//	@objc private func trackSliderAction() {
//		if player?.isPlaying == true {
//			player?.pause()
//			let currentTime = Float64(trackSlider.value)
//			player?.currentTime = TimeInterval(currentTime)
//			player?.play()
//		} else {
//			player?.stop()
//			let currentTime = Float64(trackSlider.value)
//			player?.currentTime = TimeInterval(currentTime)
////			player?.pause()
//		}
//	} // end

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		if case playerView.player = playerView.player {
			playerView.player?.stop()
			playerView.shrinkImage()
			playerView.playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
		}
	}
	// MARK: - Class end
}

// MARK: - Delegate
extension PlayerViewController: AVAudioPlayerDelegate {

	func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
		if flag == true {
			NotificationCenter.default.post(name: NSNotification.Name("Finish"), object: nil)
			player.stop()
			playerView.playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
			playerView.shrinkImage()
		}
	}
}
