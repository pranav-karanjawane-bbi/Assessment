
let data = [
    {
        type: 'div',
        children: [
            { type: 'h1', children: [{ type: 'p' }] },
            {
                type: 'ul', children: [
                    { type: 'li' },
                    { type: 'li' }
                ]
            }
        ]
    }
]



function accessElements(data, parentElement) {
    data.forEach(item => {
        var element = document.createElement(item.type);

        if (!parentElement) {
            document.body.appendChild(element);
        } else {
            parentElement.appendChild(element);
        }

        if (item.children) {
            accessElements(item.children, element);
        }
    });
}

accessElements(data);






