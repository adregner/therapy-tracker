# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.open_in_new = (elem) ->
    parentWindow = window
    w = 400
    h = 500
    #//"status=0,toolbar=0,location=0,menubar=0,directories=0,resizable=1,scroolbars=1,height="+h+",width="+w
    theWindow = window.open(elem.href, "myNewItem");
    #//theWindow.parentWindow
    #//    if(theWindow.document.body.innerHTML.index("Agency was successfully created") > 0)
    return false;
