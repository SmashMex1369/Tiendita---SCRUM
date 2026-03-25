fetch('obtener_productos.php')
    .then(response => response.json())
    .then(data => {
        const contenedor = document.getElementById('productos-container');

        data.forEach(producto => {
            const card = document.createElement('div');
            card.classList.add('producto-card');

            card.innerHTML = `
                <div class="producto-nombre">${producto.Nombre}</div>
                <div class="producto-precio">$${producto.Precio}</div>
                <div class="producto-disponible">Disponible: ${producto.Existencias}</div>
                <button class="producto-add">+</button>
            `;

            contenedor.appendChild(card);
        });
    })
    .catch(error => console.error('Error:', error));