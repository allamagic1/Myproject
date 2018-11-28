var starRating = function(){
var $star = $(".star-input"),
    $result = $star.find("output>b");
	
  	$(document)
	.on("focusin", ".star-input>.input", 
		function(){
   		 $(this).addClass("focus");
 	})
		 
   	.on("focusout", ".star-input>.input", function(){
    	var $this = $(this);
    	setTimeout(function(){
      		if($this.find(":focus").length === 0){
       			$this.removeClass("focus");
     	 	}
   		}, 100);
 	 })
  
    .on("change", ".star-input :radio", function(){//별점이 바뀔 때
    	$result.text($(this).next().text());
  	})
    .on("mouseover", ".star-input label", function(){//별점에 마우스 올릴때
    	$result.text($(this).text());
    })
    .on("mouseleave", ".star-input>.input", function(){
    	var $checked = $star.find(":checked");
    		if($checked.length === 0){	//마우스 올렸다가 그냥 나갈때
     	 		$result.text("0");
   		 	} else {					//별점 선택 후 나갈때
     	 		$result.text($checked.next().text());
    		}
  	});
};

starRating();