<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<script>
    let form = document.getElementById("couponForm");
    let inputs = form.querySelectorAll("input, select");
    let valueInput = document.getElementById("value");
    let valueUnit = document.getElementById("value_unit");

    // 改變金額填寫欄的單位
    let couponType = document.querySelectorAll("input[name='coupontype']");
    couponType.forEach(radio => {
        radio.addEventListener("change", function() {
            if (this.value == 1) {
                valueUnit.textContent = '%';
                valueInput.placeholder = '請輸入折扣百分比';
            } else {
                valueUnit.textContent = '元';
                valueInput.placeholder = '請輸入金額';
            }
        });
    });
    // 生成代碼
    function generateCode() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    let code = '';
    for (let i = 0; i < 6; i++) {
        code += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    document.getElementById('code').value = code;
}

// 驗證日期
document.getElementById('start_date').addEventListener('change', function () {
    const startDate = new Date(this.value);
    const endDateInput = document.getElementById('end_date');
    const endDate = new Date(endDateInput.value);

    if (endDate < startDate) {
        endDateInput.value = this.value;
    }

    endDateInput.min = this.value;
});

document.getElementById('end_date').addEventListener('change', function () {
    const startDateInput = document.getElementById('start_date');
    const startDate = new Date(startDateInput.value);
    const endDate = new Date(this.value);

    if (endDate < startDate) {
        startDateInput.value = this.value;
    }

    startDateInput.max = this.value;
});


</script>

    
</script>