//função pra alterar as frases na section do filtro da pagina destinow

const frases = [
    "Sua próxima viagem começa aqui. Vamos encontrar o destino perfeito!",
    "Encontre o destino dos seus sonhos!",
    "Pronto para a próxima aventura? Vamos encontrar seu destino!",
    "Procurando um lugar inesquecível? Vamos ajudar!",
    "Onde você quer estar? Descubra seu próximo destino!"
];

let contador = 0;

function mudarFrase() {
    document.getElementById("frase").textContent = frases[contador];

    contador = (contador + 1) % frases.length;
}

setInterval(mudarFrase, 10000);


//função para armazenar informação de login temporariamente e direcionar para destinos após login

document.getElementById("login").addEventListener("submit", function(event) {
    event.preventDefault();
    const username = document.getElementById("username").value;
    
    localStorage.setItem("username", username);
    window.location.href = "destinos.html";
});