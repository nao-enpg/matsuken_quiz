document.addEventListener('DOMContentLoaded', () => {
  const playButton = document.getElementById('playButton');
  const audioPlayer = document.getElementById('audioPlayer');

  if (playButton && audioPlayer) {
    playButton.addEventListener('click', () => {
      if (audioPlayer.paused) {
        audioPlayer.play();
        playButton.textContent = 'Pause';
      } else {
        audioPlayer.pause();
        playButton.textContent = 'Play';
      }
    });
  }
});