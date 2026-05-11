/* =========================
LOADING SCREEN
========================= */

window.addEventListener('load', function(){

    const loader = document.getElementById('loading-screen');

    // Cek apakah loader sudah pernah tampil
    const alreadyShown = sessionStorage.getItem('loaderShown');

    // Jika sudah pernah tampil
    if(alreadyShown){

        // Langsung hilangkan loader
        loader.style.display = 'none';

    }else{

        // Simpan status
        sessionStorage.setItem('loaderShown', 'true');

        // Delay fade out
        setTimeout(() => {

            loader.classList.add('loader-hide');

            // Hapus total dari DOM
            setTimeout(() => {

                loader.style.display = 'none';

            }, 800);

        }, 1800);

    }

});

/* =========================
AJAX LIVE SEARCH
========================= */

const liveSearch = document.getElementById('liveSearch');

if(liveSearch){

    let timeout = null;

    liveSearch.addEventListener('keyup', function(){

        clearTimeout(timeout);

        timeout = setTimeout(() => {

            // Ambil value search
            const search = this.value;

            // Ambil kategori aktif
            const kategori = document.querySelector(
                'input[name="kategori"]'
            )?.value || '';

            // URL query
            const url = `/explore?search=${search}&kategori=${kategori}`;

            // Fetch AJAX
            fetch(url, {

                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                }

            })

            .then(response => response.text())

            .then(data => {

                // Replace card wisata
                document.getElementById(
                    'wisataContainer'
                ).innerHTML = data;

            });

        }, 400);

    });

}