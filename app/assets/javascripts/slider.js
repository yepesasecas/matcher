var setText = function(labelId, value){
  if(labelId == "#weekend-value"){
    if(value < 4){
      return "Noche Tranquila"
    }
    else if(4 <= value && value < 7){
      return "Salir a tomarse algo."
    }
    else if(7 <= value){
       return "Fiesta!"
    }
  }
  else if (labelId == "#talk-about-value"){
    if(value < 4){
      return "Farandula y Chismes"
    }
    else if(4 <= value && value < 7){
      return "lo que sea"
    }
    else if(7 <= value){
      return "El significado de la vida"
    }
  }
  else if (labelId == "#social-status-value"){
    if(value < 4){
      return "No importa"
    }
    else if(4 <= value && value < 7){
      return "No es tan importane"
    }
    else if(7 <= value){
      return "Muy importante!"
    }
  }
  else if (labelId == "#meet-value"){
    if(value < 4){
      return "Alguien Atractivo"
    }
    else if(4 <= value && value < 7){
      return "Gente Chevere"
    }
    else if(7 <= value){
      return "Gente para relacion seria"
    }
  }
};

var setSlider = function(sliderId, labelId, formId){
  $( sliderId ).slider({
    range: "max",
    min: 1,
    max: 10,
    value: 5,
    slide: function( event, ui ) {
      $( labelId ).val( setText(labelId, ui.value));
      $( formId ).val(ui.value);
    }
  });
  $( labelId ).val( $( sliderId ).slider( "value" ) );
  $( labelId ).val( setText(labelId, 5));
  $( formId ).val(5);
};

$(document).ready(function(){
  setSlider("#slider-weekend-value", "#weekend-value", "#group_weekend_value");
  setSlider("#slider-talk-about-value", "#talk-about-value", "#group_talk_about_value");
  setSlider("#slider-social-status-value", "#social-status-value", "#group_social_status_value");
  setSlider("#slider-meet-value", "#meet-value", "#group_meet_value");
})
  
