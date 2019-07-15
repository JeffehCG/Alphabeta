$(init);
$(createExe);
$(textOberver);

	var correctCards = 0;
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
		
		//create exercices forms
		$("#addExe").click(function(){
			if($("#menu").find(".exeContainer").length < 10){
				var fileIdGenerate = "ex" + ($(document).find(".exeContainer").length + 1) + "wo" + 1;
                                $("#menu").append(
						"<div class='exeContainer' id='e"+($(document).find(".exeContainer").length + 1)+"'>"
					+	"<br>"
					+	"<h4>Exercício " + ($(document).find(".exeContainer").length + 1) + "</h4>"
                                        +	"<textarea rows='6' cols='30' class='texto' placeholder='Digite a frase aqui...'></textarea>&nbsp;"
					+	"<div class='keyWord'>"
					+	"<input type='file' name='"+fileIdGenerate+"' id='"+fileIdGenerate+"'/>"
					+       "<label class='' for='"+fileIdGenerate+"'><img class='ui fluid image' id='img"+fileIdGenerate+"' src='src/images/square-image.png'></label><br>"
					+	"<input type='text' class='palavra' placeholder='Palavra "+1+"'/>&nbsp;"
					+	"</div>"
                                        +	"</div>"
				);
				
				textOberver();
			}
		});
		
		$("#removeExe").click(function(){
			if($("#menu").find(".exeContainer").length > 1){
				$("#menu").find(".exeContainer").last().remove();
			}
		});
		
		
		
		
		//create exercicio face
		$("#sub").click(function(){
			
                        
			
			$("#result").css("display","flex").empty();
			$("#ans").css("display","flex").empty();
			
			var exercisesLength = $("#menu").find(".exeContainer").length;
			
			for(var j = 0; j < exercisesLength; j++){
				$("#result").append("<div class='exeUnit'></div>");
				$("#result").find(".exeUnit").last().append("<div class='org'></div>")
				var elemen = $(".exeContainer")[j];
				var text = $(elemen).find(".texto").val().split(" ");
				var getWordsCount = 0;
				for(var i = 0; i < text.length; i++){
					if(text[i] != "#"){
						$("#result").find(".exeUnit").last().find("div").last().append(text[i] + " ");
					}
					else{
						var getKeyWord = $(elemen).find(".keyWord")[getWordsCount];
						$('<div class="wordSlot">  </div>').data( 'word', $(getKeyWord).find(".palavra").last().val() ).appendTo($("#result").find(".exeUnit").last()).droppable( {
						  accept: '#ans div',
						  hoverClass: 'hovered',
						  drop: handleCardDrop
						} );
						
						$("#result").find(".exeUnit").last().append("<div class='org' ></div>");
						
                                                var imgSrc = $("#imgex1wo"+(getWordsCount + 1)).prop("src") != undefined ? $("#imgex1wo"+(getWordsCount + 1)).prop("src") : "src/images/square-image.png";
						
                                                $("#ans").append(
								"<div class='wordContainer'>"
							+		"<img src='"+imgSrc+"' alt='Image' height='80' width='80'>"
							+ 	"</div>"
						);
						$('<div class="wordObject">'+$(getKeyWord).find(".palavra").last().val()+'</div>').data( 'word', $(getKeyWord).find(".palavra").last().val() ).attr( 'id', 'card1' ).appendTo( $("#ans").find(".wordContainer").last() ).draggable( {
						  containment: '#content',
						  stack: '#ans div',
						  cursor: 'move',
						  revert: true
						} );
						
						getWordsCount++;
					}
				}
				
				$("#result").append("<hr>");
			}
			
			 $("#result").find("hr").last().remove();
			
			
			
		});
	
		}
		
		//---------# funções #-------------
		
		function createExe(){
			
		}
		
		function textOberver(){
			
                    $(".texto").on("input",function(){
				var text = $(this).val().split(" ");
				var hashLength = $(this).parent().parent().find(".exe-cards .keyWord").length;
				var hashCount = 0;
				for(var i = 0; i < text.length; i++){
                                    if(text[i] == "#"){
                                            hashCount++;
                                            if(hashCount > hashLength && hashCount <= 10){
                                                    var fileIdGenerate = "ex" + ($(this).parent().parent().attr("id").charAt(1)) + "wo" + hashCount;
                                                    

                                                    var container = $("<div class='ui card form keyWord'></div>");
                                                    $("<input required type='file'name='"+fileIdGenerate+"' id='"+fileIdGenerate+"'/>")
                                                            .on("change",function(){
                                                                        $(this).parent().find("label i").remove();
                                                                        $(this).parent().find("label img").remove();
                                                                        $(this).parent().find("label").append($("<img class='ui fluid image' id='img"+fileIdGenerate+"' src='"+ URL.createObjectURL(event.target.files[0]) +"'/>"));
                                                                        //$("#img" + $(this).prop("name")).prop("src", URL.createObjectURL(event.target.files[0]));
                                                            })
                                                            .appendTo(container);
                                                    $("<i class='plus icon'></i>").appendTo($("<label class='lblFile'for='"+fileIdGenerate+"'></label>").appendTo(container));
                                                    //$("<img class='ui fluid image' id='img"+fileIdGenerate+"' src='src/images/square-image.png'/>").appendTo($("<label for='"+fileIdGenerate+"'></label>").appendTo(container));

                                                    $("<input required name='palavra"+(hashCount)+"' type='text' class='palavra' placeholder='Palavra "+(hashCount)+"'/>").appendTo(container);
                                                    $(this).parent().parent().find('.exe-cards').append(container);
                                                    
//                                                        $(this).parent().append(
//									"<div class='ui card form keyWord'>"
//								+	"<input type='file' name='"+fileIdGenerate+"' id='"+fileIdGenerate+"'/>"
//                                                                +	"<label class='' for='"+fileIdGenerate+"'><img class='ui fluid image' id='img"+fileIdGenerate+"' src='src/images/square-image.png'></label><br>"
//                                                                +	"<input name='palavra"+(hashCount)+"' type='text' class='palavra' placeholder='Palavra "+(hashCount)+"'/>&nbsp;"
//								+	"</div>"
//							);

                                                    $("input[type = file]").on("change",function(){
                                                        $("#img" + $(this).prop("name")).prop("src", URL.createObjectURL(event.target.files[0]));
                                                    });
                                            }

                                    }
                            }
                            if(hashLength > hashCount){
                                    for(var i = hashLength; i > hashCount; i--){
                                            if($(this).parent().parent().find(".exe-cards .keyWord").length > 1){
                                                    $(this).parent().parent().find(".exe-cards .keyWord").last().remove();

                                            }
                                    }
                            }
                            
                            if(hashCount > 0){
                                $("#sub").prop("disabled",false);
                            }
                            else{
                                $("#sub").prop("disabled",true);
                            }
                            
                            
                        });
		}
		
		//validator drag and drop
		function handleCardDrop( event, ui ) 
		{
			var slotNumber = $(this).data( 'word' );
			var cardNumber = ui.draggable.data( 'word' );
			
			//alert(bDrag)	  
			if ( cardNumber == slotNumber ) 
			{
				
				//ui.draggable.addClass( 'correct' );
				ui.draggable.draggable( 'disable' );// this line decrease opacity and disable.
				$(this).droppable( 'disable' ); 
				ui.draggable.position( { of: $(this), my: 'left top', at: 'left top' } );
				ui.draggable.draggable( 'option', 'revert', false ); // this line drop the element.
				correctCards++;
			} 
			
			// If all the cards have been placed correctly then display a message
			// and reset the cards for another go
 
			if ( correctCards == 8 ) 
			{	
				$('#successMessage').show();
				$('#successMessage').animate
				( 
					{
					  left: '380px',
					  top: '200px',
					  width: '400px',
					  height: '100px',
					  opacity: 1
					} 
				);
			}
		}
    $("input[type = file]").on("change",function(){
        $(this).parent().find("label i").remove();
        $(this).parent().find("label img").remove();
        $(this).parent().find("label").append($("<img class='ui fluid image' id='img"+$(this).prop("name")+"' src='"+ URL.createObjectURL(event.target.files[0]) +"'/>"));
        //$("#img" + $(this).prop("name")).prop("src", URL.createObjectURL(event.target.files[0]));
    });            
    