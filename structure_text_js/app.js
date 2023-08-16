let data = [{
    type: 'div', children: [
        { type: 'h1', children: [{ type: 'p', text: 'abtc' }] },
        {
            type: 'ul', children: [
                { type: 'li', text: 'item 1' },
                { type: 'li', text: 'item 2' }
            ]
        }
    ]
}
]



function accessElements(data, parentElement) {
    data.forEach(item => {
        var element = document.createElement(item.type);
        
        if(item.text){
            var txtElement = document.createTextNode(item.text);
            element.appendChild(txtElement);
        }

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