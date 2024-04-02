const translations = {
  ja: {
    play: "踊る",
    pause: "おとなしくする",
  },
  pt: {
    play: "Dançar",
    pause: "Parar",
  }
};

const lang = document.documentElement.lang;

function translate(key) {
  return translations[lang] ? translations[lang][key] : key;
}

document.addEventListener('DOMContentLoaded', () => {
  const playButton = document.getElementById('playButton');
  const audioPlayer = document.getElementById('audioPlayer');

  if (playButton && audioPlayer) {
    playButton.addEventListener('click', () => {
      if (audioPlayer.paused) {
        audioPlayer.play();
        playButton.textContent = translate('pause');
      } else {
        audioPlayer.pause();
        playButton.textContent = translate('play');
      }
    });

    audioPlayer.addEventListener('ended', () => {
      playButton.textContent = translate('play');
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
      });
      this.classList.remove('bg-yellow-500');
      this.classList.add('bg-yellow-300');
    });
  });
});

document.addEventListener('DOMContentLoaded', () => {
  const songOptions = document.querySelectorAll('.nekosong-option');

  songOptions.forEach(option => {
    option.addEventListener('click', function() {
      songOptions.forEach(opt => {
        opt.classList.remove('bg-red-400');
        opt.classList.add('bg-red-300');
      });
      this.classList.remove('bg-red-300');
      this.classList.add('bg-red-100');
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

document.addEventListener('DOMContentLoaded', () => {
  const songOptions = document.querySelectorAll('.nekosong-option');
  const selectedSongIdField = document.getElementById('selected_song_id');
  songOptions.forEach(option => {
    option.addEventListener('click', function() {
      selectedSongIdField.value = this.dataset.songId;
    });
  });
});