/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],

  theme: {
    extend: {
      colors: {
        purple:{
        650: '#544092',
        660:'#725DB4'
        }
      }
    },
      safelist: ['py-2', 'py-4', 'px-2', 'px-4'],
  },
  plugins: [  ],
}
