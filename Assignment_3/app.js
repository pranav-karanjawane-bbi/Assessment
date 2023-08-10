const rectangles = document.querySelectorAll('.rectangle');

rectangles.forEach(rectangle => {
    rectangle.addEventListener('click', () => {
        rectangles.forEach(rect => {
            if (rect === rectangle) {
                rect.style.backgroundColor = 'black';
            } else {
                rect.style.backgroundColor = 'white';
            }
        });
    });
});


