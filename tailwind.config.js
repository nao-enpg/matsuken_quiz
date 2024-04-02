module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        samba: ['Yuji Syuku', 'serif'],
        nekosamba: ['Hachi Maru Pop', 'cursive'],
      }
    }
  },
  plugins: [
    require('daisyui')
  ],
  daisyui: {
    themes: [
    ],
  },
}
