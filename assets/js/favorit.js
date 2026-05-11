function toggleFavorit(nama, el) {
    let data = JSON.parse(localStorage.getItem("favorit")) || [];

    if (data.includes(nama)) {
        data = data.filter(item => item !== nama);
        el.classList.remove("active");
        el.innerHTML = "🤍";
    } else {
        data.push(nama);
        el.classList.add("active");
        el.innerHTML = "❤️";
    }

    localStorage.setItem("favorit", JSON.stringify(data));
}

function loadFavorit() {
    let data = JSON.parse(localStorage.getItem("favorit")) || [];

    document.querySelectorAll(".btn-fav, .btn-fav-list").forEach(btn => {
        let nama = btn.getAttribute("data-nama");

        if (data.includes(nama)) {
            btn.classList.add("active");
            btn.innerHTML = "❤️";
        }
    });
}

document.addEventListener("DOMContentLoaded", loadFavorit);