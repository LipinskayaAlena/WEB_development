$(document).ready(function() {
    //Скрыть PopUp при загрузке страницы
    PopUpHide();
});
//Функция отображения PopUp
function PopUpShow(){
    $("#popup1").show();
}

function showNote(event) {
    console.info("%s",note_txt);
    console.info("%s",note_date);
}

//Функция скрытия PopUp
function PopUpHide(){
    $("#popup1").hide();
}