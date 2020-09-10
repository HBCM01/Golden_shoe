import Typed from 'typed.js';

const newText = () => {
const text = document.getElementById("typed");
  if (text) {
    new Typed("#typed", {
      strings: ['Boots', 'Trainers', 'Slippers'],
      typeSpeed: 70,
      loop: true
    });
  }
}
export { newText };
