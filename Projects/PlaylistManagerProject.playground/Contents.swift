import UIKit

struct Song{
    let title: String
    let artist: String
    let duration: Int
}

class PlayList {
    let name: String
    let author: String
    var songs: [Song]
    var currentlyPlaying: Int?
    
    init(name: String, author: String, songs: [Song]) {
        self.name = name
        self.author = author
        self.songs = songs
    }
    
    // Core mutation functions
    func add(_ song: Song) {
        songs += [song]
    }
    
    func remove(at index: Int){
        songs.remove(at: index - 1)
    }
    
    func clear() {
        songs.removeAll()
    }
    
    // Querying functions
    var count: Int {
        get {
            songs.count
        }
    }
    
    func allSongs() -> [Song] {
        songs
    }
    
    func totalDuration() -> Int {
        var total = 0
        for song in songs {
            total += song.duration
        }
        return total
    }
    
    func currentSong() -> Song? {
        return if let currentlyPlaying {
           songs[currentlyPlaying]
        } else {
            nil
        }
    }
    
    // Playback navigation
    func play(at index: Int) {
      currentlyPlaying = index - 1
    }
    
    func playnext() {
        if let currentlyPlaying {
            self.currentlyPlaying = currentlyPlaying + 1
        }
    }
    
    func playPrevious() {
        if let currentlyPlaying {
            self.currentlyPlaying = currentlyPlaying - 1
        }
    }

    // Shuffle and Sort
    func shuffle() {
        songs = songs.shuffled()
    }
    
    func sortSongTitle() {
       songs = songs.sorted { $0.title < $1.title }
    }
    
    func sortSongArtist() {
        songs = songs.sorted { $0.artist < $1.artist }
    }
    
    func sortSongDuration() {
        songs = songs.sorted { $0.duration > $1.duration}
    }
    
    func moveSongNumber(_ song: Int, to index: Int) {
        let songMoved = songs.remove(at: song - 1)
        songs.insert(songMoved, at: index - 1)
    }
    
}



let song1 = Song(title: "Alone Together", artist: "Fall Out Boy", duration: 4)
let song2 = Song(title: "The Middle", artist: "Jimmy Eat World", duration: 3)
let song3 = Song(title: "Bad Liar", artist: "Imagine Dragons", duration: 5)
let song4 = Song(title: "Just Pretend", artist: "Bad Omens", duration: 2)
var myPlaylist = PlayList(name: "My Jams", author: "Logan", songs: [song1, song2, song3, song4])

myPlaylist.play(at: 1)
myPlaylist.currentSong()
myPlaylist.moveSongNumber(1, to: 3)
print(myPlaylist.allSongs())
