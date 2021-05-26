$("#usuarioLog").focus();
// Filtro de campos
$("#usuarioLog").keyup(function () {
    var u4 = $(this).val();
    var mu4 = u4.toLowerCase();
    $("#usuarioLog").val(mu4);
});
$("#usuarioLog").keyup(function () {
    this.value = (this.value + "").replace(/[^a-zA-ZñÑáéíóúÁÉÍÓÚ]/g, "");
});
// Filtro de campos
// Validación de campos
function ValidarLogin() {
    var usuarioLog = $("#usuarioLog").val();
    var passwordLog = $("#usuarioPass").val();

    if (usuarioLog.length == 0 || passwordLog.length == 0) {
        Swal.fire({
            icon: "warning",
            title: "Ingrese usuario y contraseña por favor",
            showConfirmButton: false,
            timer: 2000
        });
        return false
    }
}
$("#btnLogin").on("click", function () {
    ValidarLogin()
});
// Validación de campos