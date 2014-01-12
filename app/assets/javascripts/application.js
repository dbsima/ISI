// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap

function reason()
{
   jQuery('#reject_reason').val(prompt('Motivul respingerii'));
   jQuery('#respingee').click();
}

function screenshot()
{
    html2canvas(document.body, {
        onrendered: function(canvas) {
            localStorage['screenshot'] = canvas.toDataURL("image/jpeg");
            localStorage['widthc'] = canvas.width;
            localStorage['heightc'] = canvas.height;
            document.body.appendChild(canvas);
        }
    });
}

function pdf()
{
    var imgData = localStorage['screenshot'];
    var doc = new jsPDF();

    doc.setFontSize(40);
    doc.addImage(imgData, 'JPEG', 0, 0, localStorage['widthc'], localStorage['heightc']);
    doc.save('Test.pdf');

}
