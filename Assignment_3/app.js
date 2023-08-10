const rectangle1 = document.getElementById('rectangle1');
const rectangle2 = document.getElementById('rectangle2');
const rectangle3 = document.getElementById('rectangle3');

rectangle1.addEventListener('click', () => {
    rectangle1.style.backgroundColor = 'black';
    rectangle2.style.backgroundColor = 'white';
    rectangle3.style.backgroundColor = 'white';
});

rectangle2.addEventListener('click', () => {
    rectangle1.style.backgroundColor = 'white';
    rectangle2.style.backgroundColor = 'black';
    rectangle3.style.backgroundColor = 'white';
});

rectangle3.addEventListener('click', () => {
    rectangle1.style.backgroundColor = 'white';
    rectangle2.style.backgroundColor = 'white';
    rectangle3.style.backgroundColor = 'black';
});


