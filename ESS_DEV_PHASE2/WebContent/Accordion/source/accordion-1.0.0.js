/*!
 * Accordion v1.0.0 (Release version)
 *
 * http://www.darlesson.com/
 *
 * Copyright 2010, Darlesson Oliveira
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * @requires jQuery v1.4.0 or above
 *
 * Reporting bugs, comments or suggestions: http://darlesson.com/contact/
 * Documentation and other jQuery plug-ins: http://darlesson.com/jquery/
 * Donations are welcome: http://darlesson.com/donate/
 */
 
// Examples and documentation at: http://darlesson.com/jquery/accordion/

// Accordion
(function($) {

    $.fn.Accordion = function(options) {

        var 
			defaults = { // Define default values
				openItems: "all", // "all", "none", number or array. Default is "all". Array defines the items to be opened by their indexes
				toggler: ".toggler", // jQuery selector. Default is ".toggler". If the selector declared doesn't match there will not be a toggler
				container: ".container", // jQuery selector. Default is ".container". If the selector declared doesn't match there will not be a container to toggled
				accordionControl: null, // jQuery selector. Default is null. It is parent of expand and collapse elements and it must be informed
				expandAll: ".expand", // jQuery selector. Default is ".expand". It match and expand all conainers for the current set of accordions
				collapseAll: ".collapse", // jQuery selector. Default is ".collapse". It match and collapse all conainers for the current set of accordions
				hasArrows: true, // boolean. The default is true. It will let the use or not of images
				arrowUp: "control-double-090.png", // The name of the image indicating close container. The path shouldn't be declared. It will be the same already existent in the HTML markup
				arrowDown: "control-double-270.png", // The name of the image indicating open container. The path shouldn't be declared. It will be the same already existent in the HTML markup
				toggle: false // Toggle the sets of containers. It will be possible have just open at a time unless if expandAll exists
			},
			settings = $.extend({}, defaults, options); // O jQuery irá automaticamente substituir as propriedades padrão pelas declaradas na chamada do plugin
		
		var $accordions = $(this),
			hasControl = (settings.accordionControl != null && $(settings.accordionControl).length > 0)? true:false,
			$expand = (hasControl)? $(settings.accordionControl + " " + settings.expandAll):null,
			$collapse = (hasControl)? $(settings.accordionControl + " " + settings.collapseAll):null,
			openItems = ( typeof settings.openItems == "string" )? settings.openItems.toLowerCase():settings.openItems;
		
		// Change arrow image
		var changeSRC = function( element, direction, changeTo ){
			var SRC = element.attr("src"),
				path = SRC.substring(0, SRC.lastIndexOf("/") + 1);
			
			if( changeTo == null ){
				
				if( direction != "down" && ( direction == "up" || element.attr("direction") == "up" )){
					element.attr({
						"src": path + settings.arrowDown,
						"direction": "down"
					});
				}else{
					element.attr({
						"src": path + settings.arrowUp,
						"direction": "up"
					});
				}
				
			}else{
				element.attr({
					"src": path + changeTo,
					"direction": direction
				});
			}
		};
		
		if( openItems == "none" ){ // Close all items
			openItems = [];
		}else if( typeof openItems.length == "number" || typeof openItems == "number" ){
			var tempItem = [];
			if(settings.toggle && typeof openItems == "object"){ // If toggle is true, only the first item of an array will be considered
				for(var x = 0; x < openItems.length; x++){
					tempItem.push(openItems[x]);
					if(tempItem.length == 1){
						openItems = tempItem;
						break
					}
				}
			}else if(settings.toggle && typeof openItems == "number"){ // If openItems is a number it will passed into an array
				openItems = [openItems];
			}
		}else{ // Open all items
			if(settings.toggle){
				openItems = [0];
			}else{
				openItems = [];
				for(var x = 0; x < this.length; x++){
					openItems.push(x);
				}
			}
		}

        $accordions.each(function(index){ // Necessário que se execute uma função por item de um seletor. Lembrando que o seletor pode retornar uma coleção de elementos
            var $this = $(this),
				$toggler = $this.find(settings.toggler),
				$container = $this.find(settings.container),
				$arrow = (settings.hasArrows)? $toggler.find("img[src*='" + settings.arrowUp + "']"):null,
				hasOneItemOpened = false;
			
			// Check if the item index is in the array. If it's it will opened
			if( $.inArray(index, openItems) == -1 ){
				$container.animate({opacity: "hide", height: "hide"});
				if(settings.hasArrows){
					changeSRC($arrow, "down", settings.arrowDown);
					$arrow.attr("direction","down");
				}
			}else{
				$container.animate({opacity: "show", height: "show"});
				if(settings.hasArrows){
					changeSRC($arrow, "up", settings.arrowUp);
				}
			}
			
            $toggler.click(function(){
									
				if(settings.toggle){
					$accordions.each(function(thisIndex){
						if(index != thisIndex){
							var $this = $(this);
							$this
								.find(settings.container)
								.animate({opacity: "hide", height: "hide"});	
							if(settings.hasArrows){
								changeSRC($this.find("img[direction]"), "up");
							}
						}
					});
				}
				
				var $container = $this.find(settings.container);
				$container.animate({opacity: "toggle", height: "toggle"});
				if(settings.hasArrows){
					changeSRC($this.find("img[direction]"));
				}
            });

        });
		
		if( hasControl ){
		
			if( $expand.length > 0 ){
				$expand.click(function(){
						$accordions.each(function(){
							var $this = $(this);							
							$this
								.find(settings.container)
								.animate({opacity: "show", height: "show"});
							if(settings.hasArrows){
								changeSRC($this.find("img[direction]"), "up");
							}
						});
						return false
					});
			}
			
			if( $collapse.length > 0  ){
				$collapse.click(function(){
						$accordions.each(function(){
							var $this = $(this);
							$this
								.find(settings.container)
								.animate({opacity: "hide", height: "hide"});
							if(settings.hasArrows){
								changeSRC($this.find("img[direction]"), "down");
							}
						});
						return false
					});
			}
		
		}

    }

})(jQuery);