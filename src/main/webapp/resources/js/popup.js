$(document).ready(function() {
    //������ PopUp ��� �������� ��������
    PopUpHide();
});
//������� ����������� PopUp
function PopUpShow(){
    $("#popup1").show();
}

function showNote(event) {
    console.info("%s",note_txt);
    console.info("%s",note_date);
}

//������� ������� PopUp
function PopUpHide(){
    $("#popup1").hide();
}