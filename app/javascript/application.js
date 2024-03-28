document.addEventListener('DOMContentLoaded', () => {
  const playButton = document.getElementById('playButton');
  const audioPlayer = document.getElementById('audioPlayer');

  if (playButton && audioPlayer) {
    playButton.addEventListener('click', () => {
      if (audioPlayer.paused) {
        audioPlayer.play();
        playButton.textContent = 'おとなしくする';
      } else {
        audioPlayer.pause();
        playButton.textContent = '踊る';
      }
    });
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const songOptions = document.querySelectorAll('.song-option');

  songOptions.forEach(option => {
    option.addEventListener('click', function() {
      songOptions.forEach(opt => {
        opt.classList.remove('bg-yellow-400');
        opt.classList.add('bg-yellow-500');
        opt.classList.remove('hover:bg-yellow-600');
        opt.classList.add('hover:bg-yellow-600');
      });
      this.classList.remove('bg-yellow-500');
      this.classList.add('bg-yellow-300');
    });
  });
});

document.addEventListener('DOMContentLoaded', () => {
  // 曲の選択肢を取得
  const songOptions = document.querySelectorAll('.song-option');
  // hidden_fieldを取得
  const selectedSongIdField = document.getElementById('selected_song_id');

  // それぞれの選択肢に対してクリックイベントを設定
  songOptions.forEach(option => {
    option.addEventListener('click', function() {
      // 選択された曲のIDをhidden_fieldにセット
      selectedSongIdField.value = this.dataset.songId;
    });
  });
});