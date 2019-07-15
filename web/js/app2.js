$(init);
$(createExe);
$(textOberver);
$(test);
var correctCards = 0;

function test() {

    $("#result").empty();
    $("#ans").empty();

    var exercisesLength = 1//$(".params").find(".word").length;

    for (var j = 0; j < exercisesLength; j++) {
        $("#result").append("<div class='exeUnit'></div>");
        $("#result").find(".exeUnit").last().append("<div class='org'></div>")
        var elemen = $(".params")[j];
        var text = $(elemen).find("#frase").val().split(" ");
        var getWordsCount = 0;
        for (var i = 0; i < text.length; i++) {
            if (text[i] != "#") {
                $("#result").find(".exeUnit").last().find("div").last().append(text[i] + " ");
            } else {
                var getKeyWord = $(elemen).find(".word")[getWordsCount];
                console.log(getWordsCount);
                $('<div class="wordSlot">  </div>').data('word', $(getKeyWord).val()).appendTo($("#result").find(".exeUnit").last()).droppable({
                    accept: '#ans div',
                    hoverClass: 'hovered',
                    drop: handleCardDrop
                });

                $("#result").find(".exeUnit").last().append("<div class='org' ></div>");

                $("#ans").append(
                        "<div class='wordContainer'>"
                        + "<img src='getImage?id="+getWordsCount+"' alt='Image' height='80' width='80'>"
                        + "</div>"
                        );

                $('<div class="wordObject">' + $(getKeyWord).val() + '</div>').data('word', $(getKeyWord).val()).attr('id', 'card1').appendTo($("#ans").find(".wordContainer").last()).draggable({
                    containment: '#content',
                    stack: '#ans div',
                    cursor: 'move',
                    revert: true
                });

                getWordsCount++;
            }
        }

        $("#result").append("<hr>");
    }

    $("#result").find("hr").last().remove();



}
;


function init()
{



    // Hide the success message
    $('#successMessage').hide();
    $('#successMessage').css
            (
                    {
                        left: '580px',
                        top: '250px',
                        width: 0,
                        height: 0
                    }
            );

    // Reset the game
    correctCards = 0;
    $("#dvSource").html();
    $("#dvDrop").html();


    $("#dvSource img").draggable
            (
                    {
                        containment: '#content',
                        stack: '#dvSource img',
                        cursor: 'move',
                        revert: true
                    }
            )

    $("#dvDrop div").droppable
            (
                    {
                        accept: '#dvSource img', //We use the accept option with the selector "#cardPile div" to ensure that the slot will only accept our number cards, and not any other draggable element.
                        hoverClass: 'hovered', //The hoverClass option adds a CSS class to a droppable when a draggable is hovered over it � we use this option to add a class of 'hovered' to the element, which we'll highlight using CSS.
                        drop: handleCardDrop
                    }
            )






    //create exercicio face
    //$("#sub").click(function(){
    function test() {

        $("#result").empty();
        $("#ans").empty();

        var exercisesLength = 1//$(".params").find(".word").length;

        for (var j = 0; j < exercisesLength; j++) {
            $("#result").append("<div class='exeUnit'></div>");
            $("#result").find(".exeUnit").last().append("<div class='org'></div>")
            var elemen = $(".param")[j];
            var text = $(elemen).find(".frase").val().split(" ");
            var getWordsCount = 0;
            for (var i = 0; i < text.length; i++) {
                if (text[i] != "#") {
                    $("#result").find(".exeUnit").last().find("div").last().append(text[i] + " ");
                } else {
                    var getKeyWord = $(elemen).find(".keyWord")[getWordsCount];
                    $('<div class="wordSlot">  </div>').data('word', $(getKeyWord).find(".palavra").last().val()).appendTo($("#result").find(".exeUnit").last()).droppable({
                        accept: '#ans div',
                        hoverClass: 'hovered',
                        drop: handleCardDrop
                    });

                    $("#result").find(".exeUnit").last().append("<div class='org' ></div>");

                    $("#ans").append(
                            "<div class='wordContainer'>"
                            + "<img src='getImage?id="+i+"' alt='Image' height='80' width='80'>"
                            + "</div>"
                            );
                    console.log("POHA");

                    $('<div class="wordObject">' + $(getKeyWord).find(".palavra").last().val() + '</div>').data('word', $(getKeyWord).find(".palavra").last().val()).attr('id', 'card1').appendTo($("#ans").find(".wordContainer").last()).draggable({
                        containment: '#content',
                        stack: '#ans div',
                        cursor: 'move',
                        revert: true
                    });

                    getWordsCount++;
                }
            }

            $("#result").append("<hr>");
        }

        $("#result").find("hr").last().remove();



    }
    ;

}

//---------# funções #-------------

function createExe() {

}

function textOberver() {
    $(".texto").on("change", function () {
        var text = $(this).val().split(" ");
        var hashLength = $(this).parent().find(".keyWord").length;
        var hashCount = 0;

        for (var i = 0; i < text.length; i++) {
            if (text[i] == "#") {
                hashCount++;
                if (hashCount > hashLength) {
                    var fileIdGenerate = "ex" + ($(this).parent().attr("id").charAt(1)) + "wo" + hashCount;

                    $(this).parent().append(
                            "<div class='keyWord'>"
                            + "<input type='file' id='" + fileIdGenerate + "'/>"
                            + "<label class='inputFile' for='" + fileIdGenerate + "'>+</label><br>"
                            + "<input type='text' name='palavra' class='palavra' placeholder='Palavra " + (hashCount) + "'/>&nbsp;"
                            + "</div>"
                            );
                }

            }
        }

        if (hashLength > hashCount) {
            for (var i = hashLength; i > hashCount; i--) {
                if ($(this).parent().find(".keyWord").length > 1) {
                    $(this).parent().find(".keyWord").last().remove();
                }
            }
        }
    });
}

//validator drag and drop
function handleCardDrop(event, ui)
{
    var slotNumber = $(this).data('word');
    var cardNumber = ui.draggable.data('word');

    //alert(bDrag)	  
    if (cardNumber === slotNumber)
    {
        console.log("ue");
        //ui.draggable.addClass( 'correct' );
        ui.draggable.draggable('disable');// this line decrease opacity and disable.
        $(this).droppable('disable');
        ui.draggable.position({of: $(this), my: 'left top', at: 'left top'});
        ui.draggable.draggable('option', 'revert', false); // this line drop the element.
        correctCards++;
    }

    // If all the cards have been placed correctly then display a message
    // and reset the cards for another go
    console.log(correctCards);
    if (correctCards === $(".word").length)
    {
        alert("Parabéns, você acertou!");
        window.history.back();
        ///$('.ui.basic.modal').modal('show');
//        $('#successMessage').show();
//        $('#successMessage').animate
//                (
//                        {
//                            left: '380px',
//                            top: '200px',
//                            width: '400px',
//                            height: '100px',
//                            opacity: 1
//                        }
//                );
    }
}

$(document).ready(function () {

    //test();
    console.log("batata");

});