

if (pushcheck && objButton6.pushcheck == true) {
    instance_destroy(inst_4348C3DA);
}
if (!place_meeting(x, y, Objpush) or !place_meeting(x, y, objPlayer)) {
    pushcheck = false;
}