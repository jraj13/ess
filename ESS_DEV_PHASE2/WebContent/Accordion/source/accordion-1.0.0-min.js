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
(function($){$.fn.Accordion=function(options){var
defaults={openItems:"all",toggler:".toggler",container:".container",accordionControl:null,expandAll:".expand",collapseAll:".collapse",hasArrows:true,arrowUp:"control-double-090.png",arrowDown:"control-double-270.png",toggle:false},settings=$.extend({},defaults,options);var $accordions=$(this),hasControl=(settings.accordionControl!=null&&$(settings.accordionControl).length>0)?true:false,$expand=(hasControl)?$(settings.accordionControl+" "+settings.expandAll):null,$collapse=(hasControl)?$(settings.accordionControl+" "+settings.collapseAll):null,openItems=(typeof settings.openItems=="string")?settings.openItems.toLowerCase():settings.openItems;var changeSRC=function(element,direction,changeTo){var SRC=element.attr("src"),path=SRC.substring(0,SRC.lastIndexOf("/")+1);if(changeTo==null){if(direction!="down"&&(direction=="up"||element.attr("direction")=="up")){element.attr({"src":path+settings.arrowDown,"direction":"down"});}else{element.attr({"src":path+settings.arrowUp,"direction":"up"});}}else{element.attr({"src":path+changeTo,"direction":direction});}};if(openItems=="none"){openItems=[];}else if(typeof openItems.length=="number"||typeof openItems=="number"){var tempItem=[];if(settings.toggle&&typeof openItems=="object"){for(var x=0;x<openItems.length;x++){tempItem.push(openItems[x]);if(tempItem.length==1){openItems=tempItem;break}}}else if(settings.toggle&&typeof openItems=="number"){openItems=[openItems];}}else{if(settings.toggle){openItems=[0];}else{openItems=[];for(var x=0;x<this.length;x++){openItems.push(x);}}}
$accordions.each(function(index){var $this=$(this),$toggler=$this.find(settings.toggler),$container=$this.find(settings.container),$arrow=(settings.hasArrows)?$toggler.find("img[src*='"+settings.arrowUp+"']"):null,hasOneItemOpened=false;if($.inArray(index,openItems)==-1){$container.animate({opacity:"hide",height:"hide"});if(settings.hasArrows){changeSRC($arrow,"down",settings.arrowDown);$arrow.attr("direction","down");}}else{$container.animate({opacity:"show",height:"show"});if(settings.hasArrows){changeSRC($arrow,"up",settings.arrowUp);}}
$toggler.click(function(){if(settings.toggle){$accordions.each(function(thisIndex){if(index!=thisIndex){var $this=$(this);$this.find(settings.container).animate({opacity:"hide",height:"hide"});if(settings.hasArrows){changeSRC($this.find("img[direction]"),"up");}}});}
var $container=$this.find(settings.container);$container.animate({opacity:"toggle",height:"toggle"});if(settings.hasArrows){changeSRC($this.find("img[direction]"));}});});if(hasControl){if($expand.length>0){$expand.click(function(){$accordions.each(function(){var $this=$(this);$this.find(settings.container).animate({opacity:"show",height:"show"});if(settings.hasArrows){changeSRC($this.find("img[direction]"),"up");}});return false});}
if($collapse.length>0){$collapse.click(function(){$accordions.each(function(){var $this=$(this);$this.find(settings.container).animate({opacity:"hide",height:"hide"});if(settings.hasArrows){changeSRC($this.find("img[direction]"),"down");}});return false});}}}})(jQuery);