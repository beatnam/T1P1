    const tabButtons = document.querySelectorAll('.tab-button');
    const tabContents = document.querySelectorAll('.login_container');

    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            const targetTab = button.getAttribute('data-tab');
            tabButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            tabContents.forEach(content => {
                content.classList.remove('active');
            });

            document.getElementById(targetTab).classList.add('active');
        });
    });

    document.querySelector("#submitBtn").onclick = function () {
        const id_lbl = document.querySelector("#id_lbl");
        if (id_lbl && id_lbl.value === "") {
            alert("아이디를 입력하시오");
            id_lbl.focus();
            return false;
        }
    };