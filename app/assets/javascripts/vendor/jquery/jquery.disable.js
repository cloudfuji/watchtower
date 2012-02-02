(function($){
  $.fn.disable = function(){
    return this.each(function(){
      var module = $(this);
      module.prepend('<div class="disabled_shield"></div>');
      var shield = module.find('.disabled_shield');
      shield.css({'position' : 'absolute', 'z-index' : '200'});
      shield.width(module.width());
      shield.height(module.height());
      module.data("disabledShield", shield);
      module.animate({opacity : 0.5}, 200);
      module.find('input:focus').blur();
    });
  };
  
  $.fn.enable = function(){
    var $this = $(this);
    $this.find('.disabled_shield').remove();
    $this.animate({opacity: 100}, 200);
  };
  
})(jQuery);
