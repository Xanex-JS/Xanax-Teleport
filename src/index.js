window.addEventListener('message', (event) => {
	let data = event.data

    if($('.display').is(":hidden") && data.showUI == true) {
        $('.display').fadeIn();
    }
    else if($('.display').is(":visible") && data.closeUI == true) {
        $('.display').fadeOut();
    }
})

window.addEventListener("keydown", function(event) {
    if (event.key == "e"){
        $.post('https://xanax-teleport/closeUi', JSON.stringify({}));
    }
});

// Teleport Locations

function SandyShoresTP() {
    $.post('https://xanax-teleport/SandyShoresTP', JSON.stringify({}));
}