document.getElementById('cambiarColor').addEventListener('click', function() {
    var colores = ['red', 'green', 'blue', 'orange', 'purple', 'black'];
    var indice = Math.floor(Math.random() * colores.length);
    document.body.style.backgroundColor = colores[indice];
});